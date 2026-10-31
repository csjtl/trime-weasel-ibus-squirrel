#!/usr/bin/env python3
"""
同步 focus_pinyin.dict.yaml 的 import_tables 列表，使其与
dicts/dicts_cn/pinyin 下的 *.dict.yaml 文件保持一致：

- 保留原有顺序与缩进；
- 磁盘上已不存在的条目 -> 删除；
- 新增文件 -> 追加到列表末尾；
- 若文件正文中存在“多字词但拼音没有空格分音节”（如 "不少\tbu"），
  对应条目写成 "#- ..."，否则写成 "- ..."。
"""
import os
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINYIN_DIR = ROOT / 'dicts' / 'dicts_cn' / 'pinyin'
FOCUS_FILE = ROOT / 'focus_pinyin.dict.yaml'

CJK_RE = re.compile(r'[\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]')
ITEM_RE = re.compile(r'^(\s*)(#-|-)\s*(\S+)\s*$')
IMPORT_RE = re.compile(r'^(\s*)import_tables\s*:')


def collect_dict_files() -> list[str]:
    """返回相对 pinyin 目录、去掉 .dict.yaml 后缀的路径列表。"""
    results: list[str] = []
    for root, dirs, files in os.walk(PINYIN_DIR):
        dirs.sort()
        for f in sorted(files):
            if f.endswith('.dict.yaml'):
                rel = (Path(root) / f).relative_to(PINYIN_DIR).as_posix()
                results.append(rel[:-len('.dict.yaml')])
    return results


def file_missing_tone(path: Path) -> bool:
    """判断 dict 文件正文中是否存在“多字词但拼音无空格分隔”的条目。"""
    try:
        text = path.read_text(encoding='utf-8-sig', errors='replace')
    except Exception as e:
        print(f'WARN: cannot read {path}: {e}', file=sys.stderr)
        return False

    lines = text.splitlines()
    idx = 0
    # 跳过 YAML frontmatter（--- ... ---）
    if lines and lines[0].strip() == '---':
        idx = 1
        while idx < len(lines) and lines[idx].strip() != '---':
            idx += 1
        idx += 1  # 跳过结尾 ---

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

        cjk_chars = CJK_RE.findall(text_part)
        # 只看中文多字词，避免误伤英文词条（如 en.dict.yaml）
        if len(cjk_chars) > 1 and ' ' not in reading and '\t' not in reading:
            return True
    return False


def main() -> None:
    if not FOCUS_FILE.exists():
        print(f'ERROR: {FOCUS_FILE} not found', file=sys.stderr)
        sys.exit(1)
    if not PINYIN_DIR.exists():
        print(f'ERROR: {PINYIN_DIR} not found', file=sys.stderr)
        sys.exit(1)

    original = FOCUS_FILE.read_text(encoding='utf-8')
    lines = original.split('\n')

    # 1. 定位 import_tables
    import_idx = None
    for i, line in enumerate(lines):
        m = IMPORT_RE.match(line)
        if m:
            import_idx = i
            break
    if import_idx is None:
        print('ERROR: "import_tables:" not found in focus_pinyin.dict.yaml',
              file=sys.stderr)
        sys.exit(1)

    key_indent = len(lines[import_idx]) - len(lines[import_idx].lstrip())

    # 2. 收集条目段（条目行 + 段内空行），遇到非条目非空行就结束
    start = import_idx + 1
    end = start
    while end < len(lines):
        s = lines[end].strip()
        if s == '':
            end += 1
            continue
        if ITEM_RE.match(lines[end]):
            end += 1
            continue
        break
    segment = lines[start:end]

    # 3. 找出原条目，推断缩进和路径前缀
    raw_items = []
    for line in segment:
        m = ITEM_RE.match(line)
        if m:
            raw_items.append((m.group(1), m.group(2) == '#-', m.group(3)))

    if raw_items:
        item_indent = raw_items[0][0]
        sample_path = raw_items[0][2]
    else:
        item_indent = ' ' * (key_indent + 2)
        sample_path = ''

    prefix = ''
    for cand in ('dicts/dicts_cn/pinyin/', 'dicts_cn/pinyin/', 'dicts/'):
        if sample_path.startswith(cand):
            prefix = cand
            break

    def strip_prefix(p: str) -> str:
        return p[len(prefix):] if prefix and p.startswith(prefix) else p

    # 4. 磁盘文件集合
    disk_files = collect_dict_files()
    disk_set = set(disk_files)

    # 5. 逐行重建条目段（保留空行/原有排版，删除失效条目）
    result_seg: list[str] = []
    last_item_pos = -1
    seen: set[str] = set()

    for line in segment:
        m = ITEM_RE.match(line)
        if not m:
            result_seg.append(line)   # 空行等原样保留
            continue

        rel = strip_prefix(m.group(3))
        if rel in seen:
            continue                  # 重复条目只保留一条
        seen.add(rel)

        if rel not in disk_set:
            continue                  # 磁盘上已不存在 -> 删除

        commented = file_missing_tone(PINYIN_DIR / (rel + '.dict.yaml'))
        marker = '#-' if commented else '-'
        result_seg.append(f'{item_indent}{marker} {prefix}{rel}')
        last_item_pos = len(result_seg) - 1

    # 6. 新增文件（磁盘有、原文件没有）追加到最后一个保留条目之后
    new_lines: list[str] = []
    for rel in disk_files:
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

    active = sum(1 for l in result_seg if ITEM_RE.match(l) and l.lstrip().startswith('- '))
    commented = sum(1 for l in result_seg if ITEM_RE.match(l) and l.lstrip().startswith('#-'))
    print(f'Updated {FOCUS_FILE.name}: '
          f'{active} active, {commented} commented, '
          f'{len(new_lines)} newly added')


if __name__ == '__main__':
    main()