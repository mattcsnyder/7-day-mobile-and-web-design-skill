# 7-Day Web Design Skill System

Get a website plan that looks great on desktop and mobile without the usual confusion, delays, or back-and-forth.

The `7-day web design` skill system is built for people who want a clear path from idea to website without needing to be a designer or developer first. It turns a vague website goal into a structured seven-day process that produces a clearer layout, stronger messaging, better page planning, and a developer-ready handoff.

Instead of guessing what pages you need, what should go on mobile, what should be different on desktop, how people sign up, where authentication belongs, how a paid paywall should work, or how the user moves from a landing page into the real platform, this system helps turn all of that into a concrete output you can actually use.

The final result is not just inspiration. It is a practical website and platform plan with public-facing pages, authentication flows, paid-access and paywall concepts, key user states, design direction, and handoff guidance that makes the next step much easier whether you build it yourself, use AI tools, or hand it to a developer.

| Stage | What This Stage Covers | What You Should Expect to Have | Realistic Day Estimate |
| --- | --- | --- | --- |
| 1. Offer and Site Foundation | Clarifying the business offer, core website purpose, audience, and desktop/mobile priorities. | homepage direction, page list, value proposition, audience focus, and feature priorities. | Days 1-2 |
| 2. Conversion and Access Planning | Mapping how visitors move from public pages into signup, authentication, and first-use flows. | landing-page flow, CTA strategy, signup/login structure, onboarding path, and access assumptions. | Days 2-3 |
| 3. Paid Platform Structure | Defining what the logged-in product experience includes and how paid access or paywalls should work. | dashboard/page map, protected routes, paywall concepts, upgrade prompts, user-state planning, and key platform sections. | Days 3-5 |
| 4. Interface and System Design | Turning the structure into real screens, mobile/desktop layouts, reusable sections, and visual direction. | wireframes, core screen states, navigation model, visual system decisions, and reusable UI patterns. | Days 4-6 |
| 5. Production Handoff | Packaging the plan so it can be built with less confusion, rework, and missing requirements. | build-ready handoff notes, implementation priorities, edge cases, auth/paywall guidance, and design rationale. | Days 6-7 |

Available across Claude, Cursor, and Codex.

## Sponsorship

If this work helps your team build stronger design systems, clearer handoffs, or better agent workflows, support the project through sponsorship and partner support.

---

## How To Use

### 1. Clone the Repository

```bash
git clone https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill.git
cd 7-day-mobile-and-web-design-skill
```

---

### 2. Choose Your Skill

There are two primary skill packages:

* `7-day-web-design` → framework-agnostic product and interface planning
* `7-day-nextjs-web-design` → tailored for Next.js with implementation-aware structure

Each skill includes platform-specific integrations.

---

### 3. Install by Platform

#### Claude (Anthropic Skills)

Copy the skill into your Claude skills directory:

```bash
skills/7-day-web-design/platforms/claude/.claude/skills/
```

or:

```bash
skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/
```

Restart Claude or reload your environment.

**Usage:**

```
Use the 7-day-web-design skill to plan this product: [your idea]
```

---

#### Cursor (Rules)

Copy the rule into your project:

```bash
.cursor/rules/7-day-web-design.mdc
```

or:

```bash
.cursor/rules/7-day-nextjs-web-design.mdc
```

Cursor will automatically apply the rule, or you can explicitly prompt:

```
Follow the 7-day web design system for this feature
```

---

### 4. Use the Skill

Once installed, the system is invoked through prompts, not UI.

Provide:

* a product idea
* target user
* any constraints (SaaS, marketplace, mobile-first, etc.)

The skill will guide you through a structured 7-day process and produce a build-ready plan.

---

### 5. Validate and Export (Optional)

Validate the workspace:

```bash
sh scripts/validate.sh
```

Export all skill packages:

```bash
sh scripts/export.sh
```

---

## What’s Here

| Skill | Positioning | Best For | GitHub File Links |
| --- | --- | --- | --- |
| `7-day-web-design` | The generalized version of the methodology. | Framework-agnostic product, feature, and redesign work on the web. | [README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/README.md), [Core Definition](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/core/skill-definition.md), [Claude Skill](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design/SKILL.md), [Codex Plugin Manifest](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/codex/plugins/7-day-web-design/.codex-plugin/plugin.json), [Cursor Rule](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design.mdc) |
| `7-day-nextjs-web-design` | The specialized version for products that will be built in Next.js. | App router planning, metadata, rendering boundaries, and implementation-aware handoff. | [README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/README.md), [Core Definition](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/core/skill-definition.md), [Claude Skill](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design/SKILL.md), [Codex Plugin Manifest](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design/.codex-plugin/plugin.json), [Cursor Rule](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design.mdc) |

## Day-by-Day Plans

| Day | 7-Day Web Design | 7-Day Nextjs Web Design |
| --- | --- | --- |
| Day 1 | brief, users, goals, and constraints | product brief and runtime constraints |
| Day 2 | information architecture and flows | route tree and app structure |
| Day 3 | concepts and tradeoffs | rendering and data architecture |
| Day 4 | page and state wireframes | route-mapped wireframes |
| Day 5 | visual system and high-fidelity UI | visual system and component inventory |
| Day 6 | validation, accessibility, and risk review | validation, metadata, and risk review |
| Day 7 | final design handoff | Next.js-specific handoff |

| Plan | Source Files |
| --- | --- |
| Generalized Web Design Plan | [General Skill README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/README.md), [General Core Definition](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-web-design/core/skill-definition.md) |
| Next.js Design Plan | [Next.js Skill README](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/README.md), [Next.js Core Definition](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/blob/main/skills/7-day-nextjs-web-design/core/skill-definition.md) |

## How to Use

| Situation | Recommended Skill |
| --- | --- |
| framework choice is still open | `7-day-web-design` |
| the focus is product and interface structure | `7-day-web-design` |
| the handoff should stay implementation-agnostic | `7-day-web-design` |
| the product will be built in Next.js | `7-day-nextjs-web-design` |
| route and layout planning matter early | `7-day-nextjs-web-design` |
| metadata, auth, rendering, and data-flow decisions need to be captured as part of design | `7-day-nextjs-web-design` |

Validate the workspace with:

```bash
sh scripts/validate.sh
```

Export all skill packages with:

```bash
sh scripts/export.sh
```

## Targeted Checklists

| Audience | Targeted Checklist |
| --- | --- |
| Product Teams | choose the generalized skill for broad web product planning; choose the Next.js skill when implementation constraints are known; expect one concrete deliverable per day; use the Day 7 handoff as the working bridge to engineering |
| General Web Design Reviews | confirm the workflow stays framework-agnostic; confirm each day has a concrete output; confirm the handoff remains usable by engineers; confirm assumptions and open questions are explicit |
| Next.js Delivery Reviews | confirm route and layout structure are explicit; confirm server versus client boundaries are visible; confirm metadata and SEO are included; confirm auth, loading, and error-state planning is present; confirm the final handoff is actionable for Next.js engineers |

## Repository Sections

| Section | Purpose | Link |
| --- | --- | --- |
| Skills | All skill packages and platform-specific outputs. | [skills/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/skills) |
| Plans | Design and implementation notes. | [docs/plans/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/docs/plans) |
| Scripts | Generator, validation, and export tooling. | [scripts/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/scripts) |
| Dist | Built package outputs. | [dist/](https://github.com/mattcsnyder/7-day-mobile-and-web-design-skill/tree/main/dist) |

## Contribute

The workflow in this repository is:
- shape or refine a skill under `skills/`
- validate the workspace
- export packages
- review the deployable outputs for Claude, Codex, and Cursor

## Support

If you want to support continued development of the 7-day web design skill system, sponsorship and partnership support are welcome.
