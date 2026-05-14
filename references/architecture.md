# Personal API Architecture

Personal API turns an Obsidian vault into an AI-readable identity and knowledge system. It is a folder convention plus a small set of markdown contracts that any file-reading AI agent can follow.

## Core Contracts

| Contract | Purpose | Owner |
|---|---|---|
| `ME.md` | Identity contract: who the user is, how they think, current preferences | Human |
| `AGENT.md` | Behavior contract: how AI should communicate, use tools, and make decisions | Human with AI assistance |
| `CLAUDE.md` | Thin adapter for Claude Code | Generated, user editable |
| `AGENTS.md` | Thin adapter for Codex / OpenAI Agents | Generated, user editable |
| `30.knowledge/00.system/methodology.md` | Operating manual for AI-led knowledge production | Generated, user review |

## Dual Track Model

Personal API uses two tracks so identity stays stable while knowledge production can scale.

| Track | Scope | AI Role |
|---|---|---|
| Track A: Identity Archive | `ME.md`, `AGENT.md`, `00.context/`, `10.identity/`, `20.skills/`, `40.memory-stream/`, `50.maps/` | Read first, suggest carefully, do not rewrite core identity without authorization |
| Track B: Knowledge Production | `30.knowledge/` | Compile, organize, link, and maintain under the methodology rules |

The key boundary is simple: identity is human-owned; knowledge production can be AI-assisted.

## Methodology Stack

Personal API combines several stable knowledge-management methods:

| Method | Role |
|---|---|
| PARA | Sort information by actionability and lifecycle |
| Johnny.Decimal | Keep top-level locations stable with numeric prefixes |
| Zettelkasten | Turn durable ideas into atomic permanent notes |
| MOC / LYT | Use maps of content for semantic navigation |
| LLM Wiki | Separate raw source material from compiled notes |
| Memory Palace | Make top-level rooms easy to remember and browse |

Core formula:

> Folders solve lifecycle. MOCs solve topic membership. Wikilinks solve relationships.

## Agent Read Order

For normal collaboration, AI agents should read:

1. `ME.md`
2. `AGENT.md`
3. `00.context/now.md`
4. `50.maps/index.md`
5. `30.knowledge/00.system/methodology.md` when working under `30.knowledge/`

This read order keeps context small while preserving the user's stable identity and current state.
