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
- **Emergency Shelter Systems** (`hv_official_emergency_shelter_systems`,
  `official_packs/hv_official_emergency_shelter_systems/`) -
  **Released v1.0.0.** All 4 articles `Verified Source`; Founder
  Publication Decision Approved; registered in `registry/registry.json`,
  live GitHub Release published and independently verified end-to-end
  (Vault Hub five-pack discovery, Official Website, Pack Detail,
  download, checksum, real `PackImporter` import, and five-pack
  coexistence with Mass Casualty, Survival Physical Readiness, Field
  Communication & Wayfinding, and Water Treatment at Scale). See its
  `REVIEW_NOTES.md` for the full record.
- **Community & System-Scale Food Production**
  (`hv_official_community_food_production`,
  `official_packs/hv_official_community_food_production/`) -
  **Released v1.0.0.** All 5 articles `Verified Source`; Founder
  Publication Decision Approved; registered in `registry/registry.json`,
  live GitHub Release published and independently verified end-to-end
  (Vault Hub six-pack discovery, Official Website, Pack Detail,
  download, checksum, real `PackImporter` import, and six-pack
  coexistence with Mass Casualty, Survival Physical Readiness, Field
  Communication & Wayfinding, Water Treatment at Scale, and Emergency
  Shelter Systems). Basic animal husbandry/livestock was deliberately
  excluded from this pack's architecture and recorded as a candidate
  for a separate future pack (Section 5, below), not approved. See its
  `REVIEW_NOTES.md` for the full record.

## 3. In Production (Not Yet Released)

### Community & Camp Sanitation Systems

**Status: Founder Approved — Research / Source Collection.**
Proposed `pack_id`: `hv_official_community_camp_sanitation_systems`.

- **Approved by:** The Founder, 2026-07-19. This approval authorizes
  research, scope definition, and source collection only - it does
  **not** authorize article-architecture approval, individual
  operational-claim approval, Writing, creation of the final pack
  directory or `manifest.md`, Editorial Review completion, `Verified
  Source` status for any claim, Release Pipeline execution, or
  publication. Those remain separate, later gates per
  `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`.
- **Origin:** Identified as the strongest advisory candidate for
  Pack #7 in a dedicated Production Direction & Roadmap Reconciliation
  analysis (2026-07-19, post-sixth-release), on the basis that three
  released packs (Water Treatment at Scale, Emergency Shelter Systems,
  and Community & System-Scale Food Production) already cross-link to
  household-scale sanitation content without any of them owning
  community/camp-scale sanitation infrastructure.
- **Current stage:** Research Plan and Source Collection underway; see
  `official_packs/community_camp_sanitation_systems_RESEARCH_PLAN.md`
  and
  `official_packs/community_camp_sanitation_systems_SOURCE_COLLECTION.md`
  for the full record. No `manifest.md`, no articles, and no pack
  directory under `official_packs/` exist yet - Writing has not begun.
  One claim (medical/biohazard waste exclusion from general burial
  pits) is flagged high-risk and requires deeper sourcing before a
  §9.3 determination can be made; two further items (a VIP-latrine
  source, a specific gender-based-violence/lighting source) remain
  open pending a closure pass.
- **Scope:** Community and camp-scale sanitation infrastructure -
  needs assessment and system planning, latrine types and
  construction, accessibility and dignified/safe use, solid-waste
  collection and disposal, and system operation/maintenance/
  decommissioning - explicitly distinct from the core corpus's
  existing household-scale hygiene content and from the settlement-
  siting, water-table-clearance, and toilet-ratio figures already
  owned by Emergency Shelter Systems, which this pack cross-links to
  rather than duplicates. Drainage/greywater management was
  investigated and excluded from this pass's architecture as
  insufficiently sourced, not forced in.

## 4. Named But Not Yet Started

No topic is currently named-but-unstarted.

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

### Livestock / Animal Husbandry (recorded future candidate, not an approved pack)

**Status: Recorded as a legitimate future candidate. Not scheduled.
Not researched. Not an approved production pack.**

Unlike Aquaponics (a Founder-originated direction), this entry
originated from AI-agent analysis during Community & System-Scale Food
Production's Research Plan (2026-07-19), which deliberately excluded
basic animal husbandry from that pack's architecture after a livestock
stress-test found disproportionate complexity (zoonotic disease,
veterinary care, slaughter, feed-supply-chain dependency, animal
welfare) relative to that pack's scope, and recommended the topic be
deferred to its own future pack rather than included or dropped
entirely. See
`official_packs/community_food_production_RESEARCH_PLAN.md`'s
livestock stress-test for the full reasoning. This entry preserves
that recorded gap; it does not authorize producing a pack.

## 6. Recommended Next Production Target

Fulfilled. The previous recommendation in this section - approve and
begin Water Treatment at Scale - is complete; it is released (Section
2, above). Emergency Shelter Systems and Community & System-Scale Food
Production, each in turn the pack in active research at the time of a
previous update, are also now complete and released (Section 2,
above). **Community & Camp Sanitation Systems (Section 3, above) is
now the pack in active research, per the Founder's 2026-07-19
approval.** A prior Production Direction & Roadmap Reconciliation
analysis (2026-07-19, post-sixth-release) also proposed a tentative,
advisory sequence for Packs #8-#9 (Aquaponics, then Field Medicine
Beyond Trauma) - **that sequence is not adopted as a roadmap
commitment here** and remains analysis only. Aquaponics and
Livestock/Animal Husbandry (Section 5, above) remain recorded future
directions, not approved topics.

## 7. Next Steps (Not Actioned By This Document)

- Complete Source Collection for Community & Camp Sanitation Systems
  (Section 3, above) - in particular, resolve the flagged medical/
  biohazard-waste high-risk item - then proceed through Writing,
  Editorial Review, and Human/AI-agent Source Verification per
  `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md` and
  `pack_production_workflow/QUALITY_STANDARD.md` §9 - followed by its
  own separate Founder Publication Decision before any release step.
  This document records that progress when it happens; it does not
  perform it.
- A Founder decision on Aquaponics or on Livestock/Animal Husbandry
  remains a prerequisite before either could begin production.
