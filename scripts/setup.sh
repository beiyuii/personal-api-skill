#!/usr/bin/env bash
set -euo pipefail

# Personal API — Setup Script (v2.0.3)
# Scaffolds the identity layer and, by default, the full Knowledge Palace v2
# 30.knowledge system inside an Obsidian vault.
#
# Usage:
#   export OBSIDIAN_VAULT_PATH="/path/to/your/vault"
#   bash scripts/setup.sh [--minimal]
#
# Flags:
#   --minimal   Create only the identity layer and basic navigation.
#               Skips 30.knowledge/.

MODE="full"
for arg in "$@"; do
    case "$arg" in
        --minimal) MODE="minimal" ;;
        --help|-h)
            echo "Usage: bash scripts/setup.sh [--minimal]"
            echo ""
            echo "Without flags: scaffolds the full Knowledge Palace v2 structure, including 30.knowledge/."
            echo "--minimal:     creates only the identity layer, thin adapters, and basic navigation."
            exit 0
            ;;
        *)
            echo "Error: unknown argument: $arg"
            echo "Use --help for usage."
            exit 1
            ;;
    esac
done

if [ -z "${OBSIDIAN_VAULT_PATH:-}" ]; then
    echo "Error: OBSIDIAN_VAULT_PATH is not set."
    echo ""
    echo "Set it to your Obsidian vault's absolute path:"
    echo "  export OBSIDIAN_VAULT_PATH=\"/path/to/your/vault\""
    exit 1
fi

if [ ! -d "$OBSIDIAN_VAULT_PATH" ]; then
    echo "Error: $OBSIDIAN_VAULT_PATH does not exist or is not a directory."
    exit 1
fi

VAULT="$OBSIDIAN_VAULT_PATH"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES_DIR="$SKILL_ROOT/templates"

required_templates=(
    "ME.md"
    "AGENT.md"
    "CLAUDE.md"
    "AGENTS.md"
    "methodology.md"
)

for f in "${required_templates[@]}"; do
    if [ ! -f "$TEMPLATES_DIR/$f" ]; then
        echo "Error: template $f not found in $TEMPLATES_DIR"
        exit 1
    fi
done

echo "Setting up Personal API ($MODE mode)..."
echo "Vault: $VAULT"
echo ""

copy_if_missing() {
    local src="$1"
    local dst="$2"
    local label="$3"
    if [ ! -f "$dst" ]; then
        mkdir -p "$(dirname "$dst")"
        cp "$src" "$dst"
        echo "Created $label"
    else
        echo "Preserved existing $label"
    fi
}

ensure_file() {
    local path="$1"
    local label="$2"
    if [ ! -f "$path" ]; then
        mkdir -p "$(dirname "$path")"
        touch "$path"
        echo "Created stub $label"
    else
        echo "Preserved existing $label"
    fi
}

create_vault_gitignore_if_missing() {
    local path="$VAULT/.gitignore"
    if [ ! -f "$path" ]; then
        cat > "$path" <<'EOF'
# Personal API generated vault files can contain private identity context.
# Keep filled-in identity contracts out of public repositories unless you
# intentionally want to version them in a private repo.

ME.md
AGENT.md
CLAUDE.md
AGENTS.md

.obsidian/
.trash/
.DS_Store
EOF
        echo "Created .gitignore"
    else
        echo "Preserved existing .gitignore"
    fi
}

echo "Track A — Identity Archive"

mkdir -p "$VAULT/00.context/projects/active"
mkdir -p "$VAULT/00.context/projects/archived"
mkdir -p "$VAULT/10.identity"
mkdir -p "$VAULT/20.skills"
mkdir -p "$VAULT/40.memory-stream/daily"
mkdir -p "$VAULT/40.memory-stream/reflections"
mkdir -p "$VAULT/50.maps"

copy_if_missing "$TEMPLATES_DIR/ME.md"              "$VAULT/ME.md"        "ME.md"
copy_if_missing "$TEMPLATES_DIR/AGENT.md"           "$VAULT/AGENT.md"     "AGENT.md"
copy_if_missing "$TEMPLATES_DIR/CLAUDE.md"          "$VAULT/CLAUDE.md"    "CLAUDE.md"
copy_if_missing "$TEMPLATES_DIR/AGENTS.md"          "$VAULT/AGENTS.md"    "AGENTS.md"
create_vault_gitignore_if_missing

ensure_file "$VAULT/00.context/now.md"                         "00.context/now.md"
ensure_file "$VAULT/00.context/open-questions.md"              "00.context/open-questions.md"
ensure_file "$VAULT/00.context/projects/project-overview.md"   "00.context/projects/project-overview.md"
ensure_file "$VAULT/10.identity/values.md"                     "10.identity/values.md"
ensure_file "$VAULT/10.identity/vision.md"                     "10.identity/vision.md"
ensure_file "$VAULT/10.identity/thinking-models.md"            "10.identity/thinking-models.md"
ensure_file "$VAULT/10.identity/strengths-gaps.md"             "10.identity/strengths-gaps.md"
ensure_file "$VAULT/50.maps/index.md"                          "50.maps/index.md"
ensure_file "$VAULT/50.maps/skills-map.md"                     "50.maps/skills-map.md"
ensure_file "$VAULT/40.memory-stream/milestones.md"            "40.memory-stream/milestones.md"

if [ "$MODE" = "full" ]; then
    echo ""
    echo "Track B — Knowledge Production"

    mkdir -p "$VAULT/30.knowledge/00.system"
    mkdir -p "$VAULT/30.knowledge/10.capture/inbox"
    mkdir -p "$VAULT/30.knowledge/10.capture/raw"
    mkdir -p "$VAULT/30.knowledge/20.intelligence/ai"
    mkdir -p "$VAULT/30.knowledge/20.intelligence/business"
    mkdir -p "$VAULT/30.knowledge/30.research"
    mkdir -p "$VAULT/30.knowledge/40.notes/literature"
    mkdir -p "$VAULT/30.knowledge/40.notes/permanent"
    mkdir -p "$VAULT/30.knowledge/40.notes/moc"
    mkdir -p "$VAULT/30.knowledge/50.frameworks/technical"
    mkdir -p "$VAULT/30.knowledge/50.frameworks/operation"
    mkdir -p "$VAULT/30.knowledge/60.projects"
    mkdir -p "$VAULT/30.knowledge/70.outputs"
    mkdir -p "$VAULT/30.knowledge/90.archive"

    copy_if_missing "$TEMPLATES_DIR/methodology.md" \
                    "$VAULT/30.knowledge/00.system/methodology.md" \
                    "30.knowledge/00.system/methodology.md"
fi

echo ""
echo "Setup complete."
echo ""
echo "Next steps:"
echo "  1. Open $VAULT in Obsidian."
echo "  2. Fill in ME.md with your real identity context."
echo "  3. Fill in AGENT.md with your collaboration rules."
if [ "$MODE" = "full" ]; then
    echo "  4. Read 30.knowledge/00.system/methodology.md before using AI for knowledge production."
    echo "  5. Tell your AI: \"Read my ME.md and AGENT.md to understand my context.\""
else
    echo "  4. Tell your AI: \"Read my ME.md and AGENT.md to understand my context.\""
fi
echo ""
echo "Privacy reminder:"
echo "  Filled-in ME.md and AGENT.md contain personal context."
echo "  Keep them private unless you intentionally version them in a private repo."
