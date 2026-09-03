# Agent Hub Starter Kit

A portable, local-first operating framework for AI agents. It separates governance,
capabilities, domains, knowledge, machine integration, credentials, and delegated work so
agents can find the right context without loading an entire workspace.

This repository is a clean-room starter template. It contains no user data, business data,
credentials, account state, session history, or machine-specific configuration.

## Quick start on Windows

Requirements: Git and PowerShell 7 or Windows PowerShell 5.1.

```powershell
git clone <repository-url>
cd agent-hub-starter-kit
.\setup.ps1
.\doctor.ps1
```

Then point your coding agent at the repository-level `AGENTS.md` and start a new session.
An agent can perform the setup itself by following
[the agent integration contract](docs/AGENT-INTEGRATION.md).

## The seven zones

```text
agent-hub-starter-kit/
|-- hub/           Governance, boot protocol, memory contract, and change log
|-- domains/       Business, project, or personal context owned by one domain
|-- skills/        Control skills, OS skills, and general skills
|-- knowledge/     Reusable reference material
|-- orchestrator/  Bounded worker-routing contracts and local route configuration
|-- platform/      Machine-specific scripts and documentation
`-- env/           Value-free credential registry and ignored local secret storage
```

## Operating model

1. Start every substantial agent session with `hub/protocols/BOOT.md`.
2. Route domain work through that domain's `BRAIN.md`.
3. Route reusable execution through one matching `SKILL.md`.
4. Keep credential values only in ignored local files or an external secret manager.
5. Keep temporary output outside the repository.
6. Delegate only bounded work; the main agent owns decisions and verification.

## Customize safely

- Copy `domains/_template` to create a real domain.
- Choose `skills/controls`, `skills/os`, or `skills/general`, then copy its `_template`.
- Configure worker routes locally from `orchestrator/routes.example.json`.
- Record credential names, never values, in `env/REGISTRY.md`.

Read [the architecture guide](docs/ARCHITECTURE.md) and
[the adoption guide](docs/ADOPTION.md) before importing existing material.

## Security promise

The repository ships with deny-by-default ignore rules, a public-safety scanner, and CI.
Run `doctor.ps1` before every push. See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).
