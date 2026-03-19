# Template Quality Checklist

Use this table to verify that AAR, PIR, and Logbook templates cover all required dimensions. Run this check after any template modification.

## Completeness Matrix

| Check | AAR | PIR | Logbook | Notes |
|-------|-----|-----|---------|-------|
| **Phase in metadata** | Required | Required | Required | Links entry to roadmap phase |
| **Milestone in metadata** | Required | Required | Required | Links entry to version tag |
| **Git range / commit refs** | Required | Required | Required | Traceability to repo history |
| **RAG zone check** | Required (Delivery/Quality/Scope) | Required (Severity/Containment/Blast Radius) | Required (Momentum/Quality/Scope — Start + End) | Honest status signal BEFORE detailed writing |
| **When to write (triggers)** | Required — visible in body | Required — visible in body | Required — visible in body | Not buried in HTML comments |
| **Examples in `<!-- -->` comments** | Required — every section | Required — every section | Required — every section | 2-3 line concrete examples, not placeholders |
| **Severity / Priority tagging** | Required — P0-P3 on action items | Required — P0-P3 severity classification | N/A | Logbook is a log, not a judgment |
| **Blast radius** | N/A | Required — direct/adjacent/downstream/potential | N/A | Only PIR — what else could break? |
| **WIP tracking** | N/A (retrospective) | N/A (retrospective) | Required — live status with ✅/❌/⏸️ | Only logbook is "live" during work |
| **Validation gate results** | Required — paste script output | Required — did validation catch it? | Required — paste script output | `scripts/validate-structure.sh` |
| **Agent template compliance** | Required — table of new/changed agents | Required — violated section analysis | N/A | AAR checks compliance; PIR investigates violations |
| **Token economics** | Required — planned vs actual | Required — cost of incident | Optional | Calibrates future session planning |
| **Lessons learned (Sustain/Improve/Stop)** | Required | Required | N/A | Logbook captures observations, not lessons |
| **Action items (trackable)** | Required — with priority + owner + date | Required — with priority + owner + date | N/A | Use Open Items / Carry-Forward in logbook instead |
| **Handoff to next milestone** | Required (light) | N/A (PIR closes, doesn't hand off) | Required (detailed) | AAR points forward; logbook enables continuation |
| **Read order for next session** | Required | N/A | Required | "If you're picking up, read these first" |
| **Competitive context** | Optional | Optional (if differentiator affected) | N/A | Track positioning impact |
| **Operator contact / escalation** | N/A (solo dev) | N/A (solo dev) | N/A (solo dev) | Add when team grows |

## How to Use

1. After modifying any template, run through this table
2. Every "Required" cell must have a corresponding section in the template
3. Every "Required" section must have a `<!-- -->` comment with a concrete example
4. N/A means the check doesn't apply to that template type

## RAG Zone Definitions

| Status | Meaning | Action |
|--------|---------|--------|
| 🟢 **GREEN** | On track, no concerns | Continue |
| 🟡 **AMBER** | Minor concerns, manageable drift | Monitor, may need course correction |
| 🔴 **RED** | Blocked, significant issues, or trust-eroding | Stop and address before continuing |

## When to Write Each

| Template | Trigger |
|----------|---------|
| **Logbook** | Every working session (non-negotiable) |
| **AAR** | Milestone complete, phase gate, 20+ agent dispatches, significant plan deviation |
| **PIR** | Evidence violation shipped, agent template broken, orchestrator failure, validation gap |
