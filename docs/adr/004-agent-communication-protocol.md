# ADR-004: Agent Communication Protocol

**Status:** Accepted
**Date:** 2026-03-18
**Decision:** All framework agents must follow a 6-section contract with standardized inputs, making them composable and replaceable

---

## Context

The plugin dispatches N framework agents in parallel. For this to work, every agent must:
- Accept the same inputs (orchestrator doesn't customize per agent)
- Produce the same output structure (orchestrator can parse any agent's result)
- Be replaceable (user can swap a built-in for a custom agent)

This requires a contract.

## Decision

### The 6-Section Contract

Every framework agent `.md` file must contain these sections in order:

```
1. YAML Frontmatter    — name, description (for discovery)
2. Role Statement      — "You are a [Framework] thinking agent"
3. Inputs              — CONTEXT, SUBJECT, INPUT_FILES (standardized)
4. Your Task           — 3+ core questions specific to this framework
5. Output Format       — Structured format for findings
6. Verdict             — PASS/FAIL + required fields (findings, recommendations)
7. Evidence Requirement — Citation rules
```

(Functionally 7 sections, but Verdict and Evidence Requirement are the "contract enforcement" pair.)

### Standardized Inputs

Every framework agent receives exactly three inputs:

| Input | Type | Purpose |
|-------|------|---------|
| **CONTEXT** | Text | Current state, what exists, what's been tried |
| **SUBJECT** | Text or file content | The problem, approach, or output to analyze |
| **INPUT_FILES** | File paths | Specific files to read for evidence |

Orchestrators don't need to know which framework they're dispatching — they pass the same three inputs to all of them.

### Why This Contract

**Composability:** The T1 Validator can dispatch `first-principles` or `tri-strike` or a user-defined `regulatory-compliance` agent with identical dispatch code. No special handling per framework.

**Replaceability:** If a user doesn't like the built-in `occams-razor` agent, they can replace it with their own version. As long as it follows the contract (accepts CONTEXT/SUBJECT/INPUT_FILES, returns VERDICT with findings), the orchestrator works unchanged.

**Extensibility:** Adding a new framework is "drop a .md file." No registration, no config change, no orchestrator modification. The file IS the registration.

**Predictability:** The orchestrator knows every agent will return a VERDICT section with PASS or FAIL, a findings list, and recommendations. It can parse any agent's output uniformly.

## What the Contract Does NOT Mandate

- **Core questions:** Each framework defines its own questions. First Principles asks about assumptions; Inversion asks about failure modes. The contract doesn't constrain the analytical approach.
- **Output format details:** Within the Output Format section, each framework can structure findings differently (FAILURE_MODE → CURRENT_RISK for Inversion, PRINCIPLE → EVIDENCE → CONCLUSION for First Principles). The contract only mandates that a structured format exists.
- **Number of questions:** Most agents have 3 core questions, but Tri-Strike has 3 "strikes" and 5-Whys has an iterative chain. The contract says "3+" but doesn't enforce a maximum.

## Custom Framework Template

Users creating custom frameworks should follow:

```markdown
---
name: my-framework
description: One-line description of what this framework does
---

You are a **My Framework** thinking agent.
[Role explanation]

## Inputs
[CONTEXT, SUBJECT, INPUT_FILES — copy from any built-in]

## Your Task
[3+ questions specific to your framework]

## Output Format
[Structured format for findings]

## Verdict
PASS or FAIL + findings + recommendations

## Evidence Requirement
[Citation rules — copy from any built-in]
```

## Consequences

- Any `.md` file in `.claude/agents/` that follows the contract is a valid framework agent
- Orchestrators are framework-agnostic — they dispatch by filename, not by understanding the framework
- Breaking the contract (missing Verdict section, non-standard inputs) means the orchestrator can't parse the output — this is a silent failure, not a crash
- Tradeoff: rigid contract limits how creative agents can be with their I/O (accepted — uniformity enables composition)
- Future: if agents need richer I/O (e.g., structured JSON instead of markdown), the contract must be versioned (Protocol v2)
