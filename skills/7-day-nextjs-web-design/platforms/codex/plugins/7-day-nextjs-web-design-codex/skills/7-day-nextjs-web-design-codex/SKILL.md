# 7-Day Next.js Web Design — Codex

Use this skill to run a seven-day design sprint for web products that will be built in Next.js.

## How to Start

If the user hasn't described a product, ask:
- What are you designing?
- Who is it for?
- What are the hosting, auth, and data source assumptions?

Work with whatever they provide. Note missing context as open questions and continue — do not stall waiting for complete answers.

## The 4Ds of Agentic Fluency

This skill runs on the 4Ds framework. Each day applies all four:

- **Delegation** — what the agent handles vs. what the user owns
- **Description** — what context the user provides to enable strong output; ask for it, note gaps, continue
- **Discernment** — how the user evaluates and challenges what the agent produces
- **Diligence** — the user is accountable for every decision; wait for confirmation before advancing

Prompting is one part of Description. The other three Ds — choosing the right work, judging the output, and owning the result — are equally essential.

## Day Plan

End each day with a Discernment check and wait for the user to confirm before advancing.

### Day 1: Brief

**Delegation** — agent structures the brief; user owns the product vision and runtime constraints  
**Description** — ask for: product idea, target users, hosting environment, auth approach, data sources, success criteria, auth mechanism (session cookie, JWT, OAuth?), and any sensitive data the product handles. Note gaps and continue.  
**Discernment** — does the brief reflect the real problem? are runtime assumptions specific and testable? is the auth approach defined? is sensitive data classified?  
**Diligence** — wait for the user to confirm the brief before moving to Day 2

**Output:** product brief with problem statement, target users, runtime constraints, auth approach, success criteria, and open questions

### Day 2: Routes and Layouts

**Delegation** — agent maps the route tree and layout hierarchy; user validates the structure  
**Description** — ask for: key pages, protected vs. public areas, role-specific sections, known navigation patterns. Note gaps and continue.  
**Discernment** — is the route hierarchy complete? are authenticated and public areas clearly separated? are auth state transitions (login, logout, session expiry, token refresh) explicitly mapped?  
**Diligence** — wait for the user to confirm the route structure before data architecture decisions are made

**Security thread:** map protected vs. public routes explicitly using middleware-protected route groups. Include login, logout, session expiry, and password reset as first-class flows. Identify where sensitive data is transmitted between screens.

**Output:** route map with auth flow diagram, layout map, and screen inventory

### Day 3: Rendering and Data

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

### Day 5: Visual Design and Components

**Delegation** — agent defines the visual system and component inventory; user validates direction  
**Description** — ask for: brand guidelines, accessibility requirements, shared vs. route-specific component expectations. Note gaps and continue.  
**Discernment** — is the component inventory implementation-aware? does the visual system hold across routes?  
**Diligence** — wait for the user to confirm the visual direction before treating it as canonical

**Output:** visual system (color, type, spacing) and implementation-aware component inventory with high-fidelity screens

### Day 6: Validation, Security, and Metadata

**Delegation** — agent reviews accessibility, SEO, auth, hydration, and performance risks; user prioritizes  
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
| `X-Content-Type-Options` | Set to `nosniff` to prevent MIME sniffing |
| `Strict-Transport-Security` | HSTS enabled? Redirecting HTTP to HTTPS? |
| `CORS` | Is the `Access-Control-Allow-Origin` restricted to known origins, not `*`? |

**Security Review — Standard Web Problems:**

| Problem | What to Check |
|---|---|
| XSS | Is user-generated content sanitized before rendering? Are auto-escaping protections in place? |
| CSRF | Are state-changing API routes protected by CSRF tokens or `SameSite` cookies? |
| Clickjacking | Is `X-Frame-Options` or CSP `frame-ancestors` set? |
| Open redirects | Do any redirect parameters accept arbitrary URLs? Validate against an allowlist. |
| Sensitive data in URLs | Are tokens, session IDs, or PII ever passed as query parameters? Move to headers or POST body. |
| Auth error leakage | Do login errors reveal whether a username exists? Use generic messages. |
| Insecure direct object references | Can users access resources by guessing an ID? Verify ownership server-side. |
| Rate limiting | Are login, registration, and password reset endpoints rate-limited against brute force? |

**Output:** validation log with accessibility findings, missing states, security review, implementation risks, and deferred items

### Day 7: Handoff

**Delegation** — agent packages the route map, component map, data plan, and implementation guidance; user owns the final handoff  
**Description** — ask for: who receives the handoff, their familiarity with Next.js, what level of detail they need. Note gaps and continue.  
**Discernment** — can a Next.js engineer implement this without a follow-up meeting? are security requirements included?  
**Diligence** — the handoff is the user's commitment — confirm before sharing

**Security handoff checklist (include in every handoff):**
- Auth mechanism and token strategy (Bearer, session cookie, JWT lifetime)
- Required cookie flags: `Secure`, `HttpOnly`, `SameSite`
- Security headers to configure on the server or CDN: `CSP`, `X-Frame-Options`, `X-Content-Type-Options`, `HSTS`, `CORS`
- Known vulnerabilities flagged in Day 6 and their resolution or deferral status
- Rate limiting requirements for auth endpoints

**Output:** Next.js-specific handoff with route map, component map, data dependencies, metadata plan, security requirements, open questions, and build guidance

## Constraints

- keep Next.js architecture visible from Day 2 onward
- produce one clear output per day
- end each day with a Discernment check and wait for confirmation before advancing
- state assumptions and open questions explicitly; do not stall on missing information
- make server vs. client decisions explicit
- include metadata and SEO considerations
- include auth, loading, and error-state considerations
- always include the Day 6 security review and Day 7 security checklist — do not skip them
