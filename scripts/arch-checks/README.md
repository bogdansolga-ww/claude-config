# Architecture Checks

Bash scripts to enforce layered architecture in TypeScript projects.

## Scripts

| Script | Purpose |
|--------|---------|
| `check-architecture.sh` | Layer hierarchy (pages → routes → services → repos) |
| `check-schemas.sh` | No inline Zod schemas in routes/services |
| `check-deep-architecture.sh` | HOF patterns, auth, domain errors, layer purity |

## Setup

1. Copy scripts to your project:
   ```bash
   cp scripts/arch-checks/*.sh your-project/scripts/
   cp scripts/arch-checks/arch-checks.conf your-project/scripts/
   ```

2. Edit `scripts/arch-checks.conf` for your project structure.

3. Make executable:
   ```bash
   chmod +x scripts/check-*.sh
   ```

## Configuration

Edit `arch-checks.conf` in your project's `scripts/` directory:

```bash
# Layer patterns (regex)
PAGE_PATTERN='src/app/.*page\.tsx$'
ROUTE_PATTERN='src/app/api/.*route\.ts$'
SERVICE_PATTERN='src/lib/services/.*\.ts$'

# Forbidden imports per layer (space-separated)
PAGE_FORBIDDEN='@/lib/services @/lib/repositories @/lib/core/db'
ROUTE_FORBIDDEN='@/lib/repositories @/lib/core/db'
SERVICE_FORBIDDEN='@/lib/core/db'

# Schema locations
SCHEMA_LOCATION='src/lib/schemas/'
SCHEMA_CHECK_ROUTES='src/app/api'
SCHEMA_CHECK_SERVICES='src/lib/services'

# Deep checks paths
REPO_LAYER_PATH='src/lib/repositories'
ROUTES_PATH='src/app/api/v1'
SERVICES_PATH='src/lib/services'

# Function names for HOF/auth checks
HOF_FUNCTION='withErrorHandling'
AUTH_FUNCTION='withAuth'
```

## Usage

```bash
# Full check (pre-push)
./scripts/check-architecture.sh
./scripts/check-schemas.sh
./scripts/check-deep-architecture.sh

# Staged files only (pre-commit)
./scripts/check-architecture.sh --staged
./scripts/check-schemas.sh --staged
```

## Git Hooks Integration

The scripts integrate with the git hooks in `scripts/git-hooks/`. The hooks auto-detect and run these checks if present.
