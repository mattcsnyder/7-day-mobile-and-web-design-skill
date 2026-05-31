# 7-Day Web Design Skill System

Get a website plan that looks great on desktop and mobile without the usual confusion, delays, or back-and-forth.

The `7-day web design` skill system is built for people who want a clear path from idea to website without needing to be a designer or developer first. It turns a vague website goal into a structured seven-day process that produces a clearer layout, stronger messaging, better page planning, and a developer-ready handoff.

Instead of guessing what pages you need, what should go on mobile, what should be different on desktop, how people sign up, where authentication belongs, how a paid paywall should work, or how the user moves from a landing page into the real platform, this system helps turn all of that into a concrete output you can actually use.

The final result is not just inspiration. It is a practical website and platform plan with public-facing pages, authentication flows, paid-access and paywall concepts, key user states, design direction, and handoff guidance that makes the next step much easier whether you build it yourself, use AI tools, or hand it to a developer.

Available across Claude, Cursor, and Codex.

---

## The 4Ds of Agentic Fluency

Every session in this skill system is guided by the 4Ds framework (Anthropic, Dakan & Feller):

| D | What It Means |
| --- | --- |
| **Delegation** | Decide what the agent handles and what stays with you. Knowing the strengths and limits of each is the starting point. |
| **Description** | Give the agent what it needs — context, constraints, goals. Prompting is one part of this. The rest is knowing what matters. |
| **Discernment** | Evaluate outputs critically before moving forward. Catch gaps, hallucinations, and weak reasoning before they compound. |
| **Diligence** | Own every decision. The agent supports; you are accountable for the plan. |

Prompting is one part of Description — roughly one quarter of one of four competencies. The other 75% — choosing the right work, judging the output, and owning the result — is what separates fluent users from shallow ones.

The 7-day workflow is structured so each day surfaces all four Ds explicitly: what the agent owns, what context you provide, how to evaluate the output, and where accountability sits.

---

## Seven-Day Workflow

| Stage | What This Stage Covers | What You Should Expect to Have | Realistic Day Estimate |
| --- | --- | --- | --- |
| 1. Brief and Constraints | Clarifying the product or business offer, core purpose, audience, and priorities. | problem statement, target users, constraints, success criteria, and open questions. | Days 1–2 |
| 2. Flows and Structure | Mapping how users move through the experience, and what screens and architecture that requires. | user flows, screen inventory, and information architecture outline. | Days 2–3 |
| 3. Concepts and Direction | Generating interface directions, comparing tradeoffs, and selecting one with explicit reasoning. | 2–3 named directions with tradeoffs and a chosen direction. | Days 3–4 |
| 4. Wireframes | Turning the chosen direction into low-fidelity screens that cover the primary journey end-to-end. | wireframe set for critical screens and states. | Days 4–5 |
| 5. Visual System | Establishing the visual language and producing high-fidelity screens. | color, type, spacing, components, and hi-fi screens. | Days 5–6 |
| 6. Validation | Reviewing the design against goals, surfacing accessibility concerns, missing states, and implementation risks. | validation log, issue list, and deferred items. | Day 6 |
| 7. Handoff | Packaging deliverables so an engineer can build without a follow-up meeting. | final handoff with screen inventory, design decisions, data model, and build guidance. | Day 7 |

---

## Skills

### `7-day-web-design`

Framework-agnostic. Use when the framework is undecided or the focus is product structure and interface planning.

- Core: `skills/7-day-web-design/core/skill-definition.md`
- Claude: `skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design-claude/SKILL.md`
- Cursor: `skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design-cursor.mdc`
- Codex: `skills/7-day-web-design/platforms/codex/plugins/7-day-web-design-codex/`

### `7-day-nextjs-web-design`

Next.js-specific. Use when routes, rendering boundaries, and implementation constraints are part of the design problem from Day 1.

- Core: `skills/7-day-nextjs-web-design/core/skill-definition.md`
- Claude: `skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design-claude/SKILL.md`
- Cursor: `skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design-cursor.mdc`
- Codex: `skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design-codex/`

---

## How To Use

### 1. Clone the Repository

```bash
git clone https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill.git
cd 7-day-mobile-and-web-design-skill
```

---

### 2. Choose Your Skill

| Situation | Recommended Skill |
| --- | --- |
| framework choice is still open | `7-day-web-design` |
| the focus is product and interface structure | `7-day-web-design` |
| the handoff should stay implementation-agnostic | `7-day-web-design` |
| the product will be built in Next.js | `7-day-nextjs-web-design` |
| route and layout planning matter early | `7-day-nextjs-web-design` |
| metadata, auth, rendering, and data-flow decisions need to be captured as part of design | `7-day-nextjs-web-design` |

---

### 3. Install by Platform

#### Claude

Copy the skill folder into your project's `.claude/skills/` directory:

```bash
# Framework-agnostic
skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design-claude/

# Next.js
skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design-claude/
```

Restart Claude or reload your environment.

**Invoke with:**

```
Use the 7-day-web-design-claude skill to plan this product: [your idea]
```

```
Use the 7-day-nextjs-web-design-claude skill to plan this product: [your idea]
```

---

#### Cursor

Copy the rule file into your project's `.cursor/rules/` directory:

```bash
# Framework-agnostic
skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design-cursor.mdc

# Next.js
skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design-cursor.mdc
```

Cursor will automatically apply the rule, or prompt explicitly:

```
Follow the 7-day-web-design-cursor rule for this product
```

---

#### Codex

Copy the plugin folder into your Codex plugins directory:

```bash
# Framework-agnostic
skills/7-day-web-design/platforms/codex/plugins/7-day-web-design-codex/

# Next.js
skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design-codex/
```

---

### 4. Use the Skill

Once installed, the system is invoked through prompts. The skill will ask you what you're designing if you haven't provided it. Provide as much or as little as you have:

- a product idea
- target user
- any constraints (SaaS, marketplace, mobile-first, Next.js, etc.)

The skill guides you through the 7-day process one day at a time. Each day ends with a Discernment check — the agent waits for your confirmation before advancing.

---

### 5. Validate and Export (Optional)

Validate the workspace structure:

```bash
sh scripts/validate.sh
```

Export all skill packages into `dist/`:

```bash
sh scripts/export.sh
```

---

## What's Here

| Skill | Positioning | Best For | Files |
| --- | --- | --- | --- |
| `7-day-web-design` | Framework-agnostic design methodology. | Product, feature, and redesign work on the web where framework choice is open. | [README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/README.md) · [Core](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/core/skill-definition.md) · [Claude](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design-claude/SKILL.md) · [Cursor](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design-cursor.mdc) · [Codex](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/codex/plugins/7-day-web-design-codex/.codex-plugin/plugin.json) |
| `7-day-nextjs-web-design` | Next.js-specific design methodology. | App router planning, metadata, rendering boundaries, and implementation-aware handoff. | [README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/README.md) · [Core](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/core/skill-definition.md) · [Claude](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design-claude/SKILL.md) · [Cursor](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design-cursor.mdc) · [Codex](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design-codex/.codex-plugin/plugin.json) |

## Day-by-Day Plans

| Day | 7-Day Web Design | 7-Day Next.js Web Design |
| --- | --- | --- |
| Day 1 | brief, users, goals, and constraints | product brief and runtime constraints |
| Day 2 | information architecture and flows | route tree and app structure |
| Day 3 | concepts and tradeoffs | rendering and data architecture |
| Day 4 | page and state wireframes | route-mapped wireframes |
| Day 5 | visual system and high-fidelity UI | visual system and component inventory |
| Day 6 | validation, accessibility, and risk review | validation, metadata, and risk review |
| Day 7 | final design handoff | Next.js-specific handoff |

---

## Targeted Checklists

| Audience | Checklist |
| --- | --- |
| Product Teams | choose the generalized skill for broad web product planning; choose the Next.js skill when implementation constraints are known; expect one concrete deliverable per day; use the Day 7 handoff as the working bridge to engineering |
| General Web Design Reviews | confirm the workflow stays framework-agnostic; confirm each day has a concrete output; confirm the handoff remains usable by engineers; confirm assumptions and open questions are explicit |
| Next.js Delivery Reviews | confirm route and layout structure are explicit; confirm server versus client boundaries are visible; confirm metadata and SEO are included; confirm auth, loading, and error-state planning is present; confirm the final handoff is actionable for Next.js engineers |

---

## Repository Sections

| Section | Purpose | Link |
| --- | --- | --- |
| Skills | All skill packages and platform-specific outputs. | [skills/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/skills) |
| Plans | Design and implementation notes. | [docs/plans/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/docs/plans) |
| Scripts | Validation and export tooling. | [scripts/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/scripts) |
| Dist | Built package outputs. | [dist/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/dist) |

---

## Contribute

The workflow in this repository is:
- shape or refine a skill under `skills/`
- run `validate.sh` to confirm structure
- run `export.sh` to produce deployable packages
- review the outputs under `dist/` before distributing

---

## Support

If you want to support continued development of the 7-day web design skill system, sponsorship and partnership support are welcome.
