# Environment and credential metadata

This directory contains only public examples. Local setup creates ignored files for:

- `local.env`: local variable bindings
- `REGISTRY.md`: credential names and lifecycle metadata, never values
- `secrets/`: optional local file-shaped credentials

Prefer an operating-system secret manager for values. Never commit generated local files.
