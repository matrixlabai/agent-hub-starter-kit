# Agent integration contract

Use this procedure when an agent opens a fresh clone or integrates the framework into an existing
workspace.

## Detect state

Read `agent-hub.manifest.json`. The clone is uninitialized when either
`hub/memory/SESSION_STATE.md` or `env/REGISTRY.md` is absent. These files are local-only and must
never be committed.

## Fresh installation

1. Inspect the repository status and confirm there is no unrelated local work.
2. Run `setup.ps1` from the repository root.
3. Ask the owner for an agent identifier only if the default is unsuitable.
4. Replace the example session-state row with the owner's first real objective.
5. Register credential names only when a task actually needs them; never request values in chat.
6. Run `doctor.ps1` and report its exact result.

## Integration into an existing workspace

1. Inventory structure and references without reading secret values.
2. Classify every candidate item as governance, domain truth, reusable skill, reusable knowledge,
   machine integration, credential metadata, or disposable output.
3. Produce an explicit allowlist and exclusion list before copying anything.
4. Keep existing credential stores, browser state, session history, and account data in place.
5. Import one vertical slice at a time and update its canonical routing door.
6. Run the relevant component verification and `doctor.ps1` after each slice.

## Skill routing

- External platform or execution boundary: `skills/controls/<name>/SKILL.md`
- End-to-end repeatable workflow: `skills/os/<name>/SKILL.md`
- Reusable method without a platform or lifecycle boundary: `skills/general/<name>/SKILL.md`

Create no skill until a real trigger exists. Register each active skill in `skills/INDEX.md`.
Controls remain tenant-neutral; owner-specific settings belong in domain profiles and credential
values remain local.

## Required completion evidence

- initialized local-only files remain ignored and untracked
- every created domain and skill has one canonical door
- no private data, secret value, account state, absolute user path, or machine identity is tracked
- PowerShell scripts parse successfully
- `doctor.ps1` exits successfully
- the exact Git diff contains only intended framework or local-owner changes

If any gate fails, stop before commit or push and report the precise blocker.
