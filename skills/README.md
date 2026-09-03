# Skills

Skills are reusable, domain-neutral capabilities. A skill exists only when its directory has a
`SKILL.md` that defines a trigger, finish line, inputs, outputs, safety gates, and verification.

Three categories exist:

- `controls`: one external platform or execution boundary; atomic operations and safety gates
- `os`: an end-to-end workflow that may coordinate multiple controls and general skills
- `general`: reusable methods that are neither a platform boundary nor a full workflow

Choose the category first, then copy its `_template`. Do not store account IDs, business facts,
machine paths, or credentials in any skill.
