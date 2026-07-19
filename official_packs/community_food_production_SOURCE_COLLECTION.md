---
pack_id: hv_official_community_food_production
---

# Source Collection — Community & System-Scale Food Production

Every source below was actually attempted this pass (2026-07-19), via
direct `WebSearch`/`WebFetch` tool access, not recalled from training
data. Search-result summaries are recorded honestly as summaries, not
as direct reads, per `QUALITY_STANDARD.md` §4 and §9. This is a first
research pass, not a closed collection - several candidate sources
identified via search have not yet been directly opened (recorded
below as "discovered but not yet read"), consistent with an honest,
in-progress Source Collection stage.

## Sources successfully opened and read in full

### Source: FAO, Integrated Pest Management (IPM) — main program page

- **Citation/URL:** https://www.fao.org/pest-and-pesticide-management/ipm/integrated-pest-management/en/
- **Publisher:** FAO (Food and Agriculture Organization of the United
  Nations)
- **Which claims it supports:** Article 4, D1
- **Source quality tier:** [x] Tier 1 (official UN agency, primary
  authority on this exact topic)
- **Directly opened and read in full:** Yes - FAO's IPM definition
  ("careful consideration of all available pest control techniques and
  subsequent integration of appropriate measures that discourage the
  development of pest populations"), the framing of IPM as combining
  biological, chemical, physical, and cultural strategies with an
  ecological, sustainability-oriented emphasis, and chemical treatment
  positioned as one component rather than the primary strategy.
- **Population/geographic scope:** Global guidance, not region-specific.
- **Limitations:** This particular page is a general definitional/
  framework page - it does not itself list specific techniques (crop
  rotation, resistant varieties) in detail; those are corroborated via
  D2's cross-link to `growing_staple_food_crops.md` rather than this
  page.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: FAO, Irrigation Water Needs (Training Manual No. 3)

- **Citation/URL:** https://www.fao.org/4/s2022e/s2022e00.htm
- **Publisher:** FAO
- **Which claims it supports:** Article 3, C3
- **Source quality tier:** [x] Tier 1 (official UN agency training
  manual)
- **Directly opened and read in full:** Yes - the manual's structure
  (reference evapotranspiration via Pan Evaporation or Blaney-Criddle
  methods, crop coefficients, effective rainfall), its explicit framing
  that the full calculation is "time-consuming and requires background
  knowledge," and that Part I gives only "approximate values or orders
  of magnitude" for extension workers, with precise computation
  reserved for Part II's technician-level detail.
- **Population/geographic scope:** Written for village/district-level
  irrigation technicians generally, not region-specific.
- **Limitations:** No specific numeric crop-water-need figures were
  extracted from this pass - deliberately, since the manual's own
  framing supports treating this as a locally-computed value, not a
  universal number this pack should assert.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: FAO, Small-Scale Irrigation for Arid Zones

- **Citation/URL:** https://www.fao.org/4/w3094e/w3094e05.htm
- **Publisher:** FAO
- **Which claims it supports:** Article 3, C1-C2
- **Source quality tier:** [x] Tier 1
- **Directly opened and read in full:** Yes - the five irrigation
  method categories (surface, sprinkle, drip, subsurface exuders,
  subirrigation), the below-ground/above-ground practical-system
  breakdown (porous jars, ceramic pipes, plastic sleeves; full drip,
  simplified drip, microsprayers, bubblers), and the explicit statement
  that "there is, altogether, no 'best system'" - selection depends on
  water availability, capital constraints, labor economics, and local
  conditions.
- **Population/geographic scope:** Arid-zone smallholder farming
  contexts, primarily African case examples per the broader manual
  series.
- **Limitations:** Arid-zone framing may not transfer perfectly to
  humid-climate irrigation needs - flagged for Writing to keep the
  method-comparison general rather than arid-zone-specific.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: FAO, Manual of the Prevention of Post-Harvest Grain Losses — Farm and Village Level Storage

- **Citation/URL:** https://www.fao.org/4/x5065e/x5065E07.htm
- **Publisher:** FAO
- **Which claims it supports:** Article 4 (D3), Article 5 (E1, E2, E3)
- **Source quality tier:** [x] Tier 1
- **Directly opened and read in full:** Yes - "storage hygiene is the
  basic prerequisite for successful storage" (non-chemical measures
  prioritized), plant-based protectants (neem leaves, Annona species,
  vegetable/peanut/palm oils at 5-10 ml/kg) for stored-grain pests
  specifically, physical techniques (sun-drying, winnowing, sieving,
  airtight storage), the integrated approach of dividing a harvest by
  planned-use timeline (citing Tanzania/West Africa field data showing
  stored pest insects generally didn't cause economic loss in the
  first 3-4 months), a discouragement of farm-level fumigation due to
  safety/sealing concerns, and specific pre-storage moisture-content
  percentages by crop (maize 23-28%, sorghum 20-25%, rice 22-28%, beans
  30-40%, groundnuts 30-35%).
- **Population/geographic scope:** Smallholder/village-level storage in
  developing-country contexts generally.
- **Limitations - IMPORTANT, flagged explicitly:** the moisture-content
  percentages read as unusually high relative to commonly-known safe
  grain-storage moisture targets (typically cited much lower, closer to
  12-14%, in other horticultural/storage literature this project has
  encountered). **This document was read via the WebFetch tool's own
  summarization, not character-by-character by a human or a second
  independent pass** - it is possible these percentages describe a
  pre-drying/threshing moisture stage rather than the final safe-
  storage target, or it is possible the figures are correct for this
  specific FAO manual's framing and simply differ from other sources'
  conventions. **This is recorded as an open, unresolved question, not
  a confirmed fact** - E3 is explicitly not frozen as a usable claim
  until a fresh, careful direct re-read (ideally with page/section
  citation for the exact moisture-threshold table) confirms what these
  numbers actually measure.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: Ask Extension (USDA Cooperative Extension network), compost ratio FAQ

- **Citation/URL:** https://ask.extension.org/kb/faq.php?id=908176
- **Publisher:** Cooperative Extension System (USDA-affiliated land-
  grant university extension network)
- **Which claims it supports:** Article 2, B1
- **Source quality tier:** [x] Tier 2 (established secondary/
  extension reference; Cooperative Extension is a recognized,
  authoritative U.S. agricultural-education network, though this
  specific page is a single extension agent's FAQ answer rather than a
  formal published standard)
- **Directly opened and read in full:** Yes - the brown-to-green
  material ratio recommendation of roughly 3:1 to 4:1 by volume, with
  a note that a 2:1 ratio can also work for beginners.
- **Limitations:** This single page did not cover moisture, temperature,
  or turning guidance - those remain search-level only (B3) or sourced
  elsewhere.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: FAO, Science, Technology and Innovation (STI) Portal — Community Seed Banks

- **Citation/URL:** https://sti-portal.fao.org/innovations/community-seed-banks
- **Publisher:** FAO
- **Which claims it supports:** Article 1 (A4, A5, A6), Article 4 (D4,
  corroborating)
- **Source quality tier:** [x] Tier 1
- **Directly opened and read in full:** Yes - governance via elected
  community committees setting deposit/withdrawal/replenishment rules;
  seeds cleaned, dried, and tested for viability before storage
  (typically in clay pots in a simple building); indigenous low-
  toxicity pest protection (wood ash, neem leaves, chili extract);
  seed quantity per cultivar ranging from 500 grams to 100 kilograms
  depending on availability/demand; one specific case study (Kumbharwadi
  village, India).
- **Population/geographic scope:** Illustrated primarily through a
  single Indian case study, with governance principles described more
  generally.
- **Limitations:** Only one directly-read source supports the
  community-seed-bank claims - this is why Article 1 folds this
  content in as a subsection rather than shipping a standalone
  article with a single-source base (see Research Plan).
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

## Sources found via search summary only — NOT yet directly read (discovered but not yet read)

Recorded honestly as candidates, not verified sources, per
`SOURCE_COLLECTION_TEMPLATE.md`'s explicit instruction that "found via
search summary only" is a valid, expected answer at this stage, not a
failure to hide.

- **USDA NRCS, Conservation Practice Standard - Composting Facility
  (Code 317)** - candidate for B2 (C:N ratio) and B3 (moisture %).
  Direct fetch of the PDF was not attempted this pass after a related
  NRCS bitstream (below) failed; a fresh direct-fetch attempt against
  the HTML overview page is a priority for closing this gap.
- **USDA Agricultural Marketing Service (AMS), NOP 5021 - Guidance on
  Compost and Vermicompost** - candidate for B4 (manure pathogen-
  reduction heat threshold, 131°F/55°C for 3 days). This is the
  highest-priority source to directly confirm, given B4's safety
  relevance. Not yet directly fetched this pass.
- **Cornell Cooperative Extension, compost troubleshooting page** -
  candidate corroborating source for B1/B2. Not yet directly fetched.
- **FAO, "Crop diversification increases productivity and stabilizes
  income of small-holders" (Agricultural Development Economics Policy
  Brief 8)** and the related Policy Brief 2 on climate resilience -
  candidates for A3. Not yet directly fetched; found only via search
  summary describing their existence and general findings.
- **FAO, household food security and crop diversification study
  (Guatemala)** (fao.org/4/u8050t/u8050t06.htm) - candidate,
  potentially strong, directly-fetchable HTML source for A3 given the
  format of other successfully-read FAO `/4/` pages this pass. Not yet
  attempted.
- **WHO/FAO guidance on safe use of wastewater/irrigation water quality
  in agriculture** - not yet searched for specifically; needed to close
  the C4 gap (irrigation water contamination risk to food crops).

## Sources attempted but not directly readable (recorded honestly, not cited as verified)

- **FAO, "Home Gardens" portal page**
  (fao.org/home-gardens/en/) - HTTP 404 Not Found. Not directly read.
  Guessed URL structure without a prior search confirming it existed;
  a genuine attempt, not a search-confirmed candidate.
- **FAO, Soils Portal - Soil Fertility page**
  (fao.org/soils-portal/soil-management/soil-fertility/en/) - HTTP 404
  Not Found. Same as above - a guessed URL, not confirmed to exist at
  this path.
- **FAO, "On-farm Composting Methods" (openknowledge.fao.org
  bitstream)** - HTTP 403 Forbidden. Not directly read. The FAO
  Knowledge Repository's bitstream-serving endpoint blocked direct
  fetch, consistent with this project's established pattern of some
  institutional repositories blocking automated access even when the
  underlying document is otherwise public.
- **FAO, "Farmer's Compost Handbook" (openknowledge.fao.org
  bitstream)** - HTTP 403 Forbidden. Not directly read. Same failure
  class as above.
- **FAO, "Module: Community seed banks" (openknowledge.fao.org
  bitstream, the fuller FAO module version)** - HTTP 403 Forbidden.
  Not directly read. The shorter STI Portal HTML page (above) was
  successfully read instead and supplies this pack's community-seed-
  bank claims; this fuller module remains a candidate for closing any
  future gap if more detail is needed.
- **FAO, "x3996e/x3996e03.htm" (home gardens in Africa)** - HTTP 200,
  fetched and read successfully, but **did not contain** the
  "0.5 hectare per person" / "0.07 hectare per person" land-area figure
  a search-result summary had attributed to it. This is a genuine
  content mismatch, not an access failure - recorded specifically
  because it demonstrates why the land-per-person figure (A2) could
  not be verified: the page most directly cited as its source, when
  actually read, does not contain it.
- **Land-per-person figure ("0.5 ha" / "0.07 ha"), general search** -
  traced only to a secondary forum post (permies.com) attributing an
  uncertain "FAO, 1993" citation, with a follow-up search unable to
  locate the original primary document (possibly traceable to Cornell
  ecologist David Pimentel's research rather than a formal FAO
  publication). **No primary source was found or read. This figure is
  not used anywhere in this pack's claim set (A2).**

## Collection summary (in progress - not final)

| Article | Claims with a Tier 1/2 source directly read | Claims search-level only or open gaps | Realistic `verification_level` if written today |
|---|---|---|---|
| 1. Assessing Land and Planning a Resilient, Diversified Food System | 3 of 6 (A1, A4-A6 count as directly read via the STI Portal source; A1 is general framing) | A2 (resolved - drop the number), A3 (search-level, direct read pending) | Community Verified today; Verified Source achievable once A3 is directly confirmed |
| 2. Building and Maintaining Soil Fertility at Scale | 1 of 5 directly read (B1); B5 is general framing | B2, B3, B4 (all search-level, direct reads pending - B4 highest priority given safety relevance) | Community Verified today; Verified Source achievable once B2-B4 are directly confirmed |
| 3. Water for Growing: Irrigation Planning at Community Scale | 3 of 4 directly read (C1-C3) | C4 (open gap, no source found yet) | Verified Source achievable on C1-C3 now; C4 must be resolved (source found, or written as general caution) before the article as a whole can honestly reach Verified Source |
| 4. Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs | 3 of 4 directly read (D1, D3, D4); D2 is a cross-link, not an independent claim | None open | Verified Source achievable now |
| 5. Harvest, Storage, and Building a Community Food Reserve | 2 of 5 directly read and usable (E1, E2); E5 is a cross-link | E3 (flagged, not usable as currently found - requires re-verification); E4 is general framing, no source needed | Community Verified today; Verified Source achievable on E1, E2, E4-E5 now, but E3 must be either re-verified or dropped before the article as a whole can honestly reach Verified Source |

This table is the honest basis for continuing Source Collection - it
is not yet a closed collection, and it is not the Editorial Review's
own independent Claim-to-Source Map, which would re-check everything
again per `editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`
at a much later stage.

## Immediate next steps to close this Source Collection (not performed this sprint)

1. Directly fetch USDA AMS NOP 5021 (or a substitute Tier 1/2 source)
   to confirm B4's pathogen-reduction heat threshold - highest
   priority given its safety relevance.
2. Directly fetch a substitute source for B2 (C:N ratio) and B3
   (moisture %), since the NRCS bitstream path failed.
3. Directly fetch the FAO Guatemala crop-diversification study or a
   policy-brief primary document for A3.
4. Search specifically for WHO/FAO irrigation-water/food-safety
   guidance to close C4.
5. Perform a careful, targeted re-read of the FAO grain-storage
   manual's moisture-content table (E3) to resolve the anomalous-
   figure concern - ideally quoting the exact table/section rather
   than relying on a single summarized pass.

None of these steps were performed in this sprint, per the Founder's
authorization covering research and source collection only, and per
this task's explicit scope (Research Plan and Source Collection
construction, not their completion).
