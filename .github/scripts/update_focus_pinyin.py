#!/usr/bin/env python3
"""
同步 focus_pinyin.dict.yaml 中属于 dicts/dicts_cn/pinyin/dicts/ 的 import_tables 条目：

- 保留原有顺序与缩进；
- 该目录下被新版 dicts.zip 移除的文件 -> 从 import_tables 删除；
- 该目录下新增的文件 -> 追加到列表末尾；
- 其它条目（如 dicts/dicts_cn/pinyin/pinyinA、five_strokes 等
  仓库自带文件）不属于同步范围，原样保留；
- 文件正文若存在“多字词但拼音无空格分音节”（如 "不少\tbu"）
  就写成 "#- ..."，否则 "- ..."。
"""
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINYIN_DIR = ROOT / 'dicts' / 'dicts_cn' / 'pinyin'
SYNC_SUBDIR = 'dicts'          # zip 的解压落点 dicts/dicts_cn/pinyin/dicts
FOCUS_FILE = ROOT / 'focus_pinyin.dict.yaml'

CJK_RE = re.compile(r'[\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]')
ITEM_RE = re.compile(r'^(\s*)(#-|-)\s*(\S+)\s*$')
IMPORT_RE = re.compile(r'^(\s*)import_tables\s*:')


def _scan(scan_dir: Path) -> list[str]:
    """递归扫描 *.dict.yaml，返回相对 PINYIN_DIR 的路径（去掉 .dict.yaml 后缀）。"""
    if not scan_dir.exists():
        return []
    results: list[str] = []
    for root, dirs, files in os.walk(scan_dir):
        dirs.sort()
        for f in sorted(files):
            if f.endswith('.dict.yaml'):
                rel = (Path(root) / f).relative_to(PINYIN_DIR).as_posix()
                results.append(rel[:-len('.dict.yaml')])
    return results


def collect_all_files() -> set[str]:
    """PINYIN_DIR 下所有 *.dict.yaml —— 用于“条目是否还存在”判断。"""
    return set(_scan(PINYIN_DIR))


def collect_sync_files() -> list[str]:
    """仅 PINYIN_DIR/dicts 下 *.dict.yaml —— 用于“新增”发现。"""
    return _scan(PINYIN_DIR / SYNC_SUBDIR)


def file_missing_tone(path: Path) -> bool:
    """判断 dict 文件正文中是否存在“多字词但拼音无空格分隔”的条目。"""
    try:
        text = path.read_text(encoding='utf-8-sig', errors='replace')
    except Exception as e:
        print(f'WARN: cannot read {path}: {e}', file=sys.stderr)
        return False

    lines = text.splitlines()
    idx = 0
    if lines and lines[0].strip() == '---':
        idx = 1
        while idx < len(lines) and lines[idx].strip() != '---':
            idx += 1
        idx += 1

    for line in lines[idx:]:
        s = line.strip()
        if not s or s.startswith('#'):
            continue
        if '\t' in line:
            text_part, reading = line.split('\t', 1)
        else:
            parts = line.split(None, 1)
            if len(parts) < 2:
                continue
            text_part, reading = parts
        text_part = text_part.strip()
        reading = reading.strip()
        if not text_part or not reading:
            continue
        if len(CJK_RE.findall(text_part)) > 1 and ' ' not in reading and '\t' not in reading:
            return True
    return False


def main() -> None:
    if not FOCUS_FILE.exists():
        print(f'ERROR: {FOCUS_FILE} not found', file=sys.stderr)
        sys.exit(1)
    if not (PINYIN_DIR / SYNC_SUBDIR).exists():
        print(f'ERROR: {(PINYIN_DIR / SYNC_SUBDIR)} not found', file=sys.stderr)
        sys.exit(1)

    original = FOCUS_FILE.read_text(encoding='utf-8')
    lines = original.split('\n')

    # 1) 定位 import_tables 段
    import_idx = None
    for i, line in enumerate(lines):
        if IMPORT_RE.match(line):
            import_idx = i
            break
    if import_idx is None:
        print('ERROR: "import_tables:" not found in focus_pinyin.dict.yaml',
              file=sys.stderr)
        sys.exit(1)

    key_indent = len(lines[import_idx]) - len(lines[import_idx].lstrip())

    start = import_idx + 1
    end = start
    while end < len(lines):
        s = lines[end].strip()
        if s == '' or ITEM_RE.match(lines[end]):
            end += 1
            continue
        break
    segment = lines[start:end]

    # 2) 提取已有条目，推断缩进与路径前缀
    raw_items = []
    for line in segment:
        m = ITEM_RE.match(line)
        if m:
            raw_items.append((m.group(1), m.group(3)))
    item_indent = raw_items[0][0] if raw_items else ' ' * (key_indent + 2)
    sample_path = raw_items[0][1] if raw_items else ''

    prefix = ''
    for cand in ('dicts/dicts_cn/pinyin/', 'dicts_cn/pinyin/', 'dicts/'):
        if sample_path.startswith(cand):
            prefix = cand
            break

    def strip_prefix(p: str) -> str:
        return p[len(prefix):] if prefix and p.startswith(prefix) else p

    # 3) 磁盘集合
    all_on_disk = collect_all_files()      # 用于删除判断
    sync_on_disk = collect_sync_files()    # 用于新增判断
    sync_prefix_in_rel = SYNC_SUBDIR + '/' # 判断条目是否属于 zip 同步范围

    # 4) 重建 import_tables 段
    result_seg: list[str] = []
    last_item_pos = -1
    seen: set[str] = set()

    for line in segment:
        m = ITEM_RE.match(line)
        if not m:
            result_seg.append(line)
            continue

        rel = strip_prefix(m.group(3))
        if rel in seen:
            continue
        seen.add(rel)

        is_sync_item = rel.startswith(sync_prefix_in_rel)

        # 删除判断：
        # - 属于 zip 同步范围（dicts/ 下）：磁盘上没有就删
        # - 非同步范围（pinyinA 等仓库内置）：磁盘上没有也删（保持列表干净）
        if rel not in all_on_disk:
            continue

        commented = False
        if is_sync_item:
            commented = file_missing_tone(PINYIN_DIR / (rel + '.dict.yaml'))
        else:
            # 非同步条目保持原样（不自动改注释）
            commented = (m.group(2) == '#-')

        marker = '#-' if commented else '-'
        result_seg.append(f'{item_indent}{marker} {prefix}{rel}')
        last_item_pos = len(result_seg) - 1

    # 5) 新增：只从 dicts/ 同步目录发现
    new_lines: list[str] = []
    for rel in sync_on_disk:
        if rel in seen:
            continue
        commented = file_missing_tone(PINYIN_DIR / (rel + '.dict.yaml'))
        marker = '#-' if commented else '-'
        new_lines.append(f'{item_indent}{marker} {prefix}{rel}')

    if new_lines:
        if last_item_pos >= 0:
            result_seg[last_item_pos + 1:last_item_pos + 1] = new_lines
        else:
            result_seg = new_lines + result_seg

    new_content = '\n'.join(lines[:start] + result_seg + lines[end:])
    if new_content == original:
        print('No change. focus_pinyin.dict.yaml is up to date.')
        return

    FOCUS_FILE.write_text(new_content, encoding='utf-8')

    active = sum(1 for l in result_seg
                 if ITEM_RE.match(l) and l.lstrip().startswith('- '))
    commented = sum(1 for l in result_seg
                    if ITEM_RE.match(l) and l.lstrip().startswith('#-'))
    print(f'Updated {FOCUS_FILE.name}: '
          f'{active} active, {commented} commented, '
          f'{len(new_lines)} newly added')


if __name__ == '__main__':
    main()