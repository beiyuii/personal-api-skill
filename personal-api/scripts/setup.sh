#!/usr/bin/env bash
set -e

# Personal API Setup Script
# Scaffolds the personal identity layer in your Obsidian vault

VAULT="${OBSIDIAN_VAULT_PATH:-$HOME/Documents/Obsidian Vault}"
SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up Personal API in your vault..."
echo "   Vault path: $VAULT"

# Create vault structure if not exists
mkdir -p "$VAULT/00.context"
mkdir -p "$VAULT/10.identity"
mkdir -p "$VAULT/20.skills"
mkdir -p "$VAULT/30.knowledge"
mkdir -p "$VAULT/40.memory-stream/daily"
mkdir -p "$VAULT/40.memory-stream/reflections"
mkdir -p "$VAULT/50.maps"

# Copy templates
if [ ! -f "$VAULT/ME.md" ]; then
    cp "$SKILL_DIR/../templates/ME.md" "$VAULT/ME.md"
    echo "Created ME.md"
else
    echo "ME.md already exists, skipping"
fi

if [ ! -f "$VAULT/AGENT.md" ]; then
    cp "$SKILL_DIR/../templates/AGENT.md" "$VAULT/AGENT.md"
    echo "Created AGENT.md"
else
    echo "AGENT.md already exists, skipping"
fi

# Create placeholder files for linked notes
touch "$VAULT/00.context/now.md"
touch "$VAULT/10.identity/vision.md"
touch "$VAULT/50.maps/skills-map.md"

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Ensure OBSIDIAN_VAULT_PATH env var points to your vault"
echo "2. Edit $VAULT/ME.md - fill in the placeholders marked with [brackets]"
echo "3. Edit $VAULT/AGENT.md - define how AI assistants should behave with you"
echo ""
echo "Once filled, tell any Hermes Agent: 'Read my ME.md to understand my context.'"
