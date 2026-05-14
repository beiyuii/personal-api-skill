#!/usr/bin/env bash
set -euo pipefail

VERSION="2.0.3"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIST_DIR="$ROOT/dist/skillhub"
ZIP_PATH="$DIST_DIR/personal-api-${VERSION}-skillhub.zip"

required_paths=(
    "README.md"
    "README.zh-CN.md"
    "SKILL.md"
    "CHANGELOG.md"
    "scripts/setup.sh"
    "scripts/validate_skill.py"
    "scripts/package_skillhub.sh"
    "templates/ME.md"
    "templates/AGENT.md"
    "templates/CLAUDE.md"
    "templates/AGENTS.md"
    "templates/methodology.md"
    "references/architecture.md"
    "references/vault-layout.md"
    "references/operation-boundaries.md"
    "references/maintenance.md"
    "agents/openai.yaml"
)

cd "$ROOT"
mkdir -p "$DIST_DIR"
rm -f "$ZIP_PATH"

for path in "${required_paths[@]}"; do
    if [ ! -e "$path" ]; then
        echo "Missing required package path: $path"
        exit 1
    fi
done

zip -q -r "$ZIP_PATH" "${required_paths[@]}"

echo "Created $ZIP_PATH"
