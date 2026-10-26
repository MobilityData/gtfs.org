"""Shared helpers for the GEO file generators: read the per-language MkDocs configs in config/<lang>/."""

from __future__ import annotations

import re
from pathlib import Path, PurePosixPath
from urllib.parse import quote, urljoin

import yaml

REPO_ROOT = Path(__file__).resolve().parents[2]
# Any single YAML config per language dir, so this keeps working after the
# planned switch from mkdocs.yml to Properdocs (config files not named mkdocs.yml).
CONFIG_GLOB = "config/*/*.yml"

# gtfs.org ships 11 per-language configs, but only these four have a homepage
# locale file and are in scope for the GEO files. The other languages are
# skipped so the generators never emit a broken llms.txt / index.generated.md
# for a language with no locale strings.
TARGET_LANGUAGES = ("en", "fr", "es", "ja")

FRONT_MATTER = re.compile(r"\A---[ \t]*\r?\n(?P<yaml>.*?)^---[ \t]*(?:\r?\n|\Z)", re.DOTALL | re.MULTILINE)


class _Loader(yaml.SafeLoader):
    """SafeLoader that reads custom tags (!!python/name:..., !ENV, ...) as null instead of failing."""


_Loader.add_multi_constructor("", lambda loader, suffix, node: None)


def load_yaml(text: str):
    return yaml.load(text, Loader=_Loader)


def split_front_matter(text: str) -> tuple[dict, str]:
    """Return (front matter, body) of a Markdown file."""
    match = FRONT_MATTER.match(text)
    if not match:
        return {}, text
    meta = load_yaml(match.group("yaml"))
    return (meta if isinstance(meta, dict) else {}), text[match.end():]


def read_page(path: Path) -> tuple[dict, str]:
    """Return (front matter, body) of a Markdown file, or ({}, "") if it does not exist."""
    if not path.is_file():
        return {}, ""
    return split_front_matter(path.read_text(encoding="utf-8"))


class Site:
    """One language of the site, as described by its config/<lang>/mkdocs.yml."""

    def __init__(self, config_path: Path):
        self.config_path = config_path
        self.config = load_yaml(config_path.read_text(encoding="utf-8")) or {}
        self.name = self.config["site_name"]
        self.site_url = self.config["site_url"].rstrip("/") + "/"
        self.repo_url = self.config.get("repo_url")
        self.language = (self.config.get("theme") or {}).get("language", "en")
        self.docs_dir = (config_path.parent / self.config.get("docs_dir", "docs")).resolve()
        self.use_directory_urls = self.config.get("use_directory_urls", True)
        self.alternates = (self.config.get("extra") or {}).get("alternate") or []
        self.nav = self.config.get("nav") or []
        self.base_url = self._base_url()

    def _base_url(self) -> str:
        """Absolute URL of this language's homepage (https://gtfs.org/, https://gtfs.org/fr/, ...), from its extra.alternate entry."""
        for alternate in self.alternates:
            if alternate.get("lang") == self.language and alternate.get("link"):
                return urljoin(self.site_url, alternate["link"])
        return self.site_url

    def page_url(self, src_path: str) -> str:
        """Absolute URL at which MkDocs serves a docs-relative Markdown file."""
        path = PurePosixPath(src_path)
        is_index = path.stem.lower() in ("index", "readme")
        if self.use_directory_urls:
            target = path.parent if is_index else path.with_suffix("")
            dest = "" if str(target) == "." else f"{target}/"
        else:
            dest = str(path.with_name("index.html") if is_index else path.with_suffix(".html"))
        return urljoin(self.base_url, quote(dest))


def load_sites() -> list[Site]:
    """One Site per in-scope config/<lang>/mkdocs.yml (TARGET_LANGUAGES only), in a stable order."""
    paths = sorted(
        path for path in REPO_ROOT.glob(CONFIG_GLOB)
        if path.parent.name in TARGET_LANGUAGES
    )
    if not paths:
        raise SystemExit(f"No config found matching {CONFIG_GLOB} for {', '.join(TARGET_LANGUAGES)} in {REPO_ROOT}")
    return [Site(path) for path in paths]
