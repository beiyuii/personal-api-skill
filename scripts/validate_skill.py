#!/usr/bin/env python3
"""Validate Personal API source, setup output, and optional SkillHub zip."""

from __future__ import annotations

import argparse
import os
import re
import shutil
import subprocess
import sys
import tempfile
import zipfile
from pathlib import Path


VERSION = "2.1.0-preview.1"
ROOT = Path(__file__).resolve().parents[1]

FULL_EXPECTED_PATHS = [
    "ME.md",
    "AGENT.md",
    "CLAUDE.md",
    "AGENTS.md",
    ".gitignore",
    "00.context/now.md",
    "00.context/open-questions.md",
    "00.context/projects/project-overview.md",
    "00.context/projects/active",
    "00.context/projects/archived",
    "10.identity/values.md",
    "10.identity/vision.md",
    "10.identity/thinking-models.md",
    "10.identity/strengths-gaps.md",
    "20.skills",
    "30.knowledge/00.system/methodology.md",
    "30.knowledge/00.system/ai-agent-operating-guide.md",
    "30.knowledge/10.capture/inbox",
    "30.knowledge/10.capture/raw",
    "30.knowledge/20.intelligence/ai",
    "30.knowledge/20.intelligence/business",
    "30.knowledge/30.research",
    "30.knowledge/40.notes/literature",
    "30.knowledge/40.notes/permanent",
    "30.knowledge/40.notes/moc",
    "30.knowledge/50.frameworks/technical",
    "30.knowledge/50.frameworks/operation",
    "30.knowledge/60.projects",
    "30.knowledge/70.outputs",
    "30.knowledge/90.archive",
    "40.memory-stream/daily",
    "40.memory-stream/reflections",
    "40.memory-stream/milestones.md",
    "50.maps/index.md",
    "50.maps/skills-map.md",
]

MINIMAL_EXPECTED_PATHS = [
    path for path in FULL_EXPECTED_PATHS if not path.startswith("30.knowledge/")
]

PACKAGE_EXPECTED_PATHS = [
    "README.md",
    "README.zh-CN.md",
    "SKILL.md",
    "CHANGELOG.md",
    "scripts/setup.sh",
    "scripts/validate_skill.py",
    "scripts/package_skillhub.sh",
    "templates/ME.md",
    "templates/AGENT.md",
    "templates/CLAUDE.md",
    "templates/AGENTS.md",
    "templates/ai-agent-operating-guide.md",
    "templates/methodology.md",
    "templates/project-overview.md",
    "templates/vault.gitignore",
    "references/ai-collaboration-protocol.md",
    "references/agent-onboarding-test.md",
    "references/architecture.md",
    "references/vault-layout.md",
    "references/operation-boundaries.md",
    "references/task-closure-sop.md",
    "references/maintenance.md",
    "agents/openai.yaml",
]


class ValidationError(Exception):
    pass


def read(path: str) -> str:
    return (ROOT / path).read_text(encoding="utf-8")


def assert_true(condition: bool, message: str) -> None:
    if not condition:
        raise ValidationError(message)


def extract_frontmatter(text: str) -> str:
    match = re.match(r"^---\n(.*?)\n---\n", text, re.DOTALL)
    if not match:
        raise ValidationError("SKILL.md must start with YAML frontmatter")
    return match.group(1)


def validate_source() -> None:
    skill = read("SKILL.md")
    frontmatter = extract_frontmatter(skill)

    assert_true(
        re.search(rf'^version:\s*"{re.escape(VERSION)}"\s*$', frontmatter, re.MULTILINE) is not None,
        f"SKILL.md must contain top-level version: \"{VERSION}\"",
    )
    assert_true(
        re.search(rf'^\s+version:\s*"{re.escape(VERSION)}"\s*$', frontmatter, re.MULTILINE) is not None,
        f"SKILL.md metadata.version must be \"{VERSION}\"",
    )

    readme = read("README.md")
    readme_cn = read("README.zh-CN.md")
    changelog = read("CHANGELOG.md")

    badge = f"version-{VERSION}-blue"
    assert_true(badge in readme, f"README.md version badge must be {VERSION}")
    assert_true(badge in readme_cn, f"README.zh-CN.md version badge must be {VERSION}")
    assert_true(f"## [{VERSION}] — 2026-05-14" in changelog, f"CHANGELOG.md must contain {VERSION} entry")
    assert_true("frontmatter.metadata.use_cases" not in changelog, "CHANGELOG.md must not claim missing use_cases metadata")
    assert_true("frontmatter.metadata.examples" not in changelog, "CHANGELOG.md must not claim missing examples metadata")

    for path in PACKAGE_EXPECTED_PATHS:
        assert_true((ROOT / path).exists(), f"required source path missing: {path}")


def run_setup(mode: str) -> Path:
    vault = Path(tempfile.mkdtemp(prefix=f"personal-api-{mode}-"))
    env = os.environ.copy()
    env["OBSIDIAN_VAULT_PATH"] = str(vault)
    cmd = ["bash", str(ROOT / "scripts/setup.sh")]
    if mode == "minimal":
        cmd.append("--minimal")
    subprocess.run(cmd, cwd=ROOT, env=env, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    return vault


def validate_setup() -> None:
    full_vault = run_setup("full")
    minimal_vault = run_setup("minimal")
    try:
        for rel in FULL_EXPECTED_PATHS:
            assert_true((full_vault / rel).exists(), f"full setup missing: {rel}")

        assert_true((full_vault / "30.knowledge").exists(), "full setup must create 30.knowledge/")

        for rel in MINIMAL_EXPECTED_PATHS:
            assert_true((minimal_vault / rel).exists(), f"minimal setup missing: {rel}")

        assert_true(
            not (minimal_vault / "30.knowledge").exists(),
            "minimal setup must not create 30.knowledge/",
        )
    finally:
        shutil.rmtree(full_vault, ignore_errors=True)
        shutil.rmtree(minimal_vault, ignore_errors=True)


def validate_dist(dist: Path) -> None:
    assert_true(dist.exists(), f"dist zip does not exist: {dist}")
    assert_true(
        dist.name == f"personal-api-{VERSION}-skillhub.zip",
        f"dist zip filename must be personal-api-{VERSION}-skillhub.zip",
    )

    with zipfile.ZipFile(dist) as zf:
        names = set(zf.namelist())
        for path in PACKAGE_EXPECTED_PATHS:
            assert_true(path in names, f"dist zip missing: {path}")

        skill = zf.read("SKILL.md").decode("utf-8")
        frontmatter = extract_frontmatter(skill)
        assert_true(
            re.search(rf'^version:\s*"{re.escape(VERSION)}"\s*$', frontmatter, re.MULTILINE) is not None,
            f"zip SKILL.md top-level version must be {VERSION}",
        )
        assert_true(
            re.search(rf'^\s+version:\s*"{re.escape(VERSION)}"\s*$', frontmatter, re.MULTILINE) is not None,
            f"zip SKILL.md metadata.version must be {VERSION}",
        )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--dist", type=Path, help="Optional SkillHub zip to validate")
    args = parser.parse_args()

    try:
        validate_source()
        validate_setup()
        if args.dist:
            validate_dist(args.dist)
    except (ValidationError, subprocess.CalledProcessError) as exc:
        print(f"Validation failed: {exc}", file=sys.stderr)
        return 1

    print("Validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
