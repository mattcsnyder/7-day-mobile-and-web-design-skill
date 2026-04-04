# 7-Day Web Design Skills Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Rename the existing generalized skill to `7-day-web-design`, add a new `7-day-nextjs-web-design` specialization, and keep `example-skill` as a generator test fixture.

**Architecture:** The current generalized skill becomes `skills/7-day-web-design/`. A second skill, `skills/7-day-nextjs-web-design/`, is generated and then rewritten with Next.js-specific design and handoff guidance. Root workspace scripts continue to discover and export all skills under `skills/`.

**Tech Stack:** Shell scripts, Markdown, JSON manifests, workspace filesystem conventions

---

### Task 1: Rename the generalized skill directory and slug

**Files:**
- Move: `skills/7-day-mobile-and-web-design/` -> `skills/7-day-web-design/`
- Modify: `skills/7-day-web-design/skill.json`
- Modify: platform package paths and filenames under `skills/7-day-web-design/platforms/`

**Step 1: Write the failing test**

```bash
test -d skills/7-day-web-design
test -f skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design.mdc
```

**Step 2: Run test to verify it fails**

Run: `test -d skills/7-day-web-design`
Expected: non-zero exit status

**Step 3: Write minimal implementation**

Rename the directory and update all slug-based paths and file contents.

**Step 4: Run test to verify it passes**

```bash
test -d skills/7-day-web-design
test -f skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design.mdc
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add skills
git commit -m "refactor: rename generalized 7-day web design skill"
```

### Task 2: Rewrite the generalized skill content

**Files:**
- Modify: `skills/7-day-web-design/README.md`
- Modify: `skills/7-day-web-design/core/skill-definition.md`
- Modify: platform files under `skills/7-day-web-design/platforms/`

**Step 1: Write the failing test**

```bash
rg "framework" skills/7-day-web-design/core/skill-definition.md
rg "do not assume a specific framework" skills/7-day-web-design/core/skill-definition.md
```

**Step 2: Run test to verify it fails**

Run: `rg "do not assume a specific framework" skills/7-day-web-design/core/skill-definition.md`
Expected: no match

**Step 3: Write minimal implementation**

Update the generalized skill so its naming and wording clearly target framework-agnostic web design work.

**Step 4: Run test to verify it passes**

```bash
rg "framework" skills/7-day-web-design/core/skill-definition.md
rg "do not assume a specific framework" skills/7-day-web-design/core/skill-definition.md
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add skills/7-day-web-design
git commit -m "feat: generalize 7-day web design skill content"
```

### Task 3: Generate the Next.js skill scaffold

**Files:**
- Create: `skills/7-day-nextjs-web-design/skill.json`
- Create: `skills/7-day-nextjs-web-design/...`

**Step 1: Write the failing test**

```bash
test -d skills/7-day-nextjs-web-design
```

**Step 2: Run test to verify it fails**

Run: `test -d skills/7-day-nextjs-web-design`
Expected: non-zero exit status

**Step 3: Write minimal implementation**

Run the generator for `7-Day Nextjs Web Design`.

**Step 4: Run test to verify it passes**

```bash
test -f skills/7-day-nextjs-web-design/skill.json
test -f skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design/SKILL.md
```

Expected: both commands succeed

**Step 5: Commit**

```bash
git add skills/7-day-nextjs-web-design
git commit -m "feat: scaffold nextjs web design skill"
```

### Task 4: Rewrite the Next.js skill content

**Files:**
- Modify: `skills/7-day-nextjs-web-design/README.md`
- Modify: `skills/7-day-nextjs-web-design/core/skill-definition.md`
- Modify: platform files under `skills/7-day-nextjs-web-design/platforms/`

**Step 1: Write the failing test**

```bash
rg "app router" skills/7-day-nextjs-web-design/core/skill-definition.md
rg "server versus client" skills/7-day-nextjs-web-design/core/skill-definition.md
rg "metadata" skills/7-day-nextjs-web-design/core/skill-definition.md
```

**Step 2: Run test to verify it fails**

Run: `rg "app router" skills/7-day-nextjs-web-design/core/skill-definition.md`
Expected: no match

**Step 3: Write minimal implementation**

Replace generator placeholders with real Next.js-specific seven-day guidance shaped by MuseumTracker-like concerns.

**Step 4: Run test to verify it passes**

```bash
rg "app router" skills/7-day-nextjs-web-design/core/skill-definition.md
rg "server versus client" skills/7-day-nextjs-web-design/core/skill-definition.md
rg "metadata" skills/7-day-nextjs-web-design/core/skill-definition.md
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add skills/7-day-nextjs-web-design
git commit -m "feat: add nextjs-specific 7-day web design guidance"
```

### Task 5: Update workspace references and verification

**Files:**
- Modify: `README.md`
- Modify: `scripts/validate.sh`
- Modify: `scripts/export.sh`

**Step 1: Write the failing test**

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -f dist/7-day-web-design/claude/.claude/skills/7-day-web-design/SKILL.md
test -f dist/7-day-nextjs-web-design/cursor/.cursor/rules/7-day-nextjs-web-design.mdc
test -f dist/example-skill/cursor/.cursor/rules/example-skill.mdc
```

**Step 2: Run test to verify it fails**

Run: `test -f dist/7-day-web-design/claude/.claude/skills/7-day-web-design/SKILL.md`
Expected: non-zero exit status until rename and exports are aligned

**Step 3: Write minimal implementation**

Update any workspace references needed so validation and export align with the renamed and new skills.

**Step 4: Run test to verify it passes**

```bash
sh scripts/validate.sh
sh scripts/export.sh
test -f dist/7-day-web-design/claude/.claude/skills/7-day-web-design/SKILL.md
test -f dist/7-day-nextjs-web-design/cursor/.cursor/rules/7-day-nextjs-web-design.mdc
test -f dist/example-skill/cursor/.cursor/rules/example-skill.mdc
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add README.md scripts dist skills
git commit -m "feat: finalize generalized and nextjs 7-day web design skills"
```

## Notes

- Keep `example-skill` unchanged as the generator verification fixture.
- Do not introduce shared inheritance between the two real skills in this pass.
