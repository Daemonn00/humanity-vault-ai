# Version Review History Template

A running, append-only log of review outcomes across a pack's
versions over time. `official_packs/` only ever holds the *current*
source for a pack (there's no separate folder per historical version),
so this table is what preserves the review history a later reader
would otherwise lose - what changed, what was re-reviewed, and what
the decision was, version by version.

Copy this table into `REVIEW_NOTES.md`'s "Version Review History"
section. **Append a new row every time the pack's version changes and
is reviewed again - never edit or delete a previous row**, even if a
later review reverses an earlier decision; the previous row is the
historical record of what was true at the time.

## History table

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| *(e.g. 1.0.0)* | *(date first reviewed)* | *(e.g. "Initial authoring and first review")* | *(e.g. "1 of 4 articles verified")* | *(names)* | *(link/reference to the Publication Decision recorded at that time)* |
| *(e.g. 1.0.0)* | *(later date)* | *(e.g. "Article 1's FAA source directly reviewed")* | *(e.g. "Article 1 upgraded to Verified Source; 2-4 unchanged")* | *(name)* | *(updated decision)* |
| *(e.g. 1.1.0)* | *(date)* | *(e.g. "Added a fifth article on X")* | *(e.g. "New article pending review; 1-4 unaffected")* | | |

## Why re-review on every version bump

A version bump to an *already-approved* pack still requires its own
row here, even for a small change:

- Adding or editing an article changes what claims exist - the
  Claim-to-Source Map must be updated and the new/changed claims
  reviewed before this new version can be approved.
- `release_pipeline`'s own version-consistency check only confirms
  the manifest's `pack_version` matches the intended release version
  and tag - it has no way to know whether the *content* behind that
  version number has actually been re-reviewed. This table is the only
  record of that.
- A version bump that touches **only** metadata (e.g. fixing a typo in
  `description`) with zero article changes may note that plainly in
  "What changed" and carry the previous review outcome forward - but
  it must still get its own row, not be silently assumed.
