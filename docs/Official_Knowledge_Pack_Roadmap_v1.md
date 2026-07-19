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

## 3. In Production (Not Yet Released)

### Community & System-Scale Food Production

**Status: Founder Approved — Research / Source Collection.**
Proposed `pack_id`: `hv_official_community_food_production`.

- **Approved by:** The Founder, 2026-07-19. This approval authorizes
  research, scope definition, and source collection only - it does
  **not** authorize article-architecture approval, individual
  operational-claim approval, Writing, creation of the final pack
  directory or `manifest.md`, Editorial Review completion, `Verified
  Source` status for any claim, Release Pipeline execution, or
  publication. Those remain separate, later gates per
  `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`.
- **Origin:** Identified as the strongest candidate for Pack #6 in a
  dedicated Production Direction and Topic Selection Analysis
  (2026-07-18), scoring 47/50 and representing the largest remaining
  system-scale capability gap - the core corpus's Agriculture category
  contains only two household/individual-garden-scale articles
  (`growing_staple_food_crops.md`, `seed_saving_basics.md`), with no
  community or system-scale food-production content anywhere.
- **Current stage:** Research Plan and Source Collection underway; see
  `official_packs/community_food_production_RESEARCH_PLAN.md` and
  `official_packs/community_food_production_SOURCE_COLLECTION.md` for
  the full record. No `manifest.md`, no articles, and no pack
  directory under `official_packs/` exist yet - Writing has not begun.
- **Scope:** Building and maintaining resilient food-production
  capacity beyond a single household or small personal garden -
  land/resource assessment and diversified-system planning, soil
  fertility management and composting at scale, irrigation planning,
  pest and disease resilience with low chemical input, and harvest/
  storage/community food-reserve practices - explicitly distinct from
  the core corpus's existing household-scale crop-growing and
  seed-saving content, which this pack cross-links to rather than
  duplicates. Basic animal husbandry/livestock is explicitly **not**
  included in this pack's architecture (see the Research Plan's
  livestock stress-test); it remains a candidate for a separate future
  pack. Aquaponics is not folded into this pack and remains a distinct
  future direction (Section 5, below).

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

## 6. Recommended Next Production Target

Fulfilled. The previous recommendation in this section - approve and
begin Water Treatment at Scale - is complete; it is released (Section
2, above). Emergency Shelter Systems, the pack that was in active
research at the time of the previous update, is also now complete and
released (Section 2, above). Community & System-Scale Food Production
(Section 3, above) is now the pack in active research, per the
Founder's 2026-07-19 approval. This document does not, on its own
initiative, extend that approval into an approved sequence of future
packs - the analytical tentative Pack #7-#10 sequence proposed in the
same Production Direction Analysis (2026-07-18) is recorded there as
analysis only and is **not** adopted as a roadmap commitment here.
Aquaponics (Section 5, below) remains a recorded future direction, not
an approved topic; this document does not select it as a next target
on its own initiative.

## 7. Next Steps (Not Actioned By This Document)

- Complete Source Collection for Community & System-Scale Food
  Production (Section 3, above), then proceed through Writing,
  Editorial Review, and Human/AI-agent Source Verification per
  `pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md` and
  `pack_production_workflow/QUALITY_STANDARD.md` §9 - followed by its
  own separate Founder Publication Decision before any release step.
  This document records that progress when it happens; it does not
  perform it.
- A Founder decision on Aquaponics remains a prerequisite before it
  could begin production.
