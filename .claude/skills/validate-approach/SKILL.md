---
name: validate-approach
description: Validate a proposed approach using multiple thinking frameworks before execution. Dispatches T1 validator with configurable frameworks.
---

# Validate Approach

Stress-test a proposed approach using multiple thinking frameworks BEFORE any execution begins. This prevents "wrong artifact type" errors and flawed assumptions from propagating through an entire project.

## Arguments

- **APPROACH** (required): The approach to validate — inline text or `@file_path` to a plan file
- `--frameworks N`: Number of frameworks to apply (default: 5)
- `--framework-names list`: Comma-separated framework names to use (overrides default selection)

## Default Frameworks

If `--framework-names` not specified, auto-selects from Exploration + Deconstruction + Strategy phases:
1. six-thinking-hats (Exploration)
2. first-principles (Deconstruction)
3. five-whys (Deconstruction)
4. inversion (Strategy)
5. occams-razor (Strategy)

All 14 available: first-principles, inversion, five-whys, occams-razor, via-negativa, one-thing, deep-dive, technical-research, tri-strike, six-thinking-hats, gap-finder, blind-spot, devils-advocate, drift-detector

## Workflow

### Step 1: Parse Input

If APPROACH is a file path (starts with `@` or ends with `.md`/`.json`):
- Read the file
- Extract the approach (numbered steps, task list, or plan content)

If APPROACH is inline text:
- Use directly as the approach to validate

If no APPROACH provided:
- Ask: "What approach would you like to validate? Paste your plan or describe your approach."

### Step 2: Gather Context

Ask the user (if not already provided):
- "What relevant files should the framework agents read? (paths, or 'none')"
- Use these as INPUT_FILES for the T1 validator

### Step 3: Configure Frameworks

Parse `--frameworks` and `--framework-names` arguments:
- If `--framework-names` provided: use exactly those frameworks
- If `--frameworks N` provided: use the first N from the default list
- Otherwise: use all 5 defaults

### Step 4: Dispatch T1 Validator

Launch the `t1-validator` agent with:
- MISSION_NAME: derived from the approach or user's project
- APPROACH: the parsed approach
- CONTEXT: any context the user provided
- INPUT_FILES: gathered in Step 2
- FRAMEWORKS: configured in Step 3

### Step 5: Present Results

Display the T1 Validation Report:
- **VALIDATED**: "Approach validated. No critical findings. Proceed with confidence."
- **VALIDATED_WITH_ADJUSTMENTS**: "Approach validated with adjustments." + list each adjustment with its source framework. Ask: "Accept these adjustments and proceed, or modify the approach?"
- **REJECTED**: "Approach rejected." + list critical findings. Ask: "Revise your approach and re-validate, or override the rejection?"

### Step 6: Handle Follow-up

If VALIDATED_WITH_ADJUSTMENTS:
- User accepts → record adjustments in session context
- User modifies → return to Step 1 with revised approach

If REJECTED:
- User revises → return to Step 1 with new approach
- User overrides → log override with reason, proceed (user's choice)

## Usage Examples

```
/validate "1. Parse all XML files 2. Extract metrics by regex 3. Classify by naming convention"

/validate @.planning/phases/02/PLAN.md --frameworks 3

/validate "My approach to migrating the database" --framework-names first-principles,inversion,technical-research

/validate  (no args — will prompt for approach)
```
