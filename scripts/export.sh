#!/bin/sh

set -eu

mkdir -p dist/claude dist/codex dist/cursor

cp -R platforms/claude/. dist/claude/
cp -R platforms/codex/. dist/codex/
cp -R platforms/cursor/. dist/cursor/

echo "Exported Claude package to dist/claude"
echo "Exported Codex package to dist/codex"
echo "Exported Cursor package to dist/cursor"
