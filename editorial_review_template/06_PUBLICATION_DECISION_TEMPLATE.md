# Publication Decision Template

The final go/no-go record for a pack (or a specific version of it).
This is the gate between editorial review/verification and the
Release Pipeline: `release_pipeline/` has no awareness of this file at
all - a human reads this section and decides, by their own judgment,
whether to run `release_pipeline/bin/release.dart` against the pack.

Copy this block into `REVIEW_NOTES.md`'s "Publication Decision"
section. Update it in place as the decision changes over time (a
pack's decision can move from "Not Yet Approved" to "Approved for
Release" once its gate closes, or from "Approved" back to "Not Yet
Approved" if a problem is later found - keep the previous decision
visible in `07_VERSION_REVIEW_HISTORY_TEMPLATE.md`'s log rather than
erasing it here).

## Decision

- **Pack:** *(pack_id)*
- **Version under decision:** *(the exact version this decision
  applies to)*
- **Decision:**
  - [ ] **Approved for Release** - every article's `verification_level`
        in the Claim-to-Source Map is fully supported; this exact
        version may be packaged and released via `release_pipeline/`.
  - [ ] **Partially Approved** - specify exactly which articles/scope
        may proceed, and which remain gated:
  - [ ] **Not Yet Approved** - one or more claims are not yet
        verified; nothing in this pack may be packaged or released.
  - [ ] **Rejected** - this pack should not be released as currently
        written; explain why:
- **Decided by:**
- **Date:**
- **Conditions (if Partially Approved):**

## What "Approved for Release" actually authorizes

Approval here means, and only means:

- The pack's manifest `pack_version` may be treated as ready for
  `release_pipeline/bin/release.dart` to be run against it.
- Nothing about the ZIP, checksum, or registry entry is created by
  this decision itself - the Release Pipeline still performs its own
  full, independent checklist (manifest/version consistency,
  structural validation, packaging, checksum, and a registry-
  generation dry run) regardless of what this document says.

## What this decision does not authorize

- It does not authorize creating the real GitHub Release, running the
  real Registry Generator, or touching `registry/registry.json` -
  those remain separate, later, manual steps per
  `release_pipeline/RELEASE_CHECKLIST.md`.
- A "Partially Approved" or "Not Yet Approved" decision means the
  **entire pack** is not release-ready, even if only one article is
  gated - `release_pipeline` releases a whole pack ZIP, not individual
  articles within it. If only some articles are ready, either hold the
  whole pack until the rest close their gates, or - if the project
  ever splits it - treat the ready subset as a distinct pack with its
  own `pack_id` and its own review.

## Hard boundary reminder

Until a version's decision reads **Approved for Release** (or
**Partially Approved** with this version explicitly named as covered):

- No ZIP archive should be built from this pack's folder for
  distribution.
- No checksum should be published anywhere.
- No marketplace listing (Vault Hub, the Official Website) should
  reference this pack.
- This pack must not be described as "official," "released," or
  "published" anywhere outside this editorial record.
