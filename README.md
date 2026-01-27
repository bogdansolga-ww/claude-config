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
commands/          # 20 commands - see COMMANDS.md
├── git/           # catchup, commit, sync, cleanup, push/pull
├── pr/            # checks, create, merge, review
├── quality/       # quick-fix, find-large-files, simplify
└── workflow/      # task-declarative

skills/            # Custom skills - see SKILLS.md
config/            # Settings (config.json, settings.json)
scripts/           # Status line, utilities
```

- [COMMANDS.md](COMMANDS.md) - Full commands reference
- [SKILLS.md](SKILLS.md) - Superpowers skills guide

## Git Hooks

TypeScript project hooks for pre-commit (type-check, lint) and pre-push (+ tests, file size).

**Install to a project:**
```bash
~/.claude-config/scripts/git-hooks/install.sh /path/to/project
```

**Run standalone** (without git, for CI or manual checks):
```bash
./scripts/git-hooks/pre-commit   # Type-check + lint
./scripts/git-hooks/pre-push     # Full suite
```

Hooks auto-detect package manager (bun/pnpm/yarn/npm) and skip missing scripts.

## Update

```bash
cd ~/.claude-config && git pull
```
