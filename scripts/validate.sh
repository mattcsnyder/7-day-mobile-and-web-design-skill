#!/bin/sh

set -eu

required_files="
README.md
core/skill-definition.md
docs/platform-packaging.md
platforms/claude/README.md
platforms/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
platforms/codex/README.md
platforms/codex/plugins/7-day-mobile-and-web-design/.codex-plugin/plugin.json
platforms/codex/plugins/7-day-mobile-and-web-design/skills/7-day-mobile-and-web-design/SKILL.md
platforms/cursor/README.md
platforms/cursor/.cursor/rules/7-day-mobile-and-web-design.mdc
scripts/validate.sh
scripts/export.sh
"

for file in $required_files; do
  if [ ! -f "$file" ]; then
    echo "Missing required file: $file" >&2
    exit 1
  fi
done

echo "Validation passed: required shared and platform files are present."
