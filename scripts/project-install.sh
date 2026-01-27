#!/bin/bash
# project-install.sh - Install commands into a project's .claude folder

set -e

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

if [ -z "$1" ]; then
  echo "Usage: $0 <project-path>"
  echo "Example: $0 /path/to/my-project"
  exit 1
fi

PROJECT_DIR="$1"

if [ ! -d "$PROJECT_DIR" ]; then
  echo "Error: Project directory does not exist: $PROJECT_DIR"
  exit 1
fi

CLAUDE_DIR="$PROJECT_DIR/.claude"

echo "Installing commands to $CLAUDE_DIR..."
echo ""

# Create .claude/commands directory
mkdir -p "$CLAUDE_DIR/commands"

# Copy command categories (additive - preserves existing user commands)
for category in git pr quality workflow; do
  if [ -d "$REPO_DIR/commands/$category" ]; then
    mkdir -p "$CLAUDE_DIR/commands/$category"
    cp -R "$REPO_DIR/commands/$category/." "$CLAUDE_DIR/commands/$category/"
    echo "  Copied commands/$category"
  fi
done

# Copy status line script
mkdir -p "$CLAUDE_DIR/scripts"
cp "$REPO_DIR/scripts/status-line.sh" "$CLAUDE_DIR/scripts/status-line.sh"
chmod +x "$CLAUDE_DIR/scripts/status-line.sh"
echo "  Copied scripts/status-line.sh"

echo ""
echo "Installation complete!"
echo ""
echo "Commands available in $PROJECT_DIR:"
echo "  /git:catchup  /git:commit  /git:sync  /git:cleanup"
echo "  /git:push:nix  /git:push:workwave  /git:pull:nix  /git:pull:workwave"
echo "  /pr:checks  /pr:create  /pr:review:local  /pr:review:ci  /pr:merge"
echo "  /quality:quick-fix  /quality:find-large-files  /quality:simplify"
echo "  /workflow:task-declarative"
