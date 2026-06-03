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

**Chosen direction: Stage**

The character is the experience. Landing on the roster is a full-screen tap-to-cycle carousel — one character fills the screen at a time with an atmospheric visual, name, and one-line descriptor. Users tap left/right (or swipe) to cycle through characters and tap a CTA to enter their world. The conversation view is immersive and styled to the character's persona.

Roster navigation: tap-to-cycle carousel, not a grid. One character in focus at a time. Page indicator shows position in the roster.

---

## Day 4: Wireframes

**Day 4 amendments (post-confirmation):**
- Screen 2 (Character Detail) removed — tapping a character goes straight to conversation
- Stage is stripped of UI chrome — spotlight on the character, nothing else
- Chat fades in as an overlay on the stage — the character backdrop stays visible behind it
- No separate chat route — the stage IS the conversation space

---

### Screen 1: Character Stage — Roster

```
┌─────────────────────────────┐
│                             │
│                             │
│        [AVATAR / ART]       │
│       full-screen image     │
│   atmospheric backdrop      │
│   spotlight / vignette      │
│                             │
│                             │
│   ◄                    ►    │  ← tap to cycle; hidden until hover/touch
│                             │
│   ●  ○  ○  ○  ○            │  ← minimal page dots, bottom
│                             │
│   CHARACTER NAME            │
│   One-line persona          │
│                             │
│   [tap anywhere to enter]   │  ← no button; whole card is the tap target
│                             │
└─────────────────────────────┘
```

Annotations: no CTA button — the entire character card is tappable; arrows appear on touch/hover only; page dots are minimal; spotlight/vignette focuses the eye on the character.

---

### Screen 2: Character Detail

```
┌─────────────────────────────┐
│  ←  Back                    │
│                             │
│        [AVATAR]             │
│        large, centered      │
│                             │
│   CHARACTER NAME            │
│   Short archetype label     │
│                             │
│  ─────────────────────────  │
│                             │
│   About                     │
│   2-3 sentence persona      │
│   description. Tone, style, │
│   what they talk about.     │
│                             │
│   Sample line:              │
│   "Opening quote from       │
│    the character..."        │
│                             │
│  ┌─────────────────────┐   │
│  │   Start Conversation │   │
│  └─────────────────────┘   │
│                             │
└─────────────────────────────┘
```

Annotations: sample line gives users a feel for the voice before entering; back returns to Stage at the same carousel position.

---

### Screen 3: Active Conversation — Empty State (first visit)

```
┌─────────────────────────────┐
│  ←     CHARACTER NAME   ··· │
│  ─────────────────────────  │
│                             │
│        [small avatar]       │
│                             │
│   ┌─────────────────────┐  │
│   │  "Opening message   │  │  ← character's auto-sent intro line
│   │   from the char-    │  │
│   │   acter. Sets tone."│  │
│   └─────────────────────┘  │
│                             │
│                             │
│  ─────────────────────────  │
│  ┌────────────────────┐ [→] │
│  │  Say something...  │     │
│  └────────────────────┘     │
└─────────────────────────────┘
```

Annotations: character sends opening message automatically on first load; `···` opens options menu (Clear Thread); input bar docked to bottom, keyboard pushes it up natively.

---

### Screen 4: Active Conversation — Mid-Thread

```
┌─────────────────────────────┐
│  ←     CHARACTER NAME   ··· │
│  ─────────────────────────  │
│                             │
│   ┌──────────────────────┐  │
│   │  Character message   │  │  ← left-aligned
│   └──────────────────────┘  │
│                             │
│        ┌──────────────────┐ │
│        │   User message   │ │  ← right-aligned
│        └──────────────────┘ │
│                             │
│   ┌──────────────────────┐  │
│   │  Character reply...  │  │
│   └──────────────────────┘  │
│                             │
│  ─────────────────────────  │
│  ┌────────────────────┐ [→] │
│  │  Say something...  │     │
│  └────────────────────┘     │
└─────────────────────────────┘
```

---

### Screen 5: Streaming State

```
┌─────────────────────────────┐
│  ←     CHARACTER NAME   ··· │
│  ─────────────────────────  │
│                             │
│        ┌──────────────────┐ │
│        │   User message   │ │
│        └──────────────────┘ │
│                             │
│   ┌──────────────────────┐  │
│   │  Partial response    │  │
│   │  text here▌          │  │  ← blinking cursor, tokens appending
│   └──────────────────────┘  │
│                             │
│  ─────────────────────────  │
│  ┌────────────────────┐ [⏸] │  ← input disabled; send becomes stop
│  │  (disabled)        │     │
│  └────────────────────┘     │
└─────────────────────────────┘
```

Annotations: input disabled while streaming; cursor removed when stream completes; character bubble expands naturally as tokens arrive.

---

### Screen 6: Error State — Ollama Unreachable

```
┌─────────────────────────────┐
│  ←     CHARACTER NAME   ··· │
│  ─────────────────────────  │
│                             │
│   [prior messages...]       │
│                             │
│   ┌──────────────────────┐  │
│   │  Couldn't reach the  │  │
│   │  server. Check your  │  │
│   │  connection.         │  │
│   │                      │  │
│   │  [Try Again]         │  │
│   └──────────────────────┘  │
│                             │
│  ─────────────────────────  │
│  ┌────────────────────┐ [→] │
│  └────────────────────┘     │
└─────────────────────────────┘
```

Annotations: error appears inline in the thread, not as a modal; "Try Again" resends the last user message; prior messages remain visible.

---

### Screen 7: Clear Thread Confirmation

```
┌─────────────────────────────┐
│                             │
│         ┌───────────┐       │
│         │  Clear    │       │
│         │  this     │       │
│         │  conver-  │       │
│         │  sation?  │       │
│         │           │       │
│         │ This will │       │
│         │ erase all │       │
│         │ messages. │       │
│         │           │       │
│         │  [Cancel] │       │
│         │  [Clear]  │       │  ← destructive action
│         └───────────┘       │
│                             │
└─────────────────────────────┘
```

### Coverage

| Flow | Screen |
|---|---|
| Browse characters (carousel) | 1 |
| Preview character before chatting | 2 |
| First conversation / empty state | 3 |
| Active conversation mid-thread | 4 |
| Streaming response | 5 |
| Ollama error / retry | 6 |
| Clear thread | 7 |
| Resume prior conversation | 1 (Resume CTA) → 4 |

### Open Questions

- Does tapping a character on Stage go directly to chat, or always through the Detail screen first?
- Can users swipe between characters from within the conversation view, or must they go back to roster?
- Any character categories or filtering needed as the roster grows?

---

## Day 5: Visual Design

### Color System

**App shell (base layer)**

| Token | Value | Use |
|---|---|---|
| `--bg-stage` | `#080810` | Full-screen stage — near-black, blue-black tint |
| `--overlay-chat` | `rgba(8,8,16,0.82)` | Chat panel — dark frosted overlay on stage art |
| `--text-primary` | `#F0EEE8` | Main text — warm off-white |
| `--text-muted` | `#7A7885` | Timestamps, secondary labels |
| `--bubble-user` | `rgba(255,255,255,0.10)` | User message bubble — subtle glass |
| `--bubble-char` | `transparent` | Character messages — no bubble, text only |
| `--border-subtle` | `rgba(255,255,255,0.08)` | Dividers, input borders |
| `--accent-default` | `#A78BFA` | Default accent — soft violet |

**Per-character theming — each character has a signature accent and backdrop mood**

| Character type | `--char-accent` | Backdrop feel |
|---|---|---|
| Philosopher / sage | `#7CB9E8` cool blue | Dark stone, muted atmospheric gradient |
| Trickster / wit | `#F59E0B` amber | Warm candlelight glow, deep shadow |
| Warrior / hero | `#EF4444` deep red | Smoke, ember, dark contrast |
| Mystic / oracle | `#A78BFA` violet | Deep indigo, starfield, mist |
| Scholar / advisor | `#34D399` sage green | Deep forest, low warm light |

Accent is used for: character name on stage, streaming cursor, and subtle conversation highlights.

### Typography

| Role | Style | Size (mobile) | Weight |
|---|---|---|---|
| Character name (stage) | Display — wide tracking, uppercase | 28px | 300 light |
| Character descriptor | Body sans | 14px | 400 |
| Character speech | Text-weight serif (Lora / Georgia) | 16px | 400 |
| User message | Body sans (Inter / DM Sans) | 16px | 400 |
| Timestamps / labels | Mono or small sans | 11px | 400 |
| Page counter | Mono | 12px | 400 |

Pairing a humanist sans for UI and user messages with a serif for character speech reinforces that each character has a distinct voice.

### Spacing and Layout

| Token | Value | Use |
|---|---|---|
| `--space-chat-h` | 16px | Message horizontal inset |
| `--space-bubble-gap` | 12px | Gap between consecutive messages |
| `--space-turn-gap` | 24px | Gap between user/character turns |
| `--chat-panel-height` | 65vh | Overlay height — character art visible above |
| `--input-bar-height` | 56px | Docked input bar |
| `--stage-name-bottom` | 96px | Character name from bottom of stage |

### Key Transitions

| Interaction | Transition |
|---|---|
| Tap character on stage | Stage dims 20%, chat panel fades up from bottom ~300ms ease-out |
| Swipe to next character | Horizontal slide; backdrop crossfades; name fades in |
| Character opening message | Fades in after panel settles, ~150ms delay |
| Streaming tokens | No animation — append only; cursor pulses at 1s |
| Dismiss chat | Chat fades down, stage brightens back |

### High-Fidelity Screen Descriptions

**Stage — Roster (resting)**
Full-screen character art with a soft radial spotlight centered on the character. Edges bleed into near-black. Character name in wide-tracked uppercase in the lower third. One-line descriptor below in muted off-white. Tiny page dots at the very bottom. No buttons, no chrome.

**Stage — Chat Open (overlay)**
Character art visible in the top ~35% of screen, dimmed slightly. Bottom 65% is the chat panel: dark semi-transparent surface with subtle blur. Character speech in serif with accent-colored name label. User messages in right-aligned glass bubbles in sans. Input bar at the very bottom — text field and send icon only. No navbar.

**Streaming State**
Last character message shows partial text with a softly pulsing accent-colored cursor at the end. Input bar dimmed. Stage backdrop unchanged. Experience stays immersive throughout.

### Component Inventory

| Component | Notes |
|---|---|
| `StageCard` | Full-screen backdrop + name + descriptor; entire card is tap target |
| `CarouselNav` | Prev/next arrows + page dots; hidden at rest, shown on touch |
| `ChatPanel` | Overlay; semi-transparent; slides up on open |
| `MessageBubble` | User variant (glass, right) + Character variant (no bubble, left) |
| `StreamingCursor` | Accent-colored blinking cursor on last character message |
| `InputBar` | Fixed bottom; text + send; disabled during streaming |
| `InlineError` | Error card within thread; includes retry action |
| `ClearConfirmSheet` | Bottom sheet for clear thread confirmation |

---

## Day 6: Validation and Security

_Pending_

---

## Day 7: Handoff

_Pending_
