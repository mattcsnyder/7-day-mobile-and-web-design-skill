# 7-Day Web Design Skill System

Design faster, hand off more clearly, and keep AI-assisted product work structured from day one through developer delivery.

This repository is the home of the `7-day web design` skill system: a marketable, repeatable design workflow packaged for Claude, Codex, and Cursor, with both a generalized web-design skill and a Next.js-specific specialization.

## Sponsorship

If this work helps your team build stronger design systems, clearer handoffs, or better agent workflows, support the project through sponsorship and partner support.

## AgentPowers

Learn more at [agentpowers.ai](https://agentpowers.ai).

## What’s Here

| Skill | Positioning | Best For | GitHub File Links |
| --- | --- | --- | --- |
| `7-day-web-design` | The generalized version of the methodology. | Framework-agnostic product, feature, and redesign work on the web. | [README](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/README.md), [Core Definition](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/core/skill-definition.md), [Claude Skill](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/platforms/claude/.claude/skills/7-day-web-design/SKILL.md), [Codex Plugin Manifest](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/platforms/codex/plugins/7-day-web-design/.codex-plugin/plugin.json), [Cursor Rule](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/platforms/cursor/.cursor/rules/7-day-web-design.mdc) |
| `7-day-nextjs-web-design` | The specialized version for products that will be built in Next.js. | App router planning, metadata, rendering boundaries, and implementation-aware handoff. | [README](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/README.md), [Core Definition](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/core/skill-definition.md), [Claude Skill](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/platforms/claude/.claude/skills/7-day-nextjs-web-design/SKILL.md), [Codex Plugin Manifest](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/platforms/codex/plugins/7-day-nextjs-web-design/.codex-plugin/plugin.json), [Cursor Rule](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/platforms/cursor/.cursor/rules/7-day-nextjs-web-design.mdc) |

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
| Generalized Web Design Plan | [General Skill README](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/README.md), [General Core Definition](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-web-design/core/skill-definition.md) |
| Next.js Design Plan | [Next.js Skill README](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/README.md), [Next.js Core Definition](/home/mattsnyder/7-day-mobile-and-web-design/skills/7-day-nextjs-web-design/core/skill-definition.md) |

## How to Use

| Situation | Recommended Skill |
| --- | --- |
| framework choice is still open | `7-day-web-design` |
| the focus is product and interface structure | `7-day-web-design` |
| the handoff should stay implementation-agnostic | `7-day-web-design` |
| the product will be built in Next.js | `7-day-nextjs-web-design` |
| route and layout planning matter early | `7-day-nextjs-web-design` |
| metadata, auth, rendering, and data-flow decisions need to be captured as part of design | `7-day-nextjs-web-design` |

Create a new skill variant with:

```bash
sh scripts/new-skill.sh "Skill Name" "Short description"
```

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
| Skills | All skill packages and platform-specific outputs. | [skills/](/home/mattsnyder/7-day-mobile-and-web-design/skills) |
| Plans | Design and implementation notes. | [docs/plans/](/home/mattsnyder/7-day-mobile-and-web-design/docs/plans) |
| Scripts | Generator, validation, and export tooling. | [scripts/](/home/mattsnyder/7-day-mobile-and-web-design/scripts) |
| Dist | Built package outputs. | [dist/](/home/mattsnyder/7-day-mobile-and-web-design/dist) |

## Contribute

The workflow in this repository is:
- shape or refine a skill under `skills/`
- validate the workspace
- export packages
- review the deployable outputs for Claude, Codex, and Cursor

## Support

If you want to support continued development of the 7-day web design skill system, sponsorship and partnership support are welcome.
