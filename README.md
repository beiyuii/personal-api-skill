# Personal API Skill for Hermes Agent

> Turn your Obsidian vault into a **personal identity layer** — so any AI agent instantly knows who you are, how you think, and how to work with you.

## The Problem

Every time you start a new AI session, the agent knows **nothing** about you. You waste the first 10 minutes repeating:
- "I'm a PM, use business terms"
- "Give me structured output, not walls of text"
- "Challenge me, don't just agree"

**Personal API** solves this with two files in your Obsidian vault.

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

### 1. Install the skill

```bash
# Copy to your Hermes skills directory
cp -r personal-api ~/.hermes/skills/

# Enable it
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

### Vault Navigation

A layered exploration strategy the AI follows:

| Layer | File | Purpose |
|-------|------|---------|
| 0 | `ME.md` | Identity — **always read first** |
| 1 | `now.md` | Current state — what you're focused on |
| 2 | `10.identity/` | Deep identity — values, vision |
| 2 | `20.skills/` | Skill library — your capabilities |
| 2 | `30.knowledge/` | Knowledge base — accumulated learnings |
| Logs | `40.memory-stream/` | Memory stream — growth trajectory |
| Index | `50.maps/` | Navigation maps — global overview |

## Why This Works

- **No vendor lock-in** — Plain Markdown files, works with any AI tool
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
- Obsidian vault with `OBSIDIAN_VAULT_PATH` env var set
- Optional: [Obsidian Local REST API](https://coddingtonbear.github.io/obsidian-local-rest-api/) for live sync

## Author

Built by [@beiyuii](https://github.com/beiyuii) — a system independently developed and validated through daily use.

## License

MIT
