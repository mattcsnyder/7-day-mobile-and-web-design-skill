# Platform Packaging

This document explains how the shared core maps into the three deployable packages.

## Shared vs Platform-Specific

The shared core is the canonical source for skill purpose, workflow, outputs, and constraints.

Platform-specific files translate that content into the packaging expected by Claude, Codex, and Cursor.

## Claude

Claude uses a skill directory centered on `SKILL.md`, with frontmatter and instruction content shaped for Claude's skill loader.

## Codex

Codex uses a skill or plugin-ready package that can include `SKILL.md`, package notes, and plugin metadata such as `.codex-plugin/plugin.json`.

## Cursor

Cursor uses a rules or prompt package intended for project-level editor behavior, kept here as `.mdc` rules content plus package documentation.
