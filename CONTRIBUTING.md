# Contributing

## Adding a Custom Framework

The fastest way to contribute: add a new thinking framework agent.

### 1. Create the agent file

Drop a `.md` file in `.claude/agents/` following this template:

```markdown
---
name: your-framework
description: One-line description of what this framework does
---

You are a **Your Framework** thinking agent.

Your job is to [core purpose — one sentence starting with a verb].

## Inputs

You will receive:
- **CONTEXT**: Current state, what exists, what's been tried
- **SUBJECT**: The problem, approach, or output to analyze
- **INPUT_FILES**: Specific file paths to read for evidence

## Your Task

Apply [Your Framework] by answering these questions:

### Question 1: [Your first question]
[Details about what to assess]

### Question 2: [Your second question]
[Details]

### Question 3: [Your third question]
[Details]

## Output Format

For each finding:

**KEY_TERM** → [description]
**EVIDENCE** → [citation: file_path:location or CONTEXT reference]
**CONCLUSION** → [what this means]

## Verdict

End with exactly one of:
- **PASS** — [condition for passing]
- **FAIL** — [condition for failing]

Include:
- `findings`: List of specific findings
- `recommendations`: Specific actions to take

## Evidence Requirement

Every claim must cite a source. [Describe your specific citation rules. If a claim cannot be cited, state the appropriate flag.]
```

### 2. Validate structure

Run the validation script:
```bash
bash scripts/validate-structure.sh
```

Your new agent should show green checkmarks for frontmatter and evidence requirement.

### 3. Use it immediately

Your framework is available via:
```
/consider your-framework "the problem to analyze"
```

No registration, no config changes, no orchestrator modification needed.

## Framework Design Guidelines

- **3 core questions** (can deviate if methodology demands it)
- **Binary verdict**: PASS or FAIL (nuance goes in findings, not verdict)
- **Evidence required**: Every claim cites a source — this is non-negotiable
- **Domain-agnostic**: No references to specific projects, technologies, or domains
- **55-80 lines**: Keep it focused. If longer, you're probably combining two frameworks.
- **Independent**: Your framework must work without knowing other frameworks exist

## Which Category?

| If your framework... | Category |
|---------------------|----------|
| Generates ideas or explores possibilities | Exploration |
| Breaks down problems to fundamentals | Deconstruction |
| Evaluates or selects approaches | Strategy |
| Checks implementation against reality | Verification |
| Simplifies or removes | Refinement |
| Audits AI-generated work specifically | Agentic Audit |

## Submitting Changes

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes following the conventions above
4. Commit with a descriptive message (`git commit -m "Add: description of change"`)
5. Push to your fork (`git push origin feature/your-feature`)
6. Open a Pull Request against `main`

Pull requests should include:
- Description of what changed and why
- Any testing you performed
- Reference to related issues (if applicable)

## Reporting Issues

Open an issue on GitHub with:
- Framework name
- What happened vs. what you expected
- The command you ran
