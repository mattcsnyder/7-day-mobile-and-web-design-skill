# 7-Day Mobile and Web Design Skill Design

## Goal

Create a single project that owns the `7-day-mobile-and-web-design` skill across three deployment targets:
- Claude skill package
- Codex skill or plugin-ready package
- Cursor rules or prompt package

The project should preserve platform-specific packaging while reducing content drift through a shared core content layer and lightweight validation/export automation.

## Context

The workspace started effectively empty. The target artifacts were confirmed as:
- Claude: a skill directory with `SKILL.md` and supporting assets
- Codex: a skill or plugin-ready package with Codex-compatible files
- Cursor: a rules or prompt package for project-level use

The user chose separate platform packages over a generated single-source system, and approved inclusion of lightweight automation to validate and assemble packages.

## Options Considered

### Option 1: Fully manual per-platform folders

Each platform package would be maintained independently.

Pros:
- Minimal tooling
- Easy to understand
- No transformation logic

Cons:
- High risk of content drift
- Repeated edits across platforms
- Weak guarantees that packages stay aligned

### Option 2: One canonical source with generated exports

All skill content would live in one schema and render into the three target formats.

Pros:
- Strong consistency
- Minimal duplication

Cons:
- Requires inventing a source schema early
- Adds transformation complexity before formats are stable
- Can hide important platform-specific differences

### Option 3: Shared core plus separate platform packages

A shared content layer defines the core skill, while each platform folder owns its deployable structure. Lightweight scripts validate and optionally sync selected shared content.

Pros:
- Keeps platform packaging explicit
- Reduces duplication where it matters
- Easier to evolve as target formats change

Cons:
- Some duplication remains
- Requires clear rules about what belongs in shared core vs platform packages

## Chosen Approach

Use Option 3: shared core plus separate platform packages.

This approach matches the user’s preference for separate packages while avoiding unnecessary duplication. It also avoids overcommitting to a generation system before the platform formats are fully nailed down.

## Repository Structure

```text
docs/
  plans/
core/
  skill-definition.md
  examples/
  constraints/
platforms/
  claude/
    skill/
  codex/
    skill/
  cursor/
    rules/
scripts/
  validate.*
  export.*
dist/
README.md
```

## Content Model

The `core/` directory will contain the canonical content for:
- skill name and purpose
- intended workflow
- required outputs
- tone and operating constraints
- examples and reference material

Each platform package will adapt that content into its native structure. The platform folders are not treated as generated-only artifacts; they are first-class deployable packages with their own metadata and wrappers.

## Automation Scope

The initial automation should stay lightweight:
- validate required files exist for each platform
- verify package naming consistency
- verify shared references are present
- optionally export platform packages into `dist/`

The first version should not attempt deep semantic transformation. It should support packaging discipline, not become a full build system.

## Expected Deliverables

Initial scaffold should include:
- project README
- shared core content files
- one package skeleton for Claude, Codex, and Cursor
- a validator script
- an export script
- basic platform documentation

## Risks

### Content drift

Mitigation:
- clearly define shared vs platform-owned files
- add validation for shared naming and required references

### Overengineering too early

Mitigation:
- keep automation limited to validation/export
- avoid custom schema rendering in the first iteration

### Platform format uncertainty

Mitigation:
- isolate platform-specific files under `platforms/`
- keep the core layer descriptive rather than overly normalized

## Testing Strategy

Validation should focus on:
- directory and file existence
- required metadata presence
- export success into `dist/`

If the project uses a runtime like Node, tests can begin with a small validator test surface. If no runtime is chosen yet, shell-based validation is acceptable for the initial scaffold.

## Open Constraint

This directory is not currently a git repository, so the design document can be created now but cannot be committed until git is initialized or the work is moved into an existing repository.
