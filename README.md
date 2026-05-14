# Personal API

> **Turn your Obsidian vault into an AI identity layer.** Any AI agent reads `ME.md` + `AGENT.md` and immediately gets your identity context, collaboration rules, and knowledge-system navigation.

中文说明：[README.zh-CN.md](./README.zh-CN.md)

[![version](https://img.shields.io/badge/version-2.0.3-blue)](./SKILL.md)
[![license](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![category](https://img.shields.io/badge/category-identity-purple)](#)
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey)](#)
[![agents](https://img.shields.io/badge/agents-Claude%20%7C%20Codex%20%7C%20Cursor%20%7C%20ChatGPT%20%7C%20Gemini-orange)](#)

---

## Why

Every new chat, project, or AI tool usually starts with re-explaining your background, preferences, communication style, and boundaries. Personal API turns that repeated onboarding into a versioned vault contract:

- `ME.md` — identity contract.
- `AGENT.md` — behavior contract.
- `CLAUDE.md` / `AGENTS.md` — thin adapter files for agent runtimes.
- `30.knowledge/00.system/methodology.md` — Knowledge Palace v2 operating manual.

Default setup creates the full Knowledge Palace v2 structure, including `30.knowledge/`. Use `--minimal` only when you want the lightweight identity layer without the knowledge-production system.

---

## Quick Start

```bash
# 1. Set your vault path
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"

# 2. Run the full scaffolder
bash scripts/setup.sh

# 3. Open your vault and fill in the placeholders
```

Minimal mode:

```bash
bash scripts/setup.sh --minimal
```

Minimal mode creates the identity layer, thin adapters, and basic navigation. It does not create `30.knowledge/`.

---

## What You Get

| Path | Role |
|---|---|
| `ME.md` | Identity contract for AI |
| `AGENT.md` | Behavior contract and collaboration rules |
| `CLAUDE.md` | Thin Claude Code adapter |
| `AGENTS.md` | Thin Codex / OpenAI Agents adapter |
| `.gitignore` | Vault privacy helper, installed only if missing |
| `00.context/` | Current state and active project context |
| `10.identity/` | Values, vision, mental models, strengths and gaps |
| `20.skills/` | Capability map |
| `30.knowledge/` | Knowledge Palace v2 production track, full mode only |
| `40.memory-stream/` | Daily logs, reflections, milestones |
| `50.maps/` | Global navigation and skill maps |

The setup script preserves existing files and only creates missing files.

---

## Architecture

Personal API uses a dual-track vault model:

| Track | Scope | AI Role |
|---|---|---|
| Track A: Identity Archive | `ME.md`, `AGENT.md`, `00.context/`, `10.identity/`, `20.skills/`, `40.memory-stream/`, `50.maps/` | Read first; suggest carefully; do not rewrite core identity without authorization |
| Track B: Knowledge Production | `30.knowledge/` | Compile, organize, link, and maintain under methodology rules |

See:

- [references/architecture.md](./references/architecture.md)
- [references/vault-layout.md](./references/vault-layout.md)
- [references/operation-boundaries.md](./references/operation-boundaries.md)
- [references/maintenance.md](./references/maintenance.md)

---

## Agent Compatibility

The protocol is plain markdown, so any AI agent that can read files can use it.

- Claude Code reads `CLAUDE.md`.
- Codex / OpenAI Agents read `AGENTS.md`.
- Cursor, ChatGPT, Gemini, and custom LLM agents can be pointed at `ME.md` + `AGENT.md`.

Standard prompt:

> Read my `ME.md` and `AGENT.md` to understand my context. Then proceed.

---

## Maintenance And Release

Validate the skill before publishing:

```bash
bash -n scripts/setup.sh
python scripts/validate_skill.py
bash scripts/package_skillhub.sh
python scripts/validate_skill.py --dist dist/skillhub/personal-api-2.0.3-skillhub.zip
```

The generated SkillHub package is:

```text
dist/skillhub/personal-api-2.0.3-skillhub.zip
```

Older local packages under `dist/skillhub/` are historical artifacts.

---

## Privacy

The skill ships templates, not your real personal data. After setup, filled-in `ME.md` and `AGENT.md` may contain sensitive personal context. The script installs a vault `.gitignore` only when one does not already exist; review it if you intentionally version your vault in a private repository.

---

## Related

- `personal-knowledge-vault` — cross-project entry skill that pulls context from this vault.
- `knowledge-palace-builder` — full step-by-step vault construction guide.

License: MIT.
