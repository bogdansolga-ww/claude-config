# Claude Code Workshop

Configuration for Claude Code workshops.

## Install

```bash
git clone <repo-url> ~/.claude-config
~/.claude-config/install.sh
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

## Update

```bash
cd ~/.claude-config && git pull
```
