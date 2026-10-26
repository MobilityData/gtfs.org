#!/usr/bin/env python3
"""Generate index.generated.md, a Markdown version of each templated homepage, for LLMs and GEO.

For every in-scope language whose <docs_dir>/index.md holds only front matter and names a template (such as template: home.html), render the content blocks of that template from the theme's custom_dir with Jinja2 and the language's locale files, convert the HTML to Markdown, and write it to <docs_dir>/index.generated.md. The site is not built: only the page content blocks of the template are rendered, so the theme's header, navigation and footer never appear. Scripts, styles, icons and images are dropped, and links are made absolute. A language whose index.md has content of its own is skipped, and a stale index.generated.md there is removed. The configs exclude *.generated.md with exclude_docs, so the site build ignores these files.

Usage: python3 scripts/geo_llm_files/generate_index_generated_md.py
"""

from __future__ import annotations

import re
from html.parser import HTMLParser
from urllib.parse import urljoin

import jinja2

from site_config import REPO_ROOT, Site, load_sites, read_page

OUTPUT_NAME = "index.generated.md"

# Stands in for the theme's main.html, which page templates extend: only the blocks that hold page content are rendered.
CONTENT_LAYOUT = "{% block hero %}{% endblock %}{% block tabs %}{% endblock %}{% block content %}{% endblock %}"

VOID_TAGS = {"area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "source", "track", "wbr"}
SKIPPED_TAGS = {
    "audio", "button", "canvas", "form", "head", "iframe", "img", "input", "link", "meta", "nav", "noscript",
    "picture", "script", "select", "style", "svg", "template", "textarea", "title", "video",
}
HEADINGS = {"h1", "h2", "h3", "h4", "h5", "h6"}
BLOCK_TAGS = HEADINGS | {
    "address", "article", "aside", "blockquote", "dd", "details", "div", "dl", "dt", "figcaption", "figure",
    "footer", "header", "hr", "li", "main", "ol", "p", "pre", "section", "summary", "table", "tbody", "td",
    "tfoot", "th", "thead", "tr", "ul",
}


class LenientUndefined(jinja2.ChainableUndefined):
    """Variables the theme provides at build time (page.next_page, lang.t, ...) render as empty text instead of failing; in these templates they only fill attributes that the conversion drops."""

    def __call__(self, *args, **kwargs):
        return self


def render_template(site: Site, template: str) -> str:
    """HTML of the content blocks of a template from the theme's custom_dir, for one language."""
    theme = site.config.get("theme") or {}
    custom_dir = (site.config_path.parent / theme.get("custom_dir", "overrides")).resolve()
    environment = jinja2.Environment(
        loader=jinja2.ChoiceLoader([
            jinja2.DictLoader({"main.html": CONTENT_LAYOUT}),
            jinja2.FileSystemLoader(custom_dir),
            # Theme templates that are not overridden in custom_dir (partials, ...) render as nothing.
            jinja2.FunctionLoader(lambda name: ""),
        ]),
        undefined=LenientUndefined,
    )
    environment.filters["url"] = lambda value: value
    config = {**site.config, "theme": {**theme, "language": site.language}}
    return environment.get_template(template).render(config=config)


class Node:
    def __init__(self, tag: str, attrs: dict[str, str | None]):
        self.tag = tag
        self.attrs = attrs
        self.children: list[Node | str] = []


class TreeBuilder(HTMLParser):
    """Build a tree from HTML, closing unclosed elements the way browsers do for the common cases."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.root = Node("#root", {})
        self.stack = [self.root]

    def handle_starttag(self, tag, attrs):
        if tag in BLOCK_TAGS and self.stack[-1].tag == "p":
            self.stack.pop()
        if tag == "li":
            for i in range(len(self.stack) - 1, 0, -1):
                if self.stack[i].tag in ("ul", "ol"):
                    break
                if self.stack[i].tag == "li":
                    del self.stack[i:]
                    break
        node = Node(tag, dict(attrs))
        self.stack[-1].children.append(node)
        if tag not in VOID_TAGS:
            self.stack.append(node)

    def handle_startendtag(self, tag, attrs):
        self.stack[-1].children.append(Node(tag, dict(attrs)))

    def handle_endtag(self, tag):
        for i in range(len(self.stack) - 1, 0, -1):
            if self.stack[i].tag == tag:
                del self.stack[i:]
                return

    def handle_data(self, data):
        self.stack[-1].children.append(data)


def skipped(node: Node) -> bool:
    return (
        node.tag in SKIPPED_TAGS
        or "hidden" in node.attrs
        or node.attrs.get("aria-hidden") == "true"
        or node.attrs.get("tabindex") == "-1"
    )


def escape(text: str) -> str:
    return re.sub(r"([\\`*\[\]<])", r"\\\1", re.sub(r"\s+", " ", text))


def wrap(inner: str, before: str, after: str) -> str:
    """Wrap inline content in Markdown markers, keeping the surrounding spaces outside them."""
    core = inner.strip()
    if not core:
        return inner
    lead = " " if inner[0].isspace() else ""
    trail = " " if inner[-1].isspace() else ""
    return f"{lead}{before}{core}{after}{trail}"


def has_blocks(node: Node) -> bool:
    return any(isinstance(child, Node) and not skipped(child) and (child.tag in BLOCK_TAGS or has_blocks(child)) for child in node.children)


class MarkdownRenderer:
    def __init__(self, page_url: str):
        self.page_url = page_url

    def blocks(self, node: Node, out: list[str]) -> list[str]:
        """Append the Markdown blocks of a container node to out."""
        inline: list[str] = []

        def flush():
            text = re.sub(r" {2,}", " ", "".join(inline)).strip()
            inline.clear()
            if text:
                out.append(text)

        for child in node.children:
            if isinstance(child, str):
                inline.append(escape(child))
                continue
            if skipped(child):
                continue
            tag = child.tag
            if tag not in BLOCK_TAGS and not has_blocks(child):
                inline.append(self.element(child))
                continue
            flush()
            if tag in HEADINGS:
                text = self.inline(child).strip()
                if text:
                    out.append(f"{'#' * int(tag[1])} {text}")
            elif tag in ("ul", "ol") and not any(isinstance(li, Node) and has_blocks(li) for li in child.children):
                self.list(child, out, 0)
            elif tag == "pre":
                code = "".join(self.text(child)).strip("\n")
                out.append(f"```\n{code}\n```")
            elif tag == "blockquote":
                quoted = self.blocks(child, [])
                out.append("\n>\n".join("\n".join(f"> {line}" for line in block.splitlines()) for block in quoted))
            elif tag == "hr":
                continue
            elif tag == "a" and child.attrs.get("href"):
                # A link around blocks (a card): render the blocks, then the link on its own line.
                self.blocks(child, out)
                out.append(f"<{self.url(child.attrs['href'])}>")
            else:
                self.blocks(child, out)
        flush()
        return out

    def list(self, node: Node, out: list[str], depth: int) -> None:
        lines: list[str] = []
        number = 0
        for item in node.children:
            if not isinstance(item, Node) or item.tag != "li" or skipped(item):
                continue
            number += 1
            marker = f"{number}." if node.tag == "ol" else "-"
            text_parts: list[str] = []
            nested: list[str] = []
            for child in item.children:
                if isinstance(child, Node) and child.tag in ("ul", "ol") and not skipped(child):
                    self.list(child, nested, depth + 1)
                elif isinstance(child, str):
                    text_parts.append(escape(child))
                else:
                    text_parts.append(self.element(child))
            text = re.sub(r" {2,}", " ", "".join(text_parts)).strip()
            if text:
                lines.append(f"{'    ' * depth}{marker} {text}")
            lines.extend(nested)
        if lines:
            out.append("\n".join(lines))

    def inline(self, node: Node) -> str:
        """Inline Markdown of the children of a node."""
        return "".join(escape(child) if isinstance(child, str) else self.element(child) for child in node.children)

    def element(self, node: Node) -> str:
        """Inline Markdown of one element."""
        if skipped(node):
            return ""
        tag = node.tag
        if tag == "br":
            return " "
        if tag == "code":
            code = "".join(self.text(node))
            return f"`{code}`" if code.strip() else ""
        inner = self.inline(node)
        if tag == "a":
            href = node.attrs.get("href")
            if href and not href.startswith("javascript:"):
                return wrap(inner, "[", f"]({self.url(href)})")
            return inner
        if tag in ("strong", "b"):
            return wrap(inner, "**", "**")
        if tag in ("em", "i"):
            return wrap(inner, "*", "*")
        if tag in BLOCK_TAGS:
            return f" {inner} "
        return inner

    def text(self, node: Node) -> list[str]:
        """Raw text of a node (for code)."""
        parts: list[str] = []
        for child in node.children:
            parts.extend([child] if isinstance(child, str) else self.text(child))
        return parts

    def url(self, href: str) -> str:
        return urljoin(self.page_url, href.strip())


def html_to_markdown(html: str, page_url: str, title: str) -> str:
    """Markdown of an HTML fragment, under a # title, with links resolved against page_url."""
    builder = TreeBuilder()
    builder.feed(html)
    builder.close()
    blocks = MarkdownRenderer(page_url).blocks(builder.root, [f"# {title}"])
    return "\n\n".join(blocks).strip() + "\n"


def main() -> None:
    for site in load_sites():
        output = site.docs_dir / OUTPUT_NAME
        meta, body = read_page(site.docs_dir / "index.md")
        template = meta.get("template")
        if body.strip() or not template:
            if output.exists():
                output.unlink()
                print(f"Removed {output.relative_to(REPO_ROOT)}: index.md is not a templated page")
            else:
                print(f"Skipped {site.language}: index.md is not a templated page")
            continue
        html = render_template(site, template)
        output.write_text(html_to_markdown(html, site.base_url, site.name), encoding="utf-8")
        print(f"Wrote {output.relative_to(REPO_ROOT)}")


if __name__ == "__main__":
    main()
