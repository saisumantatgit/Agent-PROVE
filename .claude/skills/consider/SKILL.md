---
name: consider
description: Apply a single thinking framework to any problem. Direct lens access without orchestration.
---

# Consider

Apply ONE specific thinking framework agent to a problem, output, or decision. No orchestrator, no multi-framework synthesis — just a single focused lens.

## Arguments

- **FRAMEWORK** (required): Name of the framework agent to apply
- **SUBJECT** (optional): What to analyze — inline text or `@file_path`

## Available Frameworks

### Exploration
- `six-thinking-hats` — 6-perspective evaluation (Facts, Intuition, Caution, Benefits, Creativity, Process)

### Deconstruction
- `first-principles` — Break down to fundamental truths, question assumptions
- `five-whys` — Drill to root cause through iterative "Why?"

### Strategy
- `inversion` — What would guarantee failure?
- `occams-razor` — Simplest approach that fits all facts
- `one-thing` — Single highest-leverage action

### Verification
- `deep-dive` — Read actual files, trace data flows
- `technical-research` — Validate implementation against established practices
- `tri-strike` — Triangulate expectations, capabilities, observations

### Refinement
- `via-negativa` — What can be removed without losing value?

### Agentic Audit
- `gap-finder` — What's missing that should be there?
- `blind-spot` — What's invisible from the current frame?
- `devils-advocate` — Prove it works or retract the claim
- `drift-detector` — Has the agent drifted from original intent?

## Workflow

### Step 1: Resolve Framework

Match FRAMEWORK argument to an agent file in .claude/agents/:
- Exact match: use directly (e.g., "inversion" → inversion.md)
- Partial match: suggest closest (e.g., "devil" → devils-advocate.md)
- No match: list all 14 available frameworks and ask user to choose

### Step 2: Parse Subject

If SUBJECT is a file path: read the file.
If SUBJECT is inline text: use directly.
If no SUBJECT: ask "What would you like to analyze with [framework]?"

### Step 3: Dispatch Single Agent

Launch the matched agent with:
- CONTEXT: conversation context
- SUBJECT: the parsed subject
- INPUT_FILES: any files the user referenced

### Step 4: Present Results

Show the agent's full output without modification:
- Findings structured per the framework's output format
- VERDICT (PASS/FAIL)
- Evidence citations
- Recommendations

### Step 5: Suggest Follow-up

Based on the verdict:
- If PASS: "Framework confirms. Want another lens? `/consider [different-framework]`"
- If FAIL: suggest the most relevant next framework. Examples:
  - Inversion FAIL → suggest `/consider first-principles` to validate fundamentals
  - Gap Finder FAIL → suggest `/consider deep-dive` to investigate the gaps
  - Drift Detector FAIL → suggest `/validate` to reassess the whole approach

## Usage Examples

```
/consider inversion "Our plan to migrate the database over the weekend"

/consider devils-advocate @src/auth/middleware.ts

/consider gap-finder "The API we just built"

/consider drift-detector "Original goal was CLI tool, current output is web app"

/consider five-whys "Why are 30% of our tests flaky?"

/consider  (no args — will list frameworks and ask)
```
