# ADR-002: Four-Layer Architecture with Parallel Dispatch

**Status:** Accepted
**Date:** 2026-03-18
**Decision:** Separate framework agents, orchestrators, skills, and commands into four distinct layers with parallel agent dispatch

---

## Context

The plugin needs to compose multiple independent thinking frameworks into structured validation workflows. The simplest approach would be flat slash commands (one command per framework, like taches-cc-resources `consider/`). The question is whether that's sufficient or whether a layered architecture is needed.

## Decision

Four layers, each with a clear responsibility:

```
Commands  →  thin entry points (/validate, /think, /audit)
Skills    →  workflow logic (gather input, configure, dispatch, present)
Orchestrators  →  T1 Validator, Cycle Auditor (dispatch N agents, synthesize)
Framework Agents  →  independent thinking lenses (9 built-in, user-extensible)
```

Framework agents dispatch **in parallel**, not sequentially. Each agent is independent — it receives the same inputs and returns a verdict without knowledge of other agents' outputs.

## Alternatives Considered

**Flat commands (one per framework):** Simpler. User runs `/first-principles`, gets a response. No orchestration. This is what taches-cc-resources does.

- Pro: Zero complexity
- Con: No synthesis across frameworks. No evidence enforcement. No structured verdicts. User must manually compare outputs.

**Two-layer (agents + commands):** Commands dispatch agents directly, no skill/orchestrator layer.

- Pro: Less indirection
- Con: Commands become bloated with workflow logic. No separation between "how to dispatch" (skill) and "how to synthesize" (orchestrator). Custom frameworks would need custom commands.

**Sequential chaining (agent 1 output feeds agent 2):** Frameworks build on each other's findings.

- Pro: Later frameworks can react to earlier findings
- Con: Creates dependencies between agents. Breaks composability — can't add/remove a framework without considering its position in the chain. Slower (sequential). Harder to reason about.

## Why Parallel

Each framework is a genuinely independent lens. First Principles doesn't need Inversion's output to do its job. Parallel dispatch means:

1. **Speed** — all frameworks run concurrently
2. **Independence** — adding/removing a framework doesn't affect others
3. **Composability** — orchestrator can request any subset of frameworks
4. **Fault tolerance** — if one agent fails, others still produce results (orchestrator reports the gap)

The orchestrator layer exists specifically to synthesize parallel results into a single verdict. Without it, the user would have to read N independent outputs and decide for themselves.

## Consequences

- Any new framework agent is immediately available to all orchestrators (drop .md in agents/)
- Skills own workflow logic; commands stay thin
- Orchestrators own synthesis logic; agents stay focused on one framework each
- No framework can block another (parallel = no cascading failures)
- Tradeoff: frameworks can't build on each other's findings (accepted — synthesis happens at orchestrator level)
