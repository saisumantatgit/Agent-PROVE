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

## Built-in Frameworks (14)

### Classic Thinking (9)
| Framework | Category | What It Does |
|-----------|----------|-------------|
| **First Principles** | Deconstruction | Break down to fundamental truths, question every assumption |
| **5-Whys** | Deconstruction | Drill to root cause through iterative "Why?" questioning |
| **Inversion** | Strategy | What would guarantee failure? Is the approach doing any of that? |
| **Occam's Razor** | Strategy / Refinement | Find the simplest explanation/approach that fits all facts |
| **One Thing** | Strategy | Identify the single highest-leverage action |
| **Via Negativa** | Refinement | Improve by removing — what can be cut without losing value? |
| **Deep Dive** | Verification | Thorough technical investigation — read files, trace data flows |
| **Technical Research** | Verification | Validate implementation approach against established practices |
| **Tri-Strike** | Verification | 3-directional convergence — triangulate expectations, capabilities, and observations |

### Agentic Era (5)
| Framework | What It Catches |
|-----------|----------------|
| **6 Thinking Hats** | Perspective collapse — cycles through 6 de Bono perspectives (Facts, Intuition, Caution, Benefits, Creativity, Process) |
| **Gap Finder** | Confident omission — what's missing that should be there? |
| **Blind Spot** | Frame lock — what's invisible from the current paradigm? |
| **Devil's Advocate** | Vaporware — does this actually work, or just sound like it does? |
| **Drift Detector** | Goal/reasoning/constraint drift — did the agent do what was asked? |

## Configuration

### Phase-aware defaults
```
/validate "my approach"              # Auto: Exploration + Deconstruction + Strategy (5 frameworks)
/think @output.json                  # Auto: Verification + Agentic Audit (5 frameworks)
/validate "my approach" --frameworks 14   # All 14 (thorough)
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

## Prior Art

Framework names reference well-known mental models (First Principles — Aristotle, Inversion — Munger/Stoics, 5-Whys — Toyota, Occam's Razor — 14th century, Via Negativa — Taleb, One Thing — Keller). The [`consider/` commands](https://github.com/glittercowboy/taches-cc-resources) in taches-cc-resources by Lex Christopherson apply similar models as conversational prompts — this plugin builds a different thing: structured orchestration with evidence-based accountability. See [ADR-001](docs/adr/001-framework-naming-and-prior-art.md) for the full assessment.

## License

MIT
