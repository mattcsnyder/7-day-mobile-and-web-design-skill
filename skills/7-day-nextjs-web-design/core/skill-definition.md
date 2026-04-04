# 7-Day Nextjs Web Design

This is the shared core definition for `7-day-nextjs-web-design`.

## Objective

Guide an AI coding or assistant environment through a structured seven-day web design workflow for products that will be built in Next.js.

## When To Use

Use this skill when the user wants a seven-day design sprint for a Next.js application or feature and needs implementation-aware outputs.

Do not use it when framework choice is unknown or when the work should stay implementation-agnostic.

## Working Style

- maintain a seven-day cadence unless the user explicitly changes it
- treat Next.js architecture as part of the design problem, not a post-design detail
- keep route structure, layout structure, and component boundaries visible from Day 2 onward
- make server versus client decisions explicit
- keep SEO, metadata, auth, and deployment assumptions visible in the plan

## Seven-Day Workflow

### Day 1: Product Brief and Runtime Constraints

- define the product problem
- identify target users and core journeys
- document business, technical, and deployment constraints
- capture runtime assumptions such as hosting, auth, and data sources

**Output:** product brief with success criteria and runtime constraints

### Day 2: Route Tree and App Structure

- map the route hierarchy
- define app router segments and nested layouts
- distinguish public, authenticated, and role-specific areas
- identify key page types and shared shells

**Output:** route map, layout map, and screen inventory

### Day 3: Rendering and Data Architecture

- decide where server rendering, client interaction, and streaming matter
- define server versus client component boundaries
- identify data dependencies and API boundaries
- compare tradeoffs before locking the direction

**Output:** rendering strategy and data architecture decisions

### Day 4: Route-Mapped Wireframes

- create low-fidelity wireframes for critical routes
- map each wireframe to its route, layout, and component zones
- capture empty, loading, error, and authenticated states

**Output:** route-aware wireframe set with key states

### Day 5: Visual System and Component Inventory

- establish the visual system
- define reusable component groups and page sections
- translate wireframes into high-fidelity Next.js-ready screens
- note what should remain shared versus route-specific

**Output:** high-fidelity UI and implementation-aware component inventory

### Day 6: Validation, Metadata, and Risk Review

- review accessibility and missing states
- identify SEO and metadata requirements
- review hydration, auth, and performance risks
- tighten consistency across layouts, pages, and state transitions

**Output:** validation log, metadata checklist, and implementation risk review

### Day 7: Next.js Handoff

- package the route map, layout map, component map, and design rationale
- summarize data dependencies, API needs, and auth assumptions
- include metadata, sitemap, robots, and deployment considerations
- provide implementation priorities and open questions

**Output:** Next.js-specific design handoff for developers

## Required Deliverables

- one clear output per day
- route-aware planning from Day 2 onward
- explicit app router, server versus client, and metadata decisions
- final handoff notes that a Next.js engineer can implement directly

## Guardrails

- do not treat Next.js as an afterthought added only on Day 7
- do not leave route hierarchy implicit
- do not leave server versus client decisions vague
- do not ignore metadata, SEO, auth, or loading states
- do not assume one layout fits every route
