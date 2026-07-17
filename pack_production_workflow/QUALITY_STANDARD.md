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
  opened and read** by a named verifier - a human reviewer, or an AI
  agent meeting every condition in Section 9's AI-Agent Verification
  Policy - not a search-result summary, not a source's own landing
  page describing itself, not an AI-generated overview of the source,
  and not a source merely recalled from a prior session without being
  freshly re-read.
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

## 9. AI-Agent Verification Policy

Established following three complete, independently end-to-end-
verified production cycles (Mass Casualty & Trauma First Aid,
Survival Physical Readiness, Field Communication & Wayfinding) in
which the Founder individually and explicitly reviewed and accepted
AI-agent-performed direct source verification every time it was
proposed, without exception, including for emergency-medicine content.
This section formalizes that already-accepted practice as a standing
policy, so it no longer requires a fresh Founder methodology waiver
for every new pack - while leaving every other gate in this document,
and in `editorial_review_template/`, exactly as strict as it already
was.

### 9.1 Four governance layers

Verification is treated as four distinct layers, never conflated:

- **Verification Execution** - the act of opening a specific source,
  reading its actual content, and comparing it against a specific
  claim. May be performed by a named human reviewer or by an AI agent
  meeting every condition in 9.2 below. The executor's identity does
  not by itself determine trust - the evidence it produces does.
- **Verification Evidence** - the durable, auditable record in
  `REVIEW_NOTES.md` (Source Access Log, Claim-to-Source Map, reviewer
  sign-off) showing exactly what was attempted, what was read, what
  wasn't, and what happened as a result. This is the load-bearing
  artifact a future reviewer actually checks - not the executor's
  identity.
- **Verification Status** - the article's `verification_level`
  frontmatter value, earned strictly from the Evidence per
  `editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`'s
  weakest-link rule. A verification pass having occurred is never
  sufficient by itself; every claim-row must independently read `Yes`
  or `N/A`.
- **Publication Authorization** - the Founder's own, separate,
  non-delegable decision that a specific pack version may be released,
  recorded via `06_PUBLICATION_DECISION_TEMPLATE.md`. This layer is
  unaffected by this section: it was never about who performed
  verification, and it remains a human (Founder) decision in every
  case - no exception is created here.

### 9.2 Conditions for AI-agent Verification Execution to be accepted

An AI-agent verification pass produces evidence eligible for
`Verified Source` status only if all of the following hold - exactly
what this project has actually practiced across all three released
packs, restated here as a standing requirement rather than a claim to
be individually re-approved each time:

1. The source was directly opened and its actual content materially
   read - never a search-result summary, a source's own landing/about
   page, or content merely recalled from a prior session without
   being freshly re-read.
2. Each meaningful factual claim attributed to that source was
   individually checked against what the source actually says.
3. Every access attempt - successful or not - is recorded honestly in
   the Source Access Log, including failures (HTTP errors, unreadable
   PDFs, truncated text).
4. A source that could not be directly read is never marked verified,
   regardless of how plausible or well-known it is.
5. A substitute source is used and documented only as an explicit
   substitute, with the reason the original could not be used, per
   `02_SOURCE_VERIFICATION_CHECKLIST.md`.
6. A claim not supported by directly-read source text is removed,
   narrowed, rewritten to match what the source actually says, or left
   `Unverified` - never presented at its original strength on the
   strength of an unread or partially-read source.
7. A citation-content mismatch (a cited source that, on direct
   reading, turns out not to actually describe the claim it was cited
   for) is recorded as a finding, not silently corrected without a
   trace.
8. Safety-critical claims receive the heightened scrutiny in 9.3
   below, in addition to - never instead of - conditions 1-7.
9. The full trail remains auditable in `REVIEW_NOTES.md`, with a
   reviewer sign-off explicitly identifying the executor as an AI
   agent - never presented as, or left ambiguous with, a human
   reviewer.
10. `verification_level` is set from the Claim-to-Source Map's actual
    result, never assigned merely because a verification pass
    occurred.
11. Founder Publication Approval remains a separate, required, human
    decision before release, regardless of how verification was
    performed (9.1's fourth layer, unchanged).

These are not new rules - they are what
`02_SOURCE_VERIFICATION_CHECKLIST.md` and
`03_CLAIM_VERIFICATION_TEMPLATE.md` already required. This section
makes explicit that meeting them is what earns trust, not the
executor's species.

### 9.3 Heightened scrutiny for high-severity content

Most safety-relevant content - general first aid, emergency-response
principles, structural/electrical/navigational cautions - is
adequately protected by 9.2 together with the Safety content rules
(Section 3) and this project's default practice of narrowing or
dropping any claim that isn't directly supported. This is not
theoretical: Mass Casualty & Trauma First Aid's triage, burn, shock,
fracture, and hypothermia/heatstroke content went through exactly this
methodology, and the Founder reviewed and approved it.

A narrow set of claim types carries higher failure cost than narrowing
can fully mitigate, because the article must state a specific,
actionable number or step rather than a general caution: **specific
medication dosages, invasive medical or surgical procedures,
childbirth/obstetric management, specific toxic-substance handling
thresholds, and specific electrical or structural load-bearing
figures.** For a claim of this kind:

- AI-agent Verification Execution (9.2) still applies in full - it is
  not replaced.
- In addition, before that specific claim may be marked directly
  verified, a named human reviewer must personally read the same
  source passage the AI agent read and confirm, in a Reviewer Sign-off
  block, that it supports the claim as written. This is a targeted
  confirmation of the specific high-severity claim, not a full
  re-verification of the article or pack.
- If no human reviewer performs this confirmation, the claim is
  written as a general caution directing the reader to a qualified
  professional or authoritative reference, rather than stated as a
  specific verified figure or procedure.

This is a **mandatory additional review** rule, narrowly scoped to the
claim types listed above - it is not a broader classification system
and does not apply to general safety content already covered by 9.2
and Section 3. A Founder spot-check of a small claim sample before
Publication Decision is **recommended, not mandatory**, for any other
safety-relevant pack.

### 9.4 Terminology

The editorial stage some packs' `REVIEW_NOTES.md` label "Human Source
Verification" keeps that name unchanged - renaming it has real
migration cost (every historical `REVIEW_NOTES.md` and workbook that
uses it) and no benefit sufficient to justify it. Read the name as
describing the *rigor* required - direct, first-hand, source-level
verification, as opposed to secondhand or summary-based checking -
rather than exclusively the species of who performs it.

### 9.5 What this section does not change

- It does not weaken Section 4's citation policy, Section 3's safety
  rules, or `editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`'s
  weakest-link rule in any way.
- It does not authorize publishing anything - `06_PUBLICATION_DECISION_
  TEMPLATE.md`'s Founder-only gate is unchanged.
- It does not apply retroactively to change any already-released
  pack's `verification_level`, and it does not alter any historical
  `REVIEW_NOTES.md` entry - those remain the accurate record of what
  was actually decided at the time.
- It does not extend to anything outside source verification during
  pack production - it has no bearing on, and does not reference,
  `docs/Canon_Philosophy_v1.md` Section 13's separate treatment of AI
  at application runtime (Ask the Vault or any future AI feature),
  which concerns AI-generated Representations shown to end users, a
  different activity from an AI agent directly reading a real source
  document during editorial production.
