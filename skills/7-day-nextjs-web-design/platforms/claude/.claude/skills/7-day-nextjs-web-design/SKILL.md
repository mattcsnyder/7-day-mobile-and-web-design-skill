---
name: 7-day-nextjs-web-design
description: A seven-day design workflow for web products that will be built in Next.js.
---

# 7-Day Nextjs Web Design

Use this skill when a user wants a seven-day design sprint for a product that will be built in Next.js.

## The 4Ds of Agentic Fluency

This skill runs on the 4Ds framework. Each day applies all four:

- **Delegation** — what the agent handles vs. what the user owns
- **Description** — what context the user provides to enable strong output
- **Discernment** — how the user evaluates and challenges what the agent produces
- **Diligence** — the user's accountability for every decision in the plan

Prompting is one part of Description. The other three Ds — choosing the right work, judging the output, and owning the result — are equally essential.

## Day Plan

### Day 1: Brief

**Delegation** — agent structures the brief; user owns the product vision and runtime constraints  
**Description** — provide: product idea, target users, hosting environment, auth approach, data sources, success criteria  
**Discernment** — does the brief reflect the real problem? are runtime assumptions specific and testable?  
**Diligence** — sign off on the brief before moving to Day 2

### Day 2: Routes and Layouts

**Delegation** — agent maps the route tree and layout hierarchy; user validates the structure  
**Description** — provide: key pages, protected vs. public areas, role-specific sections, known navigation patterns  
**Discernment** — is the route hierarchy complete? are authenticated and public areas clearly separated?  
**Diligence** — confirm the route structure before data architecture decisions are made

### Day 3: Rendering and Data

**Delegation** — agent proposes rendering strategy and data boundaries; user makes the architecture decisions  
**Description** — provide: performance requirements, known data sources, real-time needs, caching expectations  
**Discernment** — are server vs. client decisions explicit and justified? are tradeoffs surfaced, not assumed?  
**Diligence** — own the rendering and data decisions before wireframing begins

### Day 4: Route-Mapped Wireframes

**Delegation** — agent produces wireframes mapped to routes and layout regions; user reviews coverage  
**Description** — provide: which routes matter most, key interaction states, loading and error expectations  
**Discernment** — does every wireframe map to a real route? are empty, loading, and error states covered?  
**Diligence** — identify gaps and resolve them before visual design

### Day 5: Visual Design and Components

**Delegation** — agent defines the visual system and component inventory; user validates direction  
**Description** — provide: brand guidelines, accessibility requirements, shared vs. route-specific component expectations  
**Discernment** — is the component inventory implementation-aware? does the visual system hold across routes?  
**Diligence** — confirm the system before treating it as canonical

### Day 6: Validation and Metadata

**Delegation** — agent reviews accessibility, SEO, auth, hydration, and performance risks; user prioritizes  
**Description** — provide: SEO requirements, known accessibility constraints, deployment environment  
**Discernment** — are the metadata and auth plans complete? which risks are real vs. theoretical?  
**Diligence** — resolve or explicitly defer every open issue before handoff

### Day 7: Handoff

**Delegation** — agent packages the route map, component map, data plan, and implementation guidance; user owns the final handoff  
**Description** — provide: who receives the handoff, their familiarity with Next.js, what level of detail they need  
**Discernment** — can a Next.js engineer implement this without a follow-up meeting?  
**Diligence** — the handoff is your commitment — review it before sharing

## Rules

- keep Next.js architecture visible from Day 2 onward
- make server vs. client decisions explicit
- include metadata and SEO considerations
- include auth, loading, and error-state considerations
