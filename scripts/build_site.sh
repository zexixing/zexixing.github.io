#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC="$ROOT/src"
BUILD="$ROOT/.hugo-build"

if [[ ! -d "$ROOT/.git" || ! -f "$SRC/hugo.toml" ]]; then
  echo "Run this script from the zexixing.github.io checkout." >&2
  exit 1
fi

command -v hugo >/dev/null 2>&1 || {
  echo "hugo is required. Install it with Homebrew: brew install hugo" >&2
  exit 1
}

rm -rf "$BUILD"
hugo --source "$SRC" --destination "$BUILD" --cleanDestinationDir --minify

generated_paths=(
  ".gitmodules"
  "404.html"
  "index.html"
  "index.json"
  "index.webmanifest"
  "index.xml"
  "robots.txt"
  "sitemap.xml"
  ".nojekyll"
  "admin"
  "announcements"
  "author"
  "authors"
  "backup"
  "categories"
  "category"
  "courses"
  "css"
  "home"
  "images"
  "img"
  "js"
  "news"
  "post"
  "project"
  "publication"
  "publication-type"
  "publication_types"
  "slides"
  "tag"
  "tags"
  "talk"
  "thanks"
)

for path in "${generated_paths[@]}"; do
  rm -rf "$ROOT/$path"
done

cp -R "$BUILD"/. "$ROOT"/
