# AI Persona Chat — Design Sprint

A mobile-first web app for conversing with AI-powered characters. Each character has a distinct voice and persona. No login required. Conversations persist in the browser via localStorage against a self-hosted Ollama inference server with streaming responses.

**Skill:** 7-day-web-design-claude  
**Started:** 2026-06-03

---

## Day 1: Brief

### Problem Statement

People want to have conversations with specific characters — fictional, historical, archetypal, or personality-based — without the friction of setup or account creation. Current AI chat tools are generic; this product gives each conversation a distinct voice and persona from the start.

### Target Users

Anyone who wants an engaging, character-driven conversation. No narrow segment assumed at launch — the character roster and tone will attract the natural audience over time.

### Core Interaction

User → selects a character from a prebuilt roster → converses with that character → can resume prior conversations or switch characters at any time.

### Constraints

| Constraint | Detail |
|---|---|
| Auth | None at launch — fully anonymous sessions |
| Characters | Prebuilt and maintained by the product team |
| Platform | Mobile-first web (responsive) |
| Business model | Free at launch |
| Inference | Self-hosted Ollama server with streaming |
| Conversation storage | localStorage, keyed by character ID |
| Framework | Undecided — no assumption made |

### Auth and Sensitive Data

No auth at launch. Conversations never leave the user's browser + their own Ollama server. Conversation content may include personal disclosures in anonymous sessions — no server-side persistence by default.

### Success Criteria

- User can open the app and be in a conversation with a character in under 30 seconds
- Each character feels meaningfully distinct
- Mobile experience is the primary quality bar
- Responses stream token-by-token without perceptible lag

### Open Questions

- What characters are in the first roster? (historical, fictional, archetypal, original?)
- Content moderation or safety guardrails on character responses?
- Is the Ollama server local or hosted via URL?
- Is there a planned path to auth/accounts in a future version?
- Any limit on localStorage thread length before trimming old messages?

---

## Day 2: Flows and Structure

### User Flow Map

```
[App Open]
    │
    ▼
[Character Roster — paginated]
    │  Characters with prior conversations show "Resume" indicator
    │
    ├── [New character] → [Character Detail / Preview]
    │       │
    │       └── Tap "Start Conversation" → [Active Conversation — new thread]
    │
    └── [Prior character] → [Active Conversation — resumed thread]
                │
                ├── Stream message → Ollama → stream tokens into UI
                ├── Scroll history
                ├── [Switch Character] → back to Roster
                └── [Clear Conversation] → wipe localStorage thread for this character
```

### Screen Inventory

| # | Screen | Notes |
|---|---|---|
| 1 | Character Roster | Paginated grid/list; prior conversations surfaced visually |
| 2 | Character Detail | Bio, sample dialogue, tone; "Start" or "Resume" CTA |
| 3 | Active Conversation | Streaming chat; character header; message history from localStorage |
| 4 | Streaming state | Partial token display with cursor/indicator while Ollama responds |
| 5 | Switch / Clear prompt | Confirm before clearing a thread |
| 6 | Empty thread state | First message prompt, character intro |
| 7 | Error state | Ollama unreachable, stream interrupted |

### Information Architecture

```
App
├── Roster (root, paginated)
│   └── Character card × N (per page)
│       ├── Avatar, name, descriptor
│       ├── "Resume" badge if localStorage thread exists
│       └── → Character Detail or direct to Chat
└── Conversation (per character)
    ├── Thread loaded from localStorage on mount
    ├── Streaming message appended token by token
    ├── Thread saved to localStorage on each exchange
    └── Actions: Clear thread · Back to Roster
```

### Route Structure

| Route | Screen | Public |
|---|---|---|
| `/` | Character Roster | Yes |
| `/characters/:id` | Character Detail / Preview | Yes |
| `/chat/:id` | Active Conversation | Yes |

All routes public — no auth boundary at launch.

### Data and Technical Notes

| Concern | Approach |
|---|---|
| Conversation storage | `localStorage` keyed by character ID; one thread per character |
| Inference | Ollama server — self-hosted, streaming via SSE or chunked HTTP |
| Streaming UI | Append tokens to last message as they arrive; show cursor indicator |
| Pagination | Characters fetched in pages; roster loads more on scroll or page tap |
| Privacy | Conversations never leave browser + user's Ollama server |

---

## Day 3: Concepts and Direction

_See below_

---

## Day 4: Wireframes

_Pending Day 3 direction choice_

---

## Day 5: Visual Design

_Pending_

---

## Day 6: Validation and Security

_Pending_

---

## Day 7: Handoff

_Pending_
