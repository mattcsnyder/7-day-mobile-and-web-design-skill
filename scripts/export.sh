#!/bin/sh

set -eu

rm -rf dist
mkdir -p dist/claude dist/codex dist/cursor

cp -R platforms/claude/.claude dist/claude/
cp -R platforms/codex/plugins dist/codex/
cp -R platforms/cursor/.cursor dist/cursor/

echo "Exported Claude package root to dist/claude/.claude"
echo "Exported Codex package root to dist/codex/plugins"
echo "Exported Cursor package root to dist/cursor/.cursor"
