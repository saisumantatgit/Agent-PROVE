# Thinking Framework Orchestrator

A Claude Code plugin that applies structured multi-framework thinking to validate approaches before execution, audit outputs during execution, and enforce evidence-based accountability. Extracted from the Mission 1086 methodology.

## Architecture

Four layers, bottom to top:

1. **Framework Agents** (8 built-in, user-extensible) — Independent thinking lenses. Each applies ONE framework and returns PASS/FAIL with cited evidence. Located in `.claude/agents/`.
2. **Orchestration Agents** — T1 Validator (pre-execution) and Cycle Auditor (during execution). They dispatch framework agents in parallel and synthesize verdicts.
3. **Skills** — Workflow logic for validate-approach, think-cycle, evidence-audit. Located in `.claude/skills/`.
4. **Commands** — User-facing entry points: `/validate`, `/think`, `/audit`. Located in `.claude/commands/`.

## Agent Communication Protocol

Every agent prompt MUST include:
- **Objective** — Single unambiguous sentence starting with a verb
- **Input files** — Exact paths to read
- **Output** — Structured result with verdict
- **Schema** — Expected output structure
- **Verification** — How to confirm success
- **Constraints** — What NOT to do

## Orchestrator Accountability

Before presenting ANY result:
1. Verify agent output exists and is valid
2. Verify counts match expectations
3. Verify no null/empty required fields
4. Cross-check agent claims against actual data

## Verdict Taxonomy

**T1 Validator:**
- `VALIDATED` — All frameworks PASS, no critical findings
- `VALIDATED_WITH_ADJUSTMENTS` — No critical findings, adjustments recommended
- `REJECTED` — Critical finding or majority FAIL

**Cycle Auditor:**
- `CYCLE_APPROVED` — All pass, no evidence violations
- `CYCLE_APPROVED_WITH_WARNINGS` — Pass with non-critical warnings
- `CYCLE_FAILED` — Evidence violation or critical framework failure
- `ESCALATE` — 3 consecutive failures, stop and ask user

**Framework Agents:**
- `PASS` — No issues found under this framework
- `FAIL` — Issues found, with specifics and evidence

## Evidence Protocol

Every claim cites a source. Every number has a derivation. Zero uncited inference.
- Factual claims → `[source: file_path:line or URL]`
- Numbers → `[derived: computation or file_path]`
- "Not found" → `[searched: list of files/paths checked]`

## Custom Frameworks

Drop a `.md` file in `.claude/agents/` following this pattern:
1. Role definition ("You are a [Framework] thinking agent")
2. Input spec (CONTEXT, SUBJECT, INPUT_FILES)
3. Core questions (3+)
4. Output format (structured findings with evidence)
5. Verdict (PASS/FAIL with specifics)
6. Evidence citation requirement
