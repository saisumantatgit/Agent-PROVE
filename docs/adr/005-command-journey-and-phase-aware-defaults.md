# ADR-005: Command Journey and Phase-Aware Defaults

**Status:** Accepted
**Date:** 2026-03-18
**Decision:** 7 commands mapping to the complete user journey; phase-aware framework defaults for /validate and /think

---

## Context

v1.0 shipped with 3 commands (/validate, /think, /audit). User journey analysis revealed 4 gaps:

| Gap | User Says | v1.0 Answer |
|-----|-----------|-------------|
| "I have a vague idea" | "Help me think through this" | Nothing — /validate expects a formed approach |
| "Apply just one lens" | "Apply inversion to this" | `/think --framework-names inversion "..."` (verbose) |
| "I'm done, full review" | "Review everything" | Run /think then /audit separately |
| "What's available?" | "What frameworks can I use?" | Read the README |

## Decision

### 7 Commands, No Redundancy

```
BEFORE WORK:
  /brainstorm     →  Explore possibilities (6 Thinking Hats)
  /validate       →  Stress-test approach (Exploration + Deconstruction + Strategy)

DURING WORK:
  /consider [fw]  →  Apply one specific framework lens
  /think          →  Audit cycle output (Verification + Agentic Audit)

AFTER WORK:
  /audit          →  Evidence protocol compliance
  /review         →  Full review (/think + /audit combined)

ANYTIME:
  /frameworks     →  List all 14 frameworks by category
```

### Commands Deliberately Not Built

| Skipped | Why |
|---------|-----|
| /drift | `/consider drift-detector` covers it |
| /refine | `/consider via-negativa` + `/consider occams-razor` covers it |
| /status | Not a thinking framework concern — other plugins own this |

Principle: every command must serve a **distinct user moment**. If it can be expressed as `/consider [framework]`, it doesn't need its own command.

### Phase-Aware Defaults

Instead of picking from a flat list, each orchestrated command auto-selects frameworks from the relevant phase:

**`/validate` defaults** (Exploration + Deconstruction + Strategy):
1. six-thinking-hats (Exploration)
2. first-principles (Deconstruction)
3. five-whys (Deconstruction)
4. inversion (Strategy)
5. occams-razor (Strategy)

**`/think` defaults** (Verification + Agentic Audit):
1. deep-dive (Verification)
2. tri-strike (Verification)
3. gap-finder (Agentic Audit)
4. devils-advocate (Agentic Audit)
5. drift-detector (Agentic Audit)

**`/review` defaults**: same as /think + evidence audit pass.

User can override with `--framework-names` for any combination. Phase-aware defaults are the opinionated choice; full flexibility is preserved.

## Alternatives Considered

**10+ commands (one per use case):** /drift, /refine, /simplify, /gaps, etc.
- Rejected: Redundant with `/consider [framework]`. More commands ≠ more value — it's more to remember.

**3 commands only (v1.0):** Keep /validate, /think, /audit.
- Rejected: Missing the exploration phase (/brainstorm) and the "I just want one lens" moment (/consider) were real UX gaps.

**No default frameworks (user always picks):** All commands require --framework-names.
- Rejected: Defeats the purpose of phase-aware design. The whole point is "right frameworks at right time, automatically."

## Consequences

- Users have a complete journey from ideation to shipping
- `/consider` provides escape hatch for any single-framework need (eliminates need for N shortcut commands)
- `/review` is the natural "I'm done" command (most common end-of-work action)
- `/frameworks` enables discovery without reading docs
- Phase-aware defaults mean users get opinionated, good choices by default
- 7 commands is learnable; 10+ would not be
