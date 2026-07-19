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
| A3 | Crop diversification (multiple crop types/varieties) increases resilience against pest, disease, and single-season failure at group/community planning scale, extending `growing_staple_food_crops.md`'s monoculture-risk point to group-level planning | Found via search this pass; primary FAO policy-brief document not yet directly read - candidate source identified, direct read pending |
| A4 | A community/group can establish a shared seed bank, extending individual household seed-saving to a pooled, more resilient system | Directly read (FAO STI Portal, Community Seed Banks) |
| A5 | Community seed banks are typically organized with an elected/community committee governing deposit, withdrawal, and replenishment rules | Directly read (same source) |
| A6 | Seeds contributed to a community bank are cleaned, dried, and tested for viability before storage, commonly in simple facilities (e.g., clay pots) | Directly read (same source) |

### Article 2 (B)

| ID | Claim | Status |
|---|---|---|
| B1 | A brown (carbon-rich) to green (nitrogen-rich) compost material ratio of roughly 3:1 to 4:1 by volume is commonly recommended | Directly read (Ask Extension) |
| B2 | The target carbon-to-nitrogen (C:N) ratio for a compost pile as a whole is commonly cited as roughly 20:1 to 40:1 | Found via search this pass (USDA/Extension consensus); direct primary read pending - NRCS Chapter 2 Composting returned 403, substitute Tier 1/2 source needed |
| B3 | Compost pile moisture should be maintained at roughly 40-65% | Found via search this pass (USDA AMS); direct read pending |
| B4 | To reduce pathogen risk, USDA's organic-certification standard requires a manure compost pile to sustain a minimum of 131°F (55°C) for at least 3 days | Found via search this pass (USDA AMS NOP 5021); direct read pending - **highest-priority claim to lock down given its safety relevance** |
| B5 | Composting recycles organic waste (crop residue, manure, food scraps) into usable soil fertility, reducing dependence on purchased/imported fertilizer | General framing, low risk, cross-links `growing_staple_food_crops.md` |

### Article 3 (C)

| ID | Claim | Status |
|---|---|---|
| C1 | Multiple small-scale irrigation methods exist (surface, sprinkle, drip, subsurface/subirrigation), each with different water-efficiency, capital, and labor tradeoffs | Directly read (FAO Small-Scale Irrigation for Arid Zones) |
| C2 | There is no single "best" irrigation method - the right choice depends on water availability, capital constraints, labor availability, and local conditions | Directly read (same source) |
| C3 | Precisely estimating a crop's irrigation water need is a genuinely technical, locally-specific calculation that a general reader cannot precisely compute without local data - stated as an honest limitation, not reduced to an invented universal number | Directly read (FAO Irrigation Water Needs manual) |
| C4 | Irrigation water carrying contamination can transfer pathogens to food crops, so the same source-protection principle used for drinking water applies | **KNOWN GAP - not directly sourced this pass.** A real, important claim; requires a direct source (candidate: WHO/FAO wastewater-reuse-in-agriculture guidance) before Writing. Not invented, not assumed |

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
| E3 | Specific pre-storage moisture-content percentages by crop (maize 23-28%, sorghum 20-25%, rice 22-28%, beans 30-40%, groundnuts 30-35%) | **FLAGGED, NOT FROZEN.** Found via WebFetch this pass but read as anomalously high relative to common storage-moisture knowledge (typical safe grain storage moisture is usually cited far lower). Possible explanation: these may describe a different measurement stage (pre-drying/threshing) rather than a final safe-storage target - **this must be confirmed by a fresh, careful direct primary-text re-read, not assumed**, before any specific percentage is used in Writing |
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
| Compost safety (manure pathogen reduction) | B4's 131°F/55°C-for-3-days figure is safety-relevant (foodborne pathogen risk) and currently only search-confirmed, not directly read | **Requires direct primary-source read before Writing; recommend explicit, conservative warning language once confirmed, matching the CO/fire-safety treatment precedent - not a §9.3 literal match (not toxic-substance/medical/structural), so no mandatory Founder pre-writing confirmation is triggered by the standing policy** |
| Manure use generally | A real food-safety concern (pathogen risk from raw manure applied to food crops) beyond composting specifically - **no source targeting a safe pre-harvest interval was found this pass** | **Gap - if not closed with a real source before Writing, write only a general caution ("compost manure fully before applying it near food crops") rather than inventing a specific day-count** |
| Irrigation quantities | C3 explicitly declines to invent a universal crop-water-need number, matching the source's own stated caution that this requires local data | No risk - handled by honest limitation-framing |
| Irrigation water quality/food safety | C4 is a known, unresolved gap - a real claim with no directly-read source yet | **Gap - must be resolved (real source found) or written as a general caution before Writing** |
| Livestock stocking densities / disease | N/A - livestock excluded from this pack's architecture (Part 4) | No risk - out of scope |
| Food-storage moisture/temperature thresholds | E3's specific percentages are flagged as requiring re-verification - see Claim Inventory | **Do not use as currently found; re-read primary source before Writing** |
| Land-per-person calculations | A2 - investigated and found unconfirmable against a reliable primary source; will not be used | **Resolved this pass - drop the number, state general dependency instead** |
| Yield-per-area claims | No yield-per-area figure is planned; `growing_staple_food_crops.md`'s own established "yield varies enormously" framing will be followed if the topic comes up at all | Low risk by design |
| Universal calorie-production claims | No calorie-math content planned - avoided entirely, consistent with this project's established caution against inventing nutrition arithmetic | No risk |
| Claims dependent on climate/soil/variety | Default framing throughout, matching `growing_staple_food_crops.md`'s own "depends heavily on local climate" language | Low risk - consistent pattern already proven across this project |

**None of the identified high-risk claim areas literally match
`QUALITY_STANDARD.md` §9.3's five named categories** (specific
medication dosages, invasive medical/surgical procedures, childbirth/
obstetric management, specific toxic-substance handling thresholds,
specific electrical/structural load-bearing figures). B4's pathogen-
heat-threshold is analogous in spirit to a biological-hazard
threshold but is not a literal toxic-substance handling figure - per
§9.3's own text ("narrowly scoped... not a broader classification
system"), this is **not force-fit into §9.3**. It is instead flagged
for the same conservative, explicit-warning discipline this project
already applies to safety-relevant content that falls short of §9.3's
literal scope (e.g., Emergency Shelter Systems' CO/fire-safety
content, which was similarly not a §9.3 match).

## Expected Verification Levels (if research closes successfully)

| Article | Realistic `verification_level` if Source Collection closes the flagged gaps | If gaps remain open |
|---|---|---|
| 1. Assessing Land and Planning a Resilient, Diversified Food System | Verified Source achievable (A3 needs its direct primary read) | Community Verified if A3 stays search-only |
| 2. Building and Maintaining Soil Fertility at Scale | Verified Source achievable (B2-B4 need direct primary reads) | Community Verified if B2-B4 stay search-only |
| 3. Water for Growing: Irrigation Planning at Community Scale | Verified Source achievable **only if C4 is closed** | Not achievable at Verified Source with C4 open - either find a source or write C4 as general caution |
| 4. Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs | Verified Source achievable now (all claims already directly read) | N/A - no open gap |
| 5. Harvest, Storage, and Building a Community Food Reserve | Verified Source achievable **only if E3 is either re-verified or dropped** | Not achievable at Verified Source with E3 open as currently worded |

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

## Ready to write? — NO

- [ ] Every planned article has at least one directly-read candidate
      source - **met for Articles 1 (partially), 2 (partially), 3, 4**;
      **NOT fully met for Article 5** (E3's specific figures need
      re-verification before use) and Article 3 has one open claim
      (C4).
- [x] No planned claim requires a source known in advance to be
      inaccessible without a fallback plan - every flagged gap (A2,
      A3, B2-B4, C4, E3) has an explicit fallback (drop the number,
      find a substitute source, or write as general caution), none is
      silently left open.
- [x] Safety-sensitive claim families identified (B4 manure pathogen
      threshold, D3 storage-pest oil dosing, E3 moisture thresholds)
      and mapped against `QUALITY_STANDARD.md` §9.3 - none is a literal
      match; all get conservative-framing treatment instead of a
      mandatory Founder pre-writing confirmation gate.

**This Research Plan does not authorize Writing.** Per the Founder's
decision, this sprint's authorization covers research, scope
definition, and source collection only.
