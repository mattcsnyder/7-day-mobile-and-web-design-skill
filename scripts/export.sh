#!/bin/sh

set -eu

rm -rf dist
mkdir -p dist

found_skill=0

for skill_dir in skills/*; do
  [ -d "$skill_dir" ] || continue
  found_skill=1

  slug=$(basename "$skill_dir")
  out_dir="dist/$slug"

  mkdir -p "$out_dir/claude" "$out_dir/codex" "$out_dir/cursor"

  cp -R "$skill_dir/platforms/claude/.claude" "$out_dir/claude/"
  cp -R "$skill_dir/platforms/codex/plugins" "$out_dir/codex/"
  cp -R "$skill_dir/platforms/cursor/.cursor" "$out_dir/cursor/"

  echo "Exported $slug to $out_dir"
done

[ "$found_skill" -eq 1 ] || {
  echo "No skills found under skills/" >&2
  exit 1
}
