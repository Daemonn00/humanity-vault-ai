# Editorial Review Checklist

Work through this once, early in review, before doing claim-by-claim
source verification (`02_SOURCE_VERIFICATION_CHECKLIST.md`). This
checklist catches structural and policy problems that would make
claim-by-claim work pointless if they're wrong.

Copy this section (filled in) into the pack's `REVIEW_NOTES.md` under
an "Editorial Review Checklist" heading.

## A. Identity and structure

- [ ] `pack_id` uses the `hv_official_` prefix.
- [ ] `pack_id` is not already used by another pack in
      `official_packs/` or a slug already retired/renamed.
- [ ] `pack_version` is well-formed semver (`X.Y.Z`).
- [ ] Every article's `category` is one of the eleven valid category
      names (Survival, Medicine, Agriculture, Engineering,
      Electronics, Construction, History, Philosophy, Islam, Local
      Wisdom, Communication) - no invented categories.
- [ ] No article's filename (slug) collides with a core-corpus slug
      or another article in this same pack.

## B. Tone and register

- [ ] Content reads as calm, practical, field-manual register -
      consistent with the rest of the Vault, not marketing copy, not
      alarmist, not academic paper style.
- [ ] No claim is written with more confidence than its actual source
      support warrants (see Section C).
- [ ] No article implies official endorsement by, or authorship from,
      any organization mentioned as a source.

## C. Source-attribution discipline

- [ ] Every non-obvious factual claim is either (a) attributed to a
      specific source that has been directly verified per
      `02_SOURCE_VERIFICATION_CHECKLIST.md`, or (b) written as
      general, widely-known practical knowledge with no specific
      source attribution at all. Nothing sits in between - a claim is
      never presented as "verified" on the strength of a source that
      was only found via a search-result summary, not directly read.
- [ ] No article reproduces copyrighted tables, figures, exact
      wording, or proprietary specifics from a source - it explains
      principles and directs the reader to the source itself for
      complete/official detail.

## D. Safety and scope boundaries

- [ ] Any safety-relevant claim (medical, structural, navigational,
      or otherwise where being wrong is costly) includes an explicit
      caveat about its own limits, rather than presenting itself as
      complete or guaranteed.
- [ ] The pack does not include tactical, weapon-making, trap-making,
      evasion, or similarly out-of-scope content, regardless of how a
      source might frame it.
- [ ] Any content that could be read as a safety guarantee (e.g. "this
      will get you rescued") is explicitly disclaimed as not a
      guarantee.

## E. Verification level integrity

- [ ] No article's frontmatter claims `verification_level: Verified
      Source` unless every source-attributed claim in that specific
      article has been directly verified (see
      `03_CLAIM_VERIFICATION_TEMPLATE.md`) - not "probably fine,"
      directly confirmed.
- [ ] Every article's `verification_level` is one of the four allowed
      values (`Verified Source`, `Community Verified`, `Historical
      Source`, `Unverified`) - see `docs/Knowledge_Authoring_Standard_
      v1.md` Section 7.

If anything above fails, record it here and stop - fix the underlying
issue before spending reviewer time on claim-by-claim verification of
content that will change anyway.
