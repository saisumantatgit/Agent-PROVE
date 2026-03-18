---
name: review
description: Comprehensive end-of-work review combining framework analysis (Verification + Agentic Audit) with evidence protocol compliance in one pass.
---

# Review

Full end-of-work review. Combines the `think-cycle` skill (framework analysis) with the `evidence-audit` skill (evidence compliance) into a single comprehensive pass. Use when you're done building and want to review everything before shipping.

## Arguments

- **TARGET** (required): What to review — file path, inline description, or `@file_path`
- `--input-files paths`: Comma-separated file paths for evidence verification
- `--expected-count N`: Expected entry count for accountability check
- `--strict`: Fail on any evidence warning (not just violations)

## Workflow

### Step 1: Parse Input

If TARGET is a file path: read the file as the review subject.
If TARGET is inline text: use as description of work to review.
If no TARGET: ask "What would you like to review?"

### Step 2: Think Pass (Framework Analysis)

Dispatch the `cycle-auditor` agent with Verification + Agentic Audit frameworks:
1. deep-dive (Verification)
2. tri-strike (Verification)
3. gap-finder (Agentic Audit)
4. devils-advocate (Agentic Audit)
5. drift-detector (Agentic Audit)

Collect: CYCLE_APPROVED / CYCLE_APPROVED_WITH_WARNINGS / CYCLE_FAILED / ESCALATE

### Step 3: Audit Pass (Evidence Compliance)

Run evidence protocol scan on the TARGET:
- Factual claims → check citations
- Numbers → check derivations
- Absence claims → check search evidence

If `--strict`: any warning = NON_COMPLIANT.
If `--source-dir` implied from `--input-files`: verify citations exist.

Collect: COMPLIANT / NON_COMPLIANT

### Step 4: Combined Verdict

| Think Pass | Audit Pass | Combined Verdict |
|------------|------------|-----------------|
| CYCLE_APPROVED | COMPLIANT | **SHIP_READY** — all clear |
| CYCLE_APPROVED_WITH_WARNINGS | COMPLIANT | **SHIP_WITH_WARNINGS** — minor issues noted |
| CYCLE_FAILED | COMPLIANT | **FRAMEWORK_ISSUES** — evidence clean but framework findings need fixing |
| Any | NON_COMPLIANT | **EVIDENCE_ISSUES** — fix citations first |
| ESCALATE | Any | **STOP** — reassess approach |

### Step 5: Present Combined Report

```
## Review Report: [TARGET]

### Combined Verdict: SHIP_READY / SHIP_WITH_WARNINGS / FRAMEWORK_ISSUES / EVIDENCE_ISSUES / STOP

### Think Pass: [verdict]
[Framework results table]
[Issues if any]

### Audit Pass: [verdict]
[Evidence compliance table]
[Violations if any]

### Next Steps
[Based on combined verdict]
```

## Usage Examples

```
/review @src/auth/middleware.ts --input-files src/auth/jwt.ts,tests/auth.test.ts

/review @data/output.json --expected-count 500 --strict

/review "The API endpoints we just built" --input-files src/routes/

/review  (no args — will prompt)
```
