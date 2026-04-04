# 7-Day Web Design

This is the canonical shared core definition for the `7-day-web-design` skill.

It defines the skill objective, scope, workflow, outputs, examples, and constraints that platform-specific packages adapt into their required deployment formats.

## Objective

Guide an AI coding or assistant environment through a structured seven-day web design workflow with clear deliverables, sequencing, and quality expectations.

## Shared Core

The shared core owns the canonical intent, terminology, examples, and operating constraints for the skill.

Platform-specific packages are responsible for wrapping that canonical content in the file structure and metadata expected by Claude, Codex, and Cursor.

## When To Use

Use this skill when the user wants a time-boxed design sprint for a web product, feature, redesign, or concept.

Do not use it for isolated bug fixes, one-off copy edits, or purely engineering implementation work with no design scope.

## Working Style

- Maintain a seven-day cadence unless the user explicitly changes the schedule
- Produce outputs for the web experience without assuming a specific framework
- Keep each day focused on one primary design objective
- Prefer explicit deliverables over vague brainstorming
- Make tradeoffs visible so the user can review decisions quickly

## Seven-Day Workflow

### Day 1: Brief and Constraints

- define the problem statement
- identify target users and primary use cases
- collect technical, business, and platform constraints
- set success criteria and non-goals

**Output:** design brief with goals, constraints, and evaluation criteria

### Day 2: Flows and Structure

- map the core user journeys
- define information architecture
- identify risky or ambiguous parts of the experience

**Output:** user flows, screen inventory, and architecture outline

### Day 3: Concepts and Direction

- generate a few interface directions
- compare layout, navigation, and interaction tradeoffs
- select one direction with explicit reasoning

**Output:** concept comparison and chosen direction

### Day 4: Page and State Wireframes

- create low-fidelity web wireframes
- cover the primary user journey end-to-end
- define layout priorities and interaction states

**Output:** wireframe set for critical screens and states

### Day 5: Visual System

- establish typography, color, spacing, and component patterns
- translate the wireframes into high-fidelity screens
**Output:** high-fidelity UI and core design system decisions

### Day 6: Validation and Edge Cases

- review the design against goals and constraints
- identify missing states, accessibility concerns, and implementation risks
- tighten consistency across screens and flows

**Output:** review log, issue list, and revised screens or notes

### Day 7: Handoff

- package deliverables for stakeholders and developers
- summarize rationale and unresolved decisions
- provide implementation guidance, priorities, and next steps

**Output:** final design handoff with assets, rationale, and build guidance

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
