---
name: review
description: Full end-of-work review — combines /think (Verification + Agentic Audit) and /audit (evidence compliance) in one pass
arguments:
  - name: target
    description: What to review (file path, inline description, or @file_path)
    required: false
  - name: --input-files
    description: Comma-separated file paths for evidence verification
    required: false
  - name: --expected-count
    description: Expected entry count for accountability check
    required: false
  - name: --strict
    description: Fail on any evidence warning, not just violations
    required: false
---

Invoke the `review` skill to perform a comprehensive end-of-work review.

If no target argument was given, ask the user: "What would you like to review? Provide a file path or describe the work to review."

This command combines two passes:
1. **Think pass:** Dispatches Verification + Agentic Audit frameworks (deep-dive, tri-strike, gap-finder, devils-advocate, drift-detector)
2. **Audit pass:** Runs evidence protocol compliance check

Pass all arguments through to the skill.

After the skill completes:
- Present the combined review report
- If both pass: "Review complete. Work is verified and evidence-compliant. Ready to ship."
- If think fails but audit passes: "Framework issues found but evidence is clean. Fix the issues and re-review."
- If audit fails: "Evidence protocol violations found. Fix citations first, then re-review."
- If both fail: "Multiple issues. Fix evidence violations first (they may resolve some framework findings), then re-review."
