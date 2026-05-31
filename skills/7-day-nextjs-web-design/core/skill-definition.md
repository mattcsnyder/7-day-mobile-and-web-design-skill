# 7-Day Next.js Web Design

This is the shared core definition for `7-day-nextjs-web-design`.

## Objective

Guide an AI coding or assistant environment through a structured seven-day web design workflow for products that will be built in Next.js.

## When To Use

Use this skill when the user wants a seven-day design sprint for a Next.js application or feature and needs implementation-aware outputs.

Do not use it when framework choice is unknown or when the work should stay implementation-agnostic.

## How to Start

If the user hasn't described a product, ask:
- What are you designing?
- Who is it for?
- What are the hosting, auth, and data source assumptions?

Work with whatever they provide. Note missing context as open questions and continue — do not stall waiting for complete answers.

## The 4Ds of Agentic Fluency

This skill applies the 4Ds framework throughout the seven-day workflow:

- **Delegation** — each day defines what the agent handles and what the user owns
- **Description** — each day identifies what context the user must provide for strong output; ask for it, note gaps, and continue
- **Discernment** — each day ends with explicit review criteria the user applies to the agent's output
- **Diligence** — the user is accountable for every decision; the agent supports, it does not decide

Prompting lives inside Description. The other three Ds — choosing the right work, evaluating output, and owning the result — are equally essential.

## Working Style

- maintain a seven-day cadence unless the user explicitly changes it
- treat Next.js architecture as part of the design problem, not a post-design detail
- keep route structure, layout structure, and component boundaries visible from Day 2 onward
- make server versus client decisions explicit
- keep SEO, metadata, auth, and deployment assumptions visible in the plan
- end each day with a Discernment check and wait for confirmation before advancing

## Seven-Day Workflow

### Day 1: Product Brief and Runtime Constraints

**Delegation** — agent structures the brief; user owns the product vision and runtime constraints  
**Description** — ask for: product idea, target users, hosting environment, auth approach, data sources, success criteria. Note gaps and continue.  
**Discernment** — does the brief reflect the real problem? are runtime assumptions specific and testable?  
**Diligence** — wait for the user to confirm the brief before moving to Day 2

**Output:** product brief with problem statement, target users, runtime constraints, success criteria, and open questions

### Day 2: Route Tree and App Structure

**Delegation** — agent maps the route tree and layout hierarchy; user validates the structure  
**Description** — ask for: key pages, protected vs. public areas, role-specific sections, known navigation patterns. Note gaps and continue.  
**Discernment** — is the route hierarchy complete? are authenticated and public areas clearly separated?  
**Diligence** — wait for the user to confirm the route structure before data architecture decisions are made

**Output:** route map, layout map, and screen inventory

### Day 3: Rendering and Data Architecture

**Delegation** — agent proposes rendering strategy and data boundaries; user makes the architecture decisions  
**Description** — ask for: performance requirements, known data sources, real-time needs, caching expectations. Note gaps and continue.  
**Discernment** — are server vs. client decisions explicit and justified? are tradeoffs surfaced, not assumed?  
**Diligence** — wait for the user to own the rendering and data decisions before wireframing begins

**Output:** rendering strategy document and data architecture decisions with explicit tradeoffs

### Day 4: Route-Mapped Wireframes

**Delegation** — agent produces wireframes mapped to routes and layout regions; user reviews coverage  
**Description** — ask for: which routes matter most, key interaction states, loading and error expectations. Note gaps and continue.  
**Discernment** — does every wireframe map to a real route? are empty, loading, and error states covered?  
**Diligence** — wait for the user to identify and resolve gaps before visual design

**Output:** route-aware wireframe set with key states annotated per route

### Day 5: Visual System and Component Inventory

**Delegation** — agent defines the visual system and component inventory; user validates direction  
**Description** — ask for: brand guidelines, accessibility requirements, shared vs. route-specific component expectations. Note gaps and continue.  
**Discernment** — is the component inventory implementation-aware? does the visual system hold across routes?  
**Diligence** — wait for the user to confirm the visual direction before treating it as canonical

**Output:** visual system (color, type, spacing) and implementation-aware component inventory with high-fidelity screens

### Day 6: Validation, Metadata, and Risk Review

**Delegation** — agent reviews accessibility, SEO, auth, hydration, and performance risks; user prioritizes  
**Description** — ask for: SEO requirements, known accessibility constraints, deployment environment. Note gaps and continue.  
**Discernment** — are the metadata and auth plans complete? which risks are real vs. theoretical?  
**Diligence** — wait for the user to resolve or explicitly defer every open issue before handoff

**Output:** validation log with accessibility findings, metadata checklist, auth and hydration risks, and deferred items

### Day 7: Next.js Handoff

**Delegation** — agent packages the route map, component map, data plan, and implementation guidance; user owns the final handoff  
**Description** — ask for: who receives the handoff, their familiarity with Next.js, what level of detail they need. Note gaps and continue.  
**Discernment** — can a Next.js engineer implement this without a follow-up meeting?  
**Diligence** — the handoff is the user's commitment — confirm before sharing

**Output:** Next.js-specific handoff with route map, component map, data dependencies, metadata plan, open questions, and build guidance

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
- do not stall on missing information — note gaps as open questions and continue
