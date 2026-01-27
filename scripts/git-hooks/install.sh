#!/bin/bash

# Install git hooks to a project
# Usage: ./install.sh [project-path]
#   project-path: Target project (default: current directory)
#
# Can also be run standalone:
#   ./pre-commit   # Run pre-commit checks without git
#   ./pre-push     # Run pre-push checks without git

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

# Resolve to absolute path
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

# Verify it's a git repository
if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Error: $TARGET_DIR is not a git repository"
    exit 1
fi

HOOKS_DIR="$TARGET_DIR/.git/hooks"

echo "Installing git hooks to: $TARGET_DIR"
echo ""

# Copy hooks
for hook in pre-commit pre-push; do
    if [ -f "$SCRIPT_DIR/$hook" ]; then
        cp "$SCRIPT_DIR/$hook" "$HOOKS_DIR/$hook"
        chmod +x "$HOOKS_DIR/$hook"
        echo "  ✓ Installed $hook"
    fi
done

echo ""
echo "Done! Hooks will run automatically on commit and push."
echo ""
echo "Standalone usage (without git):"
echo "  $HOOKS_DIR/pre-commit   # Run commit checks"
echo "  $HOOKS_DIR/pre-push     # Run push checks"
