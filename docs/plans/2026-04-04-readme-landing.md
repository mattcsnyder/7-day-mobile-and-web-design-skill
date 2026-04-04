# README Landing Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Rewrite the root README into a stronger landing page with sponsorship, AgentPowers link, day-by-day plan links, instructions, and targeted checklists.

**Architecture:** Keep the README as the single workspace landing page, but move from a plain technical overview to a structured entry point for both users and contributors.

**Tech Stack:** Markdown

---

### Task 1: Restructure the README

**Files:**
- Modify: `README.md`

**Step 1: Write the failing test**

```bash
rg "Sponsorship" README.md
rg "agentpowers.ai" README.md
rg "Day-by-Day Plans" README.md
rg "Targeted Checklists" README.md
```

**Step 2: Run test to verify it fails**

Run: `rg "Sponsorship" README.md`
Expected: no match

**Step 3: Write minimal implementation**

Rewrite the README to include:
- sponsorship at the top
- AgentPowers link
- day-by-day plan links for both real skills
- instructions
- targeted checklists
- compressed workspace reference

**Step 4: Run test to verify it passes**

```bash
rg "Sponsorship" README.md
rg "agentpowers.ai" README.md
rg "Day-by-Day Plans" README.md
rg "Targeted Checklists" README.md
```

Expected: all commands succeed

**Step 5: Commit**

```bash
git add README.md
git commit -m "docs: improve readme landing page"
```
