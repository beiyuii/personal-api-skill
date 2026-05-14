# Changelog

All notable changes to this skill will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [2.0.3] — 2026-05-14

### Fixed
- Removed `templates/vault.gitignore` from the upload package because ClawHub rejects that file type.
- `scripts/setup.sh` now generates the vault `.gitignore` inline when the target vault does not already have one.
- Kept the same stable scaffold behavior as `2.0.2`: full mode creates `30.knowledge/`, while `--minimal` does not.

---

## [2.0.2] — 2026-05-14

### Added
- `references/` resource layer for architecture, vault layout, operation boundaries, and maintenance guidance.
- `templates/CLAUDE.md` and `templates/AGENTS.md` thin agent adapters.
- `templates/vault.gitignore` privacy helper, installed only if the vault has no `.gitignore`.
- `scripts/validate_skill.py` for source, setup-output, and optional dist-package validation.
- `scripts/package_skillhub.sh` for reproducible SkillHub zip generation.
- `agents/openai.yaml` release metadata.

### Changed
- Reworked `SKILL.md` into a lightweight routing layer with top-level `version: "2.0.2"`.
- Kept default setup as full Knowledge Palace v2 installation, including `30.knowledge/`.
- Clarified that `--minimal` creates only the identity layer and must not create `30.knowledge/`.
- `setup.sh` now creates `CLAUDE.md`, `AGENTS.md`, `00.context/projects/project-overview.md`, `10.identity/thinking-models.md`, and `10.identity/strengths-gaps.md`.
- Updated English and Chinese READMEs to match actual setup behavior and release validation.

### Fixed
- Aligned source version, README badges, changelog, setup output, and SkillHub package naming.
- Removed stale changelog claims about discovery metadata that was not present in the current manifest.

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

### Changed
- **BREAKING**: `setup.sh` now creates the full Knowledge Palace v2 directory structure by default. Run with `--minimal` to preserve v1 behavior.
- Repositioned as agent-agnostic — explicitly tested with multiple agent runtimes, not tied to any single one.
- `setup.sh` hardened: `set -euo pipefail`, `--help` flag, idempotent file creation, separate Track A / Track B sections.
- SKILL.md grew from 3KB to about 15KB with methodology depth borrowed from Knowledge Palace v2.
- ME.md template comments genericized (removed personal example values).

### Migration from v1.x
1. Re-run `bash scripts/setup.sh` — your existing `ME.md` and `AGENT.md` are preserved untouched.
2. Read the newly installed `30.knowledge/00.system/methodology.md` for the knowledge-production operating rules.
3. If you do not want the `30.knowledge/` tree, run `bash scripts/setup.sh --minimal` instead.

---

## [1.0.0] — 2026-04-19

### Added
- Initial release.
- `templates/ME.md` — identity contract.
- `templates/AGENT.md` — behavior contract.
- `scripts/setup.sh` — basic vault scaffolder (identity layer only).
- `SKILL.md` skill manifest.
