# After-Action Review — AAR-NNN — [Short Title]

<!--
  Thinking Framework Orchestrator — After-Action Review Template
  Adapted from GordonAI AAR template.

  Numbering: AAR-NNN, sequential (AAR-001, AAR-002, ...).

  DESIGN PRINCIPLES (preserved from GordonAI):
  - US Army AAR methodology: structured reflection immediately after
    a significant event, milestone, or phase completion.
  - Blameless: focus on process and system, not individuals.
  - Variance analysis: compare planned vs. actual outcomes.
  - Token economics: track cost to inform future planning.
  - Lessons learned are categorized: Sustain / Improve / Stop.

  REFERENCES:
  - GordonAI AAR Template (original source)
  - US Army, "A Leader's Guide to After-Action Reviews", TC 25-20, 1993
  - US Army, "The After Action Review: A Tool for Continuous Improvement",
    Center for Army Lessons Learned (CALL)
  - Garvin, D. "Learning in Action", Harvard Business School Press, 2000
  - Nygard, M. "Documenting Architecture Decisions", 2011
  - Hollnagel, E. "Safety-II in Practice", Routledge, 2017
-->

## Metadata

| Field                | Value                                  |
| -------------------- | -------------------------------------- |
| **AAR ID**           | AAR-NNN                                |
| **Date**             | YYYY-MM-DD                             |
| **Author**           | [agent-name / human]                   |
| **Plugin milestone** | [Milestone label]                      |
| **Phase**            | [Phase N — short description]          |
| **Period covered**   | YYYY-MM-DD to YYYY-MM-DD              |
| **Participants**     | [agents / humans involved]             |
| **Git range**        | [start-SHA..end-SHA or tag range]      |

## Zone Check

<!--
  Quick RAG status. Fill this BEFORE writing the rest of the AAR.
  Forces honest assessment upfront.
-->

| Dimension | Status | Notes |
|-----------|--------|-------|
| **Delivery** | 🟢 GREEN / 🟡 AMBER / 🔴 RED | [On track / delayed / blocked] |
| **Quality** | 🟢 GREEN / 🟡 AMBER / 🔴 RED | [Validation passing / warnings / failures] |
| **Scope** | 🟢 GREEN / 🟡 AMBER / 🔴 RED | [As planned / minor drift / major drift] |

---

## When to Write an AAR

- After completing a plugin milestone (v1.x.0 tag)
- After a significant phase gate (new category of agents, new command set)
- After a session with 20+ sub-agent dispatches
- After any event where the plan significantly diverged from reality
- After incorporating major external feedback

---

## 1. Purpose

<!--
  One paragraph: what milestone, phase gate, or significant event
  triggered this AAR? What scope does it cover?

  Example: "This AAR covers the v1.1.0 milestone — adding 5 agentic
  audit frameworks and phase-aware defaults to the Thinking Framework
  Orchestrator plugin."
-->

---

## 2. What Was Planned (Intent)

<!--
  Describe what was supposed to happen. Reference the milestone plan,
  ADR, or roadmap item. Be specific about deliverables and timelines.
-->

### 2.1 Planned Deliverables

<!--
  Example row:
  | 1 | 5 new framework agents (gap-finder, blind-spot, etc.) | 2026-03-18 | .planning/ROADMAP.md Phase 9 |
-->

| # | Deliverable                  | Target date | Source reference    |
|---|------------------------------|-------------|---------------------|
| 1 |                              |             |                     |
| 2 |                              |             |                     |

### 2.2 Success Criteria

- [ ] [Criterion 1]
- [ ] [Criterion 2]

### 2.3 Planned Token Budget

| Metric                    | Planned |
| ------------------------- | ------- |
| Total input tokens        |         |
| Total output tokens       |         |
| Sub-agent dispatches      |         |
| Framework agent tokens    |         |

---

## 3. What Actually Happened (Outcome)

<!--
  Factual account of what occurred. Chronological where possible.
  Reference logbook entries, commits, and validation outputs.
-->

### 3.1 Actual Deliverables

| # | Deliverable                  | Actual date | Status              |
|---|------------------------------|-------------|---------------------|
| 1 |                              |             | Done / Partial / No |
| 2 |                              |             | Done / Partial / No |

### 3.2 Success Criteria Results

- [ ] [Criterion 1] — Met / Not met / Partial — [brief explanation]
- [ ] [Criterion 2] — Met / Not met / Partial — [brief explanation]

### 3.3 Actual Token Spend

| Metric                    | Planned | Actual | Variance |
| ------------------------- | ------- | ------ | -------- |
| Total input tokens        |         |        |          |
| Total output tokens       |         |        |          |
| Sub-agent dispatches      |         |        |          |
| Framework agent tokens    |         |        |          |

---

## 4. Variance Analysis

<!--
  Where did reality diverge from the plan? Why?
  This is the core analytical section of the AAR.
-->

### 4.1 Positive Variances (better than expected)

<!--
  Example row:
  | Parallel dispatch 8 agents completed in 2min vs 15min sequential | Independent agent architecture | Yes — any N-independent-agent task |
-->

| Variance | Root cause | Reproducible? |
| -------- | ---------- | ------------- |
|          |            |               |

### 4.2 Negative Variances (worse than expected)

| Variance | Root cause | Preventable? |
| -------- | ---------- | ------------ |
|          |            |              |

### 4.3 Unplanned Work

<!--
  Work that wasn't in the original plan but had to be done.
  Common in plugin development: unexpected agent interactions,
  orchestrator edge cases, marketplace compatibility fixes.
-->

| Item | Trigger | Tokens spent | Was it foreseeable? |
| ---- | ------- | ------------ | ------------------- |
|      |         |              |                     |

---

## 5. Structural Validation

<!--
  Plugin equivalent of a TEVV audit.
  Did the structural validation scripts catch issues?
  Did agent templates remain compliant throughout the milestone?
-->

### 5.1 Validation Script Results (scripts/validate-structure.sh)

```
[Paste or summarize final validation output]
```

- Total checks: [N]
- Passed: [N]
- Failed: [N]
- Warnings: [N]

### 5.2 Agent Template Compliance

<!--
  Do new or modified agents match the canonical structure?
  Canonical structure includes: purpose, constraints, evidence protocol,
  output format, and cross-references.
-->

| Agent                      | Compliant? | Deviations noted         |
| -------------------------- | ---------- | ------------------------ |
| [agent-name]               | Yes / No   | [details if No]          |

### 5.3 Framework Agent Token Profile

<!--
  Track token counts for framework agent templates.
  Helps detect bloat and maintain lean agent definitions.
-->

| Agent                      | Token count | Change from baseline |
| -------------------------- | ----------- | -------------------- |
| [agent-name]               |             | +N / -N / unchanged  |

### 5.4 Marketplace Compatibility

<!--
  Were any changes made that affect plugin packaging, installation,
  or compatibility with Claude Code marketplace requirements?
-->

- Compatible: Yes / No / Not tested
- Issues: [none / list]

---

## 6. Lessons Learned

<!--
  US Army AAR convention: categorize every lesson.
  - SUSTAIN: things that worked well — keep doing them.
  - IMPROVE: things that partially worked — refine the approach.
  - STOP: things that actively hurt — cease immediately.
-->

### 6.1 Sustain (keep doing)

| # | Lesson | Evidence |
|---|--------|----------|
| 1 |        |          |

### 6.2 Improve (refine)

| # | Lesson | Proposed change |
|---|--------|-----------------|
| 1 |        |                 |

### 6.3 Stop (cease)

| # | Lesson | Reason |
|---|--------|--------|
| 1 |        |        |

---

## 7. Action Items

<!--
  Concrete, assignable actions arising from this AAR.
  Each item should be tracked to closure.
-->

| # | Action | Priority | Owner | Due date | Status |
|---|--------|----------|-------|----------|--------|
| 1 |        | P0/P1/P2 |       |          | Open   |

---

## 8. Competitive Context

<!--
  Optional. Note any observations relevant to competitive positioning
  against Superpowers (95K stars), BMAD (41K stars), GSD (34K stars),
  or other plugin frameworks discovered during the milestone.
-->

- Differentiators validated: [list]
- Gaps identified: [list]

---

## 9. References

<!--
  Link to logbook entries, ADRs, research docs, and external sources
  consulted during this milestone.
-->

- Logbook entries: [links]
- ADRs: [ADR-NNN links]
- Research docs: [docs/research/... links]
- External: [URLs or citations]

## 10. Handoff to Next Milestone

<!--
  Light handoff: what does the next AAR's author need to know?
  Not a full session handoff — just the strategic thread.
-->

- Next milestone: [v1.x.0 — what it targets]
- Carry-forward risks: [from Section 4.2]
- Unresolved action items: [from Section 7]

## 11. Read Order for Next Session

<!--
  If someone is picking up this project, what should they read first?
  Ordered from most to least important.
-->

1. [Most critical file/doc]
2. [Second most critical]
3. [Third]

---

<!--
  END OF TEMPLATE

  Filing convention:
    docs/aar/AAR-NNN-short-title.md

  Naming examples:
    AAR-001-phase1-orchestrator-bootstrap.md
    AAR-002-evidence-protocol-hardening.md

  REFERENCES (full list):
  - GordonAI AAR Template (original source)
  - US Army, TC 25-20, "A Leader's Guide to After-Action Reviews", 1993
  - US Army, Center for Army Lessons Learned (CALL)
  - Garvin, D. "Learning in Action", HBS Press, 2000
  - Nygard, M. "Documenting Architecture Decisions", 2011
  - Hollnagel, E. "Safety-II in Practice", Routledge, 2017
  - Thinking Framework Orchestrator project: docs/PRODUCT.md
-->
