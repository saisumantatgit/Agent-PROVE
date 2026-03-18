# Thinking Framework Orchestrator

**Your code is only as good as the thinking behind it.**

Most AI agents execute first and debug later. This plugin makes them *think first* — stress-testing every approach with battle-tested mental models before a single line of code is written, and auditing every output during execution with zero tolerance for uncited claims.

---

## The Problem

You've seen it happen: an agent charges ahead with a flawed approach, produces 500 lines of code, then you discover the foundational assumption was wrong. Hours wasted. Context burned. Back to square one.

Mission 1086 solved this. A project that classified 1,086 regulatory data points caught a critical "wrong data source" error *before execution began* — because a First Principles agent asked: "What IS the authoritative source? Are we sure?" That one question saved days of rework.

This plugin extracts that methodology and makes it available for *every* project.

---

## What It Does

**Three commands. One discipline.**

`/validate` — Before you build, prove your approach survives scrutiny. Five independent thinking frameworks stress-test your plan in parallel. VALIDATED, or go back to the drawing board.

`/think` — While you build, audit every cycle. Did the output match expectations? Is every claim backed by evidence? Three frameworks challenge your work, and the evidence protocol catches what they miss.

`/audit` — When you're done, verify the receipts. Every factual claim cited. Every number derived. Every "not found" backed by search evidence. Zero uncited inference. Period.

---

## Why It Works

### Pure Markdown. Zero Dependencies.

No build step. No compiled code. No npm install. The entire plugin is structured prompts — agent definitions that tell Claude *how to think*, not what to think. Install it by copying a folder. Extend it by dropping a markdown file.

**This is intentional.** The value isn't in code — it's in the *quality of the questions asked*. First Principles (Aristotle, 4th century BC) doesn't need a TypeScript wrapper.

### 14 Frameworks. 6 Categories. Phase-Aware.

Each framework is a separate agent running its own analysis. No sequential bottlenecks. No framework waiting on another. The orchestrator dispatches all of them simultaneously and synthesizes the results.

**The right frameworks fire at the right time.** `/validate` auto-selects from Exploration + Deconstruction + Strategy. `/think` auto-selects from Verification + Agentic Audit. You don't pick frameworks — the phase picks them for you.

| Category | Phase | Frameworks |
|----------|-------|-----------|
| **Exploration** | Brainstorming | 6 Thinking Hats |
| **Deconstruction** | Problem Understanding | First Principles, 5-Whys |
| **Strategy** | Approach Design | Inversion, Occam's Razor, One Thing |
| **Verification** | Implementation Validation | Deep Dive, Technical Research, Tri-Strike |
| **Refinement** | Reduction & Tightening | Via Negativa, Occam's Razor |
| **Agentic Audit** | AI Work Audit | Gap Finder, Blind Spot, Devil's Advocate, Drift Detector |

The first 9 frameworks are classic mental models — Aristotle to Taleb. The last 4 are **purpose-built for the agentic era**, because AI agents fail in ways humans don't:

| Agentic Failure Mode | Framework | The Question It Asks |
|---------------------|-----------|---------------------|
| Skips edge cases | **Gap Finder** | What did the agent not even consider? |
| Can't see outside its frame | **Blind Spot** | What is the agent incapable of seeing? |
| Produces confident nonsense | **Devil's Advocate** | Does this actually work, or is it vaporware? |
| Silently changes the task | **Drift Detector** | Did the agent do what was asked, or something else? |

Need a 15th? Write a markdown file. It's available immediately.

### Configurable Depth

Not every decision needs 9 frameworks.

- Quick sanity check: `/validate "my approach" --frameworks 3`
- Full scrutiny: `/validate "my approach" --frameworks 9`
- Specific lenses: `/think "problem" --framework-names inversion,five-whys`

Default: phase-aware selection — `/validate` pulls from Exploration + Deconstruction + Strategy. `/think` pulls from Verification + Agentic Audit. Override anytime with `--frameworks N` or `--framework-names`.

### Escalation That Stops Bad Work Early

The cycle auditor tracks consecutive failures. First failure: fix and retry. Second failure: fix and retry. Third failure: **full stop**. The system escalates, presents the failure pattern, and recommends reassessing the entire approach.

Three strikes and you're out — because the fourth retry of a flawed approach never works.

### Evidence Protocol: The Hardest Line in the System

Every claim cites a source. Every number has a derivation. Every "we didn't find X" proves it searched.

This isn't optional. A single uncited inference fails the audit. Not a warning. Not a suggestion. A failure.

**Why this extreme?** Because "I think this is correct" is how bugs ship. "This is correct because `config.json:L42` shows `max_retries: 3`" is how confidence ships.

---

## Who It's For

- **Solo developers using AI agents** who want structured thinking before execution, not just after
- **Technical leads** who want evidence trails on agent-generated work
- **Anyone burned by the "agent charged ahead with wrong assumptions" problem**

---

## Built on Battle-Tested Methodology

This isn't theoretical. The thinking framework orchestration pattern was developed and validated during Mission 1086 — a project that classified 1,086 regulatory data points across 3,582 taxonomy files with **zero uncited inference**. The T1 validator caught the critical error before execution began. Per-cycle framework agents found 32 retired metrics, 4 misclassifications, and recommended structural simplifications during execution.

The methodology is domain-agnostic. The rigour is universal.

---

## Where This Fits

Every top Claude Code plugin owns ONE thing:

| Plugin | What It Owns | Stars |
|--------|-------------|-------|
| Superpowers | Developer discipline (TDD, code review, worktrees) | 95K |
| BMAD | Full agile lifecycle (personas, phase gates) | 41K |
| GSD | Context engineering (fresh windows, wave execution) | 34K |
| claude-mem | Persistent cross-session memory | 38K |
| **This plugin** | **Structured, evidence-based thinking** | — |

We don't enforce TDD — Superpowers does that. We don't manage sprints — BMAD does that. We don't manage context windows — GSD does that. We don't persist memory — claude-mem does that.

**We make agents think before they act, prove their work while they act, and catch their own blind spots after they act.** Nobody else does this.

### What We Deliberately Don't Build

| Not Building | Why |
|---|---|
| Python/TypeScript execution layer | Top plugins (Superpowers, BMAD, GSD) are primarily markdown. Validated by the ecosystem. |
| Persistent state/memory | claude-mem exists. Don't reinvent. |
| Community marketplace | Earned at scale (Superpowers at 95K★). Premature for v1. |
| Full agile methodology | BMAD owns this space. We think, we don't manage sprints. |
| Context window management | GSD owns this space. We validate thinking, we don't manage tokens. |

These aren't gaps — they're borders. Knowing what you're *not* is how you stay sharp at what you *are*.

---

*MIT License. [Prior art acknowledged.](docs/adr/001-framework-naming-and-prior-art.md) | [Competitive landscape.](docs/research/001-competitive-landscape-and-gap-analysis.md)*
