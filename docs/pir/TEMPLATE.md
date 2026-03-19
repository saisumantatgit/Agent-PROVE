# Post-Incident Review — PIR-NNN — [Short Title]

<!--
  Thinking Framework Orchestrator — Post-Incident Review Template
  Adapted from GordonAI PIR template.

  Numbering: PIR-NNN, sequential (PIR-001, PIR-002, ...).

  DESIGN PRINCIPLES (preserved from GordonAI):
  - Blameless culture: incidents are system failures, not personal ones.
  - Timeline-first: establish facts before analysis.
  - Five Whys: drill to root cause, not proximate cause.
  - Prompt forensics: capture the exact prompts/inputs that led to failure.
  - Action items: every PIR must produce trackable improvements.
  - Token cost: quantify the cost of the incident and its remediation.

  SEVERITY LEVELS (plugin-specific):
  - P0 CRITICAL: Evidence protocol violation shipped (uncited inference
    in production agent output), domain-specific leakage in public agent
    (private framework logic exposed in a general-purpose agent).
  - P1 HIGH: Agent template broken (missing required sections),
    orchestrator dispatch failure (agents not receiving correct context),
    phase-aware defaults wrong (incorrect phase config applied).
  - P2 MEDIUM: Style inconsistency across agents, missing example in
    agent template, broken cross-reference between docs/agents.
  - P3 LOW: Minor formatting issue, non-blocking documentation gap,
    cosmetic inconsistency.

  REFERENCES:
  - GordonAI PIR Template (original source)
  - Lunney, J. et al. "Site Reliability Engineering", O'Reilly, 2016
    — Chapter 15: Postmortem Culture
  - Allspaw, J. "Blameless PostMortems and a Just Culture", Etsy, 2012
  - Dekker, S. "The Field Guide to Understanding Human Error", 3rd ed., 2014
  - Ohno, T. "Toyota Production System", 1988 — Five Whys methodology
  - Hollnagel, E. "Safety-II in Practice", Routledge, 2017
-->

## Metadata

| Field                | Value                                  |
| -------------------- | -------------------------------------- |
| **PIR ID**           | PIR-NNN                                |
| **Date**             | YYYY-MM-DD                             |
| **Author**           | [agent-name / human]                   |
| **Severity**         | P0 / P1 / P2 / P3                     |
| **Status**           | Draft / Review / Final                 |
| **Plugin milestone** | [Milestone label]                      |
| **Phase**            | [Phase N — short description]          |
| **Incident date**    | YYYY-MM-DD [HH:MM if known]           |
| **Detection date**   | YYYY-MM-DD [HH:MM if known]           |
| **Resolution date**  | YYYY-MM-DD [HH:MM if known]           |
| **Git range**        | [start-SHA..end-SHA]                   |

---

## Zone Check

<!--
  Immediate RAG assessment. Fill BEFORE detailed analysis.
-->

| Dimension | Status | Notes |
|-----------|--------|-------|
| **Severity** | 🔴 P0 / 🟠 P1 / 🟡 P2 / 🟢 P3 | [Initial assessment — may change after analysis] |
| **Containment** | 🟢 Contained / 🔴 Active | [Is the incident still happening?] |
| **Blast Radius** | [scope] | [Which agents/commands/skills/users affected? What ELSE could this break?] |

---

## When to Write a PIR

Write a PIR when any of these occur:
- Evidence protocol violation reaches a user (shipped uncited inference)
- Domain-specific content leaks into a public agent
- Agent template missing required sections (frontmatter, evidence requirement, verdict)
- Orchestrator dispatches wrong frameworks or loses context
- Phase-aware defaults produce incorrect framework selection
- Validation script fails to catch a structural issue that ships
- Any incident that erodes trust in the plugin's core differentiators

**Do NOT write a PIR for:** cosmetic issues, documentation typos, or problems caught before commit. Use the logbook for those.

---

## 1. Executive Summary

<!--
  2-4 sentences maximum. What happened, what was the impact, and
  what was the resolution? A busy reader should get the full picture
  from this section alone.
-->

---

## 2. Severity Classification

<!--
  Justify the severity rating. Reference the severity definitions above.
-->

| Factor                     | Assessment                             |
| -------------------------- | -------------------------------------- |
| **Severity**               | P0 / P1 / P2 / P3                     |
| **Scope**                  | [which agents/commands/skills affected]|
| **User impact**            | [none / degraded / broken]             |
| **Evidence protocol**      | Violated / Not violated                |
| **Data/context leakage**   | Yes / No                               |
| **Shipped to users?**      | Yes / No / N/A (pre-release)           |

### Severity Definitions (for reference)

- **P0 CRITICAL**: Evidence protocol violation shipped; domain-specific leakage in public agent.
- **P1 HIGH**: Agent template broken (missing sections); orchestrator dispatch failure; phase-aware defaults wrong.
- **P2 MEDIUM**: Style inconsistency across agents; missing example; broken cross-reference.
- **P3 LOW**: Minor formatting issue; non-blocking documentation gap.

---

## 3. Timeline

<!--
  Chronological, factual, timestamped where possible.
  This is the foundation of the entire review — get it right.
  Include: when the issue was introduced, when detected, when resolved.
-->

| Time (UTC)       | Event                                          | Actor        |
| ---------------- | ---------------------------------------------- | ------------ |
| YYYY-MM-DD HH:MM | [Event description]                           | [who/what]   |
| YYYY-MM-DD HH:MM | [Event description]                           | [who/what]   |
| YYYY-MM-DD HH:MM | **Incident detected**                         | [who/what]   |
| YYYY-MM-DD HH:MM | [Remediation step]                            | [who/what]   |
| YYYY-MM-DD HH:MM | **Incident resolved**                         | [who/what]   |

### Detection method

- [ ] Structural validation script (scripts/validate-structure.sh)
- [ ] Manual review
- [ ] User report
- [ ] Automated CI/CD check
- [ ] Sub-agent output inspection
- [ ] Other: [describe]

---

## 4. Prompt Forensics

<!--
  Capture the exact inputs, agent configurations, and dispatch
  patterns that contributed to the incident. In plugin development,
  this means: what was the orchestrator state, which agents were
  dispatched, what context did they receive?

  IMPORTANT: Redact any sensitive information. Include enough
  detail to reproduce the failure.
-->

### 4.1 Triggering Input

```
[The command, prompt, or action that triggered the incident]
```

### 4.2 Agent/Orchestrator State

| Factor                     | Value                                  |
| -------------------------- | -------------------------------------- |
| Active phase               | [Phase N]                              |
| Agents dispatched          | [list]                                 |
| Parallel dispatch count    | [N of 8-12]                            |
| Orchestrator agent         | [thinking-orchestrator / framework-orchestrator] |
| Context passed to agents   | [summary]                              |

### 4.3 Observed Output

```
[The incorrect or unexpected output]
```

### 4.4 Expected Output

```
[What should have happened instead]
```

---

## 5. Plugin Structure Analysis

<!--
  This is the plugin-specific replacement for model behavior analysis.
  Core question: did the structural validation script catch this issue?
  If yes, was the warning ignored? If no, why didn't it catch it?
-->

### 5.1 Validation Script Assessment

| Question                                              | Answer       |
| ----------------------------------------------------- | ------------ |
| Did validate-structure.sh detect this issue?           | Yes / No     |
| If yes, was the warning ignored or missed?             | [explain]    |
| If no, should a new check be added?                   | Yes / No     |
| Proposed new check (if applicable)                     | [describe]   |

### 5.2 Agent Template Analysis

<!--
  For incidents involving agent templates: does the affected agent
  match the canonical structure? What specific section or constraint
  was violated or missing?
-->

| Agent affected             | Section violated            | Canonical requirement       |
| -------------------------- | --------------------------- | --------------------------- |
| [agent-name]               | [section]                   | [what should be there]      |

### 5.3 Cross-Reference Integrity

<!--
  Did broken cross-references between agents, commands, skills,
  or documentation contribute to the incident?
-->

- Broken references found: [none / list]
- Impact on incident: [direct / indirect / none]

### 5.4 Orchestrator Dispatch Analysis

<!--
  For incidents involving the orchestrator: was the dispatch pattern
  correct? Did agents receive appropriate context?
-->

- Dispatch pattern: [correct / incorrect]
- Context propagation: [complete / partial / missing]
- Phase-aware defaults: [correct / incorrect / N/A]

---

## 6. Five Whys

<!--
  Drill to root cause. Each "Why" should be supported by evidence.
  Stop when you reach a systemic or process-level cause.
  Evidence protocol: cite specific files, commits, or outputs.
-->

1. **Why** did [the incident] happen?
   - Because [proximate cause]. *Evidence: [cite]*

2. **Why** did [proximate cause] happen?
   - Because [deeper cause]. *Evidence: [cite]*

3. **Why** did [deeper cause] happen?
   - Because [still deeper]. *Evidence: [cite]*

4. **Why** did [still deeper] happen?
   - Because [systemic cause]. *Evidence: [cite]*

5. **Why** did [systemic cause] happen?
   - Because [root cause]. *Evidence: [cite]*

### Root Cause Summary

[One sentence: the root cause of this incident was ___.]

---

## 7. Impact Assessment

### 7.1 Direct Impact

| Dimension                  | Assessment                             |
| -------------------------- | -------------------------------------- |
| Agents affected            | [count and names]                      |
| Commands affected          | [count and names]                      |
| Skills affected            | [count and names]                      |
| Users affected             | [none / count / "all"]                 |
| Duration of impact         | [time]                                 |

### 7.1.5 Blast Radius Assessment

<!--
  Beyond the direct impact — what ELSE could this incident affect?
  Think: if this agent template was wrong, what other agents reference it?
  If this evidence violation shipped, what other outputs cite the same source?

  Example:
  | Radius | Affected | How |
  |--------|----------|-----|
  | Direct | devils-advocate.md | Missing verdict section |
  | Adjacent | cycle-auditor.md | Dispatches devils-advocate; would receive malformed output |
  | Downstream | /think command | Would present incomplete audit to user |
  | Potential | /review command | Combines /think output — cascade failure |
-->

| Radius | Affected | How |
|--------|----------|-----|
| Direct | | |
| Adjacent | | |
| Downstream | | |
| Potential (if undetected) | | |

### 7.2 Token Cost of Incident

| Metric                    | Value   |
| ------------------------- | ------- |
| Tokens wasted by incident |         |
| Tokens spent on detection |         |
| Tokens spent on fix       |         |
| Tokens spent on this PIR  |         |
| **Total incident cost**   |         |

### 7.3 Competitive Impact

<!--
  Optional. Did this incident affect any competitive differentiator
  (evidence protocol, parallel dispatch, framework coverage)?
-->

- Differentiators affected: [none / list]
- Marketplace compatibility affected: Yes / No

---

## 8. Remediation

### 8.1 Immediate Fix

<!--
  What was done to stop the bleeding? Reference commits.
-->

- Fix applied: [description]
- Commit: [SHA]
- Validated by: [scripts/validate-structure.sh output or manual check]

### 8.2 Structural Safeguards

<!--
  What changes prevent this class of incident from recurring?
-->

| # | Safeguard                    | Type                  | Status     |
|---|------------------------------|-----------------------|------------|
| 1 |                              | Validation script     | Done/TODO  |
| 2 |                              | Agent template change | Done/TODO  |
| 3 |                              | Process change        | Done/TODO  |

---

## 9. Lessons Learned

### 9.1 Sustain (keep doing)

| # | Practice                     | Why it helped                          |
|---|------------------------------|----------------------------------------|
| 1 |                              |                                        |

### 9.2 Improve (refine)

| # | Practice                     | Proposed refinement                    |
|---|------------------------------|----------------------------------------|
| 1 |                              |                                        |

### 9.3 Stop (cease)

| # | Practice                     | Why it's harmful                       |
|---|------------------------------|----------------------------------------|
| 1 |                              |                                        |

---

## 10. Action Items

<!--
  Every PIR must produce at least one action item.
  Each item must be concrete, assignable, and trackable.
-->

| # | Action                       | Owner        | Due date   | Status | Blocks |
|---|------------------------------|--------------|------------|--------|--------|
| 1 |                              |              |            | Open   |        |
| 2 |                              |              |            | Open   |        |

---

## 11. Review & Sign-Off

<!--
  PIR should be reviewed by at least one person/agent who was NOT
  involved in the incident. This ensures fresh perspective.
-->

| Reviewer       | Date       | Approved? | Comments |
| -------------- | ---------- | --------- | -------- |
|                |            |           |          |

---

## 12. References

- Logbook entries: [links]
- ADRs: [ADR-NNN links]
- Related PIRs: [PIR-NNN links]
- Related AARs: [AAR-NNN links]
- Research docs: [docs/research/... links]
- External: [URLs or citations]

---

<!--
  END OF TEMPLATE

  Filing convention:
    docs/pir/PIR-NNN-short-title.md

  Naming examples:
    PIR-001-evidence-protocol-violation-first-principles.md
    PIR-002-orchestrator-dispatch-context-loss.md
    PIR-003-broken-crossref-mental-models-agent.md

  REFERENCES (full list):
  - GordonAI PIR Template (original source)
  - Lunney, J. et al. "Site Reliability Engineering", O'Reilly, 2016
    — Chapter 15: Postmortem Culture
  - Allspaw, J. "Blameless PostMortems and a Just Culture", Etsy, 2012
  - Dekker, S. "The Field Guide to Understanding Human Error", 3rd ed., 2014
  - Ohno, T. "Toyota Production System", 1988 — Five Whys methodology
  - Hollnagel, E. "Safety-II in Practice", Routledge, 2017
  - Thinking Framework Orchestrator project: docs/PRODUCT.md
-->
