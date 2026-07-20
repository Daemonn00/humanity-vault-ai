---
pack_id: hv_official_community_camp_sanitation_systems
pack_name: Community & Camp Sanitation Systems
---

# Research Plan — Community & Camp Sanitation Systems

## Topic acceptance (Founder-approved directly; no separate Topic Selection file created)

The Founder approved this topic directly (Founder Decision, 2026-07-19),
matching the pattern used for every prior Official Knowledge Pack.
This section records the same six `QUALITY_STANDARD.md` §1 criteria
`TOPIC_SELECTION_TEMPLATE.md` would otherwise capture.

- **Criterion 1 (multi-article coherence):** Passes - a real theme
  (needs assessment/planning → latrine technology → accessibility/
  safety → solid waste → operation/maintenance) spans the 5 articles
  below, all addressing sanitation beyond a single household.
- **Criterion 2 (no duplication):** Passes - see the Ownership
  Boundary below. The core corpus already owns household-scale
  hygiene/latrine practice; three released packs (Water Treatment at
  Scale, Emergency Shelter Systems, Community Food Production) already
  cross-link to sanitation without owning community-scale sanitation
  infrastructure themselves - this pack is explicitly scoped to close
  that gap.
- **Criterion 3 (plausible source availability):** Passes - confirmed
  during this research pass: CDC, Oxfam WASH, SSWM, the Global WASH
  Cluster's own eCompendium, and CBM (a recognized disability-inclusion
  humanitarian organization) all publish directly-readable Tier 1/2
  technical content on exactly this topic.
- **Criterion 4 (category fit):** Passes - articles fit `Survival` and
  `Medicine` (or `Construction`, pending final Writing-stage decision
  per article), all existing category names; no new category is
  introduced.
- **Criterion 5 (scope safety):** Passes - no tactical, weapon-making,
  trap-making, or evasion content is required.
- **Criterion 6 (roadmap alignment):** Deliberate, not accidental -
  this topic was identified as the strongest advisory candidate for
  Pack #7 in a dedicated Production Direction & Roadmap Reconciliation
  analysis (2026-07-19), specifically because it is the one gap three
  existing released packs already independently point toward.

## Proposed pack_id and naming

**Proposed `pack_id`: `hv_official_community_camp_sanitation_systems`**
- Checked against repository naming convention: matches the
  established `hv_official_<topic>` pattern used by all 6 released
  packs exactly (e.g. `hv_official_community_food_production`,
  `hv_official_emergency_shelter_systems`).
- Checked for collision: no existing folder in `official_packs/` uses
  this id; no core-corpus slug or other pack slug matches it.
- **This is a proposal only, not yet reserved or created as a pack
  directory** - per this sprint's boundaries, no `official_packs/
  hv_official_community_camp_sanitation_systems/` directory or
  `manifest.md` has been created.
- **Proposed article slug prefix: `ccss_`** - checked against every
  existing prefix in use (`fieldcomm_`/individual article names,
  `wts_`, `ess_`, `mcfa_`, `spr_`, `cfp_`) - no collision.

## Ownership Boundary (Part A)

Read fresh, in full, this pass:
`humanity_vault_app/knowledge/medicine/sanitation_hygiene_and_disease_prevention.md`,
`official_packs/hv_official_emergency_shelter_systems/ess_shelter_site_selection_and_system_planning.md`,
`official_packs/hv_official_water_treatment_at_scale/wts_assessing_community_water_needs_and_protecting_the_source.md`,
`docs/Canon_Philosophy_v1.md`, `docs/Project_Charter_v1.md`,
`pack_production_workflow/QUALITY_STANDARD.md`,
`pack_production_workflow/PACK_PRODUCTION_CHECKLIST.md`,
`pack_authoring_template/`, `editorial_review_template/`,
`docs/Official_Knowledge_Pack_Roadmap_v1.md`. Community & System-Scale
Food Production's articles were also checked and found to have no
material sanitation overlap (manure/compost content is agricultural
soil-fertility, not excreta/waste sanitation infrastructure).

### Domain-by-domain classification

| Domain | Classification | Reasoning |
|---|---|---|
| Household-scale hygiene practice (handwashing behavior, food/water cleanliness, illness isolation) | **B. CROSS-LINKED, already owned** | `sanitation_hygiene_and_disease_prevention.md` owns this in full - cross-link, do not restate |
| Household-scale latrine siting (30m from well/stream) | **B. CROSS-LINKED, already owned** | Same core article - a single-household figure, distinct from this pack's camp/trench-latrine siting figures |
| Settlement-scale toilet-per-population ratio (1:50 emergency-phase) | **B. CROSS-LINKED, already owned** | `ess_shelter_site_selection_and_system_planning.md` already states this exact figure - this pack cross-links it and may extend it (see A3) but must not re-derive or restate it as a new claim |
| Settlement-scale toilet-pit water-table clearance (1.5m) | **B. CROSS-LINKED, already owned** | Same ESS article - cross-link, do not restate |
| Settlement-scale distance-from-hazard siting (dumpsite/hazardous-waste/protected-area distances) | **B. CROSS-LINKED, already owned** | Same ESS article - this pack's own solid-waste-burial-pit siting figures (D4) are a distinct claim object (waste-pit-to-dwelling/water distance) and must be presented as their own attributed figure, not conflated with ESS's settlement-to-hazard figures |
| Water-source protection from contamination (general principle) | **B. CROSS-LINKED, already owned** | Water Treatment at Scale and `well_digging_and_safe_water_access.md` own this - cross-link |
| Sanitation needs assessment and system-level planning (service chain, phased approach, ratios beyond emergency phase) | **A. OWNED BY THIS PACK** | Not covered anywhere - genuinely new |
| Latrine technology types and construction (trench/pit dimensions, siting distance from groundwater, backfill management) | **A. OWNED BY THIS PACK** | Not covered anywhere - the core article only describes a single basic household pit; camp-scale trench/pit construction and technology comparison is new |
| Accessibility and safe/dignified use (disability access, gender-based-violence risk, privacy) | **A. OWNED BY THIS PACK** | Not covered anywhere in the corpus at any scale |
| Handwashing infrastructure at community scale (station placement, shared-device capacity) | **A. OWNED BY THIS PACK** | The core article covers the *practice* of handwashing; community-scale *infrastructure* for it is new |
| Solid-waste collection and disposal at community scale | **A. OWNED BY THIS PACK** | The core article's "bury or burn" is household-level; community-scale collection ratios, transport, burial-pit specification, and incineration guidance are new |
| Operation, maintenance, vector control, and decommissioning of sanitation systems | **A. OWNED BY THIS PACK** | Not covered anywhere - the core article's closing-a-full-pit guidance is household-scale only |
| Drainage and greywater/wastewater treatment | **D. OUT OF SCOPE for this pack, this pass** | Investigated (Part D below); found insufficient directly-read, camp/emergency-specific material this pass to respons‌ibly support even a general-principles treatment. Not forced into the architecture - recorded as a genuine research gap, not a silent omission |
| Aquaponics/livestock | **D. OUT OF SCOPE, unrelated** | No overlap - these remain recorded future directions elsewhere (roadmap Section 5), unrelated to sanitation |

**Explicit boundary statement for Writing:** this pack's land-and-
distance figures (camp/trench latrine siting, solid-waste burial-pit
siting) must be presented as their own distinct, source-attributed
claims - never merged with, silently corrected against, or presented
as restating the already-published household latrine distance (core
article), the settlement-scale toilet-pit water-table clearance or
toilet ratio (Emergency Shelter Systems), or the general water-source-
protection principle (Water Treatment at Scale / well-digging
article). Where this pack's own figures are numerically close to an
already-published figure, the similarity is coincidental (different
sources, different claim objects) unless a source explicitly states
they are the same rule - do not assume equivalence.

## Candidate Content Domains Investigated (Part B)

All of the task's listed candidate domains were investigated. Result:

| Candidate domain | Included in architecture? | Reasoning |
|---|---|---|
| Sanitation needs assessment and system planning | Yes | Rich, directly-read material found |
| Excreta containment and disposal | Yes | Rich, directly-read material found |
| Emergency and camp latrine systems | Yes | Rich, directly-read material found |
| Latrine siting and environmental separation | Yes, as part of latrine-construction content | Directly-read material found; carefully distinguished from already-owned figures (see boundary statement above) |
| Accessibility and safe-use considerations | Yes | Rich, directly-read material found (CBM HHoT) - genuinely new to the entire corpus |
| Handwashing infrastructure at community scale | Yes, folded into Article 1 rather than standalone | Real but thinner material (2 claims) - insufficient alone for a full article, folded per the "fold rather than pad" precedent already used in Emergency Shelter Systems and Community Food Production |
| Solid-waste collection and disposal | Yes, own article | Rich, directly-read material found (7 claims) - clearly deserves its own article |
| Drainage and wastewater management | **No** | Investigated; only general/global WHO multi-volume framework and thin, not-directly-read camp-specific material found - excluded rather than forced in, per this task's explicit instruction not to force domains the evidence doesn't support |
| Vector-control measures directly connected to sanitation | Yes, folded into Article 5 (Operation & Maintenance) | Thin as a standalone topic but naturally connects to ongoing latrine operation (fly/odor management, VIP upgrade path) |
| Operation, cleaning, inspection, maintenance, decommissioning | Yes, own article | Directly-read material found for decommissioning/pit-closure; cleaning/inspection frequency less deeply sourced this pass (see Source Collection gaps) |

## Proposed Article Architecture (Part F)

5 articles, following the established "prefer clear ownership
boundaries over maximizing article count" discipline.

### Article 1: Assessing Sanitation Needs and Planning a Community System

- **Purpose:** How a group plans a sanitation system as a whole
  (excreta + handwashing), not just "build a latrine" - the service-
  chain concept, a phased approach, and where handwashing
  infrastructure fits into that planning.
- **Scope:** Sanitation as a full service chain (user interface →
  containment → collection/transport → treatment → disposal/reuse);
  phased improvement over time; latrine-per-population ratio
  improving from the already-published 1:50 emergency-phase target
  (cross-linked, not restated) toward a 1:20 longer-term target (a
  genuinely new claim this pack can own); the "wrap, contain, and
  collect" strategy for populations too scattered for a dug latrine;
  handwashing station placement and basic shared-device capacity.
- **Explicit exclusions:** Does not restate the 1:50 ratio, the
  1.5m water-table clearance, or settlement-siting/hazard-distance
  figures already owned by Emergency Shelter Systems - cross-links
  instead. Does not restate household hygiene practice already owned
  by the core sanitation article.
- **Core claim IDs:** A1-A7 (A7 is a non-sourced boundary note)
- **Likely sources:** Global WASH Cluster eCompendium (service chain);
  CDC (phased ratios); SSWM (wrap/contain/collect); Oxfam WASH and
  Watershed Management Group (handwashing).
- **Safety-critical claims:** none in the §9.3 sense.
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2

### Article 2: Latrine Types and Construction for Camp and Emergency Settings

- **Purpose:** What latrine technology options exist by phase/context,
  and how to build a basic trench or pit latrine.
- **Scope:** Technology comparison (packet, bucket/elevated, chemical,
  trench, pit, eco-san/UDDT); pit/trench suitability caveats (high
  water table, unstable/rocky ground); trench dimensions; camp-latrine
  siting distance from a groundwater source; backfill/pit-management
  practice during use; VIP as a fly/odor-control upgrade path
  (currently flagged, not frozen - see High-Risk/Open Items below).
- **Explicit exclusions:** Does not restate the household 30m
  well-distance rule, the 1.5m water-table clearance, or the 1:50/1:20
  ratios - cross-links Article 1 and existing packs instead.
- **Core claim IDs:** B1-B7 (B5 is a cross-link, B7 is flagged/open)
- **Likely sources:** CDC, SSWM, Global WASH Cluster eCompendium.
- **Safety-critical claims:** siting/water-table figures are ordinary
  sourced planning figures, treated the same as Emergency Shelter
  Systems treated its own analogous figures (not §9.3) - see High-
  Risk Claim Identification below for the full reasoning.
- **Proposed category:** Construction
- **Proposed knowledge_level:** Level 2

### Article 3: Accessibility, Safety, and Dignified Use of Sanitation Facilities

- **Purpose:** Making sanitation facilities usable and safe for
  everyone, not just able-bodied adult men - a genuinely new topic for
  the entire Humanity Vault corpus, not just this pack.
- **Scope:** Minimum usable space dimensions; door/lock design; wheel-
  chair transfer space and turning space; grabrail height; an
  approximate accessible-facility ratio; latrine-to-dwelling distance
  (a different axis from Article 2's groundwater-siting distance);
  gender-based-violence risk connected to siting/lighting (currently
  flagged, general framing only - see below); privacy/separation
  principles.
- **Explicit exclusions:** Does not restate latrine construction
  technique (Article 2) or population ratios (Article 1).
- **Core claim IDs:** C1-C7 (C6 is flagged/general-only)
- **Likely sources:** CBM (Humanitarian Hub of Tools) for accessibility
  figures - a genuinely new source family for this project, a
  recognized international disability-and-development organization.
- **Safety-critical claims:** none numeric in the §9.3 sense; the
  GBV/safety content is qualitative and will stay general pending
  a directly-read source (see Source Collection gaps).
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2

### Article 4: Solid Waste Collection and Disposal at Community Scale

- **Purpose:** What happens to household and communal refuse (not
  excreta) in a displacement or disaster setting.
- **Scope:** Household-to-collection-point distance targets; communal
  bin ratios and siting; transport-method scaling by population size;
  waste burial-pit siting (its own distinct claim from Article 2's
  latrine siting); a flagged high-risk item on medical/biohazard waste
  exclusion (see below); incineration as a last resort with explicit
  cautions; reference planning-capacity ratios.
- **Explicit exclusions:** Does not restate excreta/latrine content
  (Articles 1-2).
- **Core claim IDs:** D1-D7 (D5 is HIGH-RISK, FLAGGED)
- **Likely sources:** Oxfam WASH (Domestic and Refugee Camp Waste
  Management).
- **Safety-critical claims:** D5 (medical/biohazard waste exclusion
  from general burial pits) - flagged for deeper sourcing before a
  Founder-confirmation determination is made; see High-Risk Claim
  Identification below.
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2

### Article 5: Operation, Maintenance, and Decommissioning of Sanitation Systems

- **Purpose:** Keeping a sanitation system working over time and
  closing it safely when full or no longer needed.
- **Scope:** Fly/odor as a known weakness of basic pit latrines and
  the VIP upgrade path (connects back to Article 2's flagged B7);
  the pit-full decision (move superstructure to a new pit and cover
  the old one, or desludge and transport for treatment); a cross-link
  to the core article's own household-scale pit-closure guidance;
  general framing on ongoing cleaning/inspection/community engagement
  as necessary to keep a system working.
- **Explicit exclusions:** Does not restate initial construction
  (Article 2).
- **Core claim IDs:** E1-E4 (E3 is a cross-link)
- **Likely sources:** Global WASH Cluster eCompendium (Single Pit
  Latrine technology page).
- **Safety-critical claims:** none in the §9.3 sense.
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2

## Claim Inventory (Provisional - Frozen Set Not Yet Finalized)

### Article 1 (A)

| ID | Claim | Status |
|---|---|---|
| A1 | Sanitation is best planned as a full service chain (user interface, containment, collection/transport, treatment, disposal/reuse), not solved by the latrine alone | Directly read (Global WASH Cluster eCompendium) |
| A2 | A phased approach - rapid initial containment in the first weeks, improving toward better technology/standards over time - is the recommended structure for planning | Directly read (CDC; corroborated by SSWM) |
| A3 | The already-published 1:50 emergency-phase toilet ratio (cross-link, Emergency Shelter Systems) is intended to improve toward roughly 1:20 in post-emergency/longer-term phases | Directly read (CDC); the 1:50 baseline itself is NOT re-verified here, only cross-linked |
| A4 | For scattered/in-situ populations where a dug latrine isn't practical, a "wrap, contain, and collect" strategy (bucket/bag containment, then collection and transport to a treatment site) is used instead | Directly read (SSWM) |
| A5 | Handwashing stations should be placed at households, next to latrines, and in communal areas (markets, schools, health centres) | Directly read (Oxfam WASH) |
| A6 | A simple gravity-tap handwashing device built from local materials (e.g. a "tippy tap") can serve roughly 15-30 people per one-gallon refill | Directly read (Watershed Management Group) |
| A7 | Boundary note distinguishing this pack's planning content from Emergency Shelter Systems' settlement-siting content and Water Treatment at Scale's water-source-protection content | Non-sourced, editorial framing |

### Article 2 (B)

| ID | Claim | Status |
|---|---|---|
| B1 | Latrine technology options differ by emergency phase and context: packet latrines, bucket/elevated toilets, chemical toilets, trench latrines, pit latrines, eco-san/UDDT systems | Directly read (CDC) |
| B2 | Simple pit/trench latrines are the most common choice for speed and cost, but are unsuitable where the water table is high or the ground is unstable/rocky | Directly read (CDC framing, corroborated by SSWM) |
| B3 | Trench latrine dimensions: a shallow trench is roughly 20-30cm wide and 15cm deep; a deep trench can be up to 2m deep | Directly read (SSWM) |
| B4 | A camp/trench latrine should be sited roughly 15-30m from any groundwater source | Directly read (SSWM) - **explicitly a distinct claim object from the household 30m rule and the ESS water-table-clearance rule, see boundary statement above** |
| B5 | Water-table clearance (1.5m) - cross-link only | Already owned by Emergency Shelter Systems - not re-verified or restated here |
| B6 | During use, a pit is generally considered for backfilling once filled to roughly 20cm beneath the slab | Directly read (SSWM) |
| B7 | VIP (Ventilated Improved Pit) latrines exist as a fly/odor-control upgrade from basic pit latrines, using a vented pipe to draw odor upward and trap flies via light-attraction | **FLAGGED, NOT FROZEN** - found via search summary only this pass; direct read pending before use in Writing |

### Article 3 (C)

| ID | Claim | Status |
|---|---|---|
| C1 | A transitional/mobile latrine should have a minimum space of roughly 120cm x 120cm, ideally 180cm x 180cm | Directly read (CBM HHoT) |
| C2 | The door should be at least 90cm wide, open outward, with an easy-grip lock/handle | Directly read (CBM HHoT) |
| C3 | A wheelchair user needs roughly 80cm x 130cm of free space next to the seat to transfer, plus a 150cm x 150cm turning space, with a grabrail at roughly 80cm height | Directly read (CBM HHoT) |
| C4 | Roughly 1 in 10 latrines in a facility should be built fully accessible/barrier-free | Directly read (CBM HHoT) |
| C5 | Latrines should be no more than roughly 50m from shelters in short-term emergencies, tightening to no more than roughly 30m in longer-term settlements | Directly read (CBM HHoT) - **a distinct claim object (dwelling-to-latrine walking distance) from Article 2's groundwater-siting distance** |
| C6 | Gender-based-violence risk is a real, documented safety concern connected to latrine siting and lighting, requiring deliberate design attention | **FLAGGED, GENERAL FRAMING ONLY** - the specific source found for this (an Oxfam Views & Voices article) is no longer live at its original URL (301 redirect to a generic blog index); not directly read this pass. Only the general, widely-corroborated principle (women/girls face elevated risk, especially at night) will be used, without the specific "lighting-only-at-latrines can backfire" nuance, unless a directly-readable source is found in a future closure pass |
| C7 | Latrines should have separate male/female facilities, working locks, and privacy from view | General, low-risk, corroborated across multiple already-directly-read sources (CBM HHoT) |

### Article 4 (D)

| ID | Claim | Status |
|---|---|---|
| D1 | Household solid waste: target no more than roughly 100m from a household to a communal collection point, tightening to roughly 10m in the initial response phase | Directly read (Oxfam WASH) |
| D2 | Communal collection: roughly one 100-liter bin per 10 families, sited at least 15m from residences | Directly read (Oxfam WASH) |
| D3 | Transport scaling: hand-carts can serve roughly 10,000-20,000 people within a 1km radius; motorized trucks are generally needed above roughly 50,000 people | Directly read (Oxfam WASH) |
| D4 | Waste burial pits should be sited at least 30m from the nearest dwelling and water sources, at least 1.5m above the water table, with daily soil cover | Directly read (Oxfam WASH) - **its own distinct claim, not the same rule as Article 2's latrine siting or Emergency Shelter Systems' settlement-hazard distances** |
| D5 | No medical/biohazard waste should be disposed of in general community burial pits | **FLAGGED, HIGH-RISK, NOT FROZEN** - directly read but only as a brief mention in the source; requires deeper sourcing (a dedicated medical-waste-handling reference) before a Founder-confirmation determination can responsibly be made - see High-Risk Claim Identification below |
| D6 | Incineration should be used only as a last resort, conducted downwind of settlements, with plastics removed first; informal/uncontrolled burning often fails to reach adequate temperature and creates air-pollution hazards | Directly read (Oxfam WASH) |
| D7 | Reference planning-capacity ratios: roughly 6 cubic meters of burial capacity per 50 people per week; roughly 3 cubic meters of landfill design capacity per 200 people per week | Directly read (Oxfam WASH) |

### Article 5 (E)

| ID | Claim | Status |
|---|---|---|
| E1 | Flies and odor are a documented, known weakness of basic single-pit latrines; upgrading to a Ventilated Improved Pit or similar design is the recommended path to control this | Directly read (Global WASH Cluster eCompendium, Single Pit Latrine technology page) |
| E2 | When a pit becomes full, the standard options are (a) move the superstructure/slab to a new pit and safely cover the old one, or (b) desludge and transport the contents for treatment/disposal | Directly read (same source) |
| E3 | The core corpus's existing household-scale guidance ("cover completely with a thick layer of soil and dig a new one") is the same underlying principle applied at single-household scale | Cross-link only, not a new claim |
| E4 | Ongoing cleaning, inspection, and community engagement/behavior-change work are necessary for a sanitation system to keep functioning, not just at the moment of construction | General synthesis, corroborated across multiple already-directly-read sources' shared emphasis on maintenance and community involvement |

## High-Risk Claim Identification (Part C)

Applied `QUALITY_STANDARD.md` §9 rigorously against every operational
number in the claim inventory above, per this task's explicit list of
categories to scrutinize.

| Claim area | Determination |
|---|---|
| Latrine-to-water-source separation distances (B4: 15-30m camp/trench; core article's 30m household) | **Ordinary sourced planning figure, not §9.3.** Directly analogous to Emergency Shelter Systems' own settlement-siting distances, which that pack's own Stage 6 pass treated as ordinary (not §9.3) despite being genuine contamination-prevention figures. Applying the same treatment here for consistency. Requires normal Stage 5/6 verification, no Founder pre-writing confirmation. |
| Water-table clearance (B5: 1.5m) | **Not a new claim at all** - cross-linked from Emergency Shelter Systems, already verified there. Not re-derived or re-verified as a new figure by this pack. |
| Latrine capacity/user ratios (A3: 1:50 → 1:20) | **Ordinary sourced planning figure, not §9.3.** Same category as Emergency Shelter Systems' own 3.5-5.5 sqm/person and toilet-ratio planning figures, which were treated as ordinary. |
| Trench/pit dimensions (B3: 20-30cm x 15cm shallow; up to 2m deep) | **Ordinary sourced construction figure, not §9.3.** A dimensional specification, not a life-safety threshold in the acute sense - normal verification suffices. |
| Waste burial/disposal distances (D4: 30m/1.5m) | **Ordinary sourced planning figure, not §9.3** - same reasoning as the latrine-siting figures above. |
| Handwashing quantities/ratios (A6: ~15-30 people per gallon refill) | **Ordinary sourced figure, not §9.3** - a capacity/logistics figure, not a life-safety threshold. |
| Chlorine/disinfectant concentrations | **N/A - not currently part of this pack's claim set.** No disinfectant-concentration claim was researched or found this pass (this pack does not currently propose to cover chemical latrine/waste treatment) - if a future closure pass adds one, it would need fresh §9 evaluation at that time. |
| Wastewater handling | **N/A - excluded from this pack's architecture this pass** (see Ownership Boundary above - drainage/wastewater was investigated and found insufficiently sourced; no claim exists to evaluate). |
| Vector-control chemical use | **N/A - not currently part of this pack's claim set.** E1's vector-control content is entirely non-chemical (ventilation/design-based), so no chemical-use claim exists to evaluate. |
| Disease-prevention claims | **General framing only, not §9.3** - this pack's disease-prevention content (A1's rationale, E4's maintenance framing) stays at the level of "why this matters," not a specific clinical/treatment claim. |
| **Medical/biohazard waste exclusion from general burial pits (D5)** | **FLAGGED - genuinely uncertain, requires deeper sourcing before determination.** This is the one candidate in the entire inventory with a plausible §9.3-by-analogy argument (biohazard material is closer in kind to a toxic-substance handling threshold than a simple engineering figure), but the current source support (one brief mention in Oxfam's general waste-management guidance) is too thin to responsibly evaluate severity or scope. **Recommendation: do not attempt to write around this by converting it into vague prose - instead, treat it as an open research item requiring a dedicated medical-waste-handling source before Writing, and make an explicit §9.3-applicability determination at that time**, following the same "flag now, resolve with real sourcing in a closure pass" pattern already used successfully for Emergency Shelter Systems' and Community Food Production's own open items. |

**Result: exactly one claim (D5) is flagged as a genuine high-risk
open item requiring resolution - not by converting it to unsupported
vague prose, but by finding real sourcing depth before Writing.** No
claim in this inventory currently requires mandatory Founder
pre-writing confirmation, because no claim has yet reached the
specific-figure-with-confirmed-severity state that triggered
Founder confirmation in Emergency Shelter Systems (B4/B6-equivalent:
CO thresholds) or Community Food Production (B4/B6: compost/manure
thresholds) - D5 may reach that state after further sourcing, or may
resolve to an ordinary general caution, or may be dropped; this is not
decided here.

## Source Conflict / Ambiguity Handling (Part E)

One genuine ambiguity was found and is preserved, not silently
resolved:

- **Numerical proximity between different claim objects.** Oxfam's
  solid-waste burial-pit siting figures (D4: 30m from dwelling/water,
  1.5m above water table) numerically match the core article's
  household-latrine distance (30m) and Emergency Shelter Systems'
  toilet-pit water-table clearance (1.5m), despite being genuinely
  different claim objects (solid waste vs. excreta) from different,
  independently-read sources. No source explicitly states these are
  "the same rule extended to a new context" - it is equally plausible
  that 30m and 1.5m are simply common, independently-arrived-at
  environmental-health separation conventions. **This pack will
  present D4 as its own distinct, source-attributed claim and will
  not assert or imply that it is definitionally the same rule as the
  other two**, per this task's explicit instruction not to silently
  merge or average figures from different sources.

No source found genuinely *contradictory* figures this pass (i.e., two
directly-read sources giving different numbers for the *same* claim
object) - the numerical similarities found were all across genuinely
different claim objects, handled as above.

## Production-Stage Status

- **Stage 1 (Topic Selection):** Complete - Founder-approved directly,
  six acceptance criteria pass (above).
- **Stage 2 (Research):** This document - substantially complete for a
  first pass. 5-article architecture proposed with 32 claim IDs; one
  claim flagged high-risk pending deeper sourcing (D5); one claim
  flagged pending direct source read (B7); one claim area kept
  deliberately general pending a directly-readable source (C6);
  drainage/wastewater deliberately excluded as insufficiently sourced
  this pass.
- **Stage 3 (Source Collection):** Underway in parallel - see
  `community_camp_sanitation_systems_SOURCE_COLLECTION.md`.
- **Stages 4-7:** Not started. Not authorized by the Founder's current
  decision, which covers research and source collection only.

## Ready to write? — NOT READY

- [ ] Every planned article has at least one directly-read candidate
      source - **met for all 5 articles**, but 3 specific claims
      (B7, C6, D5) remain open (search-level-only, general-only, or
      requiring deeper sourcing respectively) and must be closed
      before Writing.
- [x] No planned claim requires a source known in advance to be
      inaccessible without a fallback plan - each open item (B7, C6,
      D5) has an explicit fallback stated above (direct-read it, keep
      it general, or find a dedicated medical-waste source).
- [x] Safety-sensitive claim families identified and mapped against
      `QUALITY_STANDARD.md` §9.3 - one genuine open question (D5)
      flagged rather than resolved silently; every other numeric claim
      determined not to require mandatory Founder pre-writing
      confirmation, consistent with how this project treated
      structurally identical figures in Emergency Shelter Systems.

**This Research Plan does not authorize Writing.** Per the Founder's
decision, this sprint's authorization covers research, scope
definition, and source collection only. A targeted closure pass
(matching the precedent already used for Emergency Shelter Systems and
Community Food Production) would need to resolve B7, C6, and
especially D5 before this pack could responsibly proceed to Writing.
