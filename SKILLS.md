# Skills Reference

Skills are reusable workflows that guide Claude through tasks with battle-tested approaches. They trigger automatically - describe your task and Claude detects which skill applies.

## Installation

Add to `.claude/settings.json`:

```json
{
  "plugins": [
    {
      "name": "superpowers",
      "url": "https://github.com/obra/superpowers",
      "enabled": true
    }
  ]
}
```

## Top Skills

### brainstorming

**Trigger**: New features, design decisions, creative work

**Process**:
1. Checks project context (files, docs, commits)
2. Asks clarifying questions one at a time
3. Proposes 2-3 approaches with tradeoffs
4. Presents design in sections for validation
5. Writes design to `docs/plans/YYYY-MM-DD-<topic>-design.md`

**Example**:
```
You: "Add user authentication"

Claude (brainstorming):
→ "Who are the users? [Internal / Public / Both]"
→ "What auth method? [Password / OAuth / SSO]"
→ [Proposes JWT vs Session approaches]
→ [Writes design doc]
```

### dispatching-parallel-agents / subagent-driven-development

**Trigger**: 2+ independent tasks without shared state

**Process**:
- Identifies truly independent work
- Spawns concurrent subagents
- Coordinates results
- Two-stage review: spec compliance, then code quality

**When to use**:
```
Good: "Build API endpoint AND write tests AND update docs"
      (3 independent tasks)

Bad:  "Build API, then test it, then document it"
      (sequential dependencies)
```

### requesting-code-review / receiving-code-review

**Trigger**: Completing tasks, major features, before merging

**requesting-code-review**:
- Applies pre-review checklist
- Verifies work meets requirements
- Prepares code for review

**receiving-code-review**:
- Requires technical rigor in responses
- Avoids performative agreement
- Verifies suggestions before implementing

**Key insight**: Don't blindly implement feedback. Verify it makes sense.

## Skill Priority

When multiple skills apply:

1. **Process skills first**: brainstorming, systematic-debugging
2. **Implementation skills second**: TDD, frontend-design

```
"Fix this bug" → systematic-debugging → test-driven-development
"Build a feature" → brainstorming → writing-plans → executing-plans
```

## All Superpowers Skills

| Skill | Trigger |
|-------|---------|
| `brainstorming` | New features, design decisions |
| `writing-plans` | Multi-step implementations |
| `test-driven-development` | Bug fixes, new features |
| `systematic-debugging` | Bugs, test failures |
| `verification-before-completion` | Before claiming work done |
| `dispatching-parallel-agents` | Independent concurrent tasks |
| `subagent-driven-development` | Plan execution with agents |
| `requesting-code-review` | Before merging |
| `receiving-code-review` | Processing review feedback |
| `using-git-worktrees` | Feature work needing isolation |
| `finishing-a-development-branch` | Ready to integrate |
