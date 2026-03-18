---
name: validate
description: Validate a proposed approach using multiple thinking frameworks before execution
arguments:
  - name: approach
    description: The approach to validate (inline text or @file_path)
    required: false
  - name: --frameworks
    description: Number of frameworks to apply (default 5)
    required: false
  - name: --framework-names
    description: Comma-separated list of specific framework names
    required: false
---

Invoke the `validate-approach` skill with the provided arguments.

If no approach argument was given, ask the user: "What approach would you like to validate? Describe your plan or reference a file with @path."

Pass all arguments through to the skill:
- The approach text or file reference as APPROACH
- --frameworks N if provided
- --framework-names if provided

After the skill completes:
- If VALIDATED: confirm and proceed
- If VALIDATED_WITH_ADJUSTMENTS: present adjustments, ask user to accept or revise
- If REJECTED: present findings, ask user to revise or override
