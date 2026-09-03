# Agent Hub instructions

Before substantial work:

1. Read `agent-hub.manifest.json`.
2. If local state is absent, follow `docs/AGENT-INTEGRATION.md` before normal work.
3. Read `hub/protocols/BOOT.md`.
4. Read `hub/core/SACRED.md`.
5. Read `hub/memory/SESSION_STATE.md` when it exists.
6. Read the nearest `AGENTS.md` before changing files in a nested scope.

Core rules:

- The main agent owns scope, judgment, integration, verification, and final claims.
- Delegate only bounded, separable work with exact paths and explicit write limits.
- Never print, copy, commit, or summarize credential values.
- Destructive or external account actions require explicit owner approval.
- Keep temporary output outside this repository.
- Put reusable capability in `skills`, owner-specific truth in `domains`, reusable
  reference material in `knowledge`, and machine glue in `platform`.
- Update `hub/LOG.md` for meaningful framework changes.

An uninitialized clone is identified by a missing `hub/memory/SESSION_STATE.md` or
`env/REGISTRY.md`. Never fill either file with guessed values. Run `setup.ps1`, ask the owner only
for information required by the active task, and finish with `doctor.ps1`.
