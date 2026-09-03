# Orchestrator

The orchestrator boundary connects a main agent to bounded workers. This starter kit ships the
contract and a value-free route template, not provider credentials or account configuration.

Copy `routes.example.json` to the ignored `routes.local.json` and configure only providers you
are authorized to use.

Every worker brief must contain:

- exact objective
- exact working directory
- required input and target paths
- allowed writes
- explicit exclusions
- required artifact or compact response
- verification and stopping condition

The main agent inspects every artifact and retains scope, judgment, canonical writes,
verification, and the user-facing answer. An exit code alone is not completion evidence.
