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
| B7 | VIP (Ventilated Improved Pit) latrines control flies and odor via a vented pipe: continuous airflow carries odor upward and out, while flies hatching in the pit are attracted to light at the top of the vent and trapped by a fly-screen. The vent pipe needs an internal diameter of at least 11cm and must reach more than 30cm above the highest point of the superstructure | **VERIFIED WITH NARROWING, 2026-07-19** - directly read (Global WASH Cluster eCompendium, S.4 Single Ventilated Improved Pit) - see Targeted Source Collection Closure below |

### Article 3 (C)

| ID | Claim | Status |
|---|---|---|
| C1 | A transitional/mobile latrine should have a minimum space of roughly 120cm x 120cm, ideally 180cm x 180cm | Directly read (CBM HHoT) |
| C2 | The door should be at least 90cm wide, open outward, with an easy-grip lock/handle | Directly read (CBM HHoT) |
| C3 | A wheelchair user needs roughly 80cm x 130cm of free space next to the seat to transfer, plus a 150cm x 150cm turning space, with a grabrail at roughly 80cm height | Directly read (CBM HHoT) |
| C4 | Roughly 1 in 10 latrines in a facility should be built fully accessible/barrier-free | Directly read (CBM HHoT) |
| C5 | Latrines should be no more than roughly 50m from shelters in short-term emergencies, tightening to no more than roughly 30m in longer-term settlements | Directly read (CBM HHoT) - **a distinct claim object (dwelling-to-latrine walking distance) from Article 2's groundwater-siting distance** |
| C6 | Reducing gender-based-violence risk at sanitation facilities requires multiple coordinated measures, not any single fix: gender-segregated facilities, locks on latrines, adequate lighting, and safe, direct travel routes/distances to water and sanitation points. Lighting is one contributing measure, not by itself sufficient | **VERIFIED WITH NARROWING, 2026-07-19** - directly read (SSWM, Preventing Gender-Based Violence in Camps and Prolonged Encampments) - see Targeted Source Collection Closure below. **Note:** the same source's "water points <500m from shelters" figure is the already-published Water Treatment at Scale claim - cross-linked, not restated here |
| C7 | Latrines should have separate male/female facilities, working locks, and privacy from view | General, low-risk, corroborated across multiple already-directly-read sources (CBM HHoT) |

### Article 4 (D)

| ID | Claim | Status |
|---|---|---|
| D1 | Household solid waste: target no more than roughly 100m from a household to a communal collection point, tightening to roughly 10m in the initial response phase | Directly read (Oxfam WASH) |
| D2 | Communal collection: roughly one 100-liter bin per 10 families, sited at least 15m from residences | Directly read (Oxfam WASH) |
| D3 | Transport scaling: hand-carts can serve roughly 10,000-20,000 people within a 1km radius; motorized trucks are generally needed above roughly 50,000 people | Directly read (Oxfam WASH) |
| D4 | Waste burial pits should be sited at least 30m from the nearest dwelling and water sources, at least 1.5m above the water table, with daily soil cover | Directly read (Oxfam WASH) - **its own distinct claim, not the same rule as Article 2's latrine siting or Emergency Shelter Systems' settlement-hazard distances** |
| D5 | Health-care waste is a mix of general/non-hazardous material (roughly 85%) and hazardous material (roughly 15% - infectious, pathological, sharps, chemical, pharmaceutical, and radioactive waste); segregating the hazardous portion from general waste, rather than mixing it into ordinary community refuse/burial systems, is a key element of safe management | **VERIFIED WITH NARROWING (claim substantially narrowed from the original vague framing), 2026-07-19** - directly read (WHO, Health-care waste fact sheet) - see Targeted Source Collection Closure below for the full §9.3 determination (Determination A - no Founder confirmation required) |
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
| **Medical/biohazard waste segregation (D5)** | **RESOLVED, 2026-07-19 - Determination A, does not require Founder confirmation.** See the Targeted Source Collection Closure section below for the full reasoning against the four factors this task specifies (consequence of misuse, operational specificity, whether the claim directs hazardous-waste handling, established precedent). |

**Result (superseded by the Targeted Source Collection Closure below -
preserved as the prior sprint's accurate record): "exactly one claim
(D5) is flagged as a genuine high-risk open item requiring
resolution... No claim in this inventory currently requires mandatory
Founder pre-writing confirmation... D5 may reach that state after
further sourcing, or may resolve to an ordinary general caution, or
may be dropped; this is not decided here."** This has now been
resolved - see below.

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

## Targeted Source Collection Closure (2026-07-19)

This section closes the three items left open by the Research pass
above (B7, C6, D5). Each was resolved by directly opening and reading
a new source this pass - not by accepting a search-summary claim.
Per this project's append/update discipline, the original flagged
text for each item is preserved above in the Claim Inventory's
superseded-note form and in the High-Risk table; nothing has been
erased.

### B7 — VIP latrine mechanism: VERIFIED WITH NARROWING

**Source directly read:** Global WASH Cluster eCompendium
(emersan-compendium.org), "S.4 Single Ventilated Improved Pit"
technology page. Same source family already used and trusted
elsewhere in this pack (E1/E2) and in this pack's own B1-B3/B6.

**Exact supporting quotes:**
- "Flies that hatch in the pit are attracted to the light at the top
  of the ventilation pipe. When they fly towards the light and try to
  escape, they are trapped by the fly-screen and eventually die."
- "continuous airflow through the ventilation pipe prevents odours and
  acts as a trap for flies as they escape towards the light."
- "a straight vent pipe is needed with an internal diameter of at
  least 11 cm and reaching more than 30 cm above the highest point of
  the toilet superstructure."
- Wind-driven or heat-driven convection drives the airflow; painting
  the pipe black improves performance in low-wind conditions.

**Narrowing applied:** the original candidate claim ("VIP latrines
exist as a fly/odor-control upgrade... using a vented pipe to draw
odor upward and trap flies via light-attraction") was a correct but
under-specified summary. The now-verified claim adds the two concrete
figures (11cm minimum internal diameter, 30cm minimum height above the
superstructure) and the precise causal mechanism (continuous airflow
prevents odor; flies are light-attracted into a screened trap), all
directly attributable to this one source. This is a dimensional/
construction figure, not a life-safety threshold - no §9.3 concern.

### C6 — GBV/lighting/sanitation-facility safety: VERIFIED WITH NARROWING

**Source directly read:** SSWM.info, "Preventing Gender-Based Violence
(Camps and Prolonged Encampments)" - the dedicated humanitarian-WASH
knowledge platform already trusted elsewhere in this pack (A2, A4,
B2, B3, B6).

**Exact supporting quote:** "building gender segregated sanitary and
bathing facilitating, installing adequate lighting at WASH facilities,
putting locks on latrines, ensuring safe travel distances and routes
to water and sanitation points (water points should be located at
less than 500 m from shelters)."

**Narrowing applied:** the original candidate claim was flagged as
"general framing only" because its source (an Oxfam article) was
dead-linked and never directly read. The now-verified claim is
narrower and more precise than the original framing in one important
respect: it does NOT support "lighting is a fix for GBV risk" as a
standalone claim. The source lists lighting as one of four coordinated
measures (gender segregation, locks, lighting, safe routes/distances)
- none singled out as sufficient alone. The claim as written in the
inventory (C6, above) reflects this precisely: multiple coordinated
measures, lighting as one contributing measure among several.

**Cross-pack overlap identified and handled:** this same source's
"water points <500m from shelters" figure is the identical claim
already published in Water Treatment at Scale's
`wts_assessing_community_water_needs_and_protecting_the_source.md`
("Households are generally planned to be within about 500 meters of a
water point"). Per this project's ownership-boundary discipline, this
figure is cross-linked, not restated, in C6's claim text (see the
Claim Inventory note above) and will be cross-linked rather than
re-cited at Writing time. This is a qualitative safety-practice claim,
not a numeric threshold whose precision drives an acute-harm outcome -
no §9.3 concern.

### D5 — Medical/biohazard waste segregation: VERIFIED WITH NARROWING, §9.3 Determination A

**Source directly read:** World Health Organization, official HTML
fact-sheet page, "Health-care waste"
(who.int/news-room/fact-sheets/detail/health-care-waste) - Tier 1,
distinct from the WHO PDF documents that have repeatedly failed to
load in this pack's research (corrupted binary) and in this closure
pass itself (Module 17 PDF, see Source Collection update).

**Exact supporting quotes:**
- "about 85% is general, non-hazardous waste"
- "the remaining 15% is considered hazardous material"
- Named hazardous categories: "Infectious waste... Pathological
  waste... Sharps waste... Chemical waste... Pharmaceutical/cytotoxic
  waste... Radioactive waste"
- "health-care waste is often not separated into hazardous or
  non-hazardous wastes" in low-income-country settings
- Segregation is described as "a key element in improving health-care
  waste management"

**Narrowing applied:** the original candidate claim ("no medical/
biohazard waste should be disposed of in general community burial
pits") was a plausible but vague, under-sourced rule with no named
authority and no operational detail. The now-verified claim is
substantially narrower and more precisely scoped: it states the
composition breakdown (85%/15%), names the hazardous sub-categories,
and frames the actionable guidance as *segregation* of the hazardous
fraction from general waste - not a categorical prohibition on any
one disposal method. This is a meaningfully different, more
defensible claim than the original framing, and is the one that will
carry forward into Writing.

**§9.3 Determination: A — does not require Founder pre-writing
confirmation.** Reasoning against the same four factors this project
has applied consistently since Emergency Shelter Systems and Community
Food Production:

1. **Consequence of misuse.** A reader who under-applies this claim
   (fails to segregate hazardous health-care waste, mixes it into
   general refuse) faces the same generalized infection/injury risk
   that already exists in any setting without organized health-care
   waste management - not a sudden, acute, individually-triggered harm
   from a single misapplied number. This differs in kind from CO
   poisoning (Emergency Shelter Systems) or pathogen survival at a
   specific compost temperature (Community Food Production), where a
   single wrong number produces a direct, immediate physiological harm
   to the person following the instruction.
2. **Operational specificity.** The claim carries a percentage
   breakdown (85%/15%) and named waste categories, but issues no
   specific dose, temperature, exposure duration, structural load, or
   other single number whose precise value determines a safe/unsafe
   outcome. It is categorical guidance ("segregate hazardous from
   general") in the same register as Emergency Shelter Systems' own
   non-elevated categorical rule ("never use a fuel-burning heater or
   an oven to heat an enclosed space") - which stayed at ordinary §9.2
   specifically *because* it carried no exploitable numeric threshold,
   in contrast to that same pack's CO-ppm figures, which were
   elevated.
3. **Does the claim direct hazardous-material handling procedure?**
   No. D5 does not instruct how to treat, transport, sterilize, or
   dispose of hazardous health-care waste (autoclave temperatures,
   chemical disinfectant concentrations, incineration temperatures) -
   it only establishes that such waste exists as a distinct category
   and should not be mixed into ordinary community refuse/burial
   systems. A future claim that specified, e.g., a minimum incineration
   temperature for medical waste would need its own fresh §9.3
   evaluation and would likely fail Determination A - but no such claim
   is proposed here.
4. **Established project precedent.** This project has now applied the
   categorical-vs-numeric-threshold test three times (Emergency Shelter
   Systems' heating-source rule vs. its CO thresholds; Community Food
   Production's manure-application caution vs. its compost-pathogen
   temperature thresholds; now D5's segregation principle vs. an
   unproposed hypothetical handling-temperature claim). The test has
   been applied the same way each time: category-level "be aware of
   and separate this risk" guidance stays ordinary; a specific number
   whose precision determines an acute outcome gets elevated. D5, as
   narrowed, falls on the categorical side.

**Explicit confirmation, per this task's instruction:** this
determination was reached by applying the test, not by a default
assumption in either direction - D5 was not classified high-risk
merely because it concerns health/medical material, and it was not
classified ordinary merely to avoid a Founder-confirmation gate. The
narrowed claim's own content (no dose, no temperature, no procedure)
is what places it in Determination A.

**No Founder Confirmation Packet is created for this pack.** No claim
in the full 32-item inventory reached the specific-figure-with-
confirmed-severity state that has triggered a Founder Confirmation
Packet in prior packs (Emergency Shelter Systems' CO thresholds,
Community Food Production's compost/manure thresholds). Manufacturing
a packet here for process symmetry, when no claim requires it, would
misrepresent this pack's actual risk profile - this task's instructions
explicitly warn against doing so.

## Architecture Recheck (Part 6)

Rechecked all four items this task calls for, using the now-closed
claim set:

- **Article 3 standalone-worthiness.** C6's narrowing (from vague
  general framing to a source-grounded, four-measure claim with an
  explicit cross-link) strengthens rather than weakens Article 3's
  case for standing alone. Combined with C1-C5 and C7 (accessibility
  dimensions, door/lock specs, wheelchair transfer space, accessible-
  facility ratio, dwelling-to-latrine distance, separate-facility/
  privacy principle), Article 3 now has 7 claims, all directly read,
  covering a genuinely new corpus-wide topic (disability access and
  facility-safety). Standalone status confirmed - no reason to fold it
  into another article.
- **Article 4 / D5 coherence.** D5's narrowed form (segregate
  hazardous health-care waste from general community waste/burial
  systems) fits Article 4's existing scope (household and communal
  solid-waste collection and disposal) as a boundary/exclusion claim
  within that scope, consistent with D1-D4, D6, D7's shared subject
  (what happens to community refuse). No architecture change needed -
  D5 stays in Article 4.
- **Drainage/greywater exclusion.** Rechecked against this pass's new
  reading (VIP mechanism, GBV-prevention page, WHO health-care-waste
  fact sheet) - none of the three newly-read sources introduced
  drainage/greywater material. The original Part B finding (excluded,
  insufficiently sourced this pass) stands unchanged.
- **Cross-pack overlap.** One new instance found and handled this pass:
  C6's "water points <500m from shelters" figure duplicates Water
  Treatment at Scale's already-published household-to-water-point
  distance. Resolved by cross-linking rather than restating (see C6
  closure above and the Claim Inventory note). No other new overlaps
  were introduced by this closure pass's three new sources.

## Production-Stage Status

- **Stage 1 (Topic Selection):** Complete - Founder-approved directly,
  six acceptance criteria pass (above).
- **Stage 2 (Research):** Complete. 5-article architecture confirmed
  with all 32 claim IDs closed - no claim remains flagged, open, or
  pending deeper sourcing. Drainage/wastewater remains deliberately
  excluded as insufficiently sourced (rechecked this pass, finding
  unchanged).
- **Stage 3 (Source Collection):** Complete for this pre-writing pass -
  see `community_camp_sanitation_systems_SOURCE_COLLECTION.md` for the
  full, now-updated record including this closure pass's 3 new
  successful reads and 2 new access failures.
- **Stages 4-7:** Not started. Not authorized by the Founder's current
  decision, which covers research and source collection only. Writing
  (Stage 4) requires a separate, later authorization and is explicitly
  not begun by this task.

## Ready to write? — READY FOR WRITING (pending separate Founder authorization to begin Stage 4)

- [x] Every planned article has at least one directly-read candidate
      source - **met for all 5 articles**, and all 3 previously-open
      claims (B7, C6, D5) are now closed via directly-read sources.
- [x] No planned claim requires a source known in advance to be
      inaccessible without a fallback plan - all fallbacks were
      exercised successfully this pass.
- [x] Safety-sensitive claim families identified and mapped against
      `QUALITY_STANDARD.md` §9.3 - the sole open question (D5) has now
      been explicitly resolved as Determination A (no Founder
      confirmation required); every other numeric claim confirmed not
      to require mandatory Founder pre-writing confirmation, consistent
      with how this project treated structurally identical figures in
      Emergency Shelter Systems and Community Food Production.

**This Research Plan still does not itself authorize Writing.** Per
the Founder's original decision, this sprint's authorization covered
research, scope definition, and source collection only, and this
closure task's own boundaries explicitly exclude beginning Stage 4.
The claim set and architecture are now assessed as ready for Writing
to begin *once the Founder separately authorizes that stage* - this
document records that readiness; it does not grant the authorization
itself.
