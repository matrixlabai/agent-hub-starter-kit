# Storage protocol

Define storage roles locally instead of hardcoding drives or user paths.

| Role | Purpose | Required property |
|---|---|---|
| repository | Versioned framework and durable text/code | Backed by Git |
| work | Disposable task output, caches, renders, and staging | Safe to remove after retention |
| data | Durable domain data that does not belong in Git | Backed up |
| archive | Cold historical material | Verified and access-controlled |

## Rules

1. Configure concrete roots only in ignored local configuration.
2. Temporary material never becomes the only copy of an original.
3. Reports contain conclusions; large raw evidence stays outside the repository.
4. Never move or retire data without the migration protocol.
5. Destructive cleanup requires explicit approval and recoverable staging.
