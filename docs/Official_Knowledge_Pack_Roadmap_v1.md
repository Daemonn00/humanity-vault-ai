# Humanity Vault Official Knowledge Pack Roadmap v1

## 1. Purpose

This document tracks topic-level planning for the **Official Knowledge
Pack** line - the release-pipeline-published, registry-listed packs
produced under `pack_production_workflow/` and
`editorial_review_template/` (distinct from the core article corpus
under `knowledge/`, which is tracked separately in
[`Knowledge_Expansion_Roadmap_v1.md`](Knowledge_Expansion_Roadmap_v1.md)).

No document of this kind existed in the repository prior to this
entry. A "25-pack" Official Knowledge Pack roadmap has been discussed
in prior planning sessions, but no such list was ever committed to the
repository - this document is the first persisted record for this
production line and starts from what has actually been produced, not
from an assumed prior list.

This document does not create, author, or research any article. It
records topic-level scope and status only.

## 2. Produced So Far (Released)

- **Mass Casualty & Trauma First Aid** (`hv_official_mass_casualty_first_aid`,
  `official_packs/hv_official_mass_casualty_first_aid/`) - **Released
  v1.0.0.** Registered in `registry/registry.json`, live GitHub Release
  published and independently verified end-to-end. See its
  `REVIEW_NOTES.md` for the full editorial and verification record.
- **Survival Physical Readiness** (`hv_official_survival_physical_readiness`,
  `official_packs/hv_official_survival_physical_readiness/`) -
  **Released v1.0.0.** All 5 articles `Verified Source`; Founder
  Publication Decision Approved; registered in `registry/registry.json`,
  live GitHub Release published and independently verified end-to-end
  (Vault Hub discovery, Official Website, Pack Detail, download,
  checksum, real `PackImporter` import, and multi-pack coexistence with
  Mass Casualty). See its `REVIEW_NOTES.md` for the full record.

## 3. In Production (Not Yet Released)

### Field Communication & Wayfinding

**Status, per its own `REVIEW_NOTES.md` (authoritative, not duplicated
here in full): Not Yet Approved - 1 of 4 articles complete.**
`pack_id`: `hv_official_field_comm_wayfinding`.

- **Visual Signaling for Rescue and Rendezvous** - `verification_level:
  Verified Source`. Its sole source (FAA AIP GEN 3.6) was directly
  human-reviewed by the Founder on 2026-07-10; the article's scope was
  narrowed to match exactly what that review supports.
- **Two-Way Radio Channel Discipline and Battery Care**,
  **Improvised Compass Construction**, and
  **Basic Knots for Shelter and Gear Lashing** - all three remain
  `verification_level: Unverified`. Their originally-cited sources
  (IARU/ARRL, CPSC, FM 21-76 Ch. 12 and 18, Scouting America) were each
  genuinely attempted via multiple access strategies during authoring
  and never successfully read in full (a mix of HTTP 403, unreadable
  binary PDF content, and truncated archive.org text) - recorded in
  full in the pack's own Source Access Log.
- A pre-drafting `field_communication_wayfinding_HUMAN_VERIFICATION_WORKBOOK.md`
  already exists as a sibling of `official_packs/`, prepared for the
  remaining three articles' verification work.
- **Notable open governance question, not resolved by this entry:**
  this pack's own Publication Decision explicitly requires the
  remaining three articles' sources to be "personally opened and read
  by **a human reviewer**" - written before this project later
  established, and the Founder twice explicitly accepted (for
  `hv_official_mass_casualty_first_aid` and
  `hv_official_survival_physical_readiness`), an AI-agent-performed
  direct-source-verification precedent. Whether that newer precedent
  extends to this pack, or whether this pack's stricter, already-
  recorded condition should be honored as-is, is a genuine open
  question for the Founder to decide before its next verification
  sprint - not assumed either way here.

## 4. Named But Not Yet Started

**Water Treatment at Scale** and **Emergency Shelter Systems** are
named in this reconciliation only because a prior, unpersisted planning
discussion referenced them alongside Field Communication and Mass
Casualty as a four-pack "Launch Batch 1." No such batch document was
ever committed to this repository - the only trace of it anywhere in
`official_packs/` is two passing mentions inside
`mass_casualty_first_aid_RESEARCH_PLAN.md`'s own header ("Launch Batch
1, pack 2 of 4"). Per this document's own standing rule (Section 1),
undocumented prior plans are not treated as governance.

**Neither topic has any production artifact of any kind** - no
directory, no Research Plan, no Source Collection, and no Founder-
recorded topic approval of the kind Survival Physical Readiness
received before its own production began (Section 2, above). They are
recorded here only as named-but-unstarted, not as approved or
scheduled. `pack_id`, article architecture, and scope remain entirely
undecided.

## 5. Approved Future Topics (Scope Only - Not Yet Authored)

### Aquaponics / Resilient Food Production (future direction, not an approved pack)

**Status: Recorded for future consideration. Not scheduled. Not
researched. Not an approved production pack.**

The Founder has identified aquaponics as a desired future component of
a broader "Infinity Food" / resilient food-production concept. This
entry preserves that direction; it does not authorize producing a
pack.

**Conceptual system (recorded conceptually only - no technical
specification):**

```
Fish
  -> biological waste
  -> nutrient conversion
  -> plant uptake
  -> water treatment/return
  -> Fish
```

No ratios, species, stocking densities, water-chemistry thresholds, or
other engineering specifications are recorded here or anywhere in this
repository. None have been researched or approved.

**Second, distinct purpose of this entry:** aquaponics is recorded as
this project's canonical example of **systems knowledge with a
feedback loop that must not be flattened into a misleading linear
procedure** - see [`Canon_Philosophy_v1.md`](Canon_Philosophy_v1.md)
Section 16 and its adversarial-pass discussion of the aquaponics
stress test. Any future authoring of this topic must represent the
loop explicitly (the water returning to the fish, closing the cycle),
not as a one-directional sequence.

## 6. Recommended Next Production Target

**Finish `hv_official_field_comm_wayfinding`** (Section 3, above) - not
a new pack. Reasoning, evaluated against remaining effort, launch-value
gap closed, dependency value, current readiness, and production
momentum:

- **Remaining effort is small and well-scoped**: 3 of 4 articles are
  already written; only source verification (via substitute Tier 1
  sources, since the originals were never successfully read) and a
  final Editorial Review pass remain - comparable in scope to the
  single Targeted Verification Closure sprint already proven twice this
  production line.
- **Closes an already-open gap** rather than opening a new one: this
  pack has been sitting at "1 of 4 articles complete" since before
  either released pack existed.
- **No dependency blockers** on any other pack.
- **By far the most ready** of any unreleased topic - a real Editorial
  Review, a real Source Access Log, and a pre-drafted Human
  Verification Workbook already exist; Water Treatment at Scale and
  Emergency Shelter Systems (Section 4) have zero production artifacts.
- **Directly reuses fresh, proven momentum**: the exact substitute-
  source-finding technique that closed Survival Physical Readiness's
  own blocked-source gaps (government/major-org domains returning HTTP
  403, resolved via equally-credible Tier 1 alternatives) is the same
  technique this pack's remaining three articles need.

## 7. Next Steps (Not Actioned By This Document)

- A Targeted Verification Closure sprint for
  `hv_official_field_comm_wayfinding`'s three remaining `Unverified`
  articles, per the existing `pack_production_workflow/` process, is
  the recommended next production sprint. It should first resolve the
  open governance question recorded in Section 3 (human-reviewer
  condition vs. the newer AI-agent-verification precedent) before
  beginning source work.
- Water Treatment at Scale and Emergency Shelter Systems (Section 4)
  remain unscheduled pending a separate future Founder decision to move
  either from "named" to "approved topic," the same status Aquaponics
  already holds.
- Aquaponics remains unscheduled pending a separate future Founder
  decision to move it from "recorded direction" to "approved topic."
