---
name: think
description: Apply thinking framework agents to audit a cycle's output or analyze a problem
arguments:
  - name: subject
    description: What to analyze (inline text or @file_path)
    required: false
  - name: --frameworks
    description: Number of frameworks to apply (default 3)
    required: false
  - name: --framework-names
    description: Comma-separated list of specific framework names
    required: false
  - name: --input-files
    description: Comma-separated file paths for evidence verification
    required: false
  - name: --expected-count
    description: Expected entry count for accountability check
    required: false
---

Invoke the `think-cycle` skill with the provided arguments.

If no subject argument was given, ask the user: "What would you like to analyze? Describe the problem, paste cycle output, or reference a file with @path."

Pass all arguments through to the skill:
- The subject text or file reference as SUBJECT
- --frameworks N if provided
- --framework-names if provided
- --input-files if provided
- --expected-count N if provided

After the skill completes:
- If CYCLE_APPROVED: confirm cycle quality
- If CYCLE_APPROVED_WITH_WARNINGS: present warnings, recommend addressing
- If CYCLE_FAILED: present specific issues, guide fixes, offer re-audit
- If ESCALATE: recommend stopping and running /validate on overall approach
