---
name: personal-api
version: "2.0.3"
description: Turn an Obsidian vault into an AI-readable personal identity layer. Use when setting up ME.md and AGENT.md, scaffolding the full Knowledge Palace v2 structure, onboarding AI assistants, or maintaining the vault contract. Default setup creates the complete 30.knowledge system; --minimal creates only the lightweight identity layer.
license: MIT
compatibility: Requires an Obsidian vault. Works with any AI agent that can read files (Claude Code, Codex, Cursor, ChatGPT, Gemini, OpenClaw, Hermes Agent). macOS, Linux, Windows (WSL).
metadata:
  author: beiyuii
  version: "2.0.3"
  category: identity
  tags: "obsidian identity knowledge-management personal-api second-brain digital-twin pkm zettelkasten para moc knowledge-palace ai-agent context-engineering prompt-engineering"
  related_skills: "personal-knowledge-vault knowledge-palace-builder"
---

# Personal API

Personal API is a lightweight routing skill for creating and maintaining an AI-readable identity layer inside an Obsidian vault.

The skill has three core contracts:

1. `ME.md` — identity contract.
2. `AGENT.md` — behavior contract.
3. `30.knowledge/00.system/methodology.md` — Knowledge Palace v2 operating manual for the knowledge-production track.

Default setup creates the full Knowledge Palace v2 structure, including `30.knowledge/`. Use `--minimal` only when the user explicitly wants the identity layer without the knowledge-production system.

## Trigger Scenarios

Use this skill when the user wants to:

- create a new AI-readable Obsidian vault structure;
- install or refresh `ME.md` / `AGENT.md`;
- set up Claude/Codex adapter files for a vault;
- initialize the `30.knowledge/` Knowledge Palace v2 system;
- explain how AI agents should read and operate inside the vault;
- validate or package this skill for release.

Do not use this skill to invent or fill in the user's real identity content. AI may explain fields and provide examples, but the user must provide the actual personal answers.

## Workflows

### 1. Install Personal API

Use when the user provides an Obsidian vault path and wants the scaffold installed.

Read:

- `scripts/setup.sh`
- `templates/ME.md`
- `templates/AGENT.md`
- `templates/CLAUDE.md`
- `templates/AGENTS.md`
- `templates/methodology.md`

Run:

```bash
export OBSIDIAN_VAULT_PATH="/path/to/vault"
bash scripts/setup.sh
```

Expected full-mode result:

- identity layer files at vault root;
- thin agent adapters `CLAUDE.md` and `AGENTS.md`;
- Track A directories and stubs;
- full `30.knowledge/` tree;
- `30.knowledge/00.system/methodology.md`.

For identity-only setup:

```bash
bash scripts/setup.sh --minimal
```

Minimal mode must not create `30.knowledge/`.

### 2. Fill Identity And Behavior Contracts

Use when the user is ready to customize `ME.md` and `AGENT.md`.

Read:

- `templates/ME.md`
- `templates/AGENT.md`
- `references/operation-boundaries.md`

Rules:

- explain each placeholder in plain language;
- ask the user for real identity facts when needed;
- do not fabricate personal history, values, or preferences;
- keep Track A identity files human-owned unless the user explicitly authorizes edits.

### 3. Start Knowledge Production

Use when the user wants AI-assisted knowledge organization under `30.knowledge/`.

Read:

- `references/architecture.md`
- `references/vault-layout.md`
- `templates/methodology.md`

Rules:

- raw material enters `30.knowledge/10.capture/`;
- compiled notes go to `30.knowledge/40.notes/literature/`;
- permanent notes and frameworks require human review;
- do not modify Track A core identity content without explicit authorization.

### 4. Validate And Package

Use before publishing or reviewing this skill.

Read:

- `scripts/validate_skill.py`
- `scripts/package_skillhub.sh`
- `CHANGELOG.md`

Run:

```bash
bash -n scripts/setup.sh
python scripts/validate_skill.py
bash scripts/package_skillhub.sh
python scripts/validate_skill.py --dist dist/skillhub/personal-api-2.0.3-skillhub.zip
```

The source version, README badges, changelog, setup output, and release zip must agree.

## Resource Routing

| Need | Read |
|---|---|
| Product overview | `README.md` or `README.zh-CN.md` |
| Architecture and method | `references/architecture.md` |
| Expected vault tree | `references/vault-layout.md` |
| AI permission boundaries | `references/operation-boundaries.md` |
| Health checks and maintenance | `references/maintenance.md` |
| Install behavior | `scripts/setup.sh` |
| Release checks | `scripts/validate_skill.py` |

## Version History

### 2.0.3 — 2026-05-14

- Converted `SKILL.md` into a lightweight routing layer.
- Moved long-form architecture and operating guidance into `references/`.
- Added adapter templates for Claude and Codex/OpenAI agents.
- Added validation and package scripts.
- Aligned source files, setup output, changelog, and SkillHub release package.

### 2.0.0 — 2026-05-08

- Added full Knowledge Palace v2 scaffold and `--minimal` setup mode.

### 1.0.0 — 2026-04-19

- Initial identity-layer skill with `ME.md`, `AGENT.md`, and setup script.
