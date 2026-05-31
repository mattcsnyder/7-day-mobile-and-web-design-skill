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
**Description** — ask for: product idea, target users, hosting environment, auth approach (NextAuth, Clerk, custom JWT?), data sources, sensitive data classification, success criteria. Note gaps and continue.  
**Discernment** — does the brief reflect the real problem? are runtime assumptions specific and testable? is the auth provider and token strategy defined?  
**Diligence** — wait for the user to confirm the brief before moving to Day 2

**Output:** product brief with problem statement, target users, runtime constraints, auth approach, success criteria, and open questions

### Day 2: Route Tree and App Structure

**Delegation** — agent maps the route tree and layout hierarchy; user validates the structure  
**Description** — ask for: key pages, protected vs. public areas, role-specific sections, known navigation patterns. Note gaps and continue.  
**Discernment** — is the route hierarchy complete? are authenticated and public areas clearly separated? is middleware protection defined for every protected route group?  
**Diligence** — wait for the user to confirm the route structure before data architecture decisions are made

**Security thread:** define middleware-protected route groups explicitly. Map login, logout, session expiry, and token refresh as routes or flows. Identify which routes require role checks beyond basic auth.

**Output:** route map, layout map, screen inventory, and protected route groups with middleware strategy

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

### Day 6: Validation, Metadata, and Security Review

**Delegation** — agent reviews accessibility, SEO, auth, hydration, performance, and security risks; user prioritizes  
**Description** — ask for: SEO requirements, known accessibility constraints, deployment environment. Note gaps and continue.  
**Discernment** — are the metadata and auth plans complete? which risks are real vs. theoretical?  
**Diligence** — wait for the user to resolve or explicitly defer every open issue before handoff

**Security Review — Auth Headers:**

| Header | What to Check |
|---|---|
| `Authorization: Bearer <token>` | Is the token short-lived? Is it stored in memory, not localStorage? |
| Cookie flags | Are `Secure`, `HttpOnly`, and `SameSite=Strict` or `Lax` set on session cookies? |
| `Content-Security-Policy` | Is a CSP defined in `next.config.js`? Does it restrict inline scripts and unknown origins? |
| `X-Frame-Options` | Set to `DENY` or use CSP `frame-ancestors 'none'` to prevent clickjacking |
| `X-Content-Type-Options` | Set to `nosniff` — configurable in Next.js headers config |
| `Strict-Transport-Security` | HSTS enabled on the host? Redirecting HTTP to HTTPS? |
| `CORS` | Are API routes restricting `Access-Control-Allow-Origin` to known origins? |

**Security Review — Standard Web Problems:**

| Problem | What to Check |
|---|---|
| XSS | Is user-generated content sanitized? Is `dangerouslySetInnerHTML` avoided or guarded? |
| CSRF | Are state-changing API routes protected? Verify custom routes beyond NextAuth. |
| Clickjacking | Is `X-Frame-Options` or CSP `frame-ancestors` configured in `next.config.js`? |
| Open redirects | Do `redirect()` calls or `callbackUrl` params accept arbitrary URLs? Validate against an allowlist. |
| Sensitive data in URLs | Are tokens or PII ever passed as query params? Move to headers or server-side session. |
| Auth error leakage | Do login errors reveal whether a username exists? Use generic messages. |
| Insecure direct object references | Can users access resources by guessing an ID? Verify ownership in server components and API routes. |
| Rate limiting | Are login, registration, and password reset routes rate-limited? |
| Middleware bypass | Is every protected route group covered by middleware — not just client-side redirects? |

**Output:** validation log with accessibility findings, metadata checklist, security review, auth and hydration risks, and deferred items

### Day 7: Next.js Handoff

**Delegation** — agent packages the route map, component map, data plan, and implementation guidance; user owns the final handoff  
**Description** — ask for: who receives the handoff, their familiarity with Next.js, what level of detail they need. Note gaps and continue.  
**Discernment** — can a Next.js engineer implement this without a follow-up meeting? are security requirements included?  
**Diligence** — the handoff is the user's commitment — confirm before sharing

**Security handoff checklist (include in every handoff):**
- Auth provider, token strategy, and session lifetime
- Required cookie flags: `Secure`, `HttpOnly`, `SameSite`
- Security headers to configure in `next.config.js`: `CSP`, `X-Frame-Options`, `X-Content-Type-Options`, `HSTS`
- Middleware protection strategy — which route groups, what checks
- Known vulnerabilities flagged in Day 6 and their resolution or deferral status
- Rate limiting requirements for auth and sensitive API routes
- CORS policy for API routes

**Output:** Next.js-specific handoff with route map, component map, data dependencies, metadata plan, security requirements, open questions, and build guidance

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
- always include the Day 6 security review and Day 7 security checklist — do not skip them
