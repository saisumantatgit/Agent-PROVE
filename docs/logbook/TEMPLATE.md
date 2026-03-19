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
