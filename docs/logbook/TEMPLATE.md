# Logbook Entry — [YYYY-MM-DD] — [Short Title]

<!--
  Thinking Framework Orchestrator — Development Logbook Template
  Adapted from GordonAI logbook template.

  DESIGN PRINCIPLES (preserved from GordonAI):
  - Low ceremony: fill what's useful, skip what isn't.
  - Chronological: one entry per working session or significant event.
  - Agent context preservation: future agents (and humans) read these
    to reconstruct *why* a decision was made, not just *what* changed.
  - Handoff-ready: any agent picking up the thread should be able to
    continue without re-reading the entire codebase.

  REFERENCES:
  - GordonAI Logbook Template (original source)
  - "A Guide to the Project Management Body of Knowledge" (PMBOK), PMI
  - "The Pragmatic Programmer", Hunt & Thomas — tip on engineering daybooks
  - Agile Alliance — "Information Radiators"
  - ADR methodology: Nygard, M. "Documenting Architecture Decisions"
-->

## Metadata

| Field                | Value                          |
| -------------------- | ------------------------------ |
| **Date**             | YYYY-MM-DD                     |
| **Author**           | [agent-name / human]           |
| **Plugin phase**     | [Phase N — short description]  |
| **Milestone**        | [Current milestone label]      |
| **Git tag/commit**   | [tag or short SHA, if any]     |
| **Session duration** | [approx. elapsed time]         |
| **Tokens consumed**  | [input / output, if tracked]   |

---

## Zone Check

<!--
  Quick pulse check. Fill at START of session, update at END.

  Example:
  | Dimension | Start | End | Notes |
  |-----------|-------|-----|-------|
  | Momentum | 🟢 GREEN | 🟡 AMBER | Slowed after GAI feedback review |
  | Quality | 🟢 GREEN | 🟢 GREEN | Validation passing throughout |
  | Scope | 🟢 GREEN | 🟡 AMBER | Added 4 commands not in original plan |
-->

| Dimension | Start | End | Notes |
|-----------|-------|-----|-------|
| **Momentum** | 🟢/🟡/🔴 | 🟢/🟡/🔴 | |
| **Quality** | 🟢/🟡/🔴 | 🟢/🟡/🔴 | |
| **Scope** | 🟢/🟡/🔴 | 🟢/🟡/🔴 | |

---

## When to Write a Logbook Entry

- At the end of every working session (non-negotiable)
- Mid-session if switching tracks or context is getting complex
- Before handing off to a different agent or person

---

## WIP Tracking

<!--
  What's in progress RIGHT NOW? Update as you work.
  Mark items ✅ when done, ❌ if abandoned, ⏸️ if paused.

  Example:
  | # | Item | Status | Notes |
  |---|------|--------|-------|
  | 1 | Build gap-finder agent | ✅ Done | 68 lines, follows canonical template |
  | 2 | Update phase-aware defaults | ⏸️ Paused | Waiting on agent builds to finish |
  | 3 | Add Gemini support | ❌ Deferred | Moving to next session |
-->

| # | Item | Status | Notes |
|---|------|--------|-------|
| 1 | | | |

---

## Objective

<!-- One or two sentences: what were you trying to accomplish this session? -->

---

## Context

<!--
  What state was the project in when you started?
  Link to the most recent logbook entry, AAR, or ADR if relevant.
  Mention any open questions or blockers carried forward.
-->

- Previous entry: [link or "first entry"]
- Open blockers: [none / list]
- Relevant ADR(s): [ADR-NNN if applicable]

---

## Work Performed

<!--
  Chronological list of what you actually did.
  Keep it factual — opinions go in "Observations" below.
  Reference file paths, commit SHAs, and command outputs.

  Example:
  1. **14:30** — Dispatched 8 parallel agents to build framework agents (first-principles through technical-research)
  2. **14:35** — All 8 agents returned. Verified structural compliance with validate-structure.sh
  3. **14:40** — Fixed domain leakage: grep found "EBA" reference in evidence-audit example
-->

1. **[HH:MM]** — [Action taken]
2. **[HH:MM]** — [Action taken]
3. ...

---

## Validation Results

<!--
  Record the output of structural validation and any other checks.
  This is the plugin equivalent of a test/build pass.
-->

### scripts/validate-structure.sh

```
[Paste or summarize output here]
```

- Pass / Fail: [result]
- Issues found: [none / list]

### Other checks (if any)

- [ ] Agent templates match canonical structure
- [ ] Commands register correctly
- [ ] Skills load without error
- [ ] Cross-references resolve

---

## Decisions Made

<!--
  Lightweight decisions that don't warrant a full ADR.
  For significant architectural choices, create an ADR instead and link it.
-->

| Decision | Rationale | Alternatives considered |
| -------- | --------- | ---------------------- |
|          |           |                        |

---

## Observations

<!--
  Subjective notes: what surprised you, what felt fragile,
  what you'd investigate further if you had time.

  Example:
  - Parallel dispatch of 8 agents completed in ~3 minutes — faster than expected
  - The GAI reviewer's feedback assumed LangGraph architecture — not applicable to our markdown-only plugin
  - Keep/Merge/Prune reduced 12 proposed ADRs to 4 — good discipline
-->

-

---

## Artifacts Changed

<!--
  Key files added, modified, or deleted.
  Not an exhaustive diff — just the highlights.
-->

| File / Path | Change type | Notes |
| ----------- | ----------- | ----- |
|             |             |       |

---

## Git References

<!--
  Tag any commits or tags created during this session.
  This aids traceability between logbook entries and the repo history.
-->

- Commits: [short SHA(s)]
- Tags: [tag name(s) or "none"]
- Branch: [branch name]

---

## Open Items / Carry-Forward

<!--
  What remains unfinished? What should the next session start with?
  This is the most critical section for agent handoff.
-->

- [ ] [Item 1]
- [ ] [Item 2]

---

## Handoff Notes

<!--
  If another agent or human is picking up from here, what do they
  absolutely need to know? Think: "If I lost all context except this
  section, could I continue effectively?"

  Include:
  - Current state of the plugin (what works, what doesn't)
  - Any running processes or background tasks
  - Environment assumptions (Node version, OS, etc.)
  - Which agents/commands/skills are affected by in-progress work
-->

### Current state

[Brief summary of what's working and what's not]

### Immediate next steps

1. [Step 1]
2. [Step 2]

### Gotchas

- [Anything non-obvious that could trip up the next person]

---

## Token Economics

<!--
  Optional but encouraged. Helps calibrate future session planning.
  Plugin work often involves dispatching 8-12 parallel sub-agents,
  so tracking token spend per dispatch pattern is valuable.
-->

| Metric                    | Value |
| ------------------------- | ----- |
| Input tokens              |       |
| Output tokens             |       |
| Sub-agents dispatched     |       |
| Avg tokens per sub-agent  |       |
| Wall-clock time           |       |

---

## Read Order for Next Session

<!--
  If a fresh agent picks up from here, what should they read?
  Order matters — most important first.

  Example:
  1. This logbook entry (you're reading it)
  2. CLAUDE.md (architecture and conventions)
  3. .planning/ROADMAP.md (current milestone and phases)
  4. Last AAR (lessons from previous milestone)
-->

1. [This entry]
2. [Most critical reference]
3. [Second reference]

---

<!--
  END OF TEMPLATE

  Filing convention:
    docs/logbook/YYYY-MM-DD-short-title.md

  Naming examples:
    2026-03-19-initial-orchestrator-wiring.md
    2026-03-20-evidence-protocol-enforcement.md

  REFERENCES (full list):
  - GordonAI Logbook Template (original source)
  - PMBOK Guide, 7th Edition, PMI, 2021
  - Hunt, A. & Thomas, D. "The Pragmatic Programmer", 2nd ed., 2019
  - Nygard, M. "Documenting Architecture Decisions", 2011
  - Agile Alliance, "Information Radiators" (agilealliance.org)
  - Thinking Framework Orchestrator project: docs/PRODUCT.md
-->
