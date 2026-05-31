# BrickLog — Design Handoff

**Completed:** 2026-05-31  
**Skill used:** 7-day-web-design  
**Framework:** 4Ds of Agentic Fluency (Anthropic, Dakan & Feller)

---

## Product Summary

BrickLog is a personal Lego collection tracker for collectors who want to know what they own, what it's worth, and the story behind each set. Price intelligence is displayed with stock-ticker clarity. Resale depth is a power layer, not the primary experience.

---

## Confirmed Stack

| Layer | Decision |
|---|---|
| Frontend | Next.js (App Router) · React · TypeScript |
| Backend | Go (REST API) |
| Database | Prisma (local for now) |
| Auth | Google OAuth (NextAuth.js) |

---

## Confirmed Scope (v1)

| In | Out |
|---|---|
| Collection inventory (sets only) | Loose parts tracking |
| Build status + notes + photos per copy | Price alerts / notifications |
| Daily price refresh (BrickLink first) | Regional pricing (USD only) |
| Stock ticker price display + sparklines | Paid tier / paywall |
| Multiple copies per set, tracked independently | Native mobile app |
| Price history chart (12 months) | Real-time pricing |
| Web-first, responsive mobile | — |

---

## Target User

Lego collectors who want to know what their collection is worth and, optionally, when it's a good time to buy or sell. Resale intelligence is a power feature, not the primary job to be done.

Users frequently own multiple copies of the same set — especially for resale — so each copy is tracked independently with its own condition, price paid, and build status.

---

## Data Sources

| Source | Purpose |
|---|---|
| Rebrickable API | Set metadata, images, themes, piece counts — free tier sufficient for v1 |
| BrickLink API | Price data (new sealed, used) — requires authentication |
| eBay sold listings | Post-launch, add as a secondary price source |

Price refresh runs as a nightly Go job. Only fetches prices for sets that exist in at least one user's collection.

---

## Information Architecture

```
/ (Dashboard)
  ├── Portfolio value + 7-day delta
  ├── Price movers ticker strip
  └── Recently added sets

/collection
  ├── Grid view of all entries
  ├── Filter: All / Built / Unbuilt / In Progress
  └── Sort: Value / Date Added / Price Change

/collection/:entryId
  ├── Set details (name, number, theme, year, piece count)
  ├── My copy: condition, price paid, build status, build date, notes, photos
  ├── Market price: current value (ticker style), sparkline, price history chart
  └── Source + last updated timestamp

/search
  └── Find a set by name or number → add to collection

/collection/add
  └── Quantity, condition, price paid, build status per copy

/account
  ├── Profile (Google)
  ├── Preferences
  └── Data source settings
```

---

## Visual System

| Token | Value |
|---|---|
| Background | `#F7F5F2` (warm off-white) |
| Surface | `#FFFFFF` |
| Primary | `#1A1A2E` (deep navy) |
| Accent | `#9B1D20` (premium brick red) |
| Price up | `#2D6A4F` |
| Price down | `#C1121F` |
| Sealed badge | `#E9C46A` |
| Built badge | `#52B788` |
| In Progress badge | `#457B9D` |
| Typeface | DM Sans + DM Mono (set numbers, prices) |
| Border radius | 12px cards · 8px inputs · 20px badges |

**Price display pattern (ticker style):**
```
$680  ▲ +$38  +5.9%
```
Always show: current value · direction arrow · dollar delta · percentage delta as a unit.

**Sparklines:** 30-day window on collection cards. 12-month on set detail. Pre-computed from PriceSnapshot. Rendered as SVG path.

---

## Prisma Schema

```prisma
model User {
  id        String            @id @default(cuid())
  email     String            @unique
  name      String?
  image     String?
  entries   CollectionEntry[]
  createdAt DateTime          @default(now())
}

model CollectionEntry {
  id          String      @id @default(cuid())
  userId      String
  user        User        @relation(fields: [userId], references: [id])
  setNumber   String
  condition   Condition
  pricePaid   Float?
  acquiredAt  DateTime?
  buildStatus BuildStatus @default(SEALED)
  builtAt     DateTime?
  notes       String?
  photos      String[]
  createdAt   DateTime    @default(now())
}

model Set {
  setNumber   String          @id
  name        String
  theme       String?
  year        Int?
  pieceCount  Int?
  retailPrice Float?
  retired     Boolean         @default(false)
  imageUrl    String?
  snapshots   PriceSnapshot[]
}

model PriceSnapshot {
  id             String   @id @default(cuid())
  setNumber      String
  set            Set      @relation(fields: [setNumber], references: [setNumber])
  newSealedPrice Float?
  usedPrice      Float?
  source         String
  fetchedAt      DateTime @default(now())
}

enum Condition {
  SEALED
  USED
  BUILT
}

enum BuildStatus {
  SEALED
  IN_PROGRESS
  BUILT
}
```

---

## Architecture Notes

**Auth:** Google OAuth via NextAuth.js on the Next.js side. Go backend verifies session token on protected API requests. User record created in the database on first sign-in.

**Frontend / backend split:** Next.js handles rendering and routing. Go handles all business logic, Rebrickable/BrickLink data fetching, and the nightly price refresh job. Next.js calls the Go API — no business logic in Next.js API routes.

**Prisma pattern (v1):** Next.js uses Prisma for direct DB reads in server components. Go owns all writes and background jobs. Schema managed via Prisma migrations. Revisit boundary as Go API matures.

---

## Empty and Edge Case States

| State | Behavior |
|---|---|
| New user, empty collection | Dashboard shows onboarding empty state with Add a Set CTA |
| Set with no price data yet | Show "Fetching price data" — never show $0 or blank |
| Price data stale / source down | Show last known price with "May be outdated" warning |
| Set image not found | Neutral placeholder with set number centered |
| Search returns no results | Suggest searching by set number (e.g. 75192) |
| Duplicate set | Allow silently — users frequently own multiples. Show ×N badge on card. |
| Retired set | Hide retail price field entirely. Show "Retired" badge. Secondary market price only. |
| Collection over 100 sets | Virtual scroll on grid. Lazy-load images. |

---

## Build Order

1. Prisma schema + local database
2. Google Auth — NextAuth.js, user creation on first login
3. Rebrickable integration (Go) — set search and metadata
4. Collection CRUD — Go API + Next.js (add, view, edit, delete entries)
5. BrickLink price fetch — Go nightly job, populate PriceSnapshot
6. Price display + sparklines — Next.js ticker UI
7. Dashboard — depends on collection + price data both working

Do not build the price UI before the Go price job is running. The ticker and sparklines have nothing to render without PriceSnapshot data.

---

## Open Questions

| Question | Notes |
|---|---|
| BrickLink API rate limits | Investigate before committing to nightly refresh — may need to stagger requests across the day |
| Photo storage | Use object storage (S3 or equivalent) — not the database |
| Offline support | Not in v1 scope |
| Regional pricing | USD only for v1 — known gap |
| Paid tier feature split | Deferred — build functionality first |
