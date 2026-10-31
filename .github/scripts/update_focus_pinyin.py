#!/usr/bin/env python3
"""
同步 focus_pinyin.dict.yaml 的 import_tables 段，使其与
dicts/dicts_cn/pinyin/dicts/（dicts.zip 的解压落点）一致。

规则：
1. 只在 dicts/dicts_cn/pinyin/dicts/ 前缀下判断“删除 / 新增 / 注释”。
2. 其它条目（pinyinA、emoji、units、diagnosis 等）原样保留。
3. 缺失文件 -> 删除该条目（包括 #- en / #- abbrev / #- t9_abbrev 等）。
4. 新增文件 -> 追加到“主词库分组”末尾
   （即最后一个 dicts/dicts_cn/pinyin/dicts/ 条目之后，
    在 “# 建议把扩展词库放到下面...” 这类分组注释之前）。
5. 注释策略：
   - 已有条目：不主动取消注释（尊重原人工判断）；
     若检测到“多字词但拼音无空格”，升级为 "#- "。
   - 新增条目：若检测到该问题，写 "#- "，否则 "- "。
6. 只有确实发生变更时，才把 frontmatter 的
   version: "YYYY-MM-DD" 更新为北京时间当天日期。
"""
from __future__ import annotations
import os
import re
import sys
from datetime import datetime, timedelta, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PINYIN_DIR = ROOT / 'dicts' / 'dicts_cn' / 'pinyin'
SYNC_SUBDIR = 'dicts'
FOCUS_FILE = ROOT / 'focus_pinyin.dict.yaml'

SYNC_PREFIX = 'dicts/dicts_cn/pinyin/dicts/'

BEIJING_TZ = timezone(timedelta(hours=8))

CJK_RE = re.compile(r'[\u3400-\u4dbf\u4e00-\u9fff\uf900-\ufaff]')
IMPORT_RE = re.compile(r'^(\s*)import_tables\s*:\s*$')
VERSION_RE = re.compile(
    r'^(\s*version\s*:\s*)(["\'])(\d{4}-\d{2}-\d{2})(["\'])\s*$'
)

# 有效条目：   - path          /   - path   #行尾注释
ACTIVE_RE = re.compile(r'^(\s*)-\s+(\S+?)(\s+#.*)?$')
# 注释条目：   #- path         /   # - path /  #- path  #行尾注释
COMMENTED_RE = re.compile(r'^(\s*)#\s*-\s+(\S+?)(\s+#.*)?$')


# ---------- 工具 ----------

def file_missing_tone(path: Path) -> bool:
    """dict 文件正文中是否出现“多字词但拼音无空格”的条目。"""
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
        if len(CJK_RE.findall(text_part)) > 1 \
                and ' ' not in reading and '\t' not in reading:
            return True
    return False


def collect_sync_files() -> list[str]:
    """dicts/dicts_cn/pinyin/dicts 下 *.dict.yaml，相对该目录、去掉后缀。"""
    root_dir = PINYIN_DIR / SYNC_SUBDIR
    if not root_dir.exists():
        return []
    results: list[str] = []
    for root, dirs, files in os.walk(root_dir):
        dirs.sort()
        for f in sorted(files):
            if f.endswith('.dict.yaml'):
                rel = (Path(root) / f).relative_to(root_dir).as_posix()
                results.append(rel[:-len('.dict.yaml')])
    return results


def bump_version(all_lines: list[str]) -> bool:
    """把 frontmatter 中的 version 日期替换为北京时间当天；返回是否有改动。"""
    today = datetime.now(BEIJING_TZ).strftime('%Y-%m-%d')
    for i, line in enumerate(all_lines):
        m = VERSION_RE.match(line)
        if m:
            if m.group(3) == today:
                return False
            all_lines[i] = f'{m.group(1)}{m.group(2)}{today}{m.group(4)}'
            return True
    return False


# ---------- 主逻辑 ----------

def main() -> None:
    if not FOCUS_FILE.exists():
        print(f'ERROR: {FOCUS_FILE} not found', file=sys.stderr)
        sys.exit(1)
    if not (PINYIN_DIR / SYNC_SUBDIR).exists():
        print(f'ERROR: {PINYIN_DIR / SYNC_SUBDIR} not found', file=sys.stderr)
        sys.exit(1)

    original = FOCUS_FILE.read_text(encoding='utf-8')
    lines = original.split('\n')

    # 1) 定位 import_tables
    import_idx = next((i for i, l in enumerate(lines) if IMPORT_RE.match(l)), None)
    if import_idx is None:
        print('ERROR: "import_tables:" not found', file=sys.stderr)
        sys.exit(1)

    # 2) 段边界
    end = import_idx + 1
    while end < len(lines):
        line = lines[end]
        s = line.strip()
        if not s:
            end += 1; continue
        if s.startswith('#') and not COMMENTED_RE.match(line):
            end += 1; continue
        if ACTIVE_RE.match(line) or COMMENTED_RE.match(line):
            end += 1; continue
        break

    segment = lines[import_idx + 1:end]

    # 3) 探测缩进
    item_indent = '   '
    for line in segment:
        m = ACTIVE_RE.match(line) or COMMENTED_RE.match(line)
        if m:
            item_indent = m.group(1)
            break

    # 4) 磁盘状态
    sync_files = collect_sync_files()
    sync_set = set(sync_files)

    # 5) 重建 import_tables 段
    result: list[str] = []
    seen: set[str] = set()
    last_sync_idx = -1

    for line in segment:
        s = line.strip()
        if not s:
            result.append(line); continue
        if s.startswith('#') and not COMMENTED_RE.match(line):
            result.append(line); continue

        am = ACTIVE_RE.match(line)
        cm = COMMENTED_RE.match(line)
        if not (am or cm):
            result.append(line); continue

        indent = (am or cm).group(1)
        path   = (am or cm).group(2)
        trail  = (am or cm).group(3) or ''
        was_commented = bool(cm)

        if not path.startswith(SYNC_PREFIX):
            result.append(line); continue

        rel = path[len(SYNC_PREFIX):]
        if rel in seen:
            continue
        seen.add(rel)

        if rel not in sync_set:
            continue   # 磁盘上不存在 -> 删除

        fp = PINYIN_DIR / SYNC_SUBDIR / (rel + '.dict.yaml')
        need = file_missing_tone(fp)
        new_commented = was_commented or need

        if new_commented == was_commented:
            result.append(line)
        else:
            marker = '#-' if new_commented else '-'
            result.append(f'{indent}{marker} {path}{trail}')

        last_sync_idx = len(result) - 1

    # 6) 新增条目插到主词库分组末尾
    new_items = [rel for rel in sync_files if rel not in seen]
    if new_items:
        new_lines: list[str] = []
        for rel in new_items:
            fp = PINYIN_DIR / SYNC_SUBDIR / (rel + '.dict.yaml')
            marker = '#-' if file_missing_tone(fp) else '-'
            new_lines.append(f'{item_indent}{marker} {SYNC_PREFIX}{rel}')
        if last_sync_idx >= 0:
            result[last_sync_idx + 1:last_sync_idx + 1] = new_lines
        else:
            result[0:0] = new_lines

    new_all = lines[:import_idx + 1] + result + lines[end:]
    new_content = '\n'.join(new_all)

    # 7) 无实际变更 -> 不改 version、不写文件
    if new_content == original:
        print('No change. focus_pinyin.dict.yaml is up to date.')
        return

    # 8) 有变更 -> 同步 version 为北京时间当天
    version_changed = bump_version(new_all)
    final_content = '\n'.join(new_all)
    FOCUS_FILE.write_text(final_content, encoding='utf-8')

    active = sum(1 for l in result
                 if ACTIVE_RE.match(l) and l.lstrip().startswith('- '))
    commented = sum(1 for l in result if COMMENTED_RE.match(l))
    print(f'Updated {FOCUS_FILE.name}: '
          f'{active} active, {commented} commented, '
          f'{len(new_items)} newly added, '
          f'version {"bumped" if version_changed else "unchanged"} '
          f'({datetime.now(BEIJING_TZ).strftime("%Y-%m-%d")})')


if __name__ == '__main__':
    main()