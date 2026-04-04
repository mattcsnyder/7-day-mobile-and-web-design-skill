# 7-Day Mobile and Web Design Skill Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Scaffold a project that maintains deployable `7-day-mobile-and-web-design` packages for Claude, Codex, and Cursor, backed by shared core content and lightweight validation/export scripts.

**Architecture:** The repository will keep a shared `core/` content layer and separate deployable packages under `platforms/claude/`, `platforms/codex/`, and `platforms/cursor/`. A small script layer will validate required files and assemble deploy-ready artifacts into `dist/` without introducing a heavy generation system.

**Tech Stack:** Markdown, shell scripts, standard filesystem layout, optional git initialization

---

### Task 1: Create the repository skeleton

**Files:**
- Create: `README.md`
- Create: `core/skill-definition.md`
- Create: `core/examples/.gitkeep`
- Create: `core/constraints/.gitkeep`
- Create: `platforms/claude/skill/SKILL.md`
- Create: `platforms/codex/skill/README.md`
- Create: `platforms/cursor/rules/README.md`
- Create: `scripts/validate.sh`
- Create: `scripts/export.sh`

**Step 1: Write the failing test**

Use filesystem expectations as the first test target.

```bash
test -f README.md
test -f core/skill-definition.md
test -f platforms/claude/skill/SKILL.md
test -f platforms/codex/skill/README.md
test -f platforms/cursor/rules/README.md
test -f scripts/validate.sh
test -f scripts/export.sh
```

**Step 2: Run test to verify it fails**

Run: `test -f README.md`
Expected: non-zero exit status because the scaffold does not exist yet

**Step 3: Write minimal implementation**

Create the directory tree and placeholder files with concise initial content describing purpose and ownership.

**Step 4: Run test to verify it passes**

Run:

```bash
test -f README.md
test -f core/skill-definition.md
test -f platforms/claude/skill/SKILL.md
test -f platforms/codex/skill/README.md
test -f platforms/cursor/rules/README.md
test -f scripts/validate.sh
test -f scripts/export.sh
```

Expected: all commands exit successfully

**Step 5: Commit**

```bash
git add README.md core platforms scripts
git commit -m "feat: add multi-platform skill scaffold"
```

### Task 2: Define shared content boundaries

**Files:**
- Modify: `README.md`
- Modify: `core/skill-definition.md`
- Create: `docs/platform-packaging.md`

**Step 1: Write the failing test**

Define required documentation strings that explain ownership boundaries.

```bash
rg "shared core" README.md
rg "platform-specific" README.md
rg "canonical" core/skill-definition.md
rg "Claude" docs/platform-packaging.md
rg "Codex" docs/platform-packaging.md
rg "Cursor" docs/platform-packaging.md
```

**Step 2: Run test to verify it fails**

Run: `rg "shared core" README.md`
Expected: no match until documentation is added

**Step 3: Write minimal implementation**

Document:
- what belongs in `core/`
- what belongs in each `platforms/*` directory
- how updates should flow from shared content to packages

**Step 4: Run test to verify it passes**

Run:

```bash
rg "shared core" README.md
rg "platform-specific" README.md
rg "canonical" core/skill-definition.md
rg "Claude" docs/platform-packaging.md
rg "Codex" docs/platform-packaging.md
rg "Cursor" docs/platform-packaging.md
```

Expected: each command returns at least one matching line

**Step 5: Commit**

```bash
git add README.md core/skill-definition.md docs/platform-packaging.md
git commit -m "docs: define shared and platform packaging boundaries"
```

### Task 3: Add Claude package scaffold

**Files:**
- Modify: `platforms/claude/skill/SKILL.md`
- Create: `platforms/claude/README.md`

**Step 1: Write the failing test**

```bash
rg "^---" platforms/claude/skill/SKILL.md
rg "name:" platforms/claude/skill/SKILL.md
rg "description:" platforms/claude/skill/SKILL.md
rg "7-day-mobile-and-web-design" platforms/claude/README.md
```

**Step 2: Run test to verify it fails**

Run: `rg "name:" platforms/claude/skill/SKILL.md`
Expected: no match until frontmatter is added

**Step 3: Write minimal implementation**

Add a valid Claude-style skill frontmatter and a concise body that maps the shared core into Claude’s skill format.

**Step 4: Run test to verify it passes**

Run:

```bash
rg "^---" platforms/claude/skill/SKILL.md
rg "name:" platforms/claude/skill/SKILL.md
rg "description:" platforms/claude/skill/SKILL.md
rg "7-day-mobile-and-web-design" platforms/claude/README.md
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add platforms/claude
git commit -m "feat: add claude package scaffold"
```

### Task 4: Add Codex package scaffold

**Files:**
- Create: `platforms/codex/skill/SKILL.md`
- Create: `platforms/codex/.codex-plugin/plugin.json`
- Modify: `platforms/codex/skill/README.md`

**Step 1: Write the failing test**

```bash
test -f platforms/codex/skill/SKILL.md
test -f platforms/codex/.codex-plugin/plugin.json
rg "7-day-mobile-and-web-design" platforms/codex/.codex-plugin/plugin.json
```

**Step 2: Run test to verify it fails**

Run: `test -f platforms/codex/.codex-plugin/plugin.json`
Expected: non-zero exit status until the plugin metadata exists

**Step 3: Write minimal implementation**

Create a Codex-oriented package that includes:
- skill content
- plugin metadata placeholder
- package-level README with installation or usage intent

**Step 4: Run test to verify it passes**

Run:

```bash
test -f platforms/codex/skill/SKILL.md
test -f platforms/codex/.codex-plugin/plugin.json
rg "7-day-mobile-and-web-design" platforms/codex/.codex-plugin/plugin.json
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add platforms/codex
git commit -m "feat: add codex package scaffold"
```

### Task 5: Add Cursor package scaffold

**Files:**
- Create: `platforms/cursor/rules/7-day-mobile-and-web-design.mdc`
- Modify: `platforms/cursor/rules/README.md`

**Step 1: Write the failing test**

```bash
test -f platforms/cursor/rules/7-day-mobile-and-web-design.mdc
rg "7-day-mobile-and-web-design" platforms/cursor/rules/README.md
```

**Step 2: Run test to verify it fails**

Run: `test -f platforms/cursor/rules/7-day-mobile-and-web-design.mdc`
Expected: non-zero exit status until the Cursor rules file exists

**Step 3: Write minimal implementation**

Create a project-level Cursor rules file that adapts the shared skill content into concise editor guidance.

**Step 4: Run test to verify it passes**

Run:

```bash
test -f platforms/cursor/rules/7-day-mobile-and-web-design.mdc
rg "7-day-mobile-and-web-design" platforms/cursor/rules/README.md
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add platforms/cursor
git commit -m "feat: add cursor package scaffold"
```

### Task 6: Add validation script

**Files:**
- Modify: `scripts/validate.sh`

**Step 1: Write the failing test**

```bash
sh scripts/validate.sh
```

**Step 2: Run test to verify it fails**

Run: `sh scripts/validate.sh`
Expected: non-zero exit status until the script checks for required files and succeeds only when the scaffold is complete

**Step 3: Write minimal implementation**

Implement a shell script that:
- exits on error
- checks for every required core and platform file
- prints a concise success message

**Step 4: Run test to verify it passes**

Run: `sh scripts/validate.sh`
Expected: zero exit status with a success message

**Step 5: Commit**

```bash
git add scripts/validate.sh
git commit -m "feat: add project validation script"
```

### Task 7: Add export script

**Files:**
- Modify: `scripts/export.sh`

**Step 1: Write the failing test**

```bash
sh scripts/export.sh
test -d dist/claude
test -d dist/codex
test -d dist/cursor
```

**Step 2: Run test to verify it fails**

Run: `sh scripts/export.sh`
Expected: non-zero exit status until the script assembles the output directories

**Step 3: Write minimal implementation**

Implement a shell script that:
- recreates `dist/`
- copies each platform package into its corresponding export directory
- prints exported locations

**Step 4: Run test to verify it passes**

Run:

```bash
sh scripts/export.sh
test -d dist/claude
test -d dist/codex
test -d dist/cursor
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add scripts/export.sh dist
git commit -m "feat: add export script for deployable packages"
```

### Task 8: Verify the full scaffold

**Files:**
- Modify: `README.md`

**Step 1: Write the failing test**

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -d dist/claude
test -d dist/codex
test -d dist/cursor
rg "validate" README.md
rg "export" README.md
```

**Step 2: Run test to verify it fails**

Run: `rg "validate" README.md`
Expected: no match until usage instructions are documented

**Step 3: Write minimal implementation**

Add concise README usage instructions for:
- project layout
- validation
- export
- expected deployment targets

**Step 4: Run test to verify it passes**

Run:

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -d dist/claude
test -d dist/codex
test -d dist/cursor
rg "validate" README.md
rg "export" README.md
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add README.md dist scripts
git commit -m "docs: add usage and verify scaffold exports"
```

## Notes

- If this directory should become a git repository, initialize git before starting Task 1 so the commit steps are meaningful.
- Keep the first pass intentionally simple; do not introduce a custom content generation engine.
