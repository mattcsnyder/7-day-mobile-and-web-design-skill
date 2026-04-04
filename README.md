# 7-Day Mobile and Web Design

This repository manages the `7-day-mobile-and-web-design` skill as separate deployable packages for Claude, Codex, and Cursor.

The project uses a shared core content layer for canonical skill intent and keeps platform-specific packaging under `platforms/`.

## Layout

- `core/` stores the shared core definition, examples, and constraints
- `platforms/claude/` stores the Claude skill package
- `platforms/codex/` stores the Codex skill or plugin-ready package
- `platforms/cursor/` stores the Cursor rules package
- `scripts/` stores validation and export helpers
- `docs/` stores planning and packaging notes

## Workflow

Update the shared core first, then adapt platform-specific files as needed for Claude, Codex, and Cursor.

The skill itself is designed to guide a seven-day design sprint that moves from framing through shipped handoff material.

## Seven-Day Structure

- Day 1: define the problem, target users, constraints, and success criteria
- Day 2: map user flows, information architecture, and platform requirements
- Day 3: explore concepts and interaction patterns, then choose a direction
- Day 4: produce mobile and web wireframes for the critical paths
- Day 5: turn the chosen direction into high-fidelity UI and a visual system
- Day 6: validate the system, close gaps, and prepare implementation guidance
- Day 7: package the final deliverables, rationale, and developer handoff

## Validate

Run `sh scripts/validate.sh` to confirm required shared and platform files exist.

## Export

Run `sh scripts/export.sh` to copy deploy-ready Claude, Codex, and Cursor packages into `dist/`.
