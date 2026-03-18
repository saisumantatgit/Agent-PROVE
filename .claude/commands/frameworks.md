---
name: frameworks
description: List all available thinking frameworks organized by category and phase
---

Display the complete framework taxonomy. This is a discovery command — no analysis, just information.

Present this table:

```
## Available Thinking Frameworks (14)

### Exploration (Brainstorming)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| 6 Thinking Hats | `/consider six-thinking-hats` | Cycle through 6 perspectives: Facts, Intuition, Caution, Benefits, Creativity, Process |

### Deconstruction (Problem Understanding)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| First Principles | `/consider first-principles` | Break down to fundamental truths, question every assumption |
| 5-Whys | `/consider five-whys` | Drill to root cause through iterative "Why?" |

### Strategy (Approach Design)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| Inversion | `/consider inversion` | What would guarantee failure? Avoid those paths |
| Occam's Razor | `/consider occams-razor` | Find the simplest approach that fits all facts |
| One Thing | `/consider one-thing` | Identify the single highest-leverage action |

### Verification (Implementation Validation)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| Deep Dive | `/consider deep-dive` | Read actual files, trace data flows, map dependencies |
| Technical Research | `/consider technical-research` | Validate implementation against established practices |
| Tri-Strike | `/consider tri-strike` | Triangulate expectations, capabilities, and observations |

### Refinement (Reduction & Tightening)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| Via Negativa | `/consider via-negativa` | Improve by removing — what can be cut? |

### Agentic Audit (AI Work Audit)
| Framework | Command | What It Does |
|-----------|---------|-------------|
| Gap Finder | `/consider gap-finder` | What's missing that should be there? |
| Blind Spot | `/consider blind-spot` | What's invisible from the current frame? |
| Devil's Advocate | `/consider devils-advocate` | Prove it works or retract the claim |
| Drift Detector | `/consider drift-detector` | Has the agent drifted from original intent? |

---

**Orchestrated commands:**
- `/brainstorm` — Explore an idea (dispatches 6 Thinking Hats)
- `/validate` — Stress-test an approach (5 frameworks: Exploration + Deconstruction + Strategy)
- `/think` — Audit a cycle (5 frameworks: Verification + Agentic Audit)
- `/audit` — Check evidence compliance (no frameworks — protocol only)
- `/review` — Full end-of-work review (/think + /audit combined)

**Single-lens access:**
- `/consider [framework-name]` — Apply one framework directly

**Custom frameworks:**
Drop a .md file in .claude/agents/ following the agent template. It becomes available immediately via `/consider [filename]`.
```
