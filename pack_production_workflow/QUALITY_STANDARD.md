# Official Knowledge Pack Quality Standard (v1)

This is the canonical policy document for what makes an Official
Knowledge Pack acceptable to produce, write, and keep published. Other
documents in this folder are worksheets that *apply* this policy;
this document defines it once, so the policy doesn't drift between
templates.

## 1. Topic acceptance criteria

Applied via `TOPIC_SELECTION_TEMPLATE.md`. A pack topic is acceptable
only if all of the following hold:

1. **Multi-article coherence** - the pack has a real, articulable
   theme spanning multiple articles. A single-article "pack" should
   usually be a core corpus article instead (see
   `docs/Content_Creation_Workflow_v1.md`).
2. **No duplication** - the topic doesn't already exist as a core
   corpus article or another official pack.
3. **Plausible source availability** - at least one Tier 1 or Tier 2
   source (Section 2 below) plausibly exists before research starts.
4. **Category fit** - every planned article fits one of the 11
   existing category display names; packs do not introduce new
   categories.
5. **Scope safety** - the topic does not require tactical,
   weapon-making, trap-making, or evasion content (Section 3 below).
6. **Roadmap awareness** - if the topic overlaps
   `docs/Knowledge_Expansion_Roadmap_v1.md`, that overlap is
   deliberate, not an accidental duplicate effort.

## 2. Source quality hierarchy

Applied via `SOURCE_COLLECTION_TEMPLATE.md`. Every source a pack cites
falls into exactly one tier:

| Tier | Description | Examples |
|---|---|---|
| **Tier 1** | Official agencies, standards bodies, primary texts | Government disaster-prep guides, WHO, established first-aid manuals, primary religious texts, aviation/maritime official publications |
| **Tier 2** | Established secondary references | Reputable textbooks, agricultural extension guides, well-established encyclopedic references |
| **Tier 3** | Named community/traditional sources with documented provenance | "Coastal fishing communities of [specific region]" - never "local people" or another unnamed generalization |
| **Rejected** | Not usable as a claim's sole support | Blogs, forums, unsourced summaries, AI-generated overviews, a source's own "about" page describing content no one has actually read |

A claim may only be marked as resting on a **directly verified**
source (see Section 4) if that source is Tier 1, 2, or 3 **and** was
actually opened and read - not merely found. A Rejected-tier source is
never a claim's sole support; either find a Tier 1-3 source or write
the claim as general, unattributed practical knowledge.

## 3. Safety content rules

- Any step with physical risk (fire, tools, medical procedures,
  electrical/mechanical work, navigation-critical decisions) must
  carry an explicit warning at the point of the risky step.
- No content may claim or imply a guaranteed outcome (e.g. "this will
  get you rescued") - safety-relevant claims are stated with their
  actual, honest limits.
- Packs never include tactical, weapon-making, trap-making, or evasion
  content, regardless of how a source frames it - this is a hard
  boundary, not a judgment call per pack.
- These rules are *checked* during Editorial Review via
  `editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md` Section
  D - this document states the policy; that checklist enforces it.

## 4. Citation policy

- A claim may only be attributed to a source that was **directly
  opened and read** by a named human - not a search-result summary,
  not a source's own landing page describing itself, not an AI-
  generated overview of the source.
- If a source could not be directly read despite a genuine attempt,
  the claim is written as general, non-source-specific practical
  knowledge, or is dropped - it is never presented as if the
  unread source confirms it.
- `verification_level: Verified Source` requires **every** claim in
  that specific article to be directly verified per the above - one
  unverified claim in an article means the whole article is not yet
  `Verified Source` (see `editorial_review_template/
  03_CLAIM_VERIFICATION_TEMPLATE.md`).
- Never invent a source. If a claim's origin cannot be named honestly,
  either find a real source or remove the claim.

## 5. Writing standards

Full detail in `WRITING_GUIDELINES.md`. In summary: follow
`pack_authoring_template/`'s exact file format;
`docs/Knowledge_Authoring_Standard_v1.md`'s tone, verification-level,
and knowledge-level conventions; official-pack-specific rules
(`hv_official_` prefix, well-formed semver); and honest, Source-
Collection-grounded `verification_level` values from the first draft.

## 6. Update policy

A pack's `pack_version` changes whenever its published content
changes, following semver:

- **Patch (`X.Y.Z+1`)** - metadata-only fixes (typo in `description`,
  a corrected date) with no change to any article's factual content
  or claims.
- **Minor (`X.Y+1.0`)** - added articles, or non-breaking content
  additions to existing articles, with no removal or reversal of an
  existing claim.
- **Major (`X+1.0.0`)** - a substantial rewrite, removal of articles,
  or a change that reverses or significantly narrows a previous claim
  (as happened with this project's own real precedent, where a
  source-verification gap required narrowing an article's factual
  scope).

**Every version bump requires its own review pass**, recorded as a new
row in `editorial_review_template/
07_VERSION_REVIEW_HISTORY_TEMPLATE.md` - even a patch-level change,
though a patch with genuinely zero content impact may carry its
prior review outcome forward explicitly (never silently). A version
bump is never released via `release_pipeline/` on the strength of a
prior version's Publication Decision alone.

## 7. Pack maintenance workflow

Official packs are not "write once" - they need periodic attention:

- **Content avoids time-sensitive references** (per
  `WRITING_GUIDELINES.md`) specifically so maintenance burden stays
  low - a pack should rarely need updates just because time passed.
- **Reported errors** (however they reach the project - GitHub issue,
  founder review, etc.) should be triaged as a normal version bump per
  Section 6 above: fix the content, re-review per the update policy,
  release a new patch/minor version.
- **Periodic spot-review** is recommended for packs with any
  `Unverified` or `Community Verified` articles, to check whether a
  Tier 1/2 source has since become available to close that gap -
  this is a judgment call for whoever maintains the pack, not a fixed
  schedule.
- Maintenance never means hand-editing `registry/registry.json` -
  every change flows through the same Editorial Review → Release
  Pipeline path as a brand-new pack.

## 8. Deprecation workflow

The Registry Schema already defines `deprecated`,
`deprecated_reason`, `replacement_pack_id`, and `archived` fields on a
pack's registry entry (see `registry_generator/lib/src/models.dart`).
This document describes the **human decision process** for using
them; it does not add, change, or wire up any code - see the note
below on the current gap.

**Process:**

1. A pack is considered for deprecation when it's superseded by a
   better pack, contains a since-discovered serious error that can't
   be fixed by a normal update, or is no longer aligned with project
   scope.
2. Record the decision and reasoning in the pack's own
   `REVIEW_NOTES.md` (a new "Deprecation Decision" note, dated and
   attributed) - the same document already holds its Publication
   Decision, so its lifecycle decisions stay together in one place.
3. If a replacement pack exists, name its `pack_id` explicitly in that
   note.
4. Communicate the deprecation via the same channels the project
   already uses for release announcements (e.g. the Changelog on the
   Official Website).

**Known gap - flagged, not solved here:** as of this writing,
`registry_generator`'s `RegistryPackEntry.toJson()` hardcodes
`deprecated: false` and `archived: false` for every pack - there is
currently no input path for actually setting these fields to `true`
in a generated `registry.json`. Deprecation today is therefore a
*documentation and communication* process only; it does not yet change
what Vault Hub or the Official Website display. Wiring that up would
be a change to `registry_generator`'s architecture, which is out of
scope for this task and every other task so far in this project's
history. This gap should be flagged to the founder as future,
separately-scoped work - not silently worked around here.
