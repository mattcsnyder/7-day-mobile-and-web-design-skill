# 7-Day Web Design Skills Design

## Goal

Split the current single generalized design skill into:
- a generalized `7-day-web-design` skill
- a specialized `7-day-nextjs-web-design` skill

Keep `example-skill` in the workspace as a generator test fixture.

## Context

The current generalized skill is named `7-day-mobile-and-web-design`. Its internal workflow is already broad enough to serve as a framework-agnostic seven-day design process, but the name is now too narrow and slightly mismatched to the desired skill taxonomy.

Reviewing the prior `MuseumTracker` project shows a clear Next.js-specific design and handoff layer:
- Next.js 14
- `app/` router
- route layouts
- TypeScript
- Tailwind CSS
- SEO surfaces like `robots.ts` and `sitemap.ts`
- auth flows and protected areas
- API client boundaries and data-fetching concerns

Those implementation-facing concerns should not be pushed into the generalized skill. They justify a second skill with the same seven-day cadence but different outputs and handoff expectations.

## Chosen Structure

The workspace should contain three relevant skills after the change:
- `skills/7-day-web-design/`
- `skills/7-day-nextjs-web-design/`
- `skills/example-skill/`

`example-skill` remains as a generator verification fixture.

## Skill Roles

### 1. 7-Day Web Design

This is the generalized design sprint skill for web products and features.

It should focus on:
- product framing
- audience and goals
- information architecture
- user flows
- wireframes
- visual system
- accessibility and validation
- implementation-agnostic handoff

It should not assume a specific framework or rendering model.

### 2. 7-Day Next.js Web Design

This is the specialization for web products that will be built in Next.js.

It should preserve the seven-day structure while changing the outputs from Day 2 onward to reflect framework-aware planning.

It should focus on:
- route and segment planning for the app router
- layout hierarchy and page structure
- server versus client component boundaries
- data-fetching and API boundary planning
- SEO surfaces and metadata planning
- auth/session placement
- deployment and runtime assumptions
- developer handoff tailored to Next.js implementation

## Day-by-Day Split

### Day 1

Base skill:
- product brief
- users
- goals
- constraints

Next.js skill:
- same as base
- add runtime and deployment assumptions
- define app boundary constraints early

### Day 2

Base skill:
- information architecture
- page hierarchy
- primary flows

Next.js skill:
- route tree
- app router segments
- layout nesting
- public versus protected routes

### Day 3

Base skill:
- concept exploration
- UX tradeoffs

Next.js skill:
- rendering and interaction tradeoffs
- server/client boundary decisions
- content and data architecture decisions

### Day 4

Base skill:
- wireframes and states

Next.js skill:
- wireframes mapped to routes
- layout regions
- reusable component zones

### Day 5

Base skill:
- visual system
- high-fidelity screens

Next.js skill:
- visual system plus implementation-aware component inventory

### Day 6

Base skill:
- validation
- accessibility
- missing states

Next.js skill:
- validation plus performance, SEO, hydration, auth, and data-state risks

### Day 7

Base skill:
- final design handoff

Next.js skill:
- final design handoff plus route map, component map, data dependencies, and metadata checklist

## Repository Changes

### Rename existing skill

Rename:

`skills/7-day-mobile-and-web-design/`

to:

`skills/7-day-web-design/`

Update:
- `skill.json`
- internal file references
- Claude skill slug/path
- Codex plugin slug/path
- Cursor rule filename/path
- validation and export expectations

### Add new specialized skill

Create:

`skills/7-day-nextjs-web-design/`

using the generator, then replace generated placeholders with real Next.js-specific content.

## Content Strategy

Do not introduce a shared inheritance system between skills yet.

Reasons:
- the workspace generator is intentionally simple
- the day count may be shared, but the outputs diverge meaningfully
- content duplication is acceptable at this size and easier to maintain than a custom composition layer

Consistency should be maintained by convention and review rather than a new abstraction.

## Risks

### Rename churn

Renaming the existing skill will affect validation, export paths, and any internal references.

Mitigation:
- update all slugs and paths in one pass
- verify exported files under the new slug

### Shallow specialization

If the Next.js skill only adds a few notes, it will not justify being separate.

Mitigation:
- rewrite the day outputs around actual Next.js implementation concerns

### Generator mismatch

The generator may produce too-generic placeholder content for future specialized skills.

Mitigation:
- keep the generator generic
- refine specialized skills after generation

## Testing Strategy

Verification should prove:
- renamed `7-day-web-design` validates and exports
- new `7-day-nextjs-web-design` validates and exports
- `example-skill` still validates and exports
- workspace scripts still work across all skills
