---
name: evidence-audit
description: Audit any output for evidence protocol compliance — every claim must cite a source, every number must have a derivation, zero uncited inference allowed.
---

# Evidence Audit

Verify that any output meets the evidence protocol: every factual claim cites a source, every number has a derivation chain, and every "not found" claim has search evidence. Zero uncited inference allowed.

## Arguments

- **TARGET** (required): File path or inline text to audit
- `--strict`: Fail on ANY warning (not just violations)
- `--source-dir path`: Directory to verify that cited sources actually exist

## Workflow

### Step 1: Read Target

If TARGET is a file path:
- Read the file
- Note the file format (JSON, markdown, plain text)

If TARGET is inline text:
- Use directly

If no TARGET provided:
- Ask: "What file or output would you like to audit for evidence compliance?"

### Step 2: Scan for Claims

Parse the TARGET and categorize every statement:

**Factual claims** — statements asserting something is true:
- Check: does it cite a source? (file_path, URL, section reference, data ID)
- If cited AND `--source-dir` provided: verify the source file exists
- Violations:
  - `UNCITED_INFERENCE` — factual claim with no citation
  - `BROKEN_CITATION` — citation to non-existent source (only if --source-dir)

**Numbers and statistics** — any quantitative value:
- Check: does it have a derivation? (formula, computation, or source reference)
- Violation:
  - `UNVERIFIED_NUMBER` — number without derivation chain

**Absence claims** — statements that something doesn't exist or wasn't found:
- Check: does it have search evidence? (what was searched, what paths were checked)
- Violation:
  - `UNSUPPORTED_ABSENCE` — "not found" without search evidence

### Step 3: Compile Report

```
## Evidence Audit Report

### Target: [file path or "inline text"]

### Overall: COMPLIANT / NON_COMPLIANT

### Summary
| Category | Total | Cited | Violations |
|----------|-------|-------|------------|
| Factual claims | X | Y | Z |
| Numbers/stats | X | Y | Z |
| Absence claims | X | Y | Z |
| **Total** | **X** | **Y** | **Z** |

### Violations (if any)
| # | Line | Type | Content | Suggested Fix |
|---|------|------|---------|---------------|
| 1 | L42 | UNCITED_INFERENCE | "The system processes 500 items" | Add: [source: path/to/config.json:L15] |
| 2 | L67 | UNVERIFIED_NUMBER | "Processing takes 3.2 seconds" | Add derivation: [derived: benchmark run on 2026-03-18] |

### Broken Citations (if --source-dir used)
| # | Line | Citation | Expected Path | Status |
|---|------|----------|---------------|--------|
| 1 | L23 | data/old.json | source-dir/data/old.json | NOT FOUND |
```

### Step 4: Determine Verdict

- **COMPLIANT**: Zero UNCITED_INFERENCE violations. (BROKEN_CITATION and UNVERIFIED_NUMBER are warnings unless --strict)
- **NON_COMPLIANT**: Any UNCITED_INFERENCE violation. Or if --strict: any violation of any type.

### Step 5: Present Results

Display the report. If NON_COMPLIANT:
- List each violation with line number and suggested fix
- "Fix these violations and re-audit: /audit @same_file"

If COMPLIANT:
- "Evidence protocol: COMPLIANT. All claims cited, all numbers derived."

## Usage Examples

```
/audit data/output.json

/audit @docs/report.md --strict

/audit @data/classification.json --source-dir data/taxonomy/

/audit "The system processes 500 records, 320 are classified as high-priority"

/audit  (no args — will prompt for target)
```
