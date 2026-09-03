# Handoff protocol

A handoff lets a fresh agent continue without replaying the whole session.

## Required fields

- objective and owner intent
- verified current state
- changed paths and commit identifiers
- commands run and their results
- unresolved blockers and safety gates
- exact next action
- paths to canonical context and evidence

Do not copy secret values, transient logs, or narrated work into a handoff. Update the current
session state and store detailed history in a dated local handoff when needed.
