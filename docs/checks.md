# Architecture & Quality Checks

Pre-commit and pre-push checks for TypeScript projects enforcing architecture patterns and code quality.

## Available Checks

| Check | Pre-commit | Pre-push | Blocking |
|-------|------------|----------|----------|
| Type Check | Yes | Yes | Yes |
| Lint (Biome) | Yes | Yes | Yes |
| Unit Tests | No | Yes | Yes |
| Architecture Hierarchy | Yes | Yes | Yes |
| Schema Location | Yes | Yes | Yes |
| Deep Architecture | Yes | Yes | Yes (errors only) |
| File Size | No | Yes | Warning only |

## Architecture Checks

Configurable scripts in `scripts/arch-checks/`. See [arch-checks README](../scripts/arch-checks/README.md) for full configuration options.

### Hierarchy Check (`check-architecture.sh`)
Enforces layer separation: **pages → API routes → services → repositories**

- Pages cannot import services, repositories, or db
- API routes cannot import repositories or db
- Services cannot import db directly

### Schema Location Check (`check-schemas.sh`)
Ensures Zod schemas are centralized (default: `@/lib/schemas/`), not defined inline in routes or services.

### Deep Architecture Check (`check-deep-architecture.sh`)
Additional validations:
- Repository layer purity (no HTTP imports)
- Services throw domain errors (not generic Error)
- Routes don't import repositories directly
- HOF pattern usage (configurable function name)
- Authentication presence (configurable function name)

## Integration Methods

### 1. Git Hooks (Automatic)
Hooks run automatically on `git commit` and `git push`.

```bash
# Install git hooks
~/.claude-config/scripts/git-hooks/install.sh /path/to/project

# Install architecture check scripts
cp ~/.claude-config/scripts/arch-checks/check-*.sh /path/to/project/scripts/
cp ~/.claude-config/scripts/arch-checks/arch-checks.conf /path/to/project/scripts/
# Edit scripts/arch-checks.conf for your project structure
```

When using Claude Code for git operations, hooks execute automatically.

### 2. Claude Code Hooks
Add to `.claude/settings.json` to run checks during Claude sessions:

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "if echo \"$TOOL_INPUT\" | grep -q 'git commit'; then ./scripts/check-architecture.sh --staged; fi"
          }
        ]
      }
    ]
  }
}
```

### 3. Manual / On-Demand
Run checks directly when needed:

```bash
# Individual checks
./scripts/check-architecture.sh          # All files
./scripts/check-architecture.sh --staged # Staged files only
./scripts/check-schemas.sh
./scripts/check-deep-architecture.sh

# Via git hooks (standalone)
./.git/hooks/pre-commit
./.git/hooks/pre-push
```

## File Size Thresholds

| File Type | Limit (lines) |
|-----------|---------------|
| Components (*.tsx) | 400 |
| Services (*.service.ts) | 500 |
| Other (*.ts) | 300 |

## Bypassing Checks

```bash
git commit --no-verify  # Skip pre-commit
git push --no-verify    # Skip pre-push
```

Use sparingly and with good reason.
