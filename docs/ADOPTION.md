# Adoption guide

## Start clean

Do not copy an existing home directory or agent workspace wholesale. Begin with this template,
then import one category at a time through an explicit allowlist.

## Recommended sequence

1. Run `setup.ps1` and `doctor.ps1`.
2. Customize the local session state and value-free credential registry.
3. Create one domain from `domains/_template`.
4. Add only the skills needed by that domain.
5. Add reusable knowledge only after removing private and business-specific material.
6. Configure one local worker route and test it with a read-only task.
7. Add automation only after its manual workflow is verified.

## Import gate

For every imported path, answer:

- Is it reusable framework, owner-specific truth, machine glue, or disposable output?
- Does it contain identities, absolute paths, account IDs, internal URLs, or credentials?
- Is its license compatible with public redistribution?
- What command proves the imported component works?

Anything without a clear owner or verification command stays out.
