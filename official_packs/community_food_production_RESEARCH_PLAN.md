---
pack_id: hv_official_community_food_production
pack_name: Community & System-Scale Food Production
---

# Research Plan — Community & System-Scale Food Production

## Topic acceptance (Founder-approved directly; no separate Topic Selection file created)

The Founder approved this topic directly (Founder Decision,
2026-07-19), matching the pattern used for Water Treatment at Scale
and Emergency Shelter Systems. This section records the same six
`QUALITY_STANDARD.md` §1 criteria `TOPIC_SELECTION_TEMPLATE.md` would
otherwise capture.

- **Criterion 1 (multi-article coherence):** Passes - a real theme
  (assessment/planning → soil fertility → water/irrigation → pest and
  disease resilience → harvest/storage/reserve) spans the 5 articles
  below, all addressing food production beyond a single household.
- **Criterion 2 (no duplication):** Passes - see the Ownership
  Boundary below. The core corpus already owns household-scale staple-
  crop growing and seed saving; this pack is explicitly scoped to
  group/community/system scale, the same "same principle, larger
  scale" pattern already used successfully by Water Treatment at Scale
  and Emergency Shelter Systems relative to their own household-scale
  predecessors.
- **Criterion 3 (plausible source availability):** Passes - confirmed
  during this research pass: FAO and USDA (including USDA
  Cooperative Extension partners) both publish directly-readable
  Tier 1/2 technical content on composting, irrigation, integrated
  pest management, and post-harvest storage. Several specific numeric
  claims could not be confirmed this pass and are flagged, not
  concealed (see High-Risk Claim Areas below).
- **Criterion 4 (category fit):** Passes - articles fit `Agriculture`
  and `Survival`, both existing category names; no new category is
  introduced.
- **Criterion 5 (scope safety):** Passes - no tactical, weapon-making,
  trap-making, or evasion content is required. No veterinary or
  medical guidance is included (see the livestock stress-test, Part 4
  below).
- **Criterion 6 (roadmap alignment):** Deliberate, not accidental -
  this topic was identified specifically because
  `docs/Knowledge_Expansion_Roadmap_v1.md`'s existing Agriculture
  category (`growing_staple_food_crops.md`, `seed_saving_basics.md`)
  is household-scale only; this pack extends it rather than
  duplicating it.

## Ownership Boundary (Part 3)

Read fresh, in full, this pass:
`humanity_vault_app/knowledge/agriculture/growing_staple_food_crops.md`,
`humanity_vault_app/knowledge/agriculture/seed_saving_basics.md`,
`humanity_vault_app/knowledge/survival/food_preservation_basics.md`,
`humanity_vault_app/knowledge/construction/well_digging_and_safe_water_access.md`,
`humanity_vault_app/knowledge/survival/water_purification.md`,
`humanity_vault_app/knowledge/survival/water_storage_and_long_term_water_safety.md`,
`humanity_vault_app/knowledge/medicine/sanitation_hygiene_and_disease_prevention.md`,
`humanity_vault_app/knowledge/local_wisdom/traditional_weather_prediction_and_seasonal_indicators.md`,
`official_packs/hv_official_water_treatment_at_scale/wts_assessing_community_water_needs_and_protecting_the_source.md`
(full manifest/article inventory), `official_packs/
hv_official_emergency_shelter_systems/` manifest and site-planning
article, `docs/Canon_Philosophy_v1.md`, `docs/Project_Charter_v1.md`,
`pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`,
`pack_production_workflow/QUALITY_STANDARD.md`,
`pack_production_workflow/WRITING_GUIDELINES.md`. No other released
Official Knowledge Pack touches agriculture, soil, irrigation, food
storage, livestock, composting, or pest management.

### Domain-by-domain classification

| Domain | Classification | Reasoning |
|---|---|---|
| Food-production planning at group/community scale | **A. OWNED BY THIS PACK** | No existing content anywhere; core corpus's two articles are single-household-garden scale |
| Land and resource assessment for growing | **A. OWNED BY THIS PACK** | Distinct purpose from Emergency Shelter Systems' site-selection content (growing suitability vs. shelter/drainage hazard-avoidance) - see explicit boundary below |
| Crop diversity and staple-food planning | **B. CROSS-LINKED** | `growing_staple_food_crops.md` already owns crop-selection/rotation/monoculture-risk principles at the individual level; this pack extends the *planning* framing to a group deciding what to grow across shared land, without re-deriving spacing/depth/watering technique |
| Soil fertility management | **A. OWNED BY THIS PACK** | Not covered anywhere; `growing_staple_food_crops.md` only briefly mentions adding compost/manure as a soil-preparation step, with no composting method of its own |
| Composting and nutrient cycling | **A. OWNED BY THIS PACK** | Same as above - genuinely new territory |
| Irrigation planning | **A. OWNED BY THIS PACK** | Not covered anywhere; existing water articles (`water_purification.md`, `water_storage_and_long_term_water_safety.md`, `well_digging_and_safe_water_access.md`, Water Treatment at Scale) are entirely about *drinking* water, never irrigation/crop water |
| Seed continuity | **B. CROSS-LINKED, extended to community scale** | `seed_saving_basics.md` owns household-scale seed saving in full, including a closing point about storing seed in multiple locations/sharing with other households. This pack's Article 1 extends that exact point into a community seed bank's governance/pooled-storage model, explicitly building on rather than repeating the household technique |
| Pest and crop-disease management | **A. OWNED BY THIS PACK** | Not covered anywhere; `growing_staple_food_crops.md`'s crop-rotation content is reused/cross-linked, not repeated, but framed here specifically around pest/disease resilience |
| Basic livestock integration | **C. DEFERRED TO A FUTURE PACK** | See the livestock stress-test, Part 4 below - excluded from this pack's architecture entirely |
| Post-harvest handling | **A. OWNED BY THIS PACK**, extending `food_preservation_basics.md` and `growing_staple_food_crops.md`'s harvest-timing note | Household-scale preservation *technique* (drying, salting, smoking, fermenting) stays owned by `food_preservation_basics.md` and is cross-linked, not restated; this pack owns storage-hygiene, loss-prevention, and group/community-scale storage practices |
| Community food reserves and storage planning | **A. OWNED BY THIS PACK** | Not covered anywhere; genuinely new, group-scale food-security-buffer content |
| Water Treatment at Scale | **B. CROSS-LINKED only** | Drinking-water source protection and distribution planning remains entirely owned there; this pack's irrigation article references it for the shared "keep the source away from contamination" principle without re-deriving it |
| Emergency Shelter Systems | **B. CROSS-LINKED only** | Settlement/shelter site-selection (drainage, slope, hazard distance for *building*) remains entirely owned there; this pack's land-assessment content is scoped specifically to *growing suitability* (soil, sun, water access for crops), a different purpose from shelter-siting even where both discuss slope/drainage in passing |
| Future Aquaponics | **D. OUT OF SCOPE**, referenced only for boundary clarity | Per the Founder's explicit instruction, Aquaponics is not folded into this pack. One narrow reference is made in Article 1 to note that integrated fish-plant systems are a distinct, more infrastructure-dependent approach not covered here - no aquaponics technical content (stocking, water chemistry, system design) appears anywhere in this pack |
| Future dedicated livestock/veterinary topic | **D. OUT OF SCOPE** for this pack; recorded as a legitimate future candidate, not decided here | This document does not approve a future livestock pack - it only notes the gap exists, per the same pattern Emergency Shelter Systems used when folding its thin Anchoring article rather than inventing content |

**Explicit land-assessment boundary:** Emergency Shelter Systems'
"Shelter Site Selection and System Planning" article covers slope
(2-4% ideal for drainage), groundwater depth, and distance-from-hazard
rules for *siting a shelter or settlement* - keeping structures dry
and away from contamination/hazard sources. This pack's land
assessment is a different question with a different purpose: whether
soil, sun exposure, and water access are adequate for *growing food*.
Where both would reasonably discuss similar terrain features (e.g.,
drainage), this pack states its own growing-specific reasoning rather
than re-deriving or contradicting the shelter-siting figures, and
cross-links to the existing article rather than repeating it.

## Livestock Stress-Test (Part 4)

Evaluated explicitly and separately, per the task's instruction not to
assume the prior analysis's tentative "basic animal husbandry" survives
into the final architecture.

- **Is livestock necessary for a coherent community food-system pack?**
  No. The five-article architecture below (assessment/planning, soil
  fertility, irrigation, pest/disease resilience, harvest/storage) is
  fully coherent and adequately scoped using plant-based food
  production alone - confirmed by the real source landscape found this
  pass (composting, IPM, irrigation, and post-harvest storage sources
  are all genuinely rich and plant/soil-focused).
- **Does crop production alone give the pack sufficient scope?** Yes -
  5 solid articles with real, directly-read source support were
  identified without any livestock content; adding livestock would
  not fill a coverage gap, it would add a sixth, structurally
  different domain.
- **Does poultry/small livestock introduce disproportionate
  complexity?** Yes, substantially: zoonotic disease risk (this
  project has no precedent or established methodology for
  animal-disease content), veterinary care (explicitly out of scope
  per this task's own instruction - "do not create veterinary or
  medical guidance"), slaughter (a genuinely different, higher-
  sensitivity content category this project has never produced),
  feed-supply-chain dependency (undermines the "resilient, low-input"
  framing this pack is built around), and animal-welfare
  considerations (a real editorial burden with no established
  in-project precedent for how to handle it responsibly).
- **Do authoritative sources support a narrow and safe treatment?**
  Not investigated in depth this pass, specifically because the
  disproportionate-complexity finding above already provides a
  sufficient basis for exclusion without needing to additionally rule
  out source availability - investigating livestock sourcing only to
  discard the topic would not be a good use of this sprint's scope.
- **Does livestock deserve its own future pack instead?** Yes - this is
  the honest, coherent resolution. Livestock/animal husbandry is
  recorded here as a legitimate future Official Knowledge Pack
  candidate, structurally analogous to how this project already
  handles Aquaponics: a real, valuable future direction, not
  approved, not researched, not scheduled.

**Recommendation: DEFER.** Livestock/animal husbandry is excluded from
this pack's architecture entirely. No livestock content of any kind
(feeding, housing, breeding, disease, slaughter) appears in the
article architecture below.

## Proposed Article Architecture (Part 7)

5 articles - the target range's lower bound, chosen deliberately after
research rather than defaulted to. A sixth candidate (a standalone
"Community Seed Banks" article) was evaluated and folded into Article
1 instead, because the single directly-read source supporting it
(FAO's Science, Technology and Innovation Portal) could not on its own
support a full, non-thin standalone article - the same "fold rather
than pad a thin article" judgment call Emergency Shelter Systems made
for its Anchoring article. If Source Collection later finds
substantially more community-seed-bank material, splitting it back out
into its own article remains an open option for the Writing stage, not
decided here.

### Article 1: Assessing Land and Planning a Resilient, Diversified Food System

- **Purpose:** How a group, not a single household, assesses whether
  available land/resources can support food production, plans for
  more than one crop type to spread risk, and extends individual
  seed-saving into a shared community seed bank.
- **Scope:** General site-suitability factors for growing (soil, sun,
  water access - framed qualitatively, not as an invented land-area-
  per-person formula, see High-Risk Claim Areas); crop diversification
  as a group-level resilience strategy; community seed bank governance
  and pooled storage as an extension of household seed saving.
- **Explicit exclusions:** Does not restate crop selection, spacing,
  planting depth, or rotation technique already owned by
  `growing_staple_food_crops.md` - cross-links instead. Does not
  restate household seed-drying/storage technique already owned by
  `seed_saving_basics.md`. Does not restate shelter/settlement site-
  selection criteria owned by Emergency Shelter Systems. Does not
  include any aquaponics technical content - one narrow sentence at
  most, noting integrated fish-plant systems are a distinct,
  infrastructure-dependent approach not covered in this pack.
- **Core claim IDs:** A1-A6 (see Claim Inventory below)
- **Likely sources:** FAO crop diversification / food security policy
  research; FAO Science, Technology and Innovation Portal (community
  seed banks)
- **Safety-critical claims:** none in the §9.3 sense.
- **Overlap/cross-links:** `growing_staple_food_crops.md`,
  `seed_saving_basics.md`, Emergency Shelter Systems' site-planning
  article (explicit boundary note, not a repeated figure).
- **Proposed category:** Agriculture
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred to Writing, per `WRITING_GUIDELINES.md`'s
  "don't tag by default" rule.

### Article 2: Building and Maintaining Soil Fertility at Scale

- **Purpose:** Composting and nutrient cycling for a group-scale
  growing operation, beyond what a single household garden bed needs.
- **Scope:** Compost material ratios (brown:green, carbon:nitrogen),
  moisture management, and - because it is genuinely safety-relevant -
  pathogen-reduction guidance when composting manure (sustained-heat
  threshold).
- **Explicit exclusions:** Does not repeat `growing_staple_food_crops.md`'s
  brief compost mention - extends it into an actual method. Does not
  cover chemical/synthetic fertilizer application rates (out of
  scope - no source targeted this pass, consistent with the pack's
  low-input framing).
- **Core claim IDs:** B1-B5
- **Likely sources:** USDA Cooperative Extension (Ask Extension,
  Cornell Cooperative Extension), USDA NRCS/AMS composting and organic-
  certification guidance.
- **Safety-critical claims:** B4 (manure pathogen-reduction heat
  threshold) is genuinely safety-relevant (foodborne-pathogen risk) -
  not a §9.3 literal match (not a toxic-substance threshold, medical
  dosage, or structural figure) but flagged for the same conservative,
  explicit-warning treatment this project already gives CO/fire
  content in Emergency Shelter Systems. See High-Risk Claim Areas.
- **Overlap/cross-links:** `growing_staple_food_crops.md`.
- **Proposed category:** Agriculture
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred.

### Article 3: Water for Growing: Irrigation Planning at Community Scale

- **Purpose:** How a group plans and chooses an irrigation approach for
  shared or expanded food production, as distinct from the Vault's
  existing drinking-water content.
- **Scope:** Comparison of small-scale irrigation methods (surface,
  sprinkle, drip, subsurface) and their tradeoffs (water efficiency,
  capital, labor, local conditions); an honest statement that precise
  crop water-need calculation is a genuinely technical, locally-
  specific exercise this article cannot reduce to a universal number.
- **Explicit exclusions:** Does not repeat drinking-water source
  protection, storage, or well-construction technique - cross-links
  `well_digging_and_safe_water_access.md`, Water Treatment at Scale,
  and `water_storage_and_long_term_water_safety.md` instead. Does not
  invent a specific crop-water-requirement figure (see High-Risk Claim
  Areas - a genuine, currently-unsourced gap around irrigation-water
  microbial safety for food crops as well).
- **Core claim IDs:** C1-C4 (C4 partially a known gap, see below)
- **Likely sources:** FAO small-scale irrigation guidance (arid zones);
  FAO Irrigation Water Needs training manual.
- **Safety-critical claims:** none load-bearing/numeric in the §9.3
  sense, but C4 (irrigation water contamination risk to food crops) is
  a real food-safety concern currently lacking a directly-read source
  - flagged as a gap to close before Writing, not silently dropped or
  silently assumed.
- **Overlap/cross-links:** `well_digging_and_safe_water_access.md`,
  `water_storage_and_long_term_water_safety.md`, Water Treatment at
  Scale.
- **Proposed category:** Agriculture
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred (arid/desert relevance is strong for
  irrigation specifically, but needs real thought, not default
  coverage-tagging, per the lesson already learned in Water Treatment
  at Scale's Stage 6 pass).

### Article 4: Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs

- **Purpose:** Integrated Pest Management (IPM) principles for a group
  growing food, emphasizing low-toxicity approaches appropriate where
  commercial pesticides are unavailable or undesirable.
- **Scope:** FAO's IPM framework (biological/cultural/physical methods,
  chemical treatment as last resort); crop rotation and resistant-
  variety selection as pest/disease prevention (cross-linking, not
  repeating, `growing_staple_food_crops.md`'s existing rotation
  content); low-toxicity, plant-based protectants for stored produce,
  narrowly scoped to the storage context the source actually supports.
- **Explicit exclusions:** No specific chemical-pesticide product or
  field-application dosing guidance. No plant-pathology/disease-
  diagnosis content requiring specialist identification. The one
  specific dosing figure found this pass (plant-oil protectant,
  5-10 ml/kg) applies **only** to stored-grain pest protection and
  must not be generalized to field-crop application - see High-Risk
  Claim Areas.
- **Core claim IDs:** D1-D4
- **Likely sources:** FAO Integrated Pest Management program page; FAO
  farm/village-level grain storage manual (storage-pest section); FAO
  Science, Technology and Innovation Portal (community seed bank pest
  protection, corroborating).
- **Safety-critical claims:** D3's storage-oil dosing figure needs
  explicit, narrow scope-framing in Writing (storage use only) - not a
  §9.3 literal match, ordinary conservative-scoping discipline applies.
- **Overlap/cross-links:** `growing_staple_food_crops.md` (rotation).
- **Proposed category:** Agriculture
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred.

### Article 5: Harvest, Storage, and Building a Community Food Reserve

- **Purpose:** Post-harvest handling and storage at group/community
  scale, and the concept of a food-security reserve, extending
  `food_preservation_basics.md` and `growing_staple_food_crops.md`'s
  brief harvest-timing note to system scale.
- **Scope:** Storage-hygiene principles as the primary loss-prevention
  method (ahead of chemical treatment); dividing a harvest by planned
  use timeline to reduce unnecessary chemical treatment (a specific,
  attributed field-study finding, not generalized into a universal
  rule); the qualitative concept of a community food reserve/buffer.
- **Explicit exclusions:** Does not restate household preservation
  technique (drying, salting, smoking, fermenting) - cross-links
  `food_preservation_basics.md` instead. **Does not include the
  specific pre-storage moisture-content percentages found this pass**
  (maize 23-28%, sorghum 20-25%, rice 22-28%, beans 30-40%, groundnuts
  30-35%) - these read as anomalously high relative to common
  storage-moisture knowledge and require a fresh, careful primary-text
  re-read before any specific percentage is used (see High-Risk Claim
  Areas). Does not invent a specific "X months of reserve" figure - no
  directly-read source supports one this pass.
- **Core claim IDs:** E1-E5 (E3 explicitly NOT frozen - see below)
- **Likely sources:** FAO farm/village-level grain storage manual.
- **Safety-critical claims:** E3 (moisture-content figures) is
  explicitly withheld pending re-verification - see High-Risk Claim
  Areas.
- **Overlap/cross-links:** `food_preservation_basics.md`,
  `growing_staple_food_crops.md`.
- **Proposed category:** Survival (matches `food_preservation_basics.md`'s
  own category, since this article is a direct scale-up of that
  domain rather than of the Agriculture-category growing content)
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred.

## Claim Inventory

### Article 1 (A)

| ID | Claim | Status |
|---|---|---|
| A1 | Before committing significant effort, a group should assess site suitability for growing (soil, water access, sun exposure) - general framing, cross-links existing core content | General knowledge / cross-link, low risk |
| A2 | A specific "land area required per person" figure was investigated and **could not be confirmed** against a directly-read Tier 1 primary source - only found via an uncertain secondary/tertiary chain (a forum post attributing an uncertain "FAO, 1993" figure, likely actually traceable to Pimentel, not FAO). **Decision: no specific hectare/acre-per-person figure will be used** - land needs will be stated only as scaling with group size, diet composition, and local soil/water conditions | **FLAGGED - drop specific number, confirmed this pass** |
| A3 | Crop diversification (multiple crop types/varieties) increases resilience against pest, disease, and single-season failure at group/community planning scale, extending `growing_staple_food_crops.md`'s monoculture-risk point to group-level planning | **VERIFIED, 2026-07-19** - see Targeted Source Collection Closure below |
| A4 | A community/group can establish a shared seed bank, extending individual household seed-saving to a pooled, more resilient system | Directly read (FAO STI Portal, Community Seed Banks) |
| A5 | Community seed banks are typically organized with an elected/community committee governing deposit, withdrawal, and replenishment rules | Directly read (same source) |
| A6 | Seeds contributed to a community bank are cleaned, dried, and tested for viability before storage, commonly in simple facilities (e.g., clay pots) | Directly read (same source) |

### Article 2 (B)

| ID | Claim | Status |
|---|---|---|
| B1 | A brown (carbon-rich) to green (nitrogen-rich) compost material ratio of roughly 3:1 to 4:1 by volume is commonly recommended | Directly read (Ask Extension) |
| B2 | The target carbon-to-nitrogen (C:N) ratio for a compost pile as a whole is roughly 25:1 to 40:1 (revised from the original 20:1-40:1 planning estimate to the directly-confirmed regulatory figure) | **VERIFIED WITH NARROWING, 2026-07-19** - see Targeted Source Collection Closure below |
| B3 | Compost pile moisture should be maintained at roughly 50-60% (optimum), with below 30% too dry and above 65% causing problems (revised from the original 40-65% planning estimate) | **VERIFIED WITH NARROWING, 2026-07-19** - see Targeted Source Collection Closure below |
| B4 | To reduce pathogen risk, a manure compost pile must reach 131-170°F (55-77°C) for **3 days if using an in-vessel or static aerated-pile system, or 15 days with at least 5 turnings if using a windrow system** - the original single "3 days" framing was incomplete and has been redesigned to represent both methods | **VERIFIED WITH NARROWING (claim redesigned to represent both methods), 2026-07-19 - flagged for §9.3-analogous Founder confirmation, see `community_food_production_FOUNDER_CONFIRMATION_PACKET.md`** |
| B5 | Composting recycles organic waste (crop residue, manure, food scraps) into usable soil fertility, reducing dependence on purchased/imported fertilizer | General framing, low risk, cross-links `growing_staple_food_crops.md` |
| B6 (new, added 2026-07-19) | Raw (uncomposted) manure applied to growing land should not be used within 120 days of harvest for a crop whose edible portion touches the soil, or within 90 days of harvest for a crop whose edible portion does not touch the soil | **VERIFIED, 2026-07-19 - REQUIRED SAFETY COMPLETION closing the "manure use generally" gap flagged in the prior sprint's High-Risk Claim Areas - flagged for §9.3-analogous Founder confirmation, see `community_food_production_FOUNDER_CONFIRMATION_PACKET.md`** |

### Article 3 (C)

| ID | Claim | Status |
|---|---|---|
| C1 | Multiple small-scale irrigation methods exist (surface, sprinkle, drip, subsurface/subirrigation), each with different water-efficiency, capital, and labor tradeoffs | Directly read (FAO Small-Scale Irrigation for Arid Zones) |
| C2 | There is no single "best" irrigation method - the right choice depends on water availability, capital constraints, labor availability, and local conditions | Directly read (same source) |
| C3 | Precisely estimating a crop's irrigation water need is a genuinely technical, locally-specific calculation that a general reader cannot precisely compute without local data - stated as an honest limitation, not reduced to an invented universal number | Directly read (FAO Irrigation Water Needs manual) |
| C4 | Irrigation water quality matters most when the water contacts the harvestable/edible portion of the crop; groundwater/well sources are generally less contaminated than surface water; drip/trickle irrigation reduces contamination risk versus overhead methods for crops other than root vegetables; allowing time between the last irrigation and harvest reduces pathogen risk. Explicitly framed as general good practice, not a claim that irrigation water must meet drinking-water potability standards, and no jurisdiction-specific numeric standard (e.g., a specific CFU count) is asserted | **VERIFIED WITH NARROWING, 2026-07-19** - see Targeted Source Collection Closure below |

### Article 4 (D)

| ID | Claim | Status |
|---|---|---|
| D1 | FAO's Integrated Pest Management (IPM) approach combines biological, cultural, physical, and chemical methods, treating chemical pesticide use as a last resort | Directly read (FAO IPM page) |
| D2 | Crop rotation and resistant/adapted variety selection are core IPM practices that reduce pest and disease buildup | Cross-link/reinforcement of `growing_staple_food_crops.md`'s existing content, not an independent new claim |
| D3 | Plant-based, low-toxicity protectants (e.g., vegetable oil at 5-10 ml/kg) are used to protect **stored grain** from certain pests | Directly read (FAO farm/village-level grain storage manual). **Scope-locked to storage use** - must not be generalized to field-crop application |
| D4 | Indigenous low-toxicity methods (wood ash, neem leaves, chili extract) are used for seed/stored-produce pest protection, corroborating D3 | Directly read (FAO STI Portal) |

### Article 5 (E)

| ID | Claim | Status |
|---|---|---|
| E1 | Storage hygiene (clean, well-prepared storage structures) is the basic prerequisite for successful loss prevention, prioritized over chemical treatment | Directly read (FAO farm/village-level grain storage manual) |
| E2 | Dividing a harvest by planned use timeline can reduce chemical treatment needs, since a documented Tanzania/West Africa field study found stored pest insects generally didn't cause economic loss in the first 3-4 months | Directly read (same source) - keep the specific-study attribution explicit, do not generalize into a universal rule for all grains/climates |
| E3 | **CITATION-CONTENT MISMATCH CONFIRMED, then REPLACED, 2026-07-19** - the original percentages (maize 23-28%, sorghum 20-25%, rice 22-28%, beans 30-40%, groundnuts 30-35%) are the source's own table of moisture content **at physiological maturity/harvest**, explicitly *not* presented by the source as safe-storage values (the source's own text states "the indicated moisture content at the time of maturity does not mean that the crop is fit for storage. Drying is necessary after the harvest"). **Replaced claim:** safe storage moisture for maize is roughly 12% for bulk storage or up to 15% for bag storage - a directly-confirmed figure for maize only; other crops' safe-storage moisture was not independently confirmed this pass and is not asserted | **REPLACED WITH A BETTER SOURCE, narrowed to maize only, 2026-07-19** - see Targeted Source Collection Closure below |
| E4 | Building a food reserve/buffer beyond immediate need is a recognized food-security practice for surviving a bad season | Framed qualitatively - no specific "X months" figure found this pass; extends `food_preservation_basics.md` and `growing_staple_food_crops.md`'s existing content to group scale |
| E5 | Household-scale preservation techniques (drying, salting, smoking, fermenting) are not restated here | Cross-link only, not a sourced claim - points to `food_preservation_basics.md` |

## High-Risk Claim Areas (Part 6)

Investigated against the task's full list (crop-spacing, planting
calendars, fertilizer rates, pesticide use, compost safety, manure use,
irrigation quantities, irrigation water quality, livestock stocking/
disease, storage moisture/temperature thresholds, land-per-person,
yield-per-area, universal calorie claims, climate/soil/variety
dependence).

| Area | Finding | Determination |
|---|---|---|
| Crop-spacing prescriptions | Already owned by `growing_staple_food_crops.md` - not re-derived here | No new risk introduced |
| Planting calendars | No calendar-date content planned; cross-links `traditional_weather_prediction_and_seasonal_indicators.md` for timing signals instead of inventing dates | No risk |
| Fertilizer application rates | Compost ratios (B1-B2) are well-corroborated across multiple Extension/USDA sources; no specific application-rate-per-area figure is planned | Normal §9.2 verification once B2 is directly confirmed |
| Pesticide use | No chemical-pesticide dosing/product content planned at all; IPM framing (D1) explicitly favors non-chemical methods first | Low risk by design |
| Compost safety (manure pathogen reduction) | B4 directly confirmed 2026-07-19, and found to be method-specific (in-vessel/static aerated pile: 3 days; windrow: 15 days + 5 turnings) - the original single-figure framing would have been misleading | **RESOLVED - claim redesigned to represent both methods. Re-evaluated against §9.3 by analogy to the Emergency Shelter Systems CO-safety precedent (a specific numeric threshold controlling a real, specific illness risk) and now flagged for §9.3-analogous Founder confirmation - see `community_food_production_FOUNDER_CONFIRMATION_PACKET.md`. This updates the prior sprint's conclusion that no §9.3 analogy applied** |
| Manure use generally | RESOLVED 2026-07-19 - a directly-read source (eOrganic, quoting USDA NOP regulatory language) gives an exact, real pre-harvest interval: 120 days if the edible portion touches the soil, 90 days if it does not | **Closed as a new claim, B6. Also flagged for §9.3-analogous Founder confirmation alongside B4** |
| Irrigation quantities | C3 explicitly declines to invent a universal crop-water-need number, matching the source's own stated caution that this requires local data | No risk - handled by honest limitation-framing |
| Irrigation water quality/food safety | C4 RESOLVED 2026-07-19 via two directly-read university Extension sources (UF IFAS, Purdue Extension) - kept deliberately qualitative (source selection, irrigation method, timing buffer), with a jurisdiction-specific numeric standard (CFU count) deliberately excluded per this task's instruction to avoid a regulatory-manual framing | No mandatory Founder confirmation - stays a general caution, not a specific actionable number, so §9.3's own trigger condition isn't met |
| Livestock stocking densities / disease | N/A - livestock excluded from this pack's architecture (Part 4) | No risk - out of scope |
| Food-storage moisture/temperature thresholds | E3 RESOLVED 2026-07-19 - the original figures were a citation-content mismatch (harvest-maturity moisture, not storage-safe moisture); replaced with a directly-confirmed maize-only safe-storage figure (12% bulk / 15% bag) | **Resolved - narrowed to maize only; other crops' safe-storage moisture not asserted** |
| Land-per-person calculations | A2 - investigated and found unconfirmable against a reliable primary source; will not be used | **Resolved this pass - drop the number, state general dependency instead** |
| Yield-per-area claims | No yield-per-area figure is planned; `growing_staple_food_crops.md`'s own established "yield varies enormously" framing will be followed if the topic comes up at all | Low risk by design |
| Universal calorie-production claims | No calorie-math content planned - avoided entirely, consistent with this project's established caution against inventing nutrition arithmetic | No risk |
| Claims dependent on climate/soil/variety | Default framing throughout, matching `growing_staple_food_crops.md`'s own "depends heavily on local climate" language | Low risk - consistent pattern already proven across this project |

**Superseded, 2026-07-19 - see Targeted Source Collection Closure
below for the current conclusion.** The original text of this
paragraph (preserved here as the accurate record of this Research
Plan's initial reasoning) is: "None of the identified high-risk claim
areas literally match `QUALITY_STANDARD.md` §9.3's five named
categories (specific medication dosages, invasive medical/surgical
procedures, childbirth/obstetric management, specific toxic-substance
handling thresholds, specific electrical/structural load-bearing
figures). B4's pathogen-heat-threshold is analogous in spirit to a
biological-hazard threshold but is not a literal toxic-substance
handling figure - per §9.3's own text ('narrowly scoped... not a
broader classification system'), this is not force-fit into §9.3. It
is instead flagged for the same conservative, explicit-warning
discipline this project already applies to safety-relevant content
that falls short of §9.3's literal scope (e.g., Emergency Shelter
Systems' CO/fire-safety content, which was similarly not a §9.3
match)." **This conclusion has been revised** - see the Targeted
Source Collection Closure section below for why B4 and the new B6
claim are now treated as §9.3-analogous.

## Targeted Source Collection Closure (2026-07-19)

Performed by Claude (AI agent), continuing the same research/source-
collection authorization the Founder granted 2026-07-19. Every source
below was freshly opened and read this pass via direct `WebFetch`, not
recalled from the prior sprint or from training data. This section
resolves the 6 items the prior sprint left open (A3, B2, B3, B4, C4,
E3) and one additionally-discovered safety gap (manure pre-harvest
interval, now claim B6).

### A3 — Crop diversification for resilience

**Result: VERIFIED.** The originally-targeted candidate source (an FAO
Guatemala smallholder study, fao.org/4/u8050t/u8050t06.htm) was
directly opened and read, and turned out **not** to support this
claim - it examines a different question (whether adding cash crops
displaces staple-food production), a genuine citation-content mismatch
caught before use, not silently substituted. The two FAO Policy Briefs
identified as stronger candidates (Policy Brief 2, "Is crop
diversification a panacea for climate resilience in Africa," 2017;
Policy Brief 8, "Crop diversification increases productivity and
stabilizes income of small-holders," 2018) could not be directly
opened - both `openknowledge.fao.org` bitstream URLs returned HTTP 403,
consistent with this project's established pattern for that specific
repository endpoint. **CCARDESA** (Centre for Coordination of
Agricultural Research and Development for Southern Africa - a
recognized regional agricultural research institution, matching this
task's Part 2 priority list) was directly opened and read instead, and
both summarizes and directly quotes the same two FAO Policy Briefs:
"The main advantage of implementing crop diversification is that it
enhances household climate resilience through reducing risk of
monocrop failure due to pests, disease, low rainfall and other climate
risks," and "Increased yields of rotated crops due to lower incidence
of pests/diseases." This is accepted as a Tier 2 directly-read source
(an institutional agricultural-research body's own published resource
page, actually opened and read) that itself transmits the FAO primary
findings - the claim is verified via CCARDESA, not falsely attributed
to a personally-read FAO primary document.

### B2, B3 — Compost C:N ratio and moisture

**Result: VERIFIED WITH NARROWING, both.** eOrganic
(https://eorganic.org/pages/18567/making-and-using-compost-for-organic-farming
- a Cooperative Extension-affiliated, land-grant-university-consortium
educational resource, Tier 2) was directly opened and read: "Composted
plant and animal manures established an initial C:N ratio of between
25:1 and 40:1" (per USDA National Organic Program regulatory
language) - narrower than the original 20:1-40:1 planning estimate,
now corrected to the confirmed figure. Cornell Composting
(https://compost.css.cornell.edu/physics.html - Cornell Waste
Management Institute, Tier 1/2 academic extension resource) was
directly opened and read for moisture: "A moisture content of 50-60%
is generally considered optimum for composting," with below 30% too
dry (slows bacterial activity) and above 65% causing odor/nutrient-
loss problems - narrower and more precisely sourced than the original
40-65% planning estimate.

### B4 — Compost pathogen-reduction time/temperature

**Result: VERIFIED WITH NARROWING (claim redesigned).** The same
eOrganic page, directly read, gives the actual USDA National Organic
Program regulatory text, and it is **method-specific, not a single
universal rule**, confirming the task's explicit warning not to
collapse multiple process standards into one:

> "Maintained a temperature of between 131°F and 170°F for 3 days
> using an in-vessel or static aerated pile system" **or** "Maintained
> a temperature of between 131°F and 170°F for 15 days using a windrow
> composting system, during which period, the materials must be
> turned a minimum of five times."

The original planned claim ("131°F/55°C for at least 3 days," singular)
would have been **incomplete and potentially misleading** for a general
reader, since windrow composting (an open pile, turned periodically) -
the method most accessible without specialized equipment, and the one
this pack's readers are most likely to actually use - requires 15 days
and 5 turnings, not 3 days. **The claim has been redesigned to state
both methods explicitly**, not simplified back to a single figure.
Vermicomposting was also investigated (via the same source) and found
to follow an entirely different process (no fixed temperature
threshold; pathogen elimination over 7-60 days depending on
technology, with time-log rather than temperature-log
recordkeeping) - **not included as a claim**, since this pack's planned
scope (a general composting method for a group, not a specialized
vermicomposting operation) does not need it, and asserting a
vermicompost-specific rule would risk exactly the kind of collapsed,
over-generalized claim this task warned against.

### C4 — Irrigation water contamination risk to food crops

**Result: VERIFIED WITH NARROWING.** Two established university
Extension sources were directly opened and read:

- University of Florida IFAS Extension (FS136,
  https://ask.ifas.ufl.edu/publication/FS136): water quality "is
  extremely important when water comes into direct contact with the
  harvestable portion of produce," groundwater "is less likely to be
  contaminated than surface water" (with a caveat for shallow/older/
  improperly-constructed wells), and allowing "time for potentially
  dangerous microbes to die off in field between last irrigation and
  harvest" is a recognized risk-reduction practice.
- Purdue Extension (Vegetable Crops Hotline,
  https://vegcropshotline.org/article/food-safety-considerations-for-vegetable-farms/):
  "With the exception of root crops, produce farms can reduce risk by
  limiting the contact of water with the edible portion of the crop
  through utilization of drip or trickle irrigation," and public/well
  water sources are preferred over surface water (ponds, streams,
  reservoirs) because "surface water is open to the environment,
  making it difficult to control animal access, runoff, and other
  potential sources of contamination."

Per this task's explicit instruction, the claim is kept **qualitative
and comparative** (source choice, irrigation method, timing buffer,
root-crop exception) rather than asserting that irrigation water must
meet drinking-water potability standards, and the U.S. FDA Produce
Safety Rule's specific numeric standard (126 CFU/100mL generic E.
coli, found via the same FS136 page) is **deliberately excluded** -
including it would turn a general offline knowledge pack into a
jurisdiction-specific regulatory citation, which this task explicitly
warned against.

### E3 — Grain storage moisture content

**Result: citation-content mismatch confirmed, then REPLACED WITH A
BETTER AUTHORITATIVE SOURCE.** The original FAO source
(x5065e/x5065E07.htm) was re-opened and read with a specifically
targeted prompt asking for the exact surrounding text. The table's own
heading and the sentence immediately following it were located:

> "Watch out for the signs of physiological maturity: [table with
> maize 23-28%, sorghum 20-25%, rice 22-28%, beans 30-40%, groundnuts
> 30-35%] The indicated moisture content at the time of maturity does
> not mean that the crop is fit for storage. Drying is necessary after
> the harvest until the moisture content is reduced to values
> mentioned under section 2.2.5."

This confirms the prior sprint's suspicion exactly: **these are
harvest-maturity indicators, not safe-storage values**, and the source
itself says so explicitly - a genuine citation-content mismatch, now
recorded rather than silently corrected. Section 2.2.5 itself could
not be located at a directly-fetchable URL this pass (only the
document's introduction page was reachable via the same path
structure). A **different, directly-read FAO source** was found and
used instead: Farm Structures... (S1250E,
https://www.fao.org/4/s1250e/S1250E0w.htm), which states plainly: "For
maize, the requirement for safe storage is maximum 15 and 12%
moisture content respectively" for bag and bulk storage. **This
figure is confirmed for maize only.** Sorghum, rice, beans, and
groundnuts' safe-storage moisture were not independently confirmed
this pass - the claim is narrowed to maize rather than extrapolating a
single universal grain-storage percentage across all five crops, per
this task's explicit instruction not to manufacture one universal
threshold when the evidence is crop-specific.

### Manure pre-harvest interval (new claim, B6)

**Classification: REQUIRED SAFETY COMPLETION.** The prior sprint
flagged "manure use generally" as a real, necessary safety gap
(pathogen risk from raw manure on food crops) beyond composting
specifically - not optional, since Article 2 already discusses manure
as a soil-fertility input and a reader could reasonably apply it raw
without this caution. The same eOrganic source used for B2/B4, directly
read, supplies the exact USDA National Organic Program interval:

> "Incorporated into the soil not less than 120 days prior to the
> harvest of a product whose edible portion has direct contact with
> the soil surface or soil particles" or "not less than 90 days prior
> to the harvest of a product whose edible portion does not have
> direct contact with the soil surface or soil particles."

This is added as new claim **B6**, not silently folded into B4 (which
covers composting, a different practice from raw-manure application
timing). Framed as a widely-used, science-informed safety practice
rather than binding law in every jurisdiction, consistent with this
task's instruction to keep the pack general rather than a regulatory
manual.

### Founder-confirmation reassessment (Part 8)

Freshly reconsidered against the actual final claim set, not
mechanically repeating the prior sprint's conclusion. **B4 and B6 are
now treated as §9.3-analogous and flagged for mandatory Founder
confirmation before Writing finalizes them**, applying the same
reasoning this project already used for Emergency Shelter Systems' CO-
poisoning thresholds (a specific numeric figure controlling a specific,
real illness risk, structurally the same shape regardless of whether
the hazard is a toxic gas or a foodborne pathogen). See
`community_food_production_FOUNDER_CONFIRMATION_PACKET.md` - nothing
in it is marked confirmed. C4 remains a general, non-numeric caution
and does not meet §9.3's own trigger condition ("the article must
state a specific, actionable number"), so it is not included in the
packet. D3 (storage-pest oil dosing) remains a pest-control figure,
not a human-health pathogen threshold, and stays under ordinary §9.2
conservative-scoping discipline.

### Full 24(now 25)-claim re-audit (Part 7)

Every claim ID was reviewed fresh against the actual final wording
above:

- No unsupported operational number remains unflagged - every
  remaining number (B1-B4, B6, C-series qualitative framing, E3-maize)
  traces to a source actually opened and read this pass or the prior
  one.
- No search-snippet-only evidence is treated as verified - A3, B2, B3,
  B4, C4, B6, and the E3 replacement were all promoted from search-
  level to directly-read this pass; none was upgraded without an
  actual fetch.
- No inaccessible source is represented as directly read - the two
  blocked FAO Policy Briefs are cited only via CCARDESA's own
  directly-read summary/quotation, not falsely claimed as personally
  read in full.
- No claim silently expanded - B4 was *narrowed into two explicit
  method-specific figures*, not expanded; C4 stayed deliberately
  qualitative; E3 was *narrowed* to maize only.
- No crop-specific recommendation became universal - E3 stays maize-
  only; the original 5-crop table is excluded, not generalized.
- No climate-specific recommendation became universal - C1-C2's arid-
  zone-sourced content remains framed as general method comparison,
  not arid-zone-specific advice.
- No regulatory recommendation became universal - C4 excludes the
  U.S.-specific CFU standard; B4/B6 are framed as general good
  practice drawn from a real standard, not asserted as binding law
  everywhere.
- No livestock content entered - manure is treated only as an
  already-available soil input (as `growing_staple_food_crops.md`
  already does), not as livestock-keeping guidance.
- No Aquaponics technical content entered - none introduced this pass.
- No chemical-pesticide dosing guidance entered - D3 remains the only
  dosing figure and it is a plant-based, low-toxicity, storage-scoped
  protectant, not a chemical pesticide.

## Expected Verification Levels (if research closes successfully)

**Updated, 2026-07-19 (post-closure):**

| Article | Source-support status | Remaining blocker before Writing |
|---|---|---|
| 1. Assessing Land and Planning a Resilient, Diversified Food System | All claims (A1, A3-A6) directly supported; A2 resolved (dropped) | None - source-ready |
| 2. Building and Maintaining Soil Fertility at Scale | All claims (B1-B6) directly supported | **B4 and B6 require Founder confirmation** before Writing finalizes them at full strength (see Founder Confirmation Packet) |
| 3. Water for Growing: Irrigation Planning at Community Scale | All claims (C1-C4) directly supported | None - source-ready |
| 4. Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs | All claims (D1, D3, D4) directly supported; D2 is a cross-link | None - source-ready |
| 5. Harvest, Storage, and Building a Community Food Reserve | All claims (E1, E2, E4, E5) directly supported; E3 replaced/narrowed to maize | None - source-ready |

## Visual Knowledge Opportunity Audit

Research/planning only - no image generated, no schema change, no
article metadata added.

| Concept | Classification | Notes |
|---|---|---|
| Compost pile structure/layering (brown vs. green materials) | **Visual strongly recommended** | A labeled cross-section directly serves Article 2's core, comparison-friendly content |
| Irrigation method comparison (surface, drip, sprinkle, subsurface) | **Visual strongly recommended** | Four genuinely different physical setups - a side-by-side diagram would convey this far more directly than prose alone |
| Land/plot layout for group food production | Visual helpful | A simple plan-view sketch could reinforce Article 1's planning content without asserting more spatial specificity than the text supports |
| Community seed bank storage | Visual helpful | Simple, non-technical (clay pots, labeled containers) - low risk of overstating specificity |
| Pest damage identification | **Text sufficient - no visual recommended** | Identifying specific pests/damage patterns requires species-level accuracy this pack's sources don't support at that resolution; a generic illustration risks implying diagnostic precision the text doesn't have, the same failure mode Emergency Shelter Systems avoided for its anchoring content |
| Harvest/storage structure | Visual helpful | A simple raised/ventilated storage structure diagram, once E3's moisture-threshold content is properly resolved |

## Production-Stage Status

- **Stage 1 (Topic Selection):** Complete - Founder-approved directly,
  six acceptance criteria pass (above).
- **Stage 2 (Research):** This document - in progress, not complete.
  Article architecture and claim inventory drafted; several claims
  remain search-level or explicitly flagged as gaps (A3, B2-B4, C4,
  E3).
- **Stage 3 (Source Collection):** Underway in parallel - see
  `community_food_production_SOURCE_COLLECTION.md`. Not complete.
- **Stages 4-7:** Not started. Not authorized by the Founder's current
  decision, which covers research and source collection only.

## Ready to write? — UPDATED 2026-07-19: READY FOR WRITING AFTER FOUNDER CONFIRMATION

*(Original 2026-07-18 "NO" assessment preserved above/unchanged in the
claim tables' history; this section records the current, superseding
status after the Targeted Source Collection Closure.)*

- [x] Every planned article now has adequate directly-read source
      support - all 6 previously-open items (A3, B2, B3, B4, C4, E3)
      are closed; one additional gap (manure pre-harvest interval) was
      found and closed as new claim B6.
- [x] No unresolved source conflict remains - E3's citation-content
      mismatch was identified, explained, and replaced with a correct,
      narrower claim (maize only).
- [x] No search-level-only claim remains - every claim in the 25-item
      set is either directly read, general framing/cross-link, or
      explicitly dropped (A2).
- [x] No unsupported operational number remains - B4 was redesigned to
      represent both composting methods rather than asserting one
      incomplete figure; C4 deliberately stays non-numeric.
- [x] All claim boundaries are sufficiently precise for drafting.
- [ ] **Mandatory Founder confirmation remains outstanding for exactly
      two claims: B4 (compost pathogen-reduction time/temperature,
      method-specific) and B6 (raw manure pre-harvest interval)** -
      see `community_food_production_FOUNDER_CONFIRMATION_PACKET.md`.
      This is the one remaining condition standing between this pack
      and a clean "READY FOR WRITING."

**This Research Plan still does not authorize Writing.** Per the
Founder's decision, this sprint's authorization covers research,
scope definition, and source collection only. Writing on every claim
*except* B4 and B6 could proceed once a separate Writing authorization
is given; B4 and B6 specifically require the Founder Confirmation
Packet to be completed first, or must be written as a general caution
without their specific figures if confirmation is not given.
