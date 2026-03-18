# Thinking Framework Orchestrator

**One-liner**: A Claude Code plugin that implements rigorous multi-framework thinking validation, per-cycle auditing, and evidence-based accountability for any project.

## Problem

Complex agentic tasks (like Mission 1086's classification of 1,086 regulatory DataPoints) succeed or fail based on approach quality. Without structured validation, agents make "wrong artifact type" errors, miss edge cases, and produce uncited inferences. Mission 1086 proved that launching thinking framework agents (First Principles, Inversion, 5-Whys, etc.) before AND during execution catches critical errors early and maintains quality throughout. This methodology is currently trapped in one session's history — it needs to be a reusable plugin.

## Success Criteria

How we know it worked:

- [ ] Plugin installs via Claude Code marketplace or local path
- [ ] `/validate` launches T1 agent that applies 5+ frameworks to a proposed approach and returns VALIDATED / VALIDATED_WITH_ADJUSTMENTS / REJECTED
- [ ] `/think` launches N configurable framework agents against a problem/cycle output and returns per-framework PASS/FAIL with specifics
- [ ] `/audit` verifies evidence protocol compliance (zero uncited inference) on any output file
- [ ] All 8 built-in frameworks work independently and in parallel
- [ ] Custom user-defined frameworks can be added without modifying the plugin
- [ ] Plugin is repo-agnostic — works in ANY project directory

## Constraints

- Must be a standard Claude Code plugin (agents/ + skills/ + commands/ + package.json)
- Framework agents must be independent (parallel execution, no cross-dependencies)
- All agent prompts must follow the Agent Communication Protocol: Objective, Input files, Output file, Schema, Verification, Constraints
- Evidence protocol: every claim must cite a source — zero inference allowed
- Ship with 8 built-in frameworks, but architecture must support user-defined additions

## Out of Scope

- ProSure-specific logic (XBRL, DPM, regulatory classification)
- Status polling implementation (future v1.1 enhancement)
- Web UI or dashboard
- Integration with specific CI/CD pipelines
- Framework agent chaining (each framework is independent in v1.0)
