---
name: 7-day-nextjs-web-design
description: A seven-day design workflow for web products that will be built in Next.js.
---

# 7-Day Nextjs Web Design

Use this skill when a user wants a seven-day design sprint for a product that will be built in Next.js.

## How to Start

If the user hasn't described a product, ask:
- What are you designing?
- Who is it for?
- What are the hosting, auth, and data source assumptions?

Work with whatever they provide. Note missing context as open questions and continue — do not stall waiting for complete answers.

## The 4Ds of Agentic Fluency

This skill runs on the 4Ds framework. Each day applies all four:

- **Delegation** — what the agent handles vs. what the user owns
- **Description** — what context the user provides to enable strong output
- **Discernment** — how the user evaluates and challenges what the agent produces
- **Diligence** — the user's accountability for every decision in the plan

Prompting is one part of Description. The other three Ds — choosing the right work, judging the output, and owning the result — are equally essential.

## Day Plan

End each day with a Discernment check and wait for the user to confirm before advancing.

### Day 1: Brief

**Delegation** — agent structures the brief; user owns the product vision and runtime constraints  
**Description** — ask for: product idea, target users, hosting environment, auth approach, data sources, success criteria. Note gaps and continue.  
**Discernment** — does the brief reflect the real problem? are runtime assumptions specific and testable?  
**Diligence** — wait for the user to confirm the brief before moving to Day 2

**Output:** product brief with problem statement, target users, runtime constraints, success criteria, and open questions

---

### Day 2: Routes and Layouts

**Delegation** — agent maps the route tree and layout hierarchy; user validates the structure  
**Description** — ask for: key pages, protected vs. public areas, role-specific sections, known navigation patterns. Note gaps and continue.  
**Discernment** — is the route hierarchy complete? are authenticated and public areas clearly separated?  
**Diligence** — wait for the user to confirm the route structure before data architecture decisions are made

**Output:** route map, layout map, and screen inventory

---

### Day 3: Rendering and Data

**Delegation** — agent proposes rendering strategy and data boundaries; user makes the architecture decisions  
**Description** — ask for: performance requirements, known data sources, real-time needs, caching expectations. Note gaps and continue.  
**Discernment** — are server vs. client decisions explicit and justified? are tradeoffs surfaced, not assumed?  
**Diligence** — wait for the user to own the rendering and data decisions before wireframing begins

**Output:** rendering strategy document and data architecture decisions with explicit tradeoffs

---

### Day 4: Route-Mapped Wireframes

**Delegation** — agent produces wireframes mapped to routes and layout regions; user reviews coverage  
**Description** — ask for: which routes matter most, key interaction states, loading and error expectations. Note gaps and continue.  
**Discernment** — does every wireframe map to a real route? are empty, loading, and error states covered?  
**Diligence** — wait for the user to identify and resolve gaps before visual design

**Output:** route-aware wireframe set with key states annotated per route

---

### Day 5: Visual Design and Components

**Delegation** — agent defines the visual system and component inventory; user validates direction  
**Description** — ask for: brand guidelines, accessibility requirements, shared vs. route-specific component expectations. Note gaps and continue.  
**Discernment** — is the component inventory implementation-aware? does the visual system hold across routes?  
**Diligence** — wait for the user to confirm the visual direction before treating it as canonical

**Output:** visual system (color, type, spacing) and implementation-aware component inventory with high-fidelity screens

---

### Day 6: Validation and Metadata

**Delegation** — agent reviews accessibility, SEO, auth, hydration, and performance risks; user prioritizes  
**Description** — ask for: SEO requirements, known accessibility constraints, deployment environment. Note gaps and continue.  
**Discernment** — are the metadata and auth plans complete? which risks are real vs. theoretical?  
**Diligence** — wait for the user to resolve or explicitly defer every open issue before handoff

**Output:** validation log with accessibility findings, metadata checklist, auth and hydration risks, and deferred items

---

### Day 7: Handoff

**Delegation** — agent packages the route map, component map, data plan, and implementation guidance; user owns the final handoff  
**Description** — ask for: who receives the handoff, their familiarity with Next.js, what level of detail they need. Note gaps and continue.  
**Discernment** — can a Next.js engineer implement this without a follow-up meeting?  
**Diligence** — the handoff is the user's commitment — confirm before sharing

**Output:** Next.js-specific handoff with route map, component map, data dependencies, metadata plan, open questions, and build guidance

---

## Rules

- keep Next.js architecture visible from Day 2 onward
- produce one clear output per day
- end each day with a Discernment check and wait for confirmation before advancing
- state assumptions and open questions explicitly; do not stall on missing information
- make server vs. client decisions explicit
- include metadata and SEO considerations
- include auth, loading, and error-state considerations
