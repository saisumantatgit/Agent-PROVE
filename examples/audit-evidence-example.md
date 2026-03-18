# Example: /audit Output

## Scenario
Auditing a technical report for evidence compliance.

## Command
```
/audit @docs/api-design-decisions.md --strict
```

## Evidence Audit Report

### Overall: NON_COMPLIANT

### Summary
| Category | Total | Cited | Violations |
|----------|-------|-------|------------|
| Factual claims | 12 | 9 | 3 |
| Numbers/stats | 4 | 2 | 2 |
| Absence claims | 1 | 0 | 1 |
| **Total** | **17** | **11** | **6** |

### Violations
| # | Line | Type | Content | Suggested Fix |
|---|------|------|---------|---------------|
| 1 | L14 | UNCITED_INFERENCE | "PostgreSQL handles concurrent writes better than MySQL" | Add: [source: benchmark URL or test result] |
| 2 | L23 | UNVERIFIED_NUMBER | "Response time improved by 40%" | Add: [derived: before=200ms after=120ms, benchmark run 2026-03-15] |
| 3 | L31 | UNCITED_INFERENCE | "This is the industry standard approach" | Add: [source: specific documentation or RFC] |
| 4 | L45 | UNVERIFIED_NUMBER | "Supports up to 10,000 concurrent users" | Add: [derived: load test result or infrastructure spec] |
| 5 | L52 | UNCITED_INFERENCE | "No security vulnerabilities were found" | Add: [source: security scan report path and date] |
| 6 | L58 | UNSUPPORTED_ABSENCE | "No alternative approaches exist" | Add: [searched: list of sources checked] |
