# Thinking Framework Orchestrator

A Claude Code plugin that validates approaches before execution, audits outputs during execution, and enforces evidence-based accountability — using multiple independent thinking frameworks.

## What It Does

- **Pre-execution validation** — Stress-test your approach with 5+ thinking frameworks before writing a line of code
- **Per-cycle auditing** — Audit each cycle's output with framework agents + evidence protocol enforcement
- **Evidence compliance** — Verify that every claim cites a source, every number has a derivation, zero uncited inference

## Installation

**Local path:**
```bash
# Clone or copy to your plugins directory
cp -r thinking-framework-orchestrator/ ~/.claude/plugins/thinking-framework-orchestrator/
```

**Or add to your project's `.claude/plugins/` directory for project-scoped use.**

## Quick Start

### Validate an approach before execution
```
/validate "1. Parse all config files 2. Extract settings by regex 3. Migrate to new schema"
```
Returns: VALIDATED / VALIDATED_WITH_ADJUSTMENTS / REJECTED with per-framework analysis.

### Audit a cycle's output
```
/think @data/output.json --frameworks 3 --expected-count 500
```
Returns: CYCLE_APPROVED / CYCLE_FAILED with evidence protocol and accountability checks.

### Check evidence compliance
```
/audit @docs/report.md --strict
```
Returns: COMPLIANT / NON_COMPLIANT with specific violations and suggested fixes.

## Built-in Frameworks

| Framework | What It Does |
|-----------|-------------|
| **First Principles** | Break down to fundamental truths, question every assumption |
| **Inversion** | What would guarantee failure? Is the approach doing any of that? |
| **5-Whys** | Drill to root cause through iterative "Why?" questioning |
| **Occam's Razor** | Find the simplest explanation/approach that fits all facts |
| **Via Negativa** | Improve by removing — what can be cut without losing value? |
| **One Thing** | Identify the single highest-leverage action |
| **Deep Dive** | Thorough technical investigation — read files, trace data flows |
| **Technical Research** | Validate implementation approach against established practices |
| **Tri-Strike** | 3-directional convergence — triangulate expectations, capabilities, and observations |

## Configuration

### Framework count
```
/validate "my approach" --frameworks 3      # Use 3 frameworks (faster)
/validate "my approach" --frameworks 9      # Use all 9 (thorough)
```

### Specific frameworks
```
/think "problem" --framework-names first-principles,inversion,five-whys
```

### Custom frameworks
Drop a `.md` file in `.claude/agents/` following the pattern in any built-in framework. Your custom framework will be available by filename (without `.md`).

## How It Works

```
User → /validate or /think or /audit
         ↓
     Command (entry point)
         ↓
     Skill (workflow logic)
         ↓
     Orchestrator Agent (T1 Validator or Cycle Auditor)
         ↓
     Framework Agents (parallel, independent)
         ↓
     Synthesized Verdict + Risk Register
```

## Verdict Taxonomy

### T1 Validation (/validate)
| Verdict | Meaning |
|---------|---------|
| **VALIDATED** | All frameworks pass, no critical findings — proceed |
| **VALIDATED_WITH_ADJUSTMENTS** | No critical issues, but improvements recommended |
| **REJECTED** | Critical finding found — revise approach before proceeding |

### Cycle Audit (/think)
| Verdict | Meaning |
|---------|---------|
| **CYCLE_APPROVED** | All checks pass, evidence compliant |
| **CYCLE_APPROVED_WITH_WARNINGS** | Pass with non-critical warnings |
| **CYCLE_FAILED** | Evidence violation or critical failure — fix and re-audit |
| **ESCALATE** | 3 consecutive failures — stop and reassess |

### Evidence Audit (/audit)
| Verdict | Meaning |
|---------|---------|
| **COMPLIANT** | All claims cited, all numbers derived |
| **NON_COMPLIANT** | Uncited inferences found — fix and re-audit |

## Evidence Protocol

The core principle: **every claim must cite a source.**

- Factual claims → `[source: file_path:line]`
- Numbers → `[derived: computation or source]`
- "Not found" → `[searched: list of paths checked]`
- Uncited claims → flagged as `UNCITED_INFERENCE`

## Origin

This plugin extracts the methodology developed during Mission 1086 — a project that classified 1,086 regulatory data points with zero uncited inference. The thinking framework approach caught critical errors before execution (wrong data source type) and during execution (misclassified items, retired entries). The methodology is domain-agnostic and works for any project requiring rigorous, evidence-based execution.

## License

MIT
