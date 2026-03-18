# Roadmap: Thinking Framework Orchestrator

## Overview

Build a Claude Code plugin that extracts the Mission 1086 thinking framework methodology into a reusable, repo-agnostic tool. The plugin ships with 8 built-in thinking frameworks, a T1 pre-execution validator, per-cycle audit orchestration, and evidence protocol enforcement. Six phases take us from bare scaffold to publishable plugin.

## Phases

- [ ] **Phase 1: Plugin Scaffold** - Directory structure, manifest, and project identity
- [ ] **Phase 2: Framework Agents** - 8 built-in thinking framework agent definitions
- [ ] **Phase 3: Orchestration Agents** - T1 validator and cycle auditor
- [ ] **Phase 4: Skills** - validate-approach, think-cycle, evidence-audit SKILL.md files
- [ ] **Phase 5: Slash Commands** - /validate, /think, /audit command entry points
- [ ] **Phase 6: Testing & Polish** - End-to-end verification, README, publish prep

## Phase Details

### Phase 1: Plugin Scaffold
**Goal**: Establish plugin directory structure, package.json manifest, and CLAUDE.md
**Depends on**: Nothing (first phase)
**Plans**: 1 plan

Plans:
- [ ] 01-01: Create plugin manifest, directory tree, and project CLAUDE.md

### Phase 2: Framework Agents
**Goal**: Write all 8 built-in thinking framework agent definitions
**Depends on**: Phase 1 (directory structure exists)
**Plans**: 2 plans (4 agents each to stay within scope limits)

Plans:
- [ ] 02-01: First Principles, Inversion, 5-Whys, Occam's Razor agents
- [ ] 02-02: Via Negativa, One Thing, Deep Dive, Technical Research agents

### Phase 3: Orchestration Agents
**Goal**: Build the T1 pre-execution validator and per-cycle audit orchestrator
**Depends on**: Phase 2 (framework agents exist to be dispatched)
**Plans**: 1 plan

Plans:
- [ ] 03-01: T1 validator agent and cycle-auditor agent

### Phase 4: Skills
**Goal**: Create SKILL.md files for validate-approach, think-cycle, and evidence-audit
**Depends on**: Phase 3 (orchestration agents exist)
**Plans**: 2 plans

Plans:
- [ ] 04-01: validate-approach and think-cycle skills
- [ ] 04-02: evidence-audit skill

### Phase 5: Slash Commands
**Goal**: Create slash command entry points that invoke the skills
**Depends on**: Phase 4 (skills exist to be invoked)
**Plans**: 1 plan

Plans:
- [ ] 05-01: /validate, /think, and /audit commands

### Phase 6: Testing & Polish
**Goal**: End-to-end verification, README documentation, and publish preparation
**Depends on**: Phase 5 (all components exist)
**Plans**: 1 plan

Plans:
- [ ] 06-01: Integration test, README, and marketplace prep

## Progress

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Plugin Scaffold | 0/1 | Not started | - |
| 2. Framework Agents | 0/2 | Not started | - |
| 3. Orchestration Agents | 0/1 | Not started | - |
| 4. Skills | 0/2 | Not started | - |
| 5. Slash Commands | 0/1 | Not started | - |
| 6. Testing & Polish | 0/1 | Not started | - |
