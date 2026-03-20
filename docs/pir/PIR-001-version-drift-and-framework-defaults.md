# PIR-001: Version Drift and Framework Default Inconsistencies

## Metadata

| Field | Value |
|-------|-------|
| **PIR ID** | PIR-001 |
| **Date** | 2026-03-20 |
| **Severity** | P2 |
| **Status** | Final |
| **Incident date** | v1.1.0 release |
| **Detection date** | 2026-03-20 |
| **Resolution date** | 2026-03-20 |

## Zone Check

| Dimension | Status | Notes |
|-----------|--------|-------|
| **Severity** | P2 | Metadata-only; no functional breakage |
| **Containment** | Contained | All inconsistencies resolved same day |
| **Blast Radius** | 4 platform adapters + 2 agent/skill layers | Codex, Cursor, OpenCode, Gemini CLI adapters; t1-validator + /think command |

## 1. Summary

Code review on 2026-03-20 discovered that 4 platform adapter `plugin.json` files were stuck at version 1.1.0 while the canonical version was 1.2.1. The same review found that the t1-validator default framework list did not match the validate-approach skill, and the `/think` command advertised 3 frameworks while the skill supported 5. All inconsistencies were corrected same-day with structural validation added to prevent recurrence.

## 2. Timeline

| Time | Event | Actor |
|------|-------|-------|
| v1.1.0 release | **Incident introduced** — adapter plugin.json files last updated | Release process |
| v1.1.0 → v1.2.1 | Version bumps applied only to `.claude-plugin/plugin.json` and `package.json` | Developer |
| 2026-03-20 | **Incident detected** — code review found version drift + framework mismatches | Code review |
| 2026-03-20 | **Remediation started** — versions synced, defaults aligned | Developer |
| 2026-03-20 | **Incident resolved** — all adapters at 1.2.1, validate-structure.sh updated with version cross-check | Developer |

## 3. Five Whys

1. **Why did version drift occur?** — Adapters were updated when features were added, but version bumps were only applied to `.claude-plugin/plugin.json` and `package.json`.
2. **Why were only those two files bumped?** — The release process was informal, with no checklist enumerating all version-bearing files.
3. **Why was there no checklist?** — PROVE was the first product in the suite, built before conventions were established.
4. **Why weren't framework default mismatches caught?** — No cross-layer consistency test existed to validate that agent defaults, skill definitions, and command descriptions stayed in sync.
5. **Why?** -> **ROOT CAUSE:** No automated version/consistency validation across platform adapters and agent layers.

## 4. Blast Radius

| Radius | Affected | How |
|--------|----------|-----|
| Direct | 4 adapter plugin.json files (Codex, Cursor, OpenCode, Gemini CLI) | Displayed stale version 1.1.0 to users |
| Direct | t1-validator agent, validate-approach skill, /think command | Framework list mismatches across layers |
| Adjacent | Users on non-Claude-Code platforms | Saw incorrect version metadata |
| Downstream | None | Adapters still functioned; version field is informational |
| Potential (if undetected) | Trust erosion | Users could question whether adapters are maintained or compatible with canonical version |

## 5. Prompt Forensics

### Triggering input
```
Manual code review of PROVE adapter directory structure and agent defaults.
```

### Expected vs actual
- Expected: All `plugin.json` files across adapters report version 1.2.1; t1-validator defaults match validate-approach skill; /think command count matches skill capability.
- Actual: 4 adapter `plugin.json` files reported 1.1.0; t1-validator default framework list diverged from validate-approach skill; /think command advertised 3 frameworks instead of 5.

## 6. What Went Well

- Code review caught all three classes of inconsistency in a single pass.
- Remediation was straightforward — no breaking changes, no data loss.
- The existing `validate-structure.sh` script provided a natural place to add the version cross-check.

## 7. What Went Wrong

- Version bumps were a manual, ad-hoc process with no automation or checklist.
- No single source of truth enforced version consistency across all platform adapters.
- Agent and skill layers evolved independently without cross-layer validation.
- The /think command description was not updated when the skill's framework support expanded.

## 8. Where We Got Lucky

- The version field in adapter `plugin.json` is informational, not functional. If adapters had used this field for compatibility checks, users on 4 platforms would have experienced failures.
- The framework mismatch was in defaults, not in capability. Users who explicitly specified frameworks were unaffected.

## 9. Remediation

### Immediate fix
- Synced all adapter `plugin.json` versions to 1.2.1.
- Aligned t1-validator default framework list with validate-approach skill.
- Updated /think command to reflect 5 supported frameworks.

### Permanent fix
- Added version cross-check to `validate-structure.sh` that verifies all `plugin.json` files match the canonical version.

### Detection improvement
- `validate-structure.sh` now fails if any adapter version diverges from canonical, catching drift before it ships.

## 10. Action Items

| # | Action | Priority | Owner | Due | Status |
|---|--------|----------|-------|-----|--------|
| 1 | Add version cross-check to validate-structure.sh | P1 | Developer | 2026-03-20 | Done |
| 2 | Sync all adapter plugin.json to 1.2.1 | P1 | Developer | 2026-03-20 | Done |
| 3 | Align framework defaults across t1-validator, validate-approach, /think | P1 | Developer | 2026-03-20 | Done |
| 4 | Create release checklist documenting all version-bearing files | P2 | Developer | Next release | Open |
| 5 | Consider cross-layer consistency tests for agent/skill/command alignment | P3 | Developer | Backlog | Open |

## 11. Lessons Learned

- **Every version-bearing file needs automated enforcement.** Manual bumps across N adapters will always drift. The canonical version should be defined once and validated everywhere by CI or structure checks.
- **Cross-layer consistency requires explicit testing.** When agents, skills, and commands reference the same capabilities (framework lists, counts, defaults), a test must verify they agree. Implicit "the developer will remember" does not scale.
- **First products accumulate the most process debt.** PROVE was built before suite conventions existed. Periodic audits of first-mover products against current conventions catch inherited gaps.
