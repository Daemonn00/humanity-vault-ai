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
- **Field Communication & Wayfinding** (`hv_official_field_comm_wayfinding`,
  `official_packs/field_communication_wayfinding/`) - **Released
  v1.0.0.** All 4 articles `Verified Source` (Visual Signaling
  single-sourced to the Founder's own direct FAA review; the remaining
  three verified via a Founder-authorized AI-agent verification pass
  using directly-read substitute sources where the originally-cited
  sources proved inaccessible or, in one case, never actually
  supported the claim cited to them); Founder Publication Decision
  Approved; registered in `registry/registry.json`, live GitHub
  Release published and independently verified end-to-end (Vault Hub
  three-pack discovery, Official Website, Pack Detail, download,
  checksum, real `PackImporter` import, and three-pack coexistence
  with Mass Casualty and Survival Physical Readiness). See its
  `REVIEW_NOTES.md` for the full record.
- **Water Treatment at Scale** (`hv_official_water_treatment_at_scale`,
  `official_packs/hv_official_water_treatment_at_scale/`) - **Released
  v1.0.0.** All 6 articles `Verified Source`; Founder Publication
  Decision Approved; registered in `registry/registry.json`, live
  GitHub Release published and independently verified end-to-end
  (Vault Hub four-pack discovery, Official Website, Pack Detail,
  download, checksum, real `PackImporter` import, and four-pack
  coexistence with Mass Casualty, Survival Physical Readiness, and
  Field Communication & Wayfinding). See its `REVIEW_NOTES.md` for the
  full record.

## 3. In Production (Not Yet Released)

### Emergency Shelter Systems

**Status: Founder Approved — Research / Source Collection.**
Proposed `pack_id`: `hv_official_emergency_shelter_systems`.

- **Approved by:** The Founder, 2026-07-18. This approval authorizes
  research, scope definition, and source collection only - it does
  **not** authorize Writing, creation of the final pack directory or
  `manifest.md`, Editorial Review completion, `Verified Source` status
  for any claim, Release Pipeline execution, or publication. Those
  remain separate, later gates per
  `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`.
- **Current stage:** Research Plan, Source Collection, and pre-writing
  Human Verification Workbook completed; see
  `official_packs/emergency_shelter_systems_RESEARCH_PLAN.md`,
  `official_packs/emergency_shelter_systems_SOURCE_COLLECTION.md`, and
  `official_packs/emergency_shelter_systems_HUMAN_VERIFICATION_WORKBOOK.md`
  for the full record. No `manifest.md`, no articles, and no pack
  directory under `official_packs/` exist yet - Writing has not begun.
  One proposed article (anchoring/wind-resistance) currently has
  weaker direct-source verification than the other four - see the
  Research Plan for the specific gap and recommended closure step
  before Writing proceeds on that article.
- **Scope:** Systems-scale emergency, transitional, and communal
  shelter (site selection and settlement planning, tarps/tents/
  rapidly-deployable shelter forms, anchoring and weather resistance,
  thermal management/ventilation/fire safety, and communal/
  transitional occupancy and maintenance) - explicitly distinct from
  the core corpus's existing individual/wilderness shelter content
  (`basic_shelter_construction.md`), permanent building content
  (`simple_structural_building_techniques.md`), fire-making/fire-
  safety content (`fire_starting_without_matches.md`,
  `emergency_fire_safety.md`), and the released Field Communication &
  Wayfinding pack's lashing-technique article, all of which this pack
  cross-links to rather than duplicates.

## 4. Named But Not Yet Started

No topic is currently named-but-unstarted. Emergency Shelter Systems
(Section 3, above) moved directly from this section into active
research this sprint.

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

Fulfilled. The previous recommendation in this section - approve and
begin Water Treatment at Scale - is complete; it is released (Section
2, above). Emergency Shelter Systems (Section 3, above) is now the
pack in active research. Aquaponics (Section 5, below) remains a
recorded future direction, not an approved topic; this document does
not select it as a next target on its own initiative.

## 7. Next Steps (Not Actioned By This Document)

- Close the anchoring/wind-resistance source-verification gap flagged
  in Emergency Shelter Systems' Research Plan (Section 3, above),
  then complete Writing, Editorial Review, and Human/AI-agent Source
  Verification per `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`
  and `pack_production_workflow/QUALITY_STANDARD.md` §9 - followed by
  its own separate Founder Publication Decision before any release
  step. This document records that progress when it happens; it does
  not perform it.
- A Founder decision on Aquaponics remains a prerequisite before it
  could begin production.
