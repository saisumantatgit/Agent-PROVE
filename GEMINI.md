# Thinking Framework Orchestrator — Gemini CLI

This plugin provides 14 thinking framework agents, 7 commands, and 6 skills for structured validation and auditing.

## Tool Mapping

Skills use Claude Code tool names. When you encounter these, use your Gemini CLI equivalent:

| Skill references | Gemini CLI equivalent |
|-----------------|----------------------|
| `Read` (file reading) | `read_file` |
| `Write` (file creation) | `write_file` |
| `Edit` (file editing) | `replace` |
| `Bash` (run commands) | `run_shell_command` |
| `Grep` (search file content) | `grep_search` |
| `Glob` (search files by name) | `glob` |
| `Skill` tool (invoke a skill) | `activate_skill` |
| `WebSearch` | `google_web_search` |
| `WebFetch` | `web_fetch` |
| `Task` tool (dispatch subagent) | No equivalent — see note below |

## Subagent Limitation

Gemini CLI does not support subagent dispatch. The T1 Validator and Cycle Auditor agents dispatch framework agents in parallel on Claude Code — on Gemini CLI, they will run sequentially within the same session. This means:
- `/validate` and `/think` work but are slower (sequential, not parallel)
- `/consider [framework]` works identically (single agent, no dispatch needed)
- `/brainstorm`, `/audit`, `/review`, `/frameworks` work identically

## Commands

| Command | What It Does |
|---------|-------------|
| `/brainstorm` | Explore ideas with 6 Thinking Hats |
| `/validate` | Stress-test approach (5 frameworks) |
| `/consider [framework]` | Apply one framework directly |
| `/think` | Audit cycle output (5 frameworks) |
| `/audit` | Evidence protocol compliance |
| `/review` | Full review (/think + /audit) |
| `/frameworks` | List all 14 frameworks |

## Framework Taxonomy

| Category | Phase | Frameworks |
|----------|-------|-----------|
| Exploration | Brainstorming | six-thinking-hats |
| Deconstruction | Problem Understanding | first-principles, five-whys |
| Strategy | Approach Design | inversion, occams-razor, one-thing |
| Verification | Implementation Validation | deep-dive, technical-research, tri-strike |
| Refinement | Reduction & Tightening | via-negativa, occams-razor |
| Agentic Audit | AI Work Audit | gap-finder, blind-spot, devils-advocate, drift-detector |

## Context Files

@./CLAUDE.md
