# Architecture

Agent Hub is a routing architecture, not a large prompt. Every fact has one owner and every
session loads only the smallest context needed for the current task.

## Ownership boundaries

| Zone | Owns | Must not own |
|---|---|---|
| `hub` | Rules, boot, protocols, memory contract, reports | Business facts or credentials |
| `domains` | Context and state for one business, project, or person | Reusable platform logic |
| `skills` | Control skills, OS workflows, and general methods | Tenant identity or secret values |
| `knowledge` | Reusable distilled reference material | Runtime state |
| `orchestrator` | Worker contracts, routing, receipts | Final judgment |
| `platform` | Machine-specific setup and scripts | Cross-domain truth |
| `env` | Credential names and ignored local values | Published credential values |

## Context flow

```text
Boot protocol
  -> current session state
  -> one domain door when owner context is needed
  -> one skill door when execution capability is needed
  -> bounded worker task when work is separable
  -> verification evidence
  -> concise log and state update
```

## Domain contract

Each real domain starts with:

- `BRAIN.md`: the routing door and hard boundaries
- `FACTS.md`: canonical values with verification dates
- `STATE.md`: current work, blockers, and next action
- `profiles/`: domain-specific configuration for reusable skills, never executable code

## Skill system

One skill is one directory containing `SKILL.md`. Control skills own external boundaries, OS
skills own end-to-end workflows, and general skills own reusable methods. Every skill declares its
trigger, finish line, inputs, outputs, ordered procedure, safety gates, and verification evidence.

## Delegation contract

A worker brief contains only an objective, working directory, required paths, allowed writes,
exclusions, required artifact, and verification/stopping condition. Workers return evidence;
the main agent decides whether the result is usable.
