# Changelog

All notable changes to this skill will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.0] — 2026-05-08

### Added
- Full Knowledge Palace v2 directory scaffold (`30.knowledge/` with 9 sub-rooms: `00.system`, `10.capture`, `20.intelligence`, `30.research`, `40.notes`, `50.frameworks`, `60.projects`, `70.outputs`, `90.archive`).
- New `templates/methodology.md` — knowledge-management operating manual auto-installed at `30.knowledge/00.system/methodology.md`.
- `setup.sh --minimal` flag for users who only want the identity layer (skips `30.knowledge/`).
- `setup.sh --help` documentation.
- `README.md` with badges, Mermaid architecture diagrams (dual-track + knowledge flow), agent compatibility table.
- `LICENSE` (MIT).
- `.gitignore` to prevent committing personal vault data.
- `CHANGELOG.md` (this file).
- `SKILL.md` enrichment: methodology basis, dual-track architecture, AI operation boundaries, frontmatter spec, FAQ, monthly health-check routine.
- `frontmatter.metadata.use_cases` (5 cases) and `frontmatter.metadata.examples` (3 prompt/effect pairs) for discovery.

### Changed
- **BREAKING**: `setup.sh` now creates the full Knowledge Palace v2 directory structure by default. Run with `--minimal` to preserve v1 behavior.
- **BREAKING**: `metadata.hermes:` removed from SKILL.md. Replaced with `metadata.compatibility:` listing supported agents (Claude Code, Codex, Cursor, ChatGPT, Gemini, any LLM agent).
- Repositioned as agent-agnostic — explicitly tested with multiple agent runtimes, not tied to any single one.
- `setup.sh` hardened: `set -euo pipefail`, `--help` flag, idempotent file creation, separate Track A / Track B sections.
- SKILL.md grew from 3KB → ~15KB with methodology depth borrowed from Knowledge Palace v2.
- ME.md template comments genericized (removed personal example values).

### Migration from v1.x
1. Re-run `bash scripts/setup.sh` — your existing `ME.md` and `AGENT.md` are preserved untouched.
2. Read the newly installed `30.knowledge/00.system/methodology.md` for the knowledge-production operating rules.
3. If you don't want the `30.knowledge/` tree, run `bash scripts/setup.sh --minimal` instead (no destructive changes; existing files are kept).

---

## [1.0.0] — 2026-04-19

### Added
- Initial release.
- `templates/ME.md` — identity contract.
- `templates/AGENT.md` — behavior contract.
- `scripts/setup.sh` — basic vault scaffolder (identity layer only).
- `SKILL.md` skill manifest.
