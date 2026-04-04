# Platform Packaging

This document explains how the shared core maps into the three deployable packages.

## Shared vs Platform-Specific

The shared core is the canonical source for skill purpose, workflow, outputs, and constraints.

Platform-specific files translate that content into the packaging expected by Claude, Codex, and Cursor.

## Claude

Claude uses a project skill directory centered on `.claude/skills/<skill-name>/SKILL.md`, with frontmatter and instruction content shaped for Claude's skill loader.

## Codex

Codex uses a plugin-ready package rooted at `plugins/<plugin-name>/`, with `.codex-plugin/plugin.json` and optional `skills/<skill-name>/SKILL.md`.

## Cursor

Cursor uses a project rules package rooted at `.cursor/rules/`, where each rule is an `.mdc` file with metadata frontmatter and instruction content.
