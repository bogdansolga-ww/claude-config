# Claude Code Workshop

Configuration for Claude Code workshops.

## Install

**Global** (user-level):
```bash
git clone <repo-url> ~/.claude-config
~/.claude-config/install.sh
```

**Project** (symlinks commands to a project):
```bash
~/.claude-config/scripts/project-install.sh /path/to/project
```

## Claude Code Extensibility

| Type | Description |
|------|-------------|
| **Tools** | Local applications and scripts (OS specific) |
| **Commands** | Structured prompts as Markdown files |
| **Skills** | Instructions, scripts, resources (e.g., superpowers) |
| **Hooks** | Deterministic scripts invoked during sessions |
| **MCP Servers** | External system integrations |
| **Plugins** | Bundles of commands, agents, hooks, skills, MCPs |

## Contents

```
commands/          # 20 commands
├── git/           # catchup, commit, sync, cleanup, push/pull
├── pr/            # checks, create, merge, review
├── quality/       # quick-fix, find-large-files, simplify
└── workflow/      # task-declarative

skills/            # Custom skills
config/            # Settings (config.json, settings.json)
scripts/           # Status line, git hooks, utilities
docs/              # Documentation
```

- [docs/commands.md](docs/commands.md) - Full commands reference
- [docs/skills.md](docs/skills.md) - Superpowers skills guide

## Git Hooks & Architecture Checks

TypeScript project hooks enforcing code quality and architecture patterns.

| Check | Pre-commit | Pre-push |
|-------|------------|----------|
| Type Check | ✓ | ✓ |
| Lint | ✓ | ✓ |
| Tests | | ✓ |
| Architecture Hierarchy | ✓ | ✓ |
| Schema Location | ✓ | ✓ |
| Deep Architecture | ✓ | ✓ |
| File Size | | ✓ (warning) |

**Integration options:**
- **Git hooks** - automatic on commit/push (also when Claude does git ops)
- **Claude Code hooks** - run during Claude sessions
- **Manual** - execute scripts directly when needed

```bash
# Install git hooks to a project
~/.claude-config/scripts/git-hooks/install.sh /path/to/project

# Run standalone (without git)
./scripts/git-hooks/pre-commit
./scripts/git-hooks/pre-push
```

See [docs/checks.md](docs/checks.md) for full documentation.

## Update

```bash
cd ~/.claude-config && git pull
```
