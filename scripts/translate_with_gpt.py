import argparse
import csv
import re
from pathlib import Path
from typing import List, Tuple
from concurrent.futures import ThreadPoolExecutor
from markdown.extensions.toc import slugify
from openai import OpenAI

# Constants and regex patterns (non-public)
_GPT_MODEL = 'gpt-5-chat-latest'
_MAX_WORKERS = 10
_HEADING = re.compile(r'^(?: {0,3})(#{1,6})[ \t]+(.+?)\s*$')
_ID_AT_END = re.compile(r'\s\{#([^}]+)\}\s*$')
_FENCE   = re.compile(r'^(?: {0,3})(`{3,}|~{3,})')

# Global OpenAI client instance (non-public)
_client = OpenAI()


# Helper functions (non-public)
def _load_prompt(lang: str) -> str:
    """
    Load the translation prompt for the given language.

    Args:
        lang: Language code (e.g., "ja", "fr", "en").

    Returns:
        The prompt string read from scripts/prompts/{lang}/base.txt.
    """
    base_path = Path(f'scripts/prompts/{lang}/base.txt')
    glosssary_both = Path(f'scripts/prompts/{lang}/glossary_both.csv')
    glosssary_ja = Path(f'scripts/prompts/{lang}/glossary_ja.csv')
    
    prompt_template = base_path.read_text(encoding='utf-8')

    both = _read_glossary_csv(glosssary_both)
    ja_only = _read_glossary_csv(glosssary_ja)
    both_lines = "\n".join(f"- {en}: {ja}" for en, ja in both)
    ja_only_lines = "\n".join(f"- {en}: {ja}" for en, ja in ja_only)

    prompt = prompt_template.format(both_lines, ja_only_lines)
    return prompt


def _read_glossary_csv(csv_path: Path) -> List[Tuple[str, str]]:
    """
    Read a glossary CSV file (en,ja) and return a list of term pairs.

    Args:
        csv_path: Path to the glossary CSV file.

    Returns:
        A list of (en, ja) tuples.
        - en: Source term in English.
        - ja: Target term in Japanese (final form to be used in the prompt,
              may already include parentheses if English should be shown).
    """
    items: List[Tuple[str, str]] = []
    with csv_path.open(encoding='utf-8', newline='') as f:
        reader = csv.DictReader(f)
        for row in reader:
            en = (row.get('en') or '').strip()
            ja = (row.get('ja') or '').strip()
            if en and ja:
                items.append((en, ja))
    return items


def _extract_front(md: str) -> Tuple[str, str]:
    """
    Extract YAML front matter (delimited by ---) from markdown.

    Args:
        md: Markdown content.

    Returns:
        A tuple (front_matter, body). If no front matter exists, returns ("", md).
    """
    if md.startswith('---\n'):
        end = md.find('\n---', 4)
        if end != -1:
            end += len('\n---')
            return md[:end].lstrip(), md[end:].lstrip('\n')
    return '', md


def _strip_inline_markup(text: str) -> str:
    """
    Remove inline markdown markup for slug generation.

    Args:
        text: Input string.

    Returns:
        String with inline markdown removed.
    """
    text = re.sub(r'(?<!\w)(\*{1,3}|_{1,3}|~~|`)(.+?)\1(?!\w)', r'\2', text)
    text = re.sub(r'`(.+?)`', r'\1', text)
    text = re.sub(r'!\[([^\]]*)\]\([^\)]+\)', r'\1', text)
    text = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', text)
    text = re.sub(r'<[^>]+>', '', text)
    text = text.replace("\\", "")
    return text


def _split_sections(md: str) -> Tuple[str, List[Tuple[str, str]]]:
    """
    Split markdown content into sections by ATX headings, preserving code fences.

    Behavior notes (kept identical to original):
    - Do not detect headings inside fenced code blocks.
    - If a heading text lacks an explicit {#id}, generate one via slugify and append.
    - Return (front_matter, [(heading_line, section_body), ...]).
    """
    front, body = _extract_front(md)
    lines = body.splitlines()
    sections: List[Tuple[str, str]] = []
    heading = ''
    buf: List[str] = []
    in_code = False

    def flush():
        if heading or ''.join(buf).strip():
            sections.append((heading, '\n'.join(buf).rstrip()))

    for line in lines:
        if _FENCE.match(line):
            in_code = not in_code
            buf.append(line)
            continue
        if not in_code:
            m = _HEADING.match(line)
            if m:
                flush()
                level = m.group(1)
                text = m.group(2).strip()
                slug = slugify(_strip_inline_markup(text), '-')
                heading = f'{level} {text}'
                if not _ID_AT_END.search(text) and slug != '':
                    heading += f' {{: #{slug}}}'
                buf = []
                continue
        buf.append(line)

    flush()
    return front, sections


def _translate_text(text: str, prompt: str) -> str:
    """
    Translate text using the OpenAI API (same request/response logic).
    """
    response = _client.responses.create(
        model=_GPT_MODEL,
        temperature=0,
        input=[
            {
                'role': 'developer',
                'content': prompt
            }, {
                'role': 'user',
                'content': text
            }
        ]
    )

    return response.output_text


def _translate_file(src: Path, out: Path, prompt: str):
    """
    Translate a single markdown file section by section (I/O flow unchanged).
    """
    if not src.exists():
        print(f'Source file not found: {src}')
        return
    
    print(f'Translation start: {src}')
    
    with open(src, 'r', encoding='utf-8') as f:
        content = f.read()

    front, sections = _split_sections(content)
    translated = []

    section_texts = [f"{heading}\n\n{body}" for (heading, body) in sections]
    translated = [None] * len(section_texts)
    with ThreadPoolExecutor(max_workers=_MAX_WORKERS) as ex:
        futures = [ex.submit(_translate_text, text, prompt) for text in section_texts]
        for i, fut in enumerate(futures):
            translated[i] = fut.result()
            print(f"Translated: {sections[i][0]}")

    if front and not front.endswith('\n'):
        front += '\n'
    translated_content = front + '\n\n'.join(t for t in translated if t is not None).rstrip() + '\n'

    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, 'w', encoding='utf-8') as f:
        f.write(translated_content)

    print('Translation complete!')


# CLI entry point (public)
def main() -> None:
    """CLI entry point for the translation script."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--src', required=True)
    parser.add_argument('--dst', required=True)
    parser.add_argument('--lang', required=True)
    parser.add_argument('--files', nargs='*') 
    args = parser.parse_args()

    prompt = _load_prompt(args.lang)

    src_root = Path(args.src).resolve()
    dst_root = Path(args.dst).resolve()
    if args.files:
        target_files = [Path(f).resolve() for f in args.files]
    else:
        target_files = [p for p in src_root.rglob('*') if p.is_file()]

    print(target_files)

    for file in target_files:
        src_path = Path(file)
        if not src_path.exists():
            continue
        dst_path = dst_root / src_path.relative_to(src_root)
        dst_path.parent.mkdir(parents=True, exist_ok=True)
        if src_path.suffix.lower() == '.md':
            _translate_file(src_path, dst_path, prompt)
        else:
            dst_path.write_bytes(src_path.read_bytes())


if __name__ == '__main__':
    main()
