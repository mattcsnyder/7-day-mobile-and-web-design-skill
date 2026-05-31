# 7-Day Web Design Skill System

This repository contains structured web design skills for Claude, Cursor, and Codex.

## What's Here

Two skills:
- `7-day-web-design` — framework-agnostic product and interface planning
- `7-day-nextjs-web-design` — Next.js-specific, implementation-aware design

Each skill is packaged for Claude, Cursor, and Codex.

## The 4Ds of Agentic Fluency

Every session in this repo is guided by the 4Ds framework (Anthropic, Dakan & Feller):

- **Delegation** — decide what the agent handles and what stays with you
- **Description** — give the agent what it needs: context, constraints, goals
- **Discernment** — evaluate outputs critically before moving forward
- **Diligence** — own every decision; the agent supports, you are accountable

The 7-day workflow is structured so each day surfaces all four Ds explicitly.

## Skills

### `7-day-web-design`

Framework-agnostic. Use when the framework is undecided or the focus is product structure and interface planning.

- Core: `skills/7-day-web-design/core/skill-definition.md`
- Claude: `skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design/SKILL.md`
- Cursor: `skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design.mdc`
- Codex: `skills/7-day-web-design/platforms/codex/plugins/7-day-web-design/`

### `7-day-nextjs-web-design`

Next.js-specific. Use when routes, rendering boundaries, and implementation constraints are part of the design problem from Day 1.

- Core: `skills/7-day-nextjs-web-design/core/skill-definition.md`
- Claude: `skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design/SKILL.md`
- Cursor: `skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design.mdc`
- Codex: `skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design/`

## Scripts

```bash
sh scripts/validate.sh   # check that all required skill files are present
sh scripts/export.sh     # build platform packages into dist/
```

## Workflow

1. Shape or refine a skill under `skills/`
2. Run `validate.sh` to confirm structure
3. Run `export.sh` to produce deployable packages
4. Review outputs under `dist/` before distributing
