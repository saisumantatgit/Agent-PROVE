# ADR-001: Framework Naming and Prior Art Assessment

**Status:** Accepted
**Date:** 2026-03-18
**Decision:** Use standard mental model names for framework agents; add attribution note in README

---

## Context

The Thinking Framework Orchestrator uses named thinking frameworks (first-principles, inversion, five-whys, occams-razor, via-negativa, one-thing, deep-dive, technical-research) as agent identifiers. The Claude Code plugin [taches-cc-resources](https://github.com/glittercowboy/taches-cc-resources) by Lex Christopherson (MIT license, 1,607 stars) includes `commands/consider/` and `commands/research/` slash commands with overlapping names.

This ADR records the prior art assessment and the decision on naming, attribution, and differentiation.

---

## Prior Art: taches-cc-resources

**Repository:** https://github.com/glittercowboy/taches-cc-resources
**License:** MIT (permits use, modification, distribution with attribution)
**Reviewed:** 2026-03-18 (commit tree via GitHub API)

### Overlapping Names

| Our Agent | Their Command | Same Name? |
|-----------|--------------|------------|
| `first-principles.md` | `commands/consider/first-principles.md` | Yes |
| `inversion.md` | `commands/consider/inversion.md` | Yes |
| `five-whys.md` | `commands/consider/5-whys.md` | Yes |
| `occams-razor.md` | `commands/consider/occams-razor.md` | Yes |
| `via-negativa.md` | `commands/consider/via-negativa.md` | Yes |
| `one-thing.md` | `commands/consider/one-thing.md` | Yes |
| `deep-dive.md` | `commands/research/deep-dive.md` | Yes |
| `technical-research.md` | `commands/research/technical.md` | Partial |
| `tri-strike.md` | — | No (original, from iVal) |
| `cycle-auditor.md` | — | No (original) |
| `t1-validator.md` | — | No (original) |

**Their additional commands not in our plugin:** pareto, swot, eisenhower-matrix, second-order, 10-10-10, opportunity-cost, competitive, feasibility, history, landscape, open-source, options.

### Implementation Comparison

| Aspect | taches-cc-resources | Thinking Framework Orchestrator |
|--------|--------------------|---------------------------------|
| Form factor | Slash commands (~30 lines) | Full agents (~90 lines) |
| Purpose | Apply mental model to current conversation | Structured validation with evidence protocol |
| Output | Freeform markdown response | Structured VERDICT (PASS/FAIL) + evidence citations |
| Orchestration | None — standalone commands | T1 Validator dispatches N agents in parallel, synthesizes |
| Evidence protocol | None | Every claim must cite source — zero uncited inference |
| Accountability | None | Output validation, count checks, cross-referencing |
| Cycle auditing | None | Cycle auditor with escalation (3 consecutive fails → stop) |
| Architecture | Flat `commands/` folder | 4-layer: Agents → Orchestrators → Skills → Commands |

### What is original to this plugin (no equivalent in taches-cc-resources)

- T1 Validation architecture (pre-execution approach validation with parallel dispatch)
- Cycle Auditor (per-cycle audit with evidence protocol enforcement and escalation logic)
- Evidence Protocol (UNCITED_INFERENCE, BROKEN_CITATION, UNVERIFIED_NUMBER violation taxonomy)
- Orchestrator Accountability (output validation, count matching, claim cross-checking)
- Tri-Strike framework (from iVal project's Tri-Strike Audit Protocol)
- Verdict synthesis (VALIDATED / VALIDATED_WITH_ADJUSTMENTS / REJECTED taxonomy)
- The entire orchestration layer — composing independent frameworks into a validation pipeline

---

## Assessment

### The names are public-domain mental models

| Framework | Origin | Century |
|-----------|--------|---------|
| First Principles | Aristotle (*Metaphysics*) | 4th BC |
| Inversion | Stoic philosophy; popularized by Charlie Munger | ~3rd BC / 20th |
| 5-Whys | Sakichi Toyoda / Toyota Production System | 20th |
| Occam's Razor | William of Ockham | 14th |
| Via Negativa | Nassim Taleb (*Antifragile*); rooted in theology | 21st / ancient |
| One Thing | Gary Keller (*The ONE Thing*, 2013) | 21st |
| Deep Dive | Common English phrase, no specific originator | — |
| Technical Research | Generic term | — |

No individual or project owns these names. They appear in hundreds of books, courses, and tools.

### Risk level: Low (optics, not legal)

- **Legal risk:** None. MIT license explicitly permits derivative work. And our work is not derivative — it's a fundamentally different architecture using the same public-domain concept names.
- **Optics risk:** Low. Someone could note the name overlap. The response is straightforward: same mental models, completely different implementation and purpose.
- **Technical overlap:** Minimal. Their commands apply one model to a conversation. Our agents produce structured verdicts with evidence chains, orchestrated in parallel by meta-agents.

---

## Decision

**Use standard mental model names. Add a one-line attribution in README.**

Rationale:
1. Renaming Occam's Razor or First Principles would be absurd — they're established terms
2. A transparency note in README costs nothing and preempts any claim
3. The architectural differentiation speaks for itself

### README attribution line (added)

> Framework names reference well-known mental models. The [`consider/` commands](https://github.com/glittercowboy/taches-cc-resources) in taches-cc-resources by Lex Christopherson apply similar models as conversational prompts — this plugin builds a different thing: structured orchestration with evidence-based accountability.

---

## Consequences

- Plugin uses standard, recognizable framework names
- README contains transparent attribution
- Future frameworks should continue using established names where applicable
- If publishing to Claude Code marketplace, the attribution note is already in place
