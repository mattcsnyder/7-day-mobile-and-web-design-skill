# Multi-Skill Generator Design

## Goal

Refactor this repository from a single-skill project into a multi-skill workspace with a repeatable generator for new skill ideas.

Each generated skill should live under `skills/<skill-name>/` and include:
- shared core content
- Claude package layout
- Codex package layout
- Cursor package layout
- per-skill docs
- a small manifest describing the skill

The root automation should validate and export all skills in the workspace without requiring per-skill script duplication.

## Current State

The repository currently models one skill directly at the repo root:
- `core/`
- `platforms/`
- `scripts/`
- `docs/`

The current export logic assumes one skill only. That is fine for the existing `7-day-mobile-and-web-design` package, but it does not scale cleanly to additional skill ideas.

## Options Considered

### Option 1: Copy a template tree per skill

Store a template folder and copy it into a new skill directory on demand.

Pros:
- simple generator
- easy to understand

Cons:
- shared automation drifts
- repeated logic in every generated skill
- harder to improve all skills consistently

### Option 2: Multi-skill workspace with per-skill manifests

Store each skill under `skills/<slug>/`, keep shared generator and automation at repo root, and make scripts discover skills automatically.

Pros:
- one place for validation and export logic
- easy to add new skills
- consistent package shapes across skills
- low duplication outside skill content

Cons:
- requires refactoring the current skill into the new workspace layout
- root scripts become slightly more complex

### Option 3: Hybrid with local wrappers per skill

Use the multi-skill workspace, but also generate per-skill helper scripts.

Pros:
- slightly nicer ergonomics for isolated skill work

Cons:
- more generated clutter
- wrappers add little value early

## Chosen Approach

Use Option 2: a multi-skill workspace with per-skill manifests and shared root automation.

This keeps generation straightforward while centralizing the logic that is most likely to change over time.

## Proposed Repository Layout

```text
docs/
  plans/
scripts/
  new-skill.sh
  validate.sh
  export.sh
skills/
  7-day-mobile-and-web-design/
    skill.json
    README.md
    core/
    docs/
    platforms/
      claude/
        .claude/skills/7-day-mobile-and-web-design/SKILL.md
      codex/
        plugins/7-day-mobile-and-web-design/.codex-plugin/plugin.json
        plugins/7-day-mobile-and-web-design/skills/7-day-mobile-and-web-design/SKILL.md
      cursor/
        .cursor/rules/7-day-mobile-and-web-design.mdc
dist/
```

## Skill Manifest

Each skill should include a compact `skill.json` manifest with:
- `name`
- `slug`
- `description`
- `platforms` object for `claude`, `codex`, and `cursor`

This manifest allows validation and export logic to avoid brittle path inference where possible.

## Generator Responsibilities

The generator should:
- normalize the provided skill name into a slug
- create the standard folder structure under `skills/<slug>/`
- write starter content files
- write `skill.json`
- create platform package skeletons using the normalized slug
- refuse to overwrite an existing skill directory

The first version should not prompt interactively. It should accept arguments and create the structure deterministically.

## Shared Automation

### Validation

Root validation should:
- discover each skill under `skills/`
- verify required files exist
- verify slug consistency across manifest and paths

### Export

Root export should:
- rebuild `dist/`
- export each skill separately under `dist/<slug>/`
- preserve each platform’s install-ready root layout

Example:

```text
dist/
  7-day-mobile-and-web-design/
    claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
    codex/plugins/7-day-mobile-and-web-design/.codex-plugin/plugin.json
    cursor/.cursor/rules/7-day-mobile-and-web-design.mdc
```

## Migration Plan

The existing root-level skill content should move into:

`skills/7-day-mobile-and-web-design/`

Root documentation should then describe:
- workspace purpose
- generator usage
- validation/export usage
- conventions for adding future skills

## Risks

### Migration mistakes

Moving the current files may break validation and export if path assumptions are missed.

Mitigation:
- update scripts and run verification after the move

### Generator drift

If the generator and workspace conventions diverge, new skills will not match existing ones.

Mitigation:
- use one generator
- centralize all required paths in validation

### Overcomplication

Adding too much metadata too early would make new skills harder to scaffold.

Mitigation:
- keep `skill.json` minimal
- keep scripts shell-based

## Testing Strategy

Verification should prove:
- the migrated existing skill still validates
- export output is correct for the migrated skill
- the generator can create a fresh sample skill
- workspace validation sees both skills

## Constraint

The repository is now live on GitHub, so this refactor should preserve the current skill content and keep commits clean and reviewable.
