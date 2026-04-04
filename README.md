# Skill Workspace

This repository is a multi-skill workspace for building and exporting reusable skill packages for Claude, Codex, and Cursor.

## Layout

- `skills/` stores one folder per skill idea
- `skills/<slug>/core/` stores the skill definition and shared content
- `skills/<slug>/platforms/claude/` stores a Claude-ready `.claude/skills/...` package
- `skills/<slug>/platforms/codex/` stores a Codex-ready `plugins/...` package
- `skills/<slug>/platforms/cursor/` stores a Cursor-ready `.cursor/rules/...` package
- `skills/<slug>/skill.json` stores per-skill metadata
- `scripts/` stores validation and export helpers
- `docs/` stores planning and packaging notes

## Workspace Workflow

Create new skills with `sh scripts/new-skill.sh "<Skill Name>" "<Description>"`.

Update each skill’s shared core first, then adapt its platform-specific files as needed for Claude, Codex, and Cursor.

## Example Skill

The current seeded example is `skills/7-day-mobile-and-web-design/`.

## Validate

Run `sh scripts/validate.sh` to confirm required files exist across the workspace.

## Export

Run `sh scripts/export.sh` to build deploy-ready package roots into `dist/<skill-slug>/`.
