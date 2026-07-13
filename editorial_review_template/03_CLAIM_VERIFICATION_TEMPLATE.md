# Factual Claim Verification Template

The claim-to-source map: one row per factual claim made in the pack,
generalizing the exact table already used in
`official_packs/field_communication_wayfinding/REVIEW_NOTES.md`. This
is the core artifact that turns "we cited a source" into "a human
confirmed the source actually says this."

Copy this table (empty, or with example rows removed) into
`REVIEW_NOTES.md`'s "Claim-to-Source Map" section, one row per claim.
Add rows as review proceeds - never delete a row once source
verification has started on it; if a claim is removed from the
article as a result of review, mark it `Removed` rather than deleting
the row, so the review history stays intact.

## Claim table

| Article | Claim in the article | Source it is associated with | Directly verified? | Reviewer | Date | Notes |
|---|---|---|---|---|---|---|
| *(article slug or number)* | *(the specific factual claim, in your own words)* | *(source name - must match a source record in the Source Access Log)* | Yes / No / N/A / Removed | *(who checked this)* | *(when)* | *(anything a future reviewer needs to know)* |

## Column guidance

- **Article** - identify which article (by slug or title) the claim
  appears in. A pack review covers every article, even ones with no
  source-specific claims at all (mark those `N/A - general knowledge
  only`).
- **Claim in the article** - be specific enough that a future reviewer
  could find the exact sentence. Don't summarize three claims into
  one row if they need independently different verification outcomes.
- **Source it is associated with** - must be a source that also has
  its own entry in `02_SOURCE_VERIFICATION_CHECKLIST.md`'s Source
  Access Log. A claim with no source is a claim written as general
  knowledge - mark the source column `N/A - general knowledge` rather
  than leaving it blank.
- **Directly verified?**
  - `Yes` - a named reviewer personally read the source's actual
    content and confirms it supports this exact claim.
  - `No` - the source has not been directly read, or was read but
    does not actually support this specific claim as written.
  - `N/A` - this claim carries no specific source (general knowledge,
    or an explicitly editorial statement not attributed to any
    source - e.g. a safety caveat).
  - `Removed` - the claim was deleted from the article as a result of
    review; kept here for the historical record.
- **Reviewer / Date** - whoever actually checked this specific row,
  and when. Different rows in the same table may have different
  reviewers and dates - that is expected, not a problem, when multiple
  reviewers divide the work.
- **Notes** - anything a future reviewer needs, e.g. why a claim was
  narrowed, what exact page/figure supports it, or why it was removed.

## The rule this table enforces

An article's frontmatter may only read `verification_level: Verified
Source` if **every** claim-row for that article reads `Yes` in the
"Directly verified?" column (or `N/A` for claims that are correctly
unattributed general knowledge). A single `No` row for an article
means that article's `verification_level` must be `Unverified` (or
another accurate value per `docs/Knowledge_Authoring_Standard_v1.md`
Section 7) until that row is resolved - this is not a judgment call,
it follows directly from the table.
