# Multi-Skill Generator Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Refactor the repository into a multi-skill workspace and add a repeatable generator that creates new skill folders under `skills/<slug>/` with Claude, Codex, and Cursor package layouts.

**Architecture:** Existing single-skill content will move into `skills/7-day-mobile-and-web-design/`. Root scripts will discover all skill folders, validate required files, and export each skill into `dist/<slug>/`. A new `scripts/new-skill.sh` generator will scaffold the same structure for future skills.

**Tech Stack:** Shell scripts, Markdown, JSON manifests, filesystem conventions

---

### Task 1: Migrate the existing skill into `skills/`

**Files:**
- Create: `skills/7-day-mobile-and-web-design/README.md`
- Create: `skills/7-day-mobile-and-web-design/skill.json`
- Move: `core/` -> `skills/7-day-mobile-and-web-design/core/`
- Move: `platforms/` -> `skills/7-day-mobile-and-web-design/platforms/`
- Move: `docs/platform-packaging.md` -> `skills/7-day-mobile-and-web-design/docs/platform-packaging.md`

**Step 1: Write the failing test**

```bash
test -f skills/7-day-mobile-and-web-design/skill.json
test -f skills/7-day-mobile-and-web-design/platforms/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
```

**Step 2: Run test to verify it fails**

Run: `test -f skills/7-day-mobile-and-web-design/skill.json`
Expected: non-zero exit status

**Step 3: Write minimal implementation**

Move the current single-skill content into the new workspace path and create the manifest plus per-skill README.

**Step 4: Run test to verify it passes**

```bash
test -f skills/7-day-mobile-and-web-design/skill.json
test -f skills/7-day-mobile-and-web-design/platforms/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add skills docs
git commit -m "refactor: move existing skill into workspace layout"
```

### Task 2: Rewrite root docs for the workspace

**Files:**
- Modify: `README.md`

**Step 1: Write the failing test**

```bash
rg "skills/" README.md
rg "new-skill.sh" README.md
rg "workspace" README.md
```

**Step 2: Run test to verify it fails**

Run: `rg "new-skill.sh" README.md`
Expected: no match

**Step 3: Write minimal implementation**

Update the root README to describe the workspace, the `skills/` layout, generator usage, and workspace-wide validation/export.

**Step 4: Run test to verify it passes**

```bash
rg "skills/" README.md
rg "new-skill.sh" README.md
rg "workspace" README.md
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add README.md
git commit -m "docs: describe multi-skill workspace"
```

### Task 3: Make validation workspace-aware

**Files:**
- Modify: `scripts/validate.sh`

**Step 1: Write the failing test**

```bash
sh scripts/validate.sh
```

**Step 2: Run test to verify it fails**

Run: `sh scripts/validate.sh`
Expected: failure until the script looks under `skills/*/`

**Step 3: Write minimal implementation**

Update validation to:
- iterate over `skills/*`
- require `skill.json`
- require the platform package files under each skill

**Step 4: Run test to verify it passes**

Run: `sh scripts/validate.sh`
Expected: success message covering discovered skills

**Step 5: Commit**

```bash
git add scripts/validate.sh
git commit -m "feat: validate all skills in workspace"
```

### Task 4: Make export workspace-aware

**Files:**
- Modify: `scripts/export.sh`

**Step 1: Write the failing test**

```bash
sh scripts/export.sh
test -f dist/7-day-mobile-and-web-design/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
```

**Step 2: Run test to verify it fails**

Run: `test -f dist/7-day-mobile-and-web-design/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md`
Expected: non-zero exit status before the script is updated

**Step 3: Write minimal implementation**

Update export to rebuild `dist/` and emit per-skill exports under `dist/<slug>/`.

**Step 4: Run test to verify it passes**

```bash
sh scripts/export.sh
test -f dist/7-day-mobile-and-web-design/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add scripts/export.sh
git commit -m "feat: export skills by workspace slug"
```

### Task 5: Add the generator script

**Files:**
- Create: `scripts/new-skill.sh`

**Step 1: Write the failing test**

```bash
test -f scripts/new-skill.sh
```

**Step 2: Run test to verify it fails**

Run: `test -f scripts/new-skill.sh`
Expected: non-zero exit status

**Step 3: Write minimal implementation**

Add a generator that:
- accepts a name and optional description
- normalizes the slug
- creates `skills/<slug>/`
- writes `skill.json`
- writes starter files for all three platforms
- errors if the target skill already exists

**Step 4: Run test to verify it passes**

Run: `test -f scripts/new-skill.sh`
Expected: success

**Step 5: Commit**

```bash
git add scripts/new-skill.sh
git commit -m "feat: add new skill generator"
```

### Task 6: Verify the generator on a sample skill

**Files:**
- Create: `skills/example-skill/skill.json`
- Create: `skills/example-skill/...`

**Step 1: Write the failing test**

```bash
test -d skills/example-skill
```

**Step 2: Run test to verify it fails**

Run: `test -d skills/example-skill`
Expected: non-zero exit status

**Step 3: Write minimal implementation**

Run the generator for a sample skill such as `Example Skill`.

**Step 4: Run test to verify it passes**

```bash
test -f skills/example-skill/skill.json
test -f skills/example-skill/platforms/cursor/.cursor/rules/example-skill.mdc
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add skills/example-skill
git commit -m "test: generate sample skill scaffold"
```

### Task 7: Verify full workspace behavior

**Files:**
- Modify: `README.md`

**Step 1: Write the failing test**

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -f dist/7-day-mobile-and-web-design/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
test -f dist/example-skill/cursor/.cursor/rules/example-skill.mdc
```

**Step 2: Run test to verify it fails**

Run: `test -f dist/example-skill/cursor/.cursor/rules/example-skill.mdc`
Expected: non-zero exit status until generator plus export flow are both working

**Step 3: Write minimal implementation**

Finish any path or documentation adjustments needed for a clean multi-skill workflow.

**Step 4: Run test to verify it passes**

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -f dist/7-day-mobile-and-web-design/claude/.claude/skills/7-day-mobile-and-web-design/SKILL.md
test -f dist/example-skill/cursor/.cursor/rules/example-skill.mdc
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add README.md scripts skills dist
git commit -m "feat: complete multi-skill workspace generator flow"
```

## Notes

- Keep the generator shell-based unless complexity proves it insufficient.
- Do not add interactive prompts in the first pass.
- Generated content should be intentionally plain starter content, not filled-in final skill prose.
