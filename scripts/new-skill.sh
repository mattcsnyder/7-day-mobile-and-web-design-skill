#!/bin/sh

set -eu

if [ "$#" -lt 1 ]; then
  echo "Usage: sh scripts/new-skill.sh \"Skill Name\" [\"Description\"]" >&2
  exit 1
fi

name="$1"
description="${2:-Starter scaffold for $1.}"

slug=$(printf "%s" "$name" \
  | tr '[:upper:]' '[:lower:]' \
  | sed 's/[^a-z0-9]/-/g; s/-\{2,\}/-/g; s/^-//; s/-$//')

[ -n "$slug" ] || {
  echo "Unable to derive a valid slug from: $name" >&2
  exit 1
}

skill_dir="skills/$slug"

[ ! -e "$skill_dir" ] || {
  echo "Skill already exists: $skill_dir" >&2
  exit 1
}

mkdir -p \
  "$skill_dir/core/examples" \
  "$skill_dir/core/constraints" \
  "$skill_dir/docs" \
  "$skill_dir/platforms/claude/.claude/skills/$slug" \
  "$skill_dir/platforms/codex/plugins/$slug/.codex-plugin" \
  "$skill_dir/platforms/codex/plugins/$slug/skills/$slug" \
  "$skill_dir/platforms/cursor/.cursor/rules"

cat > "$skill_dir/README.md" <<EOF
# $name

$description

Key files:

- \`skill.json\`
- \`core/skill-definition.md\`
- \`platforms/claude/.claude/skills/$slug/SKILL.md\`
- \`platforms/codex/plugins/$slug/.codex-plugin/plugin.json\`
- \`platforms/cursor/.cursor/rules/$slug.mdc\`
EOF

cat > "$skill_dir/skill.json" <<EOF
{
  "name": "$name",
  "slug": "$slug",
  "description": "$description",
  "platforms": {
    "claude": true,
    "codex": true,
    "cursor": true
  }
}
EOF

cat > "$skill_dir/core/skill-definition.md" <<EOF
# $name

This is the shared core definition for \`$slug\`.

Fill in the objective, workflow, outputs, and constraints for this skill.
EOF

touch "$skill_dir/core/examples/.gitkeep" "$skill_dir/core/constraints/.gitkeep"

cat > "$skill_dir/docs/platform-packaging.md" <<EOF
# Platform Packaging

This skill exports deployable packages for Claude, Codex, and Cursor.

- Claude: \`.claude/skills/$slug/SKILL.md\`
- Codex: \`plugins/$slug/.codex-plugin/plugin.json\`
- Cursor: \`.cursor/rules/$slug.mdc\`
EOF

cat > "$skill_dir/platforms/claude/README.md" <<EOF
# Claude Package

Primary entry point: \`.claude/skills/$slug/SKILL.md\`.
EOF

cat > "$skill_dir/platforms/claude/.claude/skills/$slug/SKILL.md" <<EOF
---
name: $slug
description: $description
---

# $name

Use this skill when the user needs this workflow.
EOF

cat > "$skill_dir/platforms/codex/README.md" <<EOF
# Codex Package

Primary files:

- \`plugins/$slug/.codex-plugin/plugin.json\`
- \`plugins/$slug/skills/$slug/SKILL.md\`
EOF

cat > "$skill_dir/platforms/codex/plugins/$slug/.codex-plugin/plugin.json" <<EOF
{
  "name": "$slug",
  "version": "0.1.0",
  "description": "$description",
  "skills": "./skills/",
  "interface": {
    "displayName": "$name",
    "shortDescription": "$description",
    "category": "Productivity",
    "capabilities": [
      "Interactive",
      "Write"
    ],
    "brandColor": "#1F6FEB"
  }
}
EOF

cat > "$skill_dir/platforms/codex/plugins/$slug/skills/$slug/SKILL.md" <<EOF
# $name

Use this skill to structure the work for \`$slug\`.
EOF

cat > "$skill_dir/platforms/cursor/README.md" <<EOF
# Cursor Package

Primary file: \`.cursor/rules/$slug.mdc\`.
EOF

cat > "$skill_dir/platforms/cursor/.cursor/rules/$slug.mdc" <<EOF
---
description: $description
globs:
alwaysApply: false
---

# $name

Use this rule when the current project should follow the \`$slug\` workflow.
EOF

echo "Created skill scaffold at $skill_dir"
