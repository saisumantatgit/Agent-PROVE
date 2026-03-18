# Research 001: Competitive Landscape & Gap Analysis

**Date:** 2026-03-18
**Researcher:** Claude Opus 4.6 (for Sai Sumanth Battepati)
**Objective:** Identify what top Claude Code plugins ship, what patterns define the ecosystem, what our plugin is missing, and where our differentiation stands.

---

## Executive Summary

The Claude Code plugin ecosystem has consolidated around three dominant players (Superpowers 95K★, BMAD 41K★, GSD 34K★) and one category-defining utility (claude-mem 38K★). Each occupies a distinct strategic position: Superpowers owns developer discipline, BMAD owns agile methodology, GSD owns context management, and claude-mem owns persistent memory.

**Our position — Thinking Framework Orchestrator — occupies an unclaimed niche:** structured, evidence-based thinking validation with phase-aware framework dispatch. No competitor offers orchestrated multi-framework analysis with evidence protocol enforcement. However, our current plugin lacks several table-stakes features that the top plugins all ship.

---

## Part 1: The Big Three — Deep Profiles

### Superpowers (obra/superpowers)
- **Stars:** ~95,200 (largest Claude Code plugin)
- **Author:** Jesse Vincent (obra)
- **Architecture:** Skills framework with mandatory discipline
- **Ships:** 14 skills, 1 agent (code-reviewer), 3 commands, hooks, multi-platform configs (.claude-plugin, .cursor-plugin, .codex, .opencode, gemini-extension.json)
- **Core Thesis:** Constrain agent behavior to follow disciplined engineering practices
- **Unique Differentiators:**
  - Mandatory TDD (RED-GREEN-REFACTOR) — deletes code written before tests
  - Two-stage code review (spec-compliance then code-quality)
  - Git worktree isolation for parallel subagent work
  - Automatic skill triggering (contextual, no manual invocation needed)
  - Community ecosystem: superpowers-marketplace (685★), superpowers-skills (565★)
- **What We Can Learn:** Multi-platform support is table stakes for top plugins. Community ecosystem (marketplace + skills repos) drives adoption beyond the core plugin.

### BMAD Method (bmad-code-org/BMAD-METHOD)
- **Stars:** ~41,200
- **Author:** BMAD Code Org
- **Architecture:** Agile methodology with 12+ agent personas
- **Ships:** 14 method skills + 4 phase modules, tools/ (CLI), docs/ (multi-language), website/
- **Core Thesis:** AI as expert collaborator through full agile lifecycle, not just coding
- **Unique Differentiators:**
  - 12+ specialized personas (PM, Architect, Developer, UX, Scrum Master, etc.)
  - "Party Mode" — multi-persona collaboration in single session
  - Phase-gated workflow (Analysis → Plan → Solution → Implementation)
  - Scale-adaptive — adjusts ceremony based on project complexity
  - Document sharding for large artifacts
  - Adversarial review + edge-case hunting as dedicated skills
  - Modular ecosystem (BMad Builder, Test Architect, Game Dev Studio, Creative Intelligence Suite)
- **What We Can Learn:** Non-engineering personas (PM, UX, editorial) expand the addressable audience. Phase-gated workflows with scale-adaptation are more sophisticated than binary on/off. Adversarial review as a first-class skill is directly relevant to our Devil's Advocate framework.

### GSD — Get Shit Done (gsd-build/get-shit-done)
- **Stars:** ~34,400
- **Author:** GSD Build
- **Architecture:** Context engineering with wave-based execution
- **Ships:** 16 agents, 1 unified command, 3 hooks (update, context-monitor, statusline), scripts/, tests/, planning templates
- **Core Thesis:** Prevent context degradation by spawning fresh 200K-token windows per execution wave
- **Unique Differentiators:**
  - Fresh context per wave — executors never accumulate token debt
  - Wave-based parallel execution — plans grouped by dependency
  - XML-structured task definitions (<action>, <verify>, <done>)
  - Discussion-before-research — surfaces preferences before investigation
  - Atomic git commits per task — enables bisection/rollback
  - Multi-runtime (Claude, OpenCode, Gemini, Codex, Copilot, Antigravity)
  - Quick mode with --discuss, --research, --full flags
- **What We Can Learn:** Context management is a real concern for long-running framework analysis. XML-structured task definitions with verification steps mirror our agent communication protocol. Multi-runtime support is becoming expected.

---

## Part 2: Ecosystem Landscape (Top 10 by Stars)

| Rank | Stars | Plugin | Core Value Proposition |
|------|-------|--------|----------------------|
| 1 | ~95,200 | Superpowers | Developer discipline (TDD, review, worktrees) |
| 2 | ~84,900 | everything-claude-code | Performance optimization harness |
| 3 | ~41,200 | BMAD Method | Full agile lifecycle with personas |
| 4 | ~38,000 | claude-mem | Persistent cross-session memory |
| 5 | ~34,400 | GSD | Context engineering, wave execution |
| 6 | ~31,600 | agents (wshobson) | Multi-agent orchestration |
| 7 | ~29,000 | awesome-claude-code | Curated directory (not a plugin) |
| 8 | ~23,400 | vibe-kanban | Kanban-style task orchestration |
| 9 | ~23,300 | gstack | Garry Tan's opinionated setup |
| 10 | ~21,600 | SuperClaude Framework | Cognitive personas + methodology |

### Category Map

| Category | Leaders | Our Overlap |
|----------|---------|-------------|
| **Developer Discipline** | Superpowers | None — we don't enforce TDD or code review |
| **Agile Methodology** | BMAD | Partial — our phases map loosely to agile stages |
| **Context Management** | GSD, claude-mem | None — we're stateless by design |
| **Task Orchestration** | vibe-kanban, agents | Partial — our T1/Cycle Auditor orchestrates frameworks |
| **Thinking Frameworks** | **Nobody** | **This is our niche** |
| **Evidence-Based Audit** | **Nobody** | **This is our niche** |
| **Agentic Work Audit** | **Nobody** | **This is our niche (with new 4 frameworks)** |

---

## Part 3: Installed Plugin Architecture Patterns

Analysis of 12 plugins installed locally in `~/.claude/plugins/cache/`:

### What Top Plugins Ship

| Component | Superpowers | ai-eng-system | taches-cc | marketing-skills | hookify | claude-mem |
|-----------|------------|---------------|-----------|-----------------|---------|-----------|
| `.claude-plugin/` manifest | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| agents/ | ✅ (1) | ✅ (30) | ✅ (3) | — | ✅ (1) | — |
| skills/ | ✅ (14) | ✅ (8) | ✅ (13) | ✅ (29) | ✅ (1) | ✅ |
| commands/ | ✅ (3) | ✅ (21) | ✅ (23) | — | ✅ (4) | — |
| hooks/ | ✅ | ✅ (5) | — | — | ✅ (4) | ✅ |
| references/ | — | ✅ | — | — | — | — |
| templates/ | — | ✅ | — | — | — | — |
| tools/ | — | — | — | ✅ (58+51) | — | — |
| tests/ | ✅ | — | — | — | — | — |
| scripts/ | — | — | — | ✅ (2) | — | ✅ |
| docs/ | ✅ | — | ✅ (3) | — | — | — |
| examples/ | — | — | — | — | ✅ (4) | — |
| Multi-platform | ✅ (4) | — | — | — | — | — |

### Manifest Format Standard

All top plugins use `.claude-plugin/plugin.json`:
```json
{
  "name": "plugin-name",
  "description": "...",
  "version": "X.Y.Z",
  "author": { "name": "...", "email": "..." },
  "homepage": "https://...",
  "repository": "https://...",
  "license": "MIT",
  "keywords": [...]
}
```

Our `package.json` at root is **non-standard**. The ecosystem standard is `.claude-plugin/plugin.json`.

---

## Part 4: Gap Analysis — What We're Missing

### Critical Gaps (Table Stakes)

| Gap | Who Has It | Impact | Priority |
|-----|-----------|--------|----------|
| **`.claude-plugin/` manifest** | All top plugins | Required for marketplace discovery and proper plugin loading | **P0** |
| **hooks.json** | Superpowers, ai-eng-system, hookify, GSD, claude-mem | Enables session-start initialization, auto-triggering | **P1** |
| **Multi-platform configs** | Superpowers (.cursor, .codex, .opencode) | Expands addressable market 3-4x | **P2** |

### Competitive Gaps (Differentiation Risks)

| Gap | Who Has It | Our Position | Action |
|-----|-----------|-------------|--------|
| **Skill references/ subdirectories** | ai-eng-system, taches-cc, BMAD | Our skills are self-contained SKILL.md files without supporting docs | Consider adding references/ for complex skills |
| **Examples/ folder** | hookify | No concrete usage examples beyond SKILL.md inline examples | Add examples/ with real-world audit scenarios |
| **Validation scripts** | marketing-skills | No way to validate agent/skill structure | Low priority — our agents are simpler than 29-skill marketing suite |

### Strategic Gaps (Differentiation Opportunities)

| Opportunity | What It Means | Who Does This | Our Advantage |
|-------------|--------------|---------------|---------------|
| **Phase-aware framework dispatch** | Right frameworks at right time, automatically | Nobody | We're building this now — unique in ecosystem |
| **Agentic Audit category** | Dedicated frameworks for auditing AI-generated work | Nobody (BMAD has adversarial review, but not a category) | 4 new frameworks purpose-built for the agentic era |
| **Evidence protocol enforcement** | Hard failure on uncited inference | Nobody | Our core differentiator — zero tolerance is unique |

---

## Part 5: Architectural Decisions Informed by Research

### Must-Do (informed by ecosystem patterns)

1. **Move manifest to `.claude-plugin/plugin.json`** — our `package.json` at root is non-standard
2. **Add `hooks.json`** — even a simple session-start hook that announces the plugin's capabilities
3. **Phase-aware defaults in skills** — `/validate` auto-selects Deconstruction+Strategy frameworks, `/think` auto-selects Verification+Agentic Audit

### Should-Do (competitive positioning)

4. **Add examples/ folder** — concrete "here's what a /validate run looks like" examples (GSD and hookify both do this)
5. **Reference the T1↔Drift bookend pattern in docs** — BMAD's phase-gated approach validates that users want structured phase transitions

### Won't-Do (wrong for our architecture)

6. **Multi-platform configs** — premature until v1.0 is proven on Claude Code
7. **Python/TypeScript execution layer** — our "markdown-only" positioning is a feature, not a limitation
8. **Persistent memory** — claude-mem exists for this; we don't need to reinvent it
9. **Community marketplace** — premature; Superpowers has 95K stars to justify a marketplace

---

## Part 6: Positioning Statement

### Current Niche (Unclaimed)

**"The only Claude Code plugin with structured, evidence-based thinking validation."**

No competitor offers:
- Orchestrated multi-framework analysis (T1 Validator, Cycle Auditor)
- Evidence protocol enforcement (zero uncited inference)
- Phase-aware framework taxonomy (13 frameworks across 6 categories)
- Dedicated agentic audit frameworks (Gap Finder, Blind Spot, Devil's Advocate, Drift Detector)

### Competitive Positioning Matrix

```
                    METHODOLOGY ────────────────────────── TOOLS
                         │                                    │
              BMAD       │                                    │  marketing-skills
              (agile     │                                    │  (29 skills)
               lifecycle)│                                    │
                         │                                    │
                         │          ┌─────────────┐           │
      DISCIPLINE ────────┤          │   US         │           ├──── UTILITY
                         │          │  (thinking   │           │
       Superpowers       │          │  frameworks  │           │  claude-mem
       (TDD, review)     │          │  + evidence) │           │  (memory)
                         │          └─────────────┘           │
                         │                                    │
                         │     GSD                            │  hookify
                         │     (context                       │  (hooks)
                         │      engineering)                  │
                         │                                    │
                    PROCESS ──────────────────────────── INFRASTRUCTURE
```

We sit at the intersection of methodology and process — not as comprehensive as BMAD's agile lifecycle, but deeper on the "how to think" dimension than anyone else.

---

## References

### Primary Sources (Directly Analyzed)

| # | Source | URL | Used For |
|---|--------|-----|----------|
| 1 | Superpowers (GitHub) | https://github.com/obra/superpowers | Architecture patterns, skill structure, multi-platform support |
| 2 | BMAD Method (GitHub) | https://github.com/bmad-code-org/BMAD-METHOD | Agile methodology, persona patterns, adversarial review |
| 3 | GSD (GitHub) | https://github.com/gsd-build/get-shit-done | Context engineering, wave execution, XML task structure |
| 4 | taches-cc-resources (GitHub) | https://github.com/glittercowboy/taches-cc-resources | Prior art assessment, consider/ commands, research/ commands |
| 5 | claude-plugins-official (GitHub) | https://github.com/anthropics/claude-plugins-official | Official plugin structure standard, manifest format |
| 6 | everything-claude-code (GitHub) | https://github.com/affaan-m/everything-claude-code | Harness optimization patterns |
| 7 | claude-mem (GitHub) | https://github.com/thedotmack/claude-mem | Persistent memory patterns, UI assets, mode configs |
| 8 | awesome-claude-code (GitHub) | https://github.com/hesreallyhim/awesome-claude-code | Ecosystem directory, plugin discovery |
| 9 | vibe-kanban (GitHub) | https://github.com/BloopAI/vibe-kanban | Task orchestration patterns |
| 10 | gstack (GitHub) | https://github.com/garrytan/gstack | Celebrity-driven adoption, opinionated setup patterns |
| 11 | SuperClaude Framework (GitHub) | https://github.com/SuperClaude-Org/SuperClaude_Framework | Cognitive personas, methodology framework |
| 12 | claude-hud (GitHub) | https://github.com/jarrodwatts/claude-hud | Terminal HUD, statusline API usage |
| 13 | zcf (GitHub) | https://github.com/UfoMiao/zcf | Zero-config workflow patterns |

### Local Sources (Installed Plugin Cache Analysis)

| # | Plugin | Path | Files Analyzed |
|---|--------|------|---------------|
| 14 | superpowers 5.0.5 | ~/.claude/plugins/cache/claude-plugins-official/superpowers/5.0.5 | 160 files |
| 15 | ai-eng-system 0.5.5 | ~/.claude/plugins/cache/ai-eng-marketplace/ai-eng-system/0.5.5 | 82 files |
| 16 | taches-cc-resources 1.0.0 | ~/.claude/plugins/cache/taches-cc-resources/taches-cc-resources/1.0.0 | 237 files |
| 17 | marketing-skills | ~/.claude/plugins/cache/marketingskills/marketing-skills/ | 200 files |
| 18 | hookify | ~/.claude/plugins/cache/claude-plugins-official/hookify/ | 28 files |
| 19 | ralph-loop | ~/.claude/plugins/cache/claude-plugins-official/ralph-loop/ | 12 files |
| 20 | frontend-design | ~/.claude/plugins/cache/claude-plugins-official/frontend-design/ | ~20 files |
| 21 | code-review | ~/.claude/plugins/cache/...code-review/ | ~15 files |
| 22 | playground | ~/.claude/plugins/cache/...playground/ | ~10 files |
| 23 | claude-mem 8.0.2 | ~/.claude/plugins/cache/thedotmack/claude-mem/8.0.2 | 82 files |
| 24 | postman | ~/.claude/plugins/cache/...postman/ | ~25 files |
| 25 | greptile | ~/.claude/plugins/cache/...greptile/ | ~5 files |

### Secondary Sources (Referenced but Not Deep-Analyzed)

| # | Source | URL | Relevance |
|---|--------|-----|-----------|
| 26 | superpowers-marketplace | https://github.com/obra/superpowers-marketplace | Community extension model (685★) |
| 27 | superpowers-skills | https://github.com/obra/superpowers-skills | Community skill contributions (565★) |
| 28 | agents (wshobson) | https://github.com/wshobson/agents | Multi-agent orchestration (31,600★) |
| 29 | BMAD Builder | Referenced in BMAD docs | Custom agent creation extension |
| 30 | LangGraph | Referenced by GAI reviewer | State machine framework (not Claude Code) |
| 31 | CrewAI | Referenced by GAI reviewer | Multi-agent framework (not Claude Code) |
| 32 | AutoGen | Referenced by GAI reviewer | Agent framework (not Claude Code) |

### GAI Reviewer Feedback (Evaluated in this research)

| # | Suggestion | Our Verdict | Reasoning |
|---|-----------|-------------|-----------|
| 33 | JSON schemas for tools | Rejected | Wrong platform — Claude Code uses markdown, not JSON schemas |
| 34 | Python router / state machine | Rejected | Wrong platform — LangGraph pattern, not Claude Code |
| 35 | logic.py per skill | Rejected | Contradicts markdown-only architecture (ADR) |
| 36 | Test harness (test_drift_detector.py) | Rejected | Can't unit-test LLM prompts deterministically |
| 37 | CI/CD GitHub Actions | Rejected | No Python code to test; CI = lint markdown + validate YAML |
| 38 | references/ folder for baselines | Rejected | Conversation context IS the baseline in Claude Code |
| 39 | Pipeline states with prerequisites | Rejected | Adversarial UX — users choose invocation timing |
| 40 | Frameworks as function calls with I/O schemas | Rejected | Redesigns plugin as LangGraph app |
| 41 | Test scenarios (Feature Creep, Tool-Loop, Context Decay) | Accepted (partially) | Excellent documentation examples for Drift Detector agent prompt |
