# Toolbox

This is the value-free registry of capabilities available to agents. Add a tool only after it is
installed and verified locally. Never record credential values here.

## Tool registry

| Task | Tool or skill door | Platform | Safety tier | Verified |
|---|---|---|---|---|
| Example task | `skills/<category>/<name>/SKILL.md` | local | read | YYYY-MM-DD |

## Safety tiers

| Tier | Meaning | Required gate |
|---|---|---|
| read | No external or persistent mutation | None |
| write | Reversible local or external change | Clear task authorization and read-back |
| destructive | Delete, overwrite, force, revoke, or irreversible mutation | Explicit approval and recovery plan |
| credential | Create, change, transmit, or remove authentication material | Explicit approval and exact target verification |

## Selection rules

1. Prefer deterministic local tools over model calls.
2. Prefer one purpose-built control over browser improvisation.
3. Inspect live capabilities before assuming a command or account exists.
4. Keep provider, credential profile, model, and route separate.
5. Treat process exit as a receipt, not proof; verify the resulting state.
