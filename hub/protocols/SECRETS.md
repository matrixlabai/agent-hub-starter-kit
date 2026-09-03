# Secrets protocol

## Invariants

- Secret values never enter version control, prompts, logs, reports, screenshots, or chat output.
- Public files may name an environment variable but never contain its value.
- Account state, cookies, browser profiles, recovery codes, and private keys are secret material.
- Use one local secret store or operating-system secret manager as the value authority.

## Discovery

Use `env/REGISTRY.md` to discover the credential name, provider, account label, lifecycle state,
and local source. The registry is local and ignored. Do not scan arbitrary files for values.

## Change procedure

1. Confirm the exact provider, account, target, and authority.
2. Write the value through a hidden-input or secret-manager workflow.
3. Verify authentication without printing the value.
4. Record only metadata in the local registry.
5. Run the public-safety scanner before any commit or push.

A credential found in version control is compromised. Revoke or rotate it; deleting the line is
not sufficient because history retains it.
