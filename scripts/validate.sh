#!/bin/sh

set -eu

required_files="
README.md
core/skill-definition.md
docs/platform-packaging.md
platforms/claude/README.md
platforms/claude/skill/SKILL.md
platforms/codex/skill/README.md
platforms/codex/skill/SKILL.md
platforms/codex/.codex-plugin/plugin.json
platforms/cursor/rules/README.md
platforms/cursor/rules/7-day-mobile-and-web-design.mdc
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
