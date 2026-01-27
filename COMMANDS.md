# Commands Reference

## Git

| Command | Description |
|---------|-------------|
| `git:catchup` | Analyze recent work from previous session(s) |
| `git:commit` | Create succinct commit message for current changes |
| `git:sync` | Sync branch with main/master, handle conflicts |
| `git:cleanup` | Delete merged local branches |
| `git:push:nix` | Push using `~/.ssh/nix` key |
| `git:push:workwave` | Push using `~/.ssh/workwave` key |
| `git:pull:nix` | Pull using `~/.ssh/nix` key |
| `git:pull:workwave` | Pull using `~/.ssh/workwave` key |
| `git:remote-add:nix <url>` | Add remote using nix key |
| `git:remote-add:workwave <url>` | Add remote using workwave key |

## PR

| Command | Description |
|---------|-------------|
| `pr:checks` | Run lint, types, tests before PR |
| `pr:create [nix\|workwave]` | Generate PR summary and create PR (optional SSH key) |
| `pr:merge` | Squash merge with structured message |
| `pr:code-rabbit` | Process CodeRabbit review comments |
| `pr:review:local` | Dispatch local agent for code review |
| `pr:review:ci` | Trigger Claude GitHub Action review |

## Quality

| Command | Description |
|---------|-------------|
| `quality:quick-fix` | Small fixes without heavy workflow |
| `quality:find-large-files` | Find large files, recommend splits |
| `quality:simplify` | Review for unnecessary complexity |

## Workflow

| Command | Description |
|---------|-------------|
| `workflow:task-declarative` | Define success criteria, let agent loop until done |
