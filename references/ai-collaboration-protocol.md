# AI Collaboration Protocol

This protocol defines how an agent should decide how much of Personal API to load and how much process evidence to produce.

It is a preview feature. The goal is to make collaboration controllable without forcing every task into a heavy workflow.

## Modes

| Mode | Use When | Behavior |
|---|---|---|
| `light` | Quick questions, low-risk edits, small explanations | Read only what is necessary. Do not produce process evidence unless asked. Do not perform task-closure sedimentation by default. |
| `standard` | Normal project work and most knowledge tasks | Read `ME.md` and `AGENT.md` when user context matters. Read methodology only when touching `30.knowledge/`. Do a brief closure check at the end. |
| `strict` | High-risk work, publishable output, long-running knowledge maintenance, multi-agent work | Read required entry files, state what was read, run onboarding/self-check when needed, and produce a closure checklist. |

Default mode: `standard`.

The user can override the mode with natural language:

- "Use light mode."
- "This time use strict mode."
- "Only answer, do not update the vault."
- "Do the full closure check."

## Task Intake

At the start of a task, classify the task into one of these routes:

| Route | Examples | Recommended Mode |
|---|---|---|
| Quick answer | One-off explanation, translation, small decision | `light` |
| Identity setup | Filling or explaining `ME.md` / `AGENT.md` | `standard` |
| Knowledge production | Filing articles, compiling notes, organizing `30.knowledge/` | `standard` |
| Project status | Updating project overview, milestones, next actions | `standard` |
| Release or verification | Packaging, publishing, migrations, destructive changes | `strict` |
| Unclear or high-risk | Sensitive information, ambiguous write scope, user asks for rigor | `strict` |

In `standard` mode, the agent may briefly tell the user which mode it recommends when the task route is not obvious. Do not interrupt simple tasks with excessive mode selection prompts.

## Required Reads

| Situation | Required Reads |
|---|---|
| Any personalized collaboration | `ME.md`, `AGENT.md` |
| Working under `30.knowledge/` | `30.knowledge/00.system/ai-agent-operating-guide.md`, then `30.knowledge/00.system/methodology.md` |
| Unclear boundaries | `AGENT.md`, `references/operation-boundaries.md` if available in the skill source |
| Task closure | `references/task-closure-sop.md` if available, otherwise use the closure checklist in the operating guide |

In `light` mode, read selectively and avoid loading long files unless the answer depends on them.

In `strict` mode, state the files read and why.

## Evidence Policy

Evidence should be proportional to the task:

- `light`: no evidence block unless requested.
- `standard`: summarize only user-visible changes and important paths.
- `strict`: include read evidence, changed paths, verification commands, and closure checklist.

Do not claim a file, memory, or external system was updated unless it was actually updated.

If memory persistence is unavailable, output `Memory candidate` instead of saying it was remembered.

## Failure Handling

If the agent cannot read a required file:

1. Say which file is missing.
2. Continue with the best available context if risk is low.
3. Ask before writing if the missing file controls permissions or identity boundaries.

If the user asks to skip protocol steps, follow the newest explicit user instruction unless it would cause destructive or privacy-risky behavior.
