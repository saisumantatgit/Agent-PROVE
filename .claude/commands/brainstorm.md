---
name: brainstorm
description: Explore possibilities using 6 Thinking Hats — cycle through Facts, Intuition, Caution, Benefits, Creativity, and Process perspectives
arguments:
  - name: idea
    description: The vague idea, problem, or opportunity to explore (inline text or @file_path)
    required: false
---

Invoke the `six-thinking-hats` framework agent directly with the provided idea.

If no idea argument was given, ask the user: "What idea, problem, or opportunity would you like to explore? Describe it in a few sentences."

This command is for the EXPLORATION phase — when the user has a vague idea and needs to think it through from multiple angles BEFORE forming an approach. It is NOT for validating an existing approach (use /validate for that).

Pass the idea as SUBJECT to the six-thinking-hats agent. Use any conversation context as CONTEXT. If the user references files, pass them as INPUT_FILES.

After the agent completes:
- Present findings organized by hat (White, Red, Black, Yellow, Green, Blue)
- Highlight the Green Hat output — creative alternatives the user may not have considered
- Highlight the Blue Hat output — is the user thinking about this problem the right way?
- Suggest: "Ready to form an approach? Use /validate to stress-test it."
