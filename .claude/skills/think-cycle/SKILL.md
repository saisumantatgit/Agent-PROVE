---
name: think-cycle
description: Apply thinking framework agents to audit a cycle's output during execution. Enforces evidence protocol and orchestrator accountability.
---

# Think Cycle

Dispatch thinking framework agents to audit the output of an execution cycle. Enforces the evidence protocol (zero uncited inference) and orchestrator accountability (verify every claim against actual data).

## Arguments

- **SUBJECT** (required): What to analyze — problem statement, cycle output, or `@file_path`
- `--frameworks N`: Number of frameworks to apply (default: 3)
- `--framework-names list`: Comma-separated framework names
- `--input-files paths`: Comma-separated file paths for evidence verification
- `--expected-count N`: Expected entry count for accountability check

## Default Frameworks

If `--framework-names` not specified, uses these 3:
1. first-principles
2. inversion
3. occams-razor

All 9 available: first-principles, inversion, five-whys, occams-razor, via-negativa, one-thing, deep-dive, technical-research, tri-strike

## Workflow

### Step 1: Parse Input

If SUBJECT is a file path:
- Read the file as CYCLE_OUTPUT
- Derive CYCLE_NAME from the filename

If SUBJECT is inline text:
- Use as both CYCLE_OUTPUT and the problem statement
- Ask for CYCLE_NAME if not obvious

If no SUBJECT provided:
- Ask: "What cycle output or problem would you like to audit?"

### Step 2: Configure

Parse arguments:
- Resolve `--frameworks` and `--framework-names` (same logic as validate-approach)
- Parse `--input-files` into list of file paths
- Parse `--expected-count` for accountability check

### Step 3: Dispatch Cycle Auditor

Launch the `cycle-auditor` agent with:
- CYCLE_NAME: from Step 1
- CYCLE_OUTPUT: the parsed subject
- CYCLE_CONTEXT: any context about what was expected
- INPUT_FILES: from `--input-files` argument
- FRAMEWORKS: configured in Step 2
- EXPECTED_COUNT: from `--expected-count` if provided

### Step 4: Present Results

Display the Cycle Audit Report:

- **CYCLE_APPROVED**: "Cycle approved. All checks pass. Evidence protocol compliant."
- **CYCLE_APPROVED_WITH_WARNINGS**: "Cycle approved with warnings." + list warnings. "These are non-critical — proceed but consider addressing."
- **CYCLE_FAILED**: "Cycle failed." + list specific issues with file:line references. "Fix these issues and re-audit."
- **ESCALATE**: "3 consecutive failures detected. Recommend stopping execution and reassessing approach. Consider running /validate on your overall approach."

### Step 5: Handle Follow-up

If CYCLE_FAILED:
- Present specific fixes needed
- After user fixes, prompt: "Re-run audit? (/think @same_file)"

If ESCALATE:
- Present full failure history
- Recommend: "Run /validate to reassess your overall approach before continuing"
- Do NOT automatically continue execution

## Usage Examples

```
/think "Is our classification of these 50 items correct?" --input-files data/output.json

/think @data/cycle3_output.json --frameworks 3 --expected-count 1086

/think "Why are 456 items unclassified?" --framework-names five-whys,first-principles

/think @results/batch2.json --input-files src/schema.json,data/source.xml --expected-count 500

/think  (no args — will prompt for subject)
```
