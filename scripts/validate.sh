#!/bin/sh

set -eu

test -d skills || {
  echo "Missing skills directory" >&2
  exit 1
}

found_skill=0

for skill_dir in skills/*; do
  [ -d "$skill_dir" ] || continue
  found_skill=1

  slug=$(basename "$skill_dir")

  required_files="
$skill_dir/README.md
$skill_dir/skill.json
$skill_dir/core/skill-definition.md
$skill_dir/docs/platform-packaging.md
$skill_dir/platforms/claude/README.md
$skill_dir/platforms/claude/.claude/skills/$slug/SKILL.md
$skill_dir/platforms/codex/README.md
$skill_dir/platforms/codex/plugins/$slug/.codex-plugin/plugin.json
$skill_dir/platforms/codex/plugins/$slug/skills/$slug/SKILL.md
$skill_dir/platforms/cursor/README.md
$skill_dir/platforms/cursor/.cursor/rules/$slug.mdc
"

  for file in $required_files; do
    if [ ! -f "$file" ]; then
      echo "Missing required file: $file" >&2
      exit 1
    fi
  done
done

[ "$found_skill" -eq 1 ] || {
  echo "No skills found under skills/" >&2
  exit 1
}

echo "Validation passed: workspace skills are present and structurally complete."
