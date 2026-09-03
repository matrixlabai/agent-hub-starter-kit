# Migration protocol

Use this protocol before moving, merging, renaming, retiring, or replacing durable material.

1. Inventory the source and its owner.
2. Scan references to the current path or interface.
3. Create and verify a recoverable backup when Git is not the rollback mechanism.
4. Define source, destination, exclusions, and rollback order.
5. Migrate the smallest viable unit.
6. Update every reference and routing door.
7. Run the owning component's verification.
8. Confirm new writes land only at the destination.
9. Retire the old location only with explicit approval.

Copy success is not migration success. The new owner, references, writes, rollback, and final state
must all be verified.
