---
name: consider
description: Apply ONE specific thinking framework to a problem — direct single-lens analysis without orchestration
arguments:
  - name: framework
    description: The framework to apply (e.g., inversion, first-principles, five-whys, devils-advocate)
    required: true
  - name: subject
    description: What to analyze (inline text or @file_path)
    required: false
---

Invoke the specified framework agent directly — no orchestrator, no synthesis, just one lens.

If no subject argument was given, ask the user: "What would you like to analyze with [framework]?"

If the framework name doesn't match any agent file in .claude/agents/, list available frameworks and ask the user to choose.

This command provides direct access to any of the 14 framework agents:

**Exploration:** six-thinking-hats
**Deconstruction:** first-principles, five-whys
**Strategy:** inversion, occams-razor, one-thing
**Verification:** deep-dive, technical-research, tri-strike
**Refinement:** via-negativa
**Agentic Audit:** gap-finder, blind-spot, devils-advocate, drift-detector

Pass the subject as SUBJECT, conversation context as CONTEXT, and any referenced files as INPUT_FILES to the chosen agent.

After the agent completes:
- Present the agent's full output (questions, findings, verdict)
- If FAIL: suggest relevant follow-up commands based on what was found
- If PASS: confirm and suggest next steps
