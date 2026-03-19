# Changelog — Agent-PROVE

All notable changes to Agent-PROVE.

## [1.2.0] - 2026-03-19

### Added
- **Gemini CLI support** — `gemini-extension.json` + `GEMINI.md` with tool mapping and subagent fallback note
- **4 new commands** — `/brainstorm`, `/consider`, `/review`, `/frameworks` completing the 7-command user journey
- **3 new skills** — brainstorm, consider, review (matching command workflows)
- **ADR-005** — Command journey design and phase-aware defaults rationale
- **LICENSE** — MIT license file
- **CONTRIBUTING.md** — Guide for adding custom frameworks with template
- **Session handoff** — `.planning/HANDOFF.md` for context continuity

### Changed
- **README.md** — Full polish with badges, structured sections, platform table, all 7 commands
- **PRODUCT.md** — Updated with 7-command journey and "Won't Do" positioning

## [1.1.0] - 2026-03-18

### Added
- **5 new framework agents** — six-thinking-hats, gap-finder, blind-spot, devils-advocate, drift-detector
- **Phase-aware defaults** — `/validate` auto-selects Exploration + Deconstruction + Strategy; `/think` auto-selects Verification + Agentic Audit
- **`.claude-plugin/plugin.json`** — Marketplace-standard manifest
- **`.claude-plugin/hooks.json`** — SessionStart hook announcing plugin
- **Multi-platform configs** — `.cursor-plugin/`, `.codex/`, `.opencode/`
- **`examples/`** — 3 real-world output examples (validate, think, audit)
- **`scripts/validate-structure.sh`** — Plugin structure validation
- **Research 002** — New agent value validation and style pattern analysis
- **PRODUCT.md** — Marketing-grade product description with competitive positioning

### Changed
- **CLAUDE.md** — Added framework taxonomy table with phase-aware defaults
- **README.md** — Updated to 14 frameworks with Classic and Agentic Era sections
- **T1 Validator** — Updated dispatch list to include all 14 frameworks
- **Skills** — validate-approach and think-cycle updated with phase-aware framework defaults

## [1.0.0] - 2026-03-18

### Added
- **9 framework agents** — first-principles, inversion, five-whys, occams-razor, via-negativa, one-thing, deep-dive, technical-research, tri-strike
- **2 orchestrator agents** — T1 validator (pre-execution) and cycle auditor (per-cycle)
- **3 skills** — validate-approach, think-cycle, evidence-audit
- **3 commands** — `/validate`, `/think`, `/audit`
- **Evidence protocol** — Zero uncited inference enforcement with violation taxonomy
- **`CLAUDE.md`** — Plugin architecture and conventions
- **`README.md`** — User documentation
- **ADRs 001-004** — Prior art, architecture, evidence protocol, agent protocol
- **Research 001** — Competitive landscape analysis (13 repos, 12 installed plugins)
- **`.planning/`** — Full planning artifacts (brief, roadmap, 8 phase plans)
