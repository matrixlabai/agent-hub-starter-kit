# Security policy

## Never commit

- API keys, tokens, passwords, recovery codes, cookies, or private keys
- Browser profiles, authentication databases, or account exports
- Personal, customer, financial, or confidential business data
- Local session history or agent runtime state
- Absolute user-profile paths or internal infrastructure addresses

Store local values in `env/local.env`, which is ignored, or use an external secret manager.
Keep only credential names and lifecycle metadata in `env/REGISTRY.md`.

## Before every push

Run:

```powershell
.\doctor.ps1
```

The scanner checks tracked files for common credential formats, private-key material,
forbidden runtime paths, and files that belong only in local state. This is a safety net,
not permission to copy a private workspace into this repository.

## Reporting

Do not open a public issue containing a secret. Revoke or rotate the credential first, then
contact the repository owner through a private channel.
