# ADR-003: Evidence Protocol and Verdict Design

**Status:** Accepted
**Date:** 2026-03-18
**Decision:** Zero uncited inference as a hard failure; binary PASS/FAIL at agent level; user override allowed but logged

---

## Context

The plugin's core value proposition is *evidence-based accountability*. This raises three design questions:

1. How strict should the evidence requirement be?
2. What verdict granularity should agents produce?
3. Can humans override evidence-based rejections?

## Decision

### Evidence Protocol: Zero Tolerance

A single `UNCITED_INFERENCE` violation causes `CYCLE_FAILED`. This is not a warning — it's a hard failure.

**Violation taxonomy (ordered by severity):**

| Violation | Meaning | Severity |
|-----------|---------|----------|
| `UNCITED_INFERENCE` | Factual claim with no citation | Critical — causes CYCLE_FAILED |
| `UNSUPPORTED_ABSENCE` | "Not found" without search evidence | Critical — causes CYCLE_FAILED |
| `BROKEN_CITATION` | Citation to non-existent source | Warning (Critical in `--strict` mode) |
| `UNVERIFIED_NUMBER` | Number without derivation chain | Warning (Critical in `--strict` mode) |

**Why hard failure, not warning:** Mission 1086 proved that "soft" evidence requirements erode. When UNCITED_INFERENCE is a warning, agents learn to ignore it. When it's a hard failure, every claim gets cited. The 5-Whys agent discovered 4 misclassified items specifically because the evidence requirement forced it to trace each claim to source data — a warning would have let the misclassification pass.

### Verdict Design: Binary at Agent Level

Framework agents produce **PASS** or **FAIL**. Not confidence scores. Not severity levels. Not "PASS with concerns."

**Why binary:**
- Orchestrators need clear signals to synthesize. "72% confidence" from 5 frameworks is harder to synthesize than "4 PASS, 1 FAIL."
- Nuance lives in the findings, not the verdict. A FAIL with "minor naming inconsistency" is different from a FAIL with "wrong data source" — but both are FAIL. The orchestrator classifies findings as CRITICAL/ADJUSTMENT/INFORMATIONAL during synthesis.
- Forces agents to commit. A framework that says "maybe there's an issue" is not useful. "FAIL: this specific assumption is unsupported [evidence]" is useful.

**Compound verdicts exist only at orchestrator level:**
- T1 Validator: VALIDATED / VALIDATED_WITH_ADJUSTMENTS / REJECTED
- Cycle Auditor: CYCLE_APPROVED / CYCLE_APPROVED_WITH_WARNINGS / CYCLE_FAILED / ESCALATE

### User Override: Allowed But Explicit

Users can override a REJECTED verdict. The validate-approach skill asks: "Revise your approach and re-validate, or override the rejection?"

**Why allow override:**
- Humans have domain knowledge that framework agents lack
- A regulatory expert may know that a "wrong data source" finding is actually acceptable for their jurisdiction
- Blocking humans creates adversarial dynamics — they'll stop using the tool

**Why it's explicit:**
- Override is a conscious choice, not a default
- The skill logs the override reason
- Future audits can see "this was overridden" in context

## Alternatives Considered

**Soft evidence (warnings only):** Every violation is a warning. User decides what to fix.
- Rejected: Evidence requirements erode when not enforced. Mission 1086 proved this.

**Confidence scores (0-100):** Agents return confidence instead of PASS/FAIL.
- Rejected: What does "First Principles: 73%" mean? Confidence scores for reasoning frameworks are poorly defined. Binary forces clarity.

**No override:** REJECTED is final, user must revise.
- Rejected: Creates adversarial tool. Users work around tools that block them.

**Weighted frameworks:** Some frameworks count more than others.
- Rejected: Who decides weights? Weighting is a domain-specific decision that doesn't belong in a generic plugin. All frameworks are equal; the orchestrator classifies findings by severity instead.

## Consequences

- Evidence violations are caught immediately (hard failure = fast feedback)
- Agents must commit to PASS or FAIL (no hedging)
- Orchestrators handle nuance through finding classification (CRITICAL/ADJUSTMENT/INFORMATIONAL)
- Users retain final authority but overrides are visible
- `--strict` mode exists for contexts where even warnings should fail (regulatory, security)
- Tradeoff: strict evidence may force re-audits on correct-but-poorly-cited work (accepted — better to cite properly than to skip)
