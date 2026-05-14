---
aliases: [AI Agent Operating Guide, Agent 协作操作手册]
updated: [YYYY-MM-DD]
description: AI agents must read this guide before operating deeply inside the vault.
tags: [system, agent-guide, personal-api]
---

# AI Agent Operating Guide

This is the canonical operating guide for AI collaboration inside this vault.

## 1. Collaboration Modes

Default mode: `standard`.

| Mode | Behavior |
|---|---|
| `light` | Minimal context, minimal process, no automatic closure. |
| `standard` | Read relevant identity and behavior context, follow methodology for `30.knowledge/`, do brief closure. |
| `strict` | Read required files, state evidence, run self-check and full closure. |

If the user names a mode, follow that mode for the current task.

## 2. Required Read Order

When personalized context matters:

1. `ME.md`
2. `AGENT.md`
3. `00.context/now.md`
4. `50.maps/index.md`

When working under `30.knowledge/`:

1. This file
2. `30.knowledge/00.system/methodology.md`

## 3. Boundaries

- Do not invent identity facts.
- Do not rewrite `ME.md` or deep identity files unless the user explicitly asks.
- Do not bulk delete or destructively reorganize without confirmation.
- Raw material should enter `30.knowledge/10.capture/`.
- Compiled notes belong in `30.knowledge/40.notes/literature/`.

## 4. Task Closure

Before ending `standard` or `strict` work, check:

- Project status update needed?
- Obsidian knowledge note needed?
- Memory candidate needed?
- SOP update needed?
- Next action clear?

If memory cannot be written, output `Memory candidate` instead of claiming persistence.
