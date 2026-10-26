#!/usr/bin/env bash
# builtbyjosef installer. Run in a project root (VS Code terminal, Ubuntu/WSL terminal, or a Claude Code session).
# Env: JY_REPO (git url), JY_REF (tag or branch, default v1), JY_DEST (default design/builtbyjosef)
set -euo pipefail

REPO="${JY_REPO:-https://github.com/16JoeTheCoder/builtbyjosef-designsystem.git}"
REF="${JY_REF:-v1}"
DEST="${JY_DEST:-design/builtbyjosef}"
START="<!-- builtbyjosef:start -->"
END="<!-- builtbyjosef:end -->"

tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT

echo "-> fetching $REPO@$REF"
git clone --quiet --depth 1 --branch "$REF" "$REPO" "$tmp/src"

echo "-> copying system into $DEST"
mkdir -p "$DEST"
for p in DESIGN.md tokens.css tokens.json bundle.css ignite.css index.css jy.js builtbyjosef.mplstyle fonts logos; do
  rm -rf "${DEST:?}/$p"
  cp -R "$tmp/src/$p" "$DEST/$p"
done
mkdir -p scripts
cp "$tmp/src/scripts/jy-check.sh" scripts/jy-check.sh

echo "-> writing CLAUDE.md block"
touch CLAUDE.md
if grep -qF "$START" CLAUDE.md; then
  awk -v s="$START" -v e="$END" '$0==s{skip=1} !skip{print} $0==e{skip=0}' CLAUDE.md > "$tmp/CLAUDE.md"
  cat "$tmp/CLAUDE.md" > CLAUDE.md
fi
# blank separator line only if the file has content that does not already end in a blank line (keeps re-runs stable)
if [ -s CLAUDE.md ] && [ -n "$(tail -n 1 CLAUDE.md)" ]; then echo >> CLAUDE.md; fi
{ echo "$START"; cat "$tmp/src/CLAUDE-snippet.block.md"; echo "$END"; } >> CLAUDE.md

echo "ok builtbyjosef $REF installed in $DEST"
echo "-> next: import $DEST/index.css, commit design/, scripts/ and CLAUDE.md"
