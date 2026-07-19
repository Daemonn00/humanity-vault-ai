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

## Sources added in Targeted Source Collection Closure (2026-07-19)

Every source below was freshly opened and read this pass via direct
`WebFetch`, closing the 6 items left open by the prior sprint plus one
additionally-discovered gap. See
`community_food_production_RESEARCH_PLAN.md`'s "Targeted Source
Collection Closure (2026-07-19)" section for the full reasoning; this
section records the source-log entries themselves.

### Source: CCARDESA (Centre for Coordination of Agricultural Research and Development for Southern Africa) — Crop Diversification

- **Citation/URL:** https://www.ccardesa.org/crop-diversification
- **Publisher:** CCARDESA (a recognized regional agricultural research
  coordination body, per this task's Part 2 priority list of CGIAR-
  equivalent institutions)
- **Which claims it supports:** Article 1, A3
- **Source quality tier:** [x] Tier 2 (established institutional
  secondary reference that itself directly quotes and cites FAO
  primary policy briefs)
- **Directly opened and read in full:** Yes - "The main advantage of
  implementing crop diversification is that it enhances household
  climate resilience through reducing risk of monocrop failure due to
  pests, disease, low rainfall and other climate risks"; "Increased
  yields of rotated crops due to lower incidence of pests/diseases";
  explicit citations to FAO Policy Brief 2 (2017) and Policy Brief 8
  (2018).
- **Limitations:** The two FAO primary policy briefs it cites could
  not themselves be directly opened this pass (see below) - this
  source is used as a directly-read Tier 2 secondary reference, not a
  false stand-in for having personally read the FAO primaries.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: eOrganic — Making and Using Compost for Organic Farming

- **Citation/URL:** https://eorganic.org/pages/18567/making-and-using-compost-for-organic-farming
- **Publisher:** eOrganic (a Cooperative Extension-affiliated,
  land-grant-university-consortium educational resource)
- **Which claims it supports:** Article 2, B2, B4, B6
- **Source quality tier:** [x] Tier 2 (established extension/
  educational reference, directly quoting USDA National Organic
  Program regulatory text)
- **Directly opened and read in full:** Yes, across two targeted
  fetches - C:N ratio ("established an initial C:N ratio of between
  25:1 and 40:1"); compost temperature/duration, method-specific ("131
  and 170°F for 3 days using an in-vessel or static aerated pile
  system" or "131°F and 170°F for 15 days using a windrow composting
  system... turned a minimum of five times"); raw manure pre-harvest
  interval ("not less than 120 days prior to the harvest of a product
  whose edible portion has direct contact with the soil" or "not less
  than 90 days" for produce without soil contact).
- **Limitations:** Did not give a moisture-content percentage for
  standard (non-vermicompost) piles - closed via Cornell Composting
  instead (below).
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: Cornell Composting (Cornell Waste Management Institute) — Physics of Composting

- **Citation/URL:** https://compost.css.cornell.edu/physics.html
- **Publisher:** Cornell University, Cornell Waste Management
  Institute
- **Which claims it supports:** Article 2, B3
- **Source quality tier:** [x] Tier 1/2 (established academic
  extension/research resource)
- **Directly opened and read in full:** Yes - "A moisture content of
  50-60% is generally considered optimum for composting," below 30%
  slows bacterial activity, above 65% causes odor/decomposition/
  nutrient-loss problems.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: University of Florida IFAS Extension — Food Safety on the Farm: Good Agricultural Practices and Good Handling Practices, Water (FS136)

- **Citation/URL:** https://ask.ifas.ufl.edu/publication/FS136
- **Publisher:** University of Florida, Institute of Food and
  Agricultural Sciences (land-grant university Extension)
- **Which claims it supports:** Article 3, C4
- **Source quality tier:** [x] Tier 1/2 (established land-grant
  university Extension publication)
- **Directly opened and read in full:** Yes - water quality "is
  extremely important when water comes into direct contact with the
  harvestable portion of produce"; groundwater "is less likely to be
  contaminated than surface water" (with a caveat for shallow/older/
  improperly-constructed wells); allowing "time for potentially
  dangerous microbes to die off in field between last irrigation and
  harvest" as a risk-reduction practice. Also contains a U.S. FDA
  Produce Safety Rule-specific numeric standard (126 CFU/100mL generic
  E. coli) - **deliberately not used as a claim**, since it is a
  jurisdiction-specific regulatory figure, not general practical
  knowledge.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: Purdue Extension (Vegetable Crops Hotline) — Food Safety Considerations for Vegetable Farms

- **Citation/URL:** https://vegcropshotline.org/article/food-safety-considerations-for-vegetable-farms/
- **Publisher:** Purdue University Extension
- **Which claims it supports:** Article 3, C4 (corroborating)
- **Source quality tier:** [x] Tier 1/2 (established land-grant
  university Extension publication)
- **Directly opened and read in full:** Yes - "With the exception of
  root crops, produce farms can reduce risk by limiting the contact of
  water with the edible portion of the crop through utilization of
  drip or trickle irrigation"; preference for public/well water over
  surface water because "surface water is open to the environment,
  making it difficult to control animal access, runoff, and other
  potential sources of contamination."
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Source: FAO, Farm Structures... (S1250E)

- **Citation/URL:** https://www.fao.org/4/s1250e/S1250E0w.htm
- **Publisher:** FAO
- **Which claims it supports:** Article 5, E3 (replacement claim,
  maize only)
- **Source quality tier:** [x] Tier 1
- **Directly opened and read in full:** Yes - "For maize, the
  requirement for safe storage is maximum 15 and 12% moisture content
  respectively" for bag and bulk storage.
- **Limitations:** Gives a figure for maize only; does not address
  sorghum, rice, beans, or groundnuts safe-storage moisture - those
  remain unconfirmed and are not asserted in this pack.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

### Re-examination: FAO, Manual of the Prevention of Post-Harvest Grain Losses (x5065e/x5065E07.htm) — moisture table re-read

- **Citation/URL:** https://www.fao.org/4/x5065e/x5065E07.htm (same
  URL as the prior sprint's entry, re-opened with a more targeted
  prompt asking for exact surrounding text)
- **Result: citation-content mismatch confirmed, recorded honestly.**
  The table of moisture percentages by crop is explicitly introduced
  in the source as "signs of physiological maturity," and is
  immediately followed by: "The indicated moisture content at the time
  of maturity does not mean that the crop is fit for storage. Drying
  is necessary after the harvest until the moisture content is reduced
  to values mentioned under section 2.2.5." **The original claim (E3,
  as drafted in the prior sprint) misread these as safe-storage
  values - they are not, and the source itself says so.** Section
  2.2.5 was not reachable at a directly-fetchable URL this pass (only
  the manual's introduction page, x5065E03.htm, loaded - it does not
  contain section 2.2.5's content). This finding is preserved as the
  reason E3 was replaced, not deleted or quietly corrected.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-19

## Sources attempted but not directly readable this pass (added 2026-07-19)

- **FAO Policy Brief 2** ("Is crop diversification a panacea for
  climate resilience in Africa," openknowledge.fao.org bitstream
  ee6dffd7-3492-431c-8df8-1b650827dcb4) - HTTP 403 Forbidden. Not
  directly read. Same failure class as other openknowledge.fao.org
  bitstream attempts in the prior sprint. Closed instead via CCARDESA
  (above), which directly quotes this brief.
- **USDA AMS, NOP 5021 handbook page**
  (ams.usda.gov/rules-regulations/organic/handbook/5021) - HTTP 403
  Forbidden. Not directly read.
- **USDA AMS, NOP 5021 PDF** (ams.usda.gov/sites/default/files/media/5021.pdf)
  - HTTP 403 Forbidden. Not directly read.
- **USDA AMS, Compost Tipsheet PDF**
  (ams.usda.gov/sites/default/files/media/Compost_FINAL.pdf) - HTTP
  403 Forbidden. Not directly read. All three USDA AMS direct-fetch
  attempts failed; the same regulatory content was successfully
  obtained instead via eOrganic (above), which quotes the same NOP
  regulatory text directly.
- **FAO JEMRA (Joint FAO/WHO Expert Meetings on Microbiological Risk
  Assessment) overview page**
  (fao.org/food-safety/scientific-advice/jemra-microbiological-risk/en)
  - HTTP 200, fetched and read successfully, but is a general program-
  overview page with **no specific irrigation-water/fresh-produce
  guidance** - a content gap, not an access failure. Not used as a
  claim source; C4 was closed via the two university Extension sources
  instead.
- **CDFA (California Department of Food and Agriculture), Healthy
  Soils On-Farm Compost Working Group page** - HTTP 200, fetched and
  read successfully, gives the same 131-170°F/15-day/5-turning windrow
  figure as eOrganic (corroborating), but does not itself distinguish
  the in-vessel/static-pile method's shorter 3-day requirement. Used as
  corroboration only, not as the primary citation (eOrganic is more
  complete).

## Sources found via search summary only — NOT yet directly read (discovered but not yet read)

Recorded honestly as candidates, not verified sources, per
`SOURCE_COLLECTION_TEMPLATE.md`'s explicit instruction that "found via
search summary only" is a valid, expected answer at this stage, not a
failure to hide.

- **USDA NRCS, Conservation Practice Standard - Composting Facility
  (Code 317)** - candidate for B2 (C:N ratio) and B3 (moisture %).
  **RESOLVED 2026-07-19 - not directly fetched (still not
  attempted directly), superseded by eOrganic and Cornell Composting,
  both directly read and sufficient to close B2/B3.**
- **USDA Agricultural Marketing Service (AMS), NOP 5021 - Guidance on
  Compost and Vermicompost** - candidate for B4. **RESOLVED 2026-07-19
  - direct fetch attempted this pass and failed (HTTP 403, see below);
  closed instead via eOrganic, which directly quotes the same
  regulatory text.**
- **Cornell Cooperative Extension, compost troubleshooting page** -
  candidate corroborating source for B1/B2. **Superseded 2026-07-19 -
  not directly fetched; B2/B3 closed via eOrganic and Cornell
  Composting's physics page instead. Remains a valid future
  corroborating source if needed.**
- **FAO, "Crop diversification increases productivity and stabilizes
  income of small-holders" (Agricultural Development Economics Policy
  Brief 8)** and the related Policy Brief 2 on climate resilience -
  candidates for A3. **RESOLVED 2026-07-19 - Policy Brief 2's direct
  fetch failed (HTTP 403, see below); Policy Brief 8 was not
  separately re-attempted after the same-repository failure pattern.
  A3 closed instead via CCARDESA, which directly quotes both briefs.**
- **FAO, household food security and crop diversification study
  (Guatemala)** (fao.org/4/u8050t/u8050t06.htm) - **RESOLVED 2026-07-19
  - directly fetched this pass and found NOT to support the intended
  claim (a genuine citation-content mismatch, not an access failure -
  see the Research Plan's Targeted Source Collection Closure section).
  Not used as a source for A3.**
- **WHO/FAO guidance on safe use of wastewater/irrigation water quality
  in agriculture** - **RESOLVED 2026-07-19 - a direct WHO/FAO
  wastewater-specific document was not located, but two directly-read
  university Extension sources (UF IFAS, Purdue) closed C4 with
  adequately authoritative, general-audience-appropriate guidance
  instead.**

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

## Collection summary (superseded by the Update below - preserved as the prior sprint's accurate record)

| Article | Claims with a Tier 1/2 source directly read | Claims search-level only or open gaps | Realistic `verification_level` if written today |
|---|---|---|---|
| 1. Assessing Land and Planning a Resilient, Diversified Food System | 3 of 6 (A1, A4-A6 count as directly read via the STI Portal source; A1 is general framing) | A2 (resolved - drop the number), A3 (search-level, direct read pending) | Community Verified today; Verified Source achievable once A3 is directly confirmed |
| 2. Building and Maintaining Soil Fertility at Scale | 1 of 5 directly read (B1); B5 is general framing | B2, B3, B4 (all search-level, direct reads pending - B4 highest priority given safety relevance) | Community Verified today; Verified Source achievable once B2-B4 are directly confirmed |
| 3. Water for Growing: Irrigation Planning at Community Scale | 3 of 4 directly read (C1-C3) | C4 (open gap, no source found yet) | Verified Source achievable on C1-C3 now; C4 must be resolved (source found, or written as general caution) before the article as a whole can honestly reach Verified Source |
| 4. Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs | 3 of 4 directly read (D1, D3, D4); D2 is a cross-link, not an independent claim | None open | Verified Source achievable now |
| 5. Harvest, Storage, and Building a Community Food Reserve | 2 of 5 directly read and usable (E1, E2); E5 is a cross-link | E3 (flagged, not usable as currently found - requires re-verification); E4 is general framing, no source needed | Community Verified today; Verified Source achievable on E1, E2, E4-E5 now, but E3 must be either re-verified or dropped before the article as a whole can honestly reach Verified Source |

### Update, 2026-07-19 (Targeted Source Collection Closure)

| Article | Final claim status | Realistic `verification_level` if written today |
|---|---|---|
| 1. Assessing Land and Planning a Resilient, Diversified Food System | 6/6 claims resolved (A2 dropped by decision, A3 now directly read via CCARDESA, A1/A4-A6 unchanged) | Verified Source achievable |
| 2. Building and Maintaining Soil Fertility at Scale | 6/6 claims resolved (B1 unchanged; B2, B3, B4 now directly read; B5 unchanged; B6 newly added and directly read) | Verified Source achievable **on every claim except B4 and B6, which additionally require Founder confirmation** (see Founder Confirmation Packet) before being finalized at their full specific-figure strength |
| 3. Water for Growing: Irrigation Planning at Community Scale | 4/4 claims resolved (C1-C3 unchanged; C4 now directly read via two university Extension sources) | Verified Source achievable |
| 4. Protecting Crops: Pest and Disease Resilience Without Heavy Chemical Inputs | 4/4 claims, unchanged from prior sprint | Verified Source achievable |
| 5. Harvest, Storage, and Building a Community Food Reserve | 5/5 claims resolved (E1, E2, E4, E5 unchanged; E3 replaced with a narrower, maize-only, directly-read claim) | Verified Source achievable |

This table is the honest basis for a Writing-stage decision - it is
not yet the Editorial Review's own independent Claim-to-Source Map,
which would re-check everything again per
`editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md` at a
much later stage.

## Immediate next steps (superseded - preserved as the prior sprint's record)

*(The 5 items originally listed here were the target of this sprint's
Targeted Source Collection Closure - see the Research Plan's
corresponding section for how each was resolved. Original text
preserved below, unedited.)*

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

## Remaining open item after this sprint

None of the original 6 items remain open. The single remaining
condition before this pack is unconditionally "ready for writing" is
**Founder confirmation of B4 and B6** (see
`community_food_production_FOUNDER_CONFIRMATION_PACKET.md`), which is
a Founder decision, not a further research/source-collection task.
