# Sync protocol

## Before work

1. Inspect the current branch and working tree.
2. Fetch or pull only when doing so cannot overwrite local work.
3. Resolve ownership and scope before editing shared files.

## After work

1. Run the relevant verification commands.
2. Run the public-safety scanner.
3. Review the exact diff and staged paths.
4. Commit only task-owned changes with a concise message.
5. Push and verify the remote commit and automated checks.

Never force-push or rewrite shared history without explicit approval.
