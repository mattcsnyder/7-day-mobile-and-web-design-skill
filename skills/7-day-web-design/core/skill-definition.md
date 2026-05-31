# 7-Day Web Design

This is the canonical shared core definition for the `7-day-web-design` skill.

It defines the skill objective, scope, workflow, outputs, and constraints that platform-specific packages adapt into their required deployment formats.

## Objective

Guide an AI coding or assistant environment through a structured seven-day web design workflow with clear deliverables, sequencing, and quality expectations.

## Shared Core

The shared core owns the canonical intent, terminology, examples, and operating constraints for the skill.

Platform-specific packages are responsible for wrapping that canonical content in the file structure and metadata expected by Claude, Codex, and Cursor.

## When To Use

Use this skill when the user wants a time-boxed design sprint for a web product, feature, redesign, or concept.

Do not use it for isolated bug fixes, one-off copy edits, or purely engineering implementation work with no design scope.

## How to Start

If the user hasn't described a product, ask:
- What are you designing?
- Who is it for?
- What constraints matter most?

Work with whatever they provide. Note missing context as open questions and continue — do not stall waiting for complete answers.

## The 4Ds of Agentic Fluency

This skill applies the 4Ds framework throughout the seven-day workflow:

- **Delegation** — each day defines what the agent handles and what the user owns
- **Description** — each day identifies what context the user must provide for strong output; ask for it, note gaps, and continue
- **Discernment** — each day ends with explicit review criteria the user applies to the agent's output
- **Diligence** — the user is accountable for every decision; the agent supports, it does not decide

Prompting lives inside Description. The other three Ds — choosing the right work, evaluating output, and owning the result — are equally essential.

## Working Style

- Maintain a seven-day cadence unless the user explicitly changes the schedule
- Produce outputs for the web experience without assuming a specific framework
- Keep each day focused on one primary design objective
- Prefer explicit deliverables over vague brainstorming
- Make tradeoffs visible so the user can review decisions quickly
- End each day with a Discernment check and wait for confirmation before advancing

## Seven-Day Workflow

### Day 1: Brief and Constraints

**Delegation** — agent structures the brief; user owns the vision and constraints  
**Description** — ask for: product idea, target users, business model, technical constraints, success criteria, auth mechanism (session cookie, JWT, OAuth?), and any sensitive data the product handles. Note gaps and continue.  
**Discernment** — does the brief reflect the real problem? are constraints specific and honest? is the auth approach defined? is sensitive data classified?  
**Diligence** — wait for the user to confirm the brief before moving to Day 2

**Output:** structured brief with problem statement, target users, constraints, auth approach, success criteria, and open questions

### Day 2: Flows and Structure

**Delegation** — agent maps user journeys and information architecture; user validates the structure  
**Description** — ask for: key tasks users need to complete, known navigation patterns, edge cases. Note gaps and continue.  
**Discernment** — do the flows match how real users think? are risky or ambiguous paths surfaced? are auth state transitions (login, logout, session expiry, token refresh) explicitly mapped?  
**Diligence** — wait for the user to confirm the architecture before wireframing begins

**Security thread:** map protected vs. public routes explicitly. Include login, logout, session expiry, and password reset as first-class flows. Identify where sensitive data is transmitted between screens.

**Output:** user flow map with auth flow diagram, screen inventory, and information architecture outline

### Day 3: Concepts and Direction

**Delegation** — agent generates direction options with tradeoffs; user makes the final choice  
**Description** — ask for: design references, brand tone, layout or navigation constraints. Note gaps and continue.  
**Discernment** — are the tradeoffs real and specific, not generic? is the chosen direction well-reasoned?  
**Diligence** — wait for the user to explicitly choose a direction before Day 4

**Output:** 2–3 named directions with tradeoffs and a recommendation with reasoning

### Day 4: Page and State Wireframes

**Delegation** — agent produces low-fidelity screens; user reviews coverage and priorities  
**Description** — ask for: which flows matter most, layout constraints, interaction priorities. Note gaps and continue.  
**Discernment** — does the wireframe set cover the primary journey end-to-end? are key states present?  
**Diligence** — wait for the user to identify and resolve gaps before moving to visual design

**Output:** low-fidelity wireframes for critical screens and states with annotations

### Day 5: Visual System

**Delegation** — agent defines the visual system and high-fidelity screens; user validates direction  
**Description** — ask for: brand guidelines, accessibility requirements, existing design patterns. Note gaps and continue.  
**Discernment** — does the visual system feel intentional? are type, spacing, and color decisions consistent?  
**Diligence** — wait for the user to confirm the visual direction before treating it as canonical

**Output:** visual system (color, type, spacing, components) and high-fidelity screens for key views

### Day 6: Validation and Security

**Delegation** — agent reviews accessibility, missing states, and implementation risks; user prioritizes issues  
**Description** — ask for: known edge cases, device targets, performance or legal constraints. Note gaps and continue.  
**Discernment** — are the issues real or theoretical? which ones block launch?  
**Diligence** — wait for the user to resolve or explicitly defer every open issue before handoff

**Security Review — Auth Headers:**

| Header | What to Check |
|---|---|
| `Authorization: Bearer <token>` | Is the token short-lived? Is it stored in memory, not localStorage? |
| Cookie flags | Are `Secure`, `HttpOnly`, and `SameSite=Strict` or `Lax` set on session cookies? |
| `Content-Security-Policy` | Is a CSP defined? Does it restrict inline scripts and unknown origins? |
| `X-Frame-Options` | Set to `DENY` or use CSP `frame-ancestors 'none'` to prevent clickjacking |
| `X-Content-Type-Options` | Set to `nosniff` to prevent MIME sniffing |
| `Strict-Transport-Security` | HSTS enabled? Redirecting HTTP to HTTPS? |
| `CORS` | Is the `Access-Control-Allow-Origin` restricted to known origins, not `*`? |

**Security Review — Standard Web Problems:**

| Problem | What to Check |
|---|---|
| XSS | Is user-generated content sanitized before rendering? Are auto-escaping protections in place? |
| CSRF | Are state-changing requests protected by CSRF tokens or `SameSite` cookies? |
| Clickjacking | Is `X-Frame-Options` or CSP `frame-ancestors` set? |
| Open redirects | Do any redirect parameters accept arbitrary URLs? Validate against an allowlist. |
| Sensitive data in URLs | Are tokens, session IDs, or PII ever passed as query parameters? Move to headers or POST body. |
| Auth error leakage | Do login errors reveal whether a username exists? Use generic messages. |
| Insecure direct object references | Can users access resources by guessing an ID? Verify ownership server-side. |
| Rate limiting | Are login, registration, and password reset endpoints rate-limited against brute force? |

**Output:** validation log with accessibility findings, missing states, security review, implementation risks, and deferred items

### Day 7: Handoff

**Delegation** — agent packages deliverables and implementation guidance; user owns the final plan  
**Description** — ask for: who receives the handoff, what level of implementation detail they need. Note gaps and continue.  
**Discernment** — can an engineer act on this without a follow-up meeting? are security requirements included?  
**Diligence** — the handoff is the user's commitment — confirm before sharing

**Security handoff checklist (include in every handoff):**
- Auth mechanism and token strategy (Bearer, session cookie, JWT lifetime)
- Required cookie flags: `Secure`, `HttpOnly`, `SameSite`
- Security headers to configure on the server or CDN: `CSP`, `X-Frame-Options`, `X-Content-Type-Options`, `HSTS`, `CORS`
- Known vulnerabilities flagged in Day 6 and their resolution or deferral status
- Rate limiting requirements for auth endpoints

**Output:** final handoff document with screen inventory, design decisions, data model, security requirements, open questions, and build guidance

## Required Deliverables

- one clear output per day
- coverage for the core web experience
- explicit assumptions and open questions
- final handoff notes that an engineer can act on

## Guardrails

- do not skip days without explaining why
- do not collapse discovery, structure, and execution into one step
- do not produce generic design language without product context
- do not assume a specific framework unless the user requests one
- do not stall on missing information — note gaps as open questions and continue
- always include the Day 6 security review and Day 7 security checklist — do not skip them
