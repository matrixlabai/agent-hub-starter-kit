# Agent Hub rules

1. Safety and owner instructions outrank convenience.
2. One root, one owner per fact, and no parallel copies of mutable truth.
3. Secrets and account state never enter version control or agent output.
4. External writes, destructive actions, and account changes require explicit approval.
5. Temporary files and generated output stay outside the repository.
6. Load context lazily: boot files, then one domain, one skill, and only required references.
7. The main agent owns decisions and verification; workers receive bounded scopes.
8. Every completion claim cites fresh evidence produced after the last change.
9. Prefer small, reversible changes and update existing canonical documents.
10. Meaningful framework changes receive one concise entry in `hub/LOG.md`.

## Placement test

- Reusable execution capability: `skills`
- Owner-specific context or state: `domains`
- Reusable reference material: `knowledge`
- Machine-specific integration: `platform`
- Governance, memory contract, or protocol: `hub`
- Credential name or local secret binding: `env`
- Worker routing or execution receipt: `orchestrator`
