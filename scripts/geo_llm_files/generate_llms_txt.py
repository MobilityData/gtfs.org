#!/usr/bin/env python3
"""Generate llms.txt (https://llmstxt.org) at the root of every in-scope language of the site, for LLMs and GEO.

For each config/<lang>/mkdocs.yml, writes <docs_dir>/llms.txt, which MkDocs copies as a static file to /llms.txt, /fr/llms.txt, ... The structure follows the config's nav: one H2 per top-level entry, one deeper heading per nested section, one link per page. Each page link carries the page's front matter description, or else the first sentence of its first paragraph. The output depends only on the configs and the Markdown sources, so an unchanged site produces no diff.

Usage: python3 scripts/geo_llm_files/generate_llms_txt.py
"""

from __future__ import annotations

import html
import re
from pathlib import Path, PurePosixPath

from site_config import REPO_ROOT, Site, load_sites, read_page

# Per-language text; {site_name} and {repo_url} come from the config. Add an entry for every language in TARGET_LANGUAGES.
TEXT = {
    "en": {
        "summary": "Official documentation of the {site_name}. This site and its source repository ({repo_url}) are the only authoritative sources for this standard.",
        "languages": "Other languages",
    },
    "fr": {
        "summary": "Documentation officielle de la {site_name}. Ce site et son dépôt source ({repo_url}) sont les seules sources faisant autorité pour ce standard.",
        "languages": "Autres langues",
    },
    "es": {
        "summary": "Documentación oficial de la {site_name}. Este sitio y su repositorio fuente ({repo_url}) son las únicas fuentes autorizadas para este estándar.",
        "languages": "Otros idiomas",
    },
    "ja": {
        "summary": "{site_name}の公式ドキュメント。このサイトとそのソースリポジトリ（{repo_url}）は、この標準に関する唯一の信頼できる情報源です。",
        "languages": "他の言語",
    },
}

DESCRIPTION_MAX_LENGTH = 200
# Shorter paragraphs ("Last updated: June 2026.") are skipped when looking for a page description.
PARAGRAPH_MIN_LENGTH = 50

NOT_PROSE = re.compile(
    r"""^(
        \#{1,6}(\s|$)        # heading
      | [<|>]                # HTML, table, blockquote
      | \{[{%#:]             # macro, attribute list
      | !!!|\?\?\?           # admonition
      | !\[                  # image
      | \[[^\]]+\]:\s        # link reference definition
      | ([-*+]|\d+[.)])\s    # list item
      | ([-*_]\s*){3,}$      # horizontal rule
    )""",
    re.VERBOSE,
)
FENCE = re.compile(r"^(```|~~~)")


def plain_text(markdown: str) -> str:
    """Strip inline Markdown and HTML from a paragraph."""
    text = re.sub(r"!\[[^\]]*\]\([^)]*\)", "", markdown)
    text = re.sub(r"\[\^[^\]]+\]", "", text)
    text = re.sub(r"\[([^\]]+)\](\([^)]*\)|\[[^\]]*\])", r"\1", text)
    text = re.sub(r"<[^>]+>", "", text)
    text = re.sub(r"\{:?[^}]*\}", "", text)
    text = re.sub(r"`([^`]*)`", r"\1", text)
    text = re.sub(r"(\*\*|__)(.+?)\1", r"\2", text)
    text = re.sub(r"\*(\S(?:.*?\S)?)\*", r"\1", text)
    return re.sub(r"\s+", " ", html.unescape(text)).strip()


def first_paragraph(body: str) -> str | None:
    """First prose paragraph of a Markdown body, as plain text, skipping headings, lists, HTML, macros, code and short lines."""
    paragraph: list[str] = []
    in_fence = False
    for line in body.splitlines() + [""]:
        stripped = line.strip()
        if FENCE.match(stripped):
            in_fence = not in_fence
            paragraph = []
            continue
        if in_fence:
            continue
        if stripped and paragraph and not NOT_PROSE.match(stripped):
            paragraph.append(stripped)
            continue
        if paragraph:
            text = plain_text(" ".join(paragraph))
            if len(text) >= PARAGRAPH_MIN_LENGTH:
                return text
            paragraph = []
        if stripped and not NOT_PROSE.match(stripped) and not line.startswith(("    ", "\t")):
            paragraph.append(stripped)
    return None


def shorten(text: str) -> str:
    """Shorten text at a word boundary to DESCRIPTION_MAX_LENGTH."""
    if len(text) <= DESCRIPTION_MAX_LENGTH:
        return text
    return text[: DESCRIPTION_MAX_LENGTH - 3].rsplit(" ", 1)[0].rstrip(",;:") + "..."


def first_sentence(text: str) -> str:
    """First sentence of a paragraph: up to the first . ! or ? followed by a capital letter, a digit or an opening mark, or the first CJK full stop (。！？), which takes no following space."""
    cjk = re.search(r"[。！？]", text)
    if cjk:
        return text[: cjk.end()]
    for match in re.finditer(r"[.!?](?=\s+(\S))", text):
        following = match.group(1)
        if following.isupper() or following.isdigit() or following in "¿¡\"'«(":
            return text[: match.end()]
    return text


def first_heading(body: str) -> str | None:
    match = re.search(r"^#\s+(.+?)\s*#*\s*$", body, re.MULTILINE)
    return plain_text(match.group(1)) if match else None


def link_text(text: str) -> str:
    return str(text).replace("[", r"\[").replace("]", r"\]")


def split_entry(entry) -> tuple[str | None, object]:
    """A nav entry is "path.md", {"Title": "path.md"} or {"Title": [children]}."""
    if isinstance(entry, dict):
        ((title, value),) = entry.items()
        return title, value
    return None, entry


def page_link(site: Site, title: str | None, target: str) -> tuple[str, str]:
    """(name, llms.txt list item) for a nav page or external link."""
    if re.match(r"^[a-zA-Z][a-zA-Z0-9+.-]*:", target):
        name = title or target
        return name, f"- [{link_text(name)}]({target})"
    meta, body = read_page(site.docs_dir / target)
    path = PurePosixPath(target)
    name = str(title or meta.get("title") or first_heading(body) or (path.parent.name if path.stem == "index" else path.stem))
    if meta.get("description"):
        description = shorten(plain_text(str(meta["description"])))
    else:
        paragraph = first_paragraph(body)
        description = shorten(first_sentence(paragraph)) if paragraph else None
    item = f"- [{link_text(name)}]({site.page_url(target)})"
    return name, f"{item}: {description}" if description else item


def nav_lines(site: Site, entries: list, level: int) -> list[str]:
    """llms.txt lines for a nav list: pages become list items, sections become headings one level deeper."""
    lines: list[str] = []
    items: list[str] = []
    for entry in entries:
        title, value = split_entry(entry)
        if isinstance(value, list):
            if items:
                lines += items + [""]
                items = []
            lines += [f"{'#' * min(level, 6)} {title}", ""] + nav_lines(site, value, level + 1)
        elif level == 2:
            # A top-level page gets its own H2, like a top-level section.
            name, item = page_link(site, title, value)
            lines += [f"## {name}", "", item, ""]
        else:
            items.append(page_link(site, title, value)[1])
    if items:
        lines += items + [""]
    return lines


def render(site: Site, sites_by_language: dict[str, Site]) -> str:
    text = TEXT.get(site.language)
    if text is None:
        raise SystemExit(f"{site.config_path}: no llms.txt text for language '{site.language}', add it to TEXT in {Path(__file__).name}")
    lines = [f"# {site.name}", "", "> " + text["summary"].format(site_name=site.name, repo_url=site.repo_url), ""]
    lines += nav_lines(site, site.nav, 2)
    others = [a for a in site.alternates if a.get("lang") != site.language and a.get("lang") in sites_by_language]
    if others:
        lines += [f"## {text['languages']}", ""]
        lines += [f"- [{link_text(a['name'])}]({sites_by_language[a['lang']].base_url}llms.txt)" for a in others]
    return "\n".join(lines).rstrip("\n") + "\n"


def main() -> None:
    sites = load_sites()
    sites_by_language = {site.language: site for site in sites}
    for site in sites:
        output = site.docs_dir / "llms.txt"
        output.write_text(render(site, sites_by_language), encoding="utf-8")
        print(f"Wrote {output.relative_to(REPO_ROOT)}")


if __name__ == "__main__":
    main()
