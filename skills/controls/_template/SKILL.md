---
name: replace-control
description: Use when operating one named external boundary.
category: control
status: draft
---

# Control skill

## Boundary

Name the platform or execution surface and the operations this control owns.

## Operations

| Operation | Safety tier | Verification |
|---|---|---|
| read | read | Return current state |
| write | write | Re-read the exact target |

## Credential contract

Name required environment variables only. Never include values or fixed account identifiers.

## Failure modes

Define stable errors, exit codes, retries, and stop conditions.
