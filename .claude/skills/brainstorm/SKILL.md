---
name: brainstorm
description: Explore an idea from 6 perspectives using de Bono's Thinking Hats. For the Exploration phase — before you have a formed approach.
---

# Brainstorm

Explore an idea, problem, or opportunity from 6 independent perspectives using de Bono's Six Thinking Hats. This is for the EXPLORATION phase — when you have a vague idea and need to think it through before forming an approach.

## Arguments

- **IDEA** (required): The idea, problem, or opportunity to explore — inline text or `@file_path`

## Workflow

### Step 1: Parse Input

If IDEA is a file path: read the file and extract the core idea.
If IDEA is inline text: use directly.
If no IDEA provided: ask "What would you like to explore?"

### Step 2: Dispatch

Launch the `six-thinking-hats` agent with:
- CONTEXT: conversation context and any background provided
- SUBJECT: the parsed idea
- INPUT_FILES: any files the user referenced

### Step 3: Present Results

Organize findings by hat pair (as the agent structures them):
1. **Fact Check (White + Red):** What's verified vs assumed? What feels off?
2. **Risk-Benefit (Black + Yellow):** What are the risks AND what's genuinely valuable?
3. **Alternatives & Process (Green + Blue):** What else could we do? Is our thinking process sound?

### Step 4: Bridge to Next Phase

After presenting findings, suggest:
- "Ready to form an approach? Use `/validate` to stress-test it."
- "Want to go deeper on one angle? Use `/consider [framework-name]`."

## Usage Examples

```
/brainstorm "Building a CLI tool that validates regulatory submissions"

/brainstorm "Should we use microservices or a monolith for this project?"

/brainstorm @docs/feature-idea.md

/brainstorm  (no args — will prompt)
```
