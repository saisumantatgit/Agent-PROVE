# Agent-PROVE

> **Protocol for Real-time Objective Verification & Evidence**
> Thinking Framework Orchestrator for AI agent workflows — build and ship products with confidence.

A Claude Code plugin that makes AI agents *think before they act* — 14 thinking frameworks across 6 categories, phase-aware dispatch, evidence protocol enforcement, and a dedicated audit suite for catching the ways AI agents fail.

**The only thinking framework plugin built for the agentic era.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Frameworks](https://img.shields.io/badge/Frameworks-14-green.svg)](#built-in-frameworks-14)
[![Commands](https://img.shields.io/badge/Commands-7-orange.svg)](#commands)
[![Platforms](https://img.shields.io/badge/Platforms-5-purple.svg)](#platform-support)

---

## The Problem

You've seen it happen: an agent charges ahead with a flawed approach, produces 500 lines of code, then you discover the foundational assumption was wrong. Hours wasted. Context burned.

Agent-PROVE fixes that. It validates approaches *before* execution, audits outputs *during* execution, and catches the 4 specific ways AI agents fail:

| Agent Failure Mode | Framework That Catches It |
|---|---|
| Skips edge cases silently | **Gap Finder** |
| Can't see outside its own frame | **Blind Spot** |
| Produces confident vaporware | **Devil's Advocate** |
| Silently changes the task | **Drift Detector** |

---

## Why Agent-PROVE?

Every top Claude Code plugin owns ONE thing:

| Plugin | What It Owns |
|--------|-------------|
| **Superpowers** (95K★) | Developer discipline — TDD, code review |
| **BMAD** (41K★) | Agile lifecycle — personas, phase gates |
| **GSD** (34K★) | Context engineering — fresh windows, wave execution |
| **Agent-PROVE** | **Structured evidence-based thinking** — prove it or it fails |

We don't enforce TDD. We don't manage sprints. We don't manage context windows. **We make agents think before they act, prove their work while they act, and catch their own blind spots after they act.**

---

## Installation

```bash
# Clone
git clone https://github.com/saisumantatgit/Agent-PROVE.git

# Install as Claude Code plugin
cp -r Agent-PROVE/ ~/.claude/plugins/agent-prove/
```

Or add to your project's `.claude/plugins/` directory for project-scoped use.

---

## Commands

**7 commands. One complete journey — from "I have a vague idea" to "ship it."**

### Before Work

```bash
/brainstorm "Should we use microservices or a monolith?"
```
Cycles through 6 perspectives (Facts, Intuition, Caution, Benefits, Creativity, Process).

```bash
/validate "1. Express.js + TypeScript 2. PostgreSQL + Prisma 3. JWT auth 4. Deploy to Railway"
```
Returns: **VALIDATED** / **VALIDATED_WITH_ADJUSTMENTS** / **REJECTED** with per-framework analysis.

### During Work

```bash
/consider inversion "Our plan to migrate the database over the weekend"
```
Apply one specific framework lens — no orchestration, just one focused question.

```bash
/think @data/output.json --expected-count 500
```
Returns: **CYCLE_APPROVED** / **CYCLE_FAILED** with evidence protocol and accountability checks.

### After Work

```bash
/audit @docs/report.md --strict
```
Returns: **COMPLIANT** / **NON_COMPLIANT** with specific violations and suggested fixes.

```bash
/review @src/auth/middleware.ts --input-files src/auth/jwt.ts,tests/auth.test.ts
```
Returns: **SHIP_READY** / **FRAMEWORK_ISSUES** / **EVIDENCE_ISSUES** — full review in one pass.

### Anytime

```bash
/frameworks
```
Lists all 14 frameworks by category with usage examples.

---

## Built-in Frameworks (14)

### Classic Thinking (9)

| Framework | Category | The Question It Asks |
|-----------|----------|---------------------|
| **First Principles** | Deconstruction | What's actually true vs. what are we assuming? |
| **5-Whys** | Deconstruction | Why is this happening? No, *really* — why? |
| **Inversion** | Strategy | What would guarantee failure? Are we doing any of that? |
| **Occam's Razor** | Strategy / Refinement | Is there a simpler way that still works? |
| **One Thing** | Strategy | If we could only do one thing, what has the most leverage? |
| **Via Negativa** | Refinement | What can we remove without losing value? |
| **Deep Dive** | Verification | What do the actual files say? (Not what we assume.) |
| **Technical Research** | Verification | Is the implementation approach sound against established practices? |
| **Tri-Strike** | Verification | Do expectations, capabilities, and observations all agree? |

### Agentic Era (5)

Purpose-built for auditing AI-generated work.

| Framework | What It Catches |
|-----------|----------------|
| **6 Thinking Hats** | Perspective collapse — cycles through 6 de Bono perspectives |
| **Gap Finder** | Confident omission — what's missing that should be there? |
| **Blind Spot** | Frame lock — what's invisible from the current paradigm? |
| **Devil's Advocate** | Vaporware — does this actually work, or just sound like it does? |
| **Drift Detector** | Goal/reasoning/constraint drift — did the agent do what was asked? |

---

## Phase-Aware Defaults

The right frameworks fire at the right time. You don't pick — the phase picks for you.

| Command | Phase | Default Frameworks |
|---------|-------|--------------------|
| `/validate` | Exploration + Deconstruction + Strategy | six-thinking-hats, first-principles, five-whys, inversion, occams-razor |
| `/think` | Verification + Agentic Audit | deep-dive, tri-strike, gap-finder, devils-advocate, drift-detector |
| `/review` | Verification + Agentic Audit + Evidence | Same as /think + evidence protocol |

Override anytime:
```bash
/validate "my approach" --frameworks 14              # All 14 (thorough)
/think "problem" --framework-names inversion,five-whys   # Specific lenses
/consider devils-advocate @src/auth.ts               # Single framework
```

---

## How It Works

```
User → Command (/validate, /think, /consider, /brainstorm, /audit, /review, /frameworks)
         ↓
     Skill (workflow logic — parse input, configure, dispatch)
         ↓
     Orchestrator Agent (T1 Validator or Cycle Auditor)
         ↓
     Framework Agents (dispatched in parallel, independent)
         ↓
     Synthesized Verdict + Risk Register + Evidence Check
```

**Four layers. Pure markdown. Zero dependencies.** The entire plugin is structured prompts — no compiled code, no npm install. Install by copying a folder. Extend by dropping a markdown file.

---

## Evidence Protocol

The hardest line in the system: **every claim must cite a source.**

| Claim Type | Required Citation |
|-----------|------------------|
| Factual claim | `[source: file_path:line]` |
| Number/statistic | `[derived: computation or source]` |
| "Not found" | `[searched: list of paths checked]` |
| Uncited claim | Flagged as `UNCITED_INFERENCE` — **hard failure** |

A single uncited inference fails the audit. Not a warning. A failure.

---

## Verdict Taxonomy

| Context | Verdicts |
|---------|----------|
| **T1 Validation** (`/validate`) | VALIDATED · VALIDATED_WITH_ADJUSTMENTS · REJECTED |
| **Cycle Audit** (`/think`) | CYCLE_APPROVED · CYCLE_APPROVED_WITH_WARNINGS · CYCLE_FAILED · ESCALATE |
| **Evidence Audit** (`/audit`) | COMPLIANT · NON_COMPLIANT |
| **Full Review** (`/review`) | SHIP_READY · SHIP_WITH_WARNINGS · FRAMEWORK_ISSUES · EVIDENCE_ISSUES · STOP |

---

## Custom Frameworks

Add your own framework in 3 steps:

1. **Create** `.claude/agents/your-framework.md` following the [agent template](CONTRIBUTING.md)
2. **Validate** with `bash scripts/validate-structure.sh`
3. **Use** immediately via `/consider your-framework "problem"`

No registration. No config changes. The file IS the registration.

---

## Platform Support

| Platform | Config | Notes |
|----------|--------|-------|
| Claude Code | `.claude-plugin/plugin.json` | Full support (parallel dispatch) |
| Cursor | `.cursor-plugin/plugin.json` | Full support |
| Codex | `.codex/plugin.json` | Full support |
| OpenCode | `.opencode/plugin.json` | Full support |
| Gemini CLI | `gemini-extension.json` + `GEMINI.md` | Sequential fallback for orchestration |

---

## Architecture Decisions

| ADR | Decision |
|-----|----------|
| [001](docs/adr/001-framework-naming-and-prior-art.md) | Public-domain framework names with attribution |
| [002](docs/adr/002-four-layer-architecture.md) | Four-layer architecture with parallel dispatch |
| [003](docs/adr/003-evidence-protocol-and-verdict-design.md) | Zero uncited inference as hard failure |
| [004](docs/adr/004-agent-communication-protocol.md) | 6-section agent contract for composability |
| [005](docs/adr/005-command-journey-and-phase-aware-defaults.md) | 7 commands with phase-aware defaults |

---

## Origin

Extracted from the Mission 1086 methodology — a project that classified 1,086 regulatory data points across 3,582 taxonomy files with **zero uncited inference**. The T1 validator caught the critical error before execution began. Per-cycle agents found 32 retired metrics, 4 misclassifications, and recommended structural simplifications during execution.

The methodology is domain-agnostic. The rigour is universal.

## Prior Art

Framework names reference well-known mental models (First Principles — Aristotle, Inversion — Munger/Stoics, 5-Whys — Toyota, Occam's Razor — 14th century, Via Negativa — Taleb, One Thing — Keller). The [`consider/` commands](https://github.com/glittercowboy/taches-cc-resources) in taches-cc-resources by Lex Christopherson apply similar models as conversational prompts — Agent-PROVE builds a different thing: structured orchestration with evidence-based accountability. See [ADR-001](docs/adr/001-framework-naming-and-prior-art.md) for the full assessment.

---

## Part of the Agent Suite

Agent-PROVE is one of six products in the Agent Suite for AI agent governance:

| Product | Tagline | Purpose |
|---------|---------|---------|
| **Agent-PROVE** | **"Prove it or it fails."** | **Thinking validation — structured reasoning frameworks** |
| [Agent-Trace](https://github.com/saisumantatgit/Agent-Trace) | "See the ripple effect before it happens." | Blast radius mapping — impact analysis before changes |
| [Agent-Scribe](https://github.com/saisumantatgit/Agent-Scribe) | "Nothing is lost." | Session governance — capture decisions and context |
| [Agent-Cite](https://github.com/saisumantatgit/Agent-Cite) | "Cite it or it's opinion." | Evidence enforcement — require citations for claims |
| [Agent-Drift](https://github.com/saisumantatgit/Agent-Drift) | "Not on my watch." | Drift detection — catch when agents deviate from instructions |
| [Agent-Litmus](https://github.com/saisumantatgit/Agent-Litmus) | "The test your tests have to pass." | Test quality governance — are tests protecting code? |

---

## License

[MIT](LICENSE)
