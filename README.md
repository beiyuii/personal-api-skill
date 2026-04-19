# Personal API Skill for Hermes Agent

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)
![Category](https://img.shields.io/badge/category-identity-blue)
![Hermes Agent](https://img.shields.io/badge/for-Hermes%20Agent-purple)
![Obsidian](https://img.shields.io/badge/vault-Obsidian-7c3aed)

> **The identity layer for Obsidian users on Hermes Agent.**
> Turn your vault into a personal API — so any AI agent instantly knows who you are, how you think, and how to work with you.

## The Problem

Every time you start a new AI session, the agent knows **nothing** about you. You waste the first 10 minutes repeating:

- "I'm a solo developer, not a team — don't suggest 'align with stakeholders'"
- "Give me structured output with priorities, not walls of text"
- "Challenge my assumptions, don't just agree"

**Personal API** solves this with two Markdown files in your Obsidian vault.

## What It Does

```
You: "Read my ME.md to understand my context."

Agent:
1. Reads ME.md    →  Knows your identity, principles, current focus
2. Reads AGENT.md →  Knows how to communicate with you
3. Explores vault →  Follows the navigation table to go deeper
```

**Result**: The AI talks to you like a colleague who's worked with you for months.

## Directory Structure

```
personal-api/
├── SKILL.md              # Skill metadata for Hermes
├── templates/
│   ├── ME.md             # ← Your identity file (fill in the blanks)
│   └── AGENT.md          # ← AI behavior contract (define the rules)
└── scripts/
    └── setup.sh          # One-command scaffold
```

## Quick Start

### 1. Clone and install

```bash
git clone https://github.com/beiyuii/personal-api-skill.git
cp -r personal-api-skill ~/.hermes/skills/personal-api
hermes skills enable personal-api
```

### 2. Run the setup script

```bash
bash ~/.hermes/skills/personal-api/scripts/setup.sh
```

This creates `ME.md` and `AGENT.md` in your Obsidian vault root.

### 3. Fill in the templates

Open the two files and replace all `[PLACEHOLDER]` markers. Each field has a comment explaining exactly what to write.

### 4. Use it

Tell any Hermes Agent:

> **"Read my ME.md to understand my context."**

That's it. The agent will self-configure.

## Why Not Just a System Prompt?

System prompts are fine — until you have more than one agent.

|                                    | System Prompt | Personal API |
| ---------------------------------- | :-----------: | :----------: |
| Portable across tools              |      ❌       |      ✅      |
| Version controlled (git)           |      ❌       |      ✅      |
| Composable (layered loading)       |      ❌       |      ✅      |
| Lives in your vault, not vendor DB |      ❌       |      ✅      |

A system prompt is a setting. **A Personal API is an asset.**

## Why Not Just SOUL.md or MEMORY.md?

Hermes ships with great built-ins (`SOUL.md`, `MEMORY.md`, `AGENTS.md`) — but they're built around a different philosophy:

|                     | Hermes Built-ins           | Personal API                   |
| ------------------- | -------------------------- | ------------------------------ |
| **Who curates it**  | AI (auto-learned)          | **You (hand-crafted)**         |
| **Where it lives**  | `~/.hermes/`               | **Your Obsidian vault**        |
| **Structure**       | Flat files                 | **Layered (L0 / L1 / L2)**     |
| **Evolution model** | AI decides what matters    | **You decide, AI follows**     |
| **Integration**     | Hermes-specific            | **Any agent that reads files** |

> If you want the AI to just figure you out — use `MEMORY.md`.
> If you want to **own and design** your identity layer — use this.

## A Scenario Built-ins Can't Handle

You have three projects. Each needs the AI to behave differently:

- **Project A** — rigorous, data-driven, no fluff
- **Project B** — creative, brainstorming mode
- **Project C** — teaching mode, explain everything

With `SOUL.md`, you get **one global personality**.

With Personal API, your `AGENT.md` declares **context-switching rules**, and your Obsidian folder structure acts as the trigger:

```
cd 20.projects/project-a/   →  AI reads project-a's AGENT.md override
cd 20.projects/project-b/   →  AI switches to brainstorming mode
```

**Vault structure = behavior routing.**
This is the kind of control flat-file built-ins can't give you.

## Core Concepts

### ME.md — Your Identity Layer

Your "About Me" page. Structured sections:

- **One-liner intro** — Who you are, what you do, what you pursue
- **Core principles** — 3-7 non-negotiable values that guide your decisions
- **Thinking patterns** — How you process information (structured? visual? first-principles?)
- **Current focus** — What you're working on right now (links to `now.md`)
- **Capability map** — Your skill stack (links to `skills-map.md`)
- **Communication rules** — How AI should talk to you

### AGENT.md — The Behavior Contract

Rules for AI assistants:

- Language preference & technical term handling
- Output format (structured vs. free-form)
- Decision-making style (data-driven vs. intuition)
- Tool usage rules (which dirs are read-only)
- Memory management (what to persist across sessions)
- Special scenarios (creative mode vs. rigorous mode)

## Recommended Vault Layout

This skill ships `ME.md` and `AGENT.md`. For the full layered loading experience, the agent also looks for the following structure — **you create these as your second brain grows**:

| Layer | Path                | Purpose                                | Shipped? |
| :---: | ------------------- | -------------------------------------- | :------: |
|   0   | `ME.md`             | Identity — **always read first**       |    ✅    |
|   0   | `AGENT.md`          | AI behavior contract                   |    ✅    |
|   1   | `now.md`            | Current state — what you're focused on |    —     |
|   2   | `10.identity/`      | Deep identity — values, vision         |    —     |
|   2   | `20.skills/`        | Skill library — your capabilities      |    —     |
|   2   | `30.knowledge/`     | Knowledge base — accumulated learnings |    —     |
|  Log  | `40.memory-stream/` | Memory stream — growth trajectory      |    —     |
| Index | `50.maps/`          | Navigation maps — global overview      |    —     |

Start with just `ME.md` and `AGENT.md`. Add layers when you actually need them.

## Why This Works

- **No vendor lock-in** — Plain Markdown, works with any AI tool that reads files
- **Version controlled** — Your identity evolves; git tracks the changelog
- **Privacy-first** — Data stays in your local vault, never uploaded
- **Composable** — Add/remove sections without breaking the structure

## Tips

- Update `ME.md` monthly — identity evolves
- Keep `AGENT.md` stable — consistency helps AI assistants calibrate
- Use `[[wikilinks]]` to connect related notes — the AI follows them
- The `layer` frontmatter helps AI prioritize what to read first

## Requirements

- [Hermes Agent](https://github.com/beiyuii/hermes-agent) ≥ v1.0
- An Obsidian vault with `OBSIDIAN_VAULT_PATH` environment variable set

## Author

Built and battle-tested daily by [@beiyuii](https://github.com/beiyuii).

## License

MIT

---

If this resonates, a ⭐ helps others find it.
