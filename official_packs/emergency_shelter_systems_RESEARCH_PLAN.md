---
pack_id: hv_official_emergency_shelter_systems
pack_name: Emergency Shelter Systems
---

# Research Plan — Emergency Shelter Systems

## Topic acceptance (Founder-approved directly; no separate Topic Selection file created)

The Founder approved this topic directly (Founder Decision,
2026-07-18), matching the same pattern used for Water Treatment at
Scale. This section records the same six `QUALITY_STANDARD.md` §1
criteria `TOPIC_SELECTION_TEMPLATE.md` would otherwise capture.

- **Criterion 1 (multi-article coherence):** Passes - a real,
  systems-scale theme (site selection → shelter form → weather
  resistance → thermal/fire safety → occupancy/maintenance) spans the
  5 articles below.
- **Criterion 2 (no duplication):** Passes - see the Overlap Audit
  below. The core corpus and one released pack already own
  individual/wilderness shelter, permanent building, fire-making/fire-
  safety, and shelter-lashing technique; this pack is explicitly
  scoped to systems/settlement/communal scale.
- **Criterion 3 (plausible source availability):** Passes - confirmed
  during this research pass: UNHCR's Emergency Handbook, USFA, and EPA
  all publish directly-readable Tier 1 technical content on this exact
  topic (see Source Collection). One proposed article (anchoring/wind
  resistance) has weaker direct-source availability - flagged
  explicitly, not concealed.
- **Criterion 4 (category fit):** Passes - articles fit `Survival` and
  `Construction`, both existing category names; no new category is
  introduced.
- **Criterion 5 (scope safety):** Passes - no tactical, weapon-making,
  trap-making, or evasion content is required.
- **Criterion 6 (roadmap alignment):** No conflict -
  `docs/Knowledge_Expansion_Roadmap_v1.md` was not separately checked
  in depth, since this is an Official Knowledge Pack, not a
  core-article roadmap item; the overlap audit below covers the
  actually-relevant existing content directly.

## Overlap Audit (Part 3)

Read fresh, in full, this pass:
`humanity_vault_app/knowledge/survival/basic_shelter_construction.md`,
`humanity_vault_app/knowledge/construction/simple_structural_building_techniques.md`,
`humanity_vault_app/knowledge/survival/emergency_fire_safety.md`,
`humanity_vault_app/knowledge/survival/fire_starting_without_matches.md`,
`official_packs/hv_official_mass_casualty_first_aid/mcfa_hypothermia_and_heatstroke_field_response.md`,
`official_packs/field_communication_wayfinding/basic_knots_for_shelter_and_gear_lashing.md`.
No other released Official Knowledge Pack (Mass Casualty, Survival
Physical Readiness, Field Comm's other articles, Water Treatment at
Scale) touches shelter construction or settlement planning, though
Water Treatment at Scale's storage/distribution content and the core
corpus's sanitation article are cross-link targets for camp-scale
infrastructure.

### Ownership map

**A. Already owned elsewhere (cross-link only):**
- `basic_shelter_construction.md` - individual/small-group improvised
  lean-to shelter from natural materials: site selection basics (dry
  ground, avoid dead trees/streambeds/ridges), construction technique,
  ground insulation, keeping the shelter small. `Verified Source`,
  Level 1.
- `simple_structural_building_techniques.md` - **durable/permanent**
  building techniques (post-and-beam framing, log construction,
  joints, sloped roofing) for homes and community structures built to
  last years. `Community Verified`, Level 2.
- `fire_starting_without_matches.md` + `emergency_fire_safety.md` -
  fire-making methods and general open-fire safety, **already
  including** an explicit warning against building a fire inside an
  enclosed shelter and a carbon-monoxide caution. Both `Verified
  Source`/`Community Verified`, Level 1.
- `basic_knots_for_shelter_and_gear_lashing.md` (Field Comm, released)
  - the actual knot/lashing **technique** for joining poles into a
  shelter frame. `Verified Source`.
- `mcfa_hypothermia_and_heatstroke_field_response.md` (Mass Casualty,
  released) - the **medical treatment** of hypothermia and heatstroke
  once they occur. `Verified Source`.
- `sanitation_hygiene_and_disease_prevention.md` and the Water
  Treatment at Scale pack - latrine siting, water demand/distribution
  for a group - camp-scale infrastructure this pack references but
  does not re-explain.

**B. Partially overlapping (strict boundary required):**
- **Site selection:** `basic_shelter_construction.md` already covers
  individual/small-group hazard-avoidance siting. This pack owns the
  same principle applied at *settlement/camp scale* (spacing between
  many shelters, firebreaks across a site, distance-from-hazard rules
  for a whole population) - the same "same principle, larger scale"
  pattern already used successfully in Water Treatment at Scale's
  Article 1 relative to `well_digging_and_safe_water_access.md`.
- **Fire safety:** the existing articles already state the core
  enclosed-space/CO warning. This pack owns the *settlement-scale*
  extension (firebreak spacing between many shelters, fire safety for
  camp-scale heating devices) without re-explaining basic campfire
  practice.
- **Knots/lashing:** Field Comm's article owns the *technique*. This
  pack may reference it for shelter-frame assembly but owns the
  *engineering* question of anchoring a tarp/tent against wind (guy-
  line geometry, ground anchoring) - a different, more systems-
  engineering-oriented problem than "how to tie a knot."
- **Structural technique:** `simple_structural_building_techniques.md`
  owns *permanent* construction. This pack owns *temporary/rapidly-
  deployable* structural systems (tarps, tents, transitional shelter
  units) - genuinely different engineering territory, mirroring how
  Water Treatment at Scale distinguished itself from household water
  content.

**C. Clearly owned by Emergency Shelter Systems (net-new territory):**
- Settlement/camp-scale site planning (spacing, firebreaks, hazard-
  distance rules, drainage planning across many shelters).
- Tarps and tents as manufactured/portable shelter forms (materials,
  configurations) - not covered anywhere in the existing corpus, which
  only covers improvised natural-material lean-tos.
- Anchoring/guy-line engineering for wind resistance - genuinely new,
  though currently the pack's weakest-sourced claim family (see
  "Known Gap," below).
- Occupancy density, shelter orientation/privacy, and communal/
  transitional-shelter-specific design principles - not covered
  anywhere.
- Post-disaster household ventilation/heating/CO safety at a systems
  level (vented vs. unvented devices, generator placement, CO alarms)
  - a real extension of, not a repeat of, the existing fire-safety
  article's open-fire-specific caution.

## Proposed article architecture

1. **Shelter Site Selection and System Planning**
2. **Tarps, Tents, and Rapidly-Deployable Shelter Forms**
3. **Anchoring, Wind, and Weather Resistance for Shelter Systems**
4. **Thermal Management, Ventilation, and Fire Safety in Shelter
   Systems**
5. **Communal and Transitional Shelter: Occupancy, Maintenance, and
   Adaptation**

5 articles, not 6 - deliberately not defaulting to the same count as
the last two packs. The domain's genuine conceptual clusters (per the
task's own source→...→adaptation chain) group cleanly into 5
operational stages without producing an oversized article: planning
happens before any structure exists (Article 1); the structure itself
has a form (Article 2) and must resist weather (Article 3); once
occupied it needs safe thermal/fire management (Article 4); and it
needs ongoing occupancy/maintenance decisions over its life (Article
5). No candidate topic from the task's list was dropped - each maps to
exactly one of these five, and none required a 6th article to avoid
overcrowding.

### Article 1: Shelter Site Selection and System Planning

- **Purpose:** How to choose and lay out a site for a shelter or group
  of shelters, from a single family unit up to a small settlement.
- **Scope:** Hazard avoidance (flooding, landslide, wind exposure),
  drainage/slope, distance-from-hazard rules (waste, water,
  contamination sources), minimum spacing between shelters, firebreaks
  across a site, a risk-based/incremental planning approach (mirroring
  Water Treatment at Scale's water-safety-planning framing).
- **Explicit exclusions:** Does not repeat single-shelter siting
  technique already covered in `basic_shelter_construction.md` -
  cross-links to it and generalizes the same principle to larger
  scale, exactly as the Overlap Audit describes.
- **Core claim IDs:** A1-A7 (see claim set below)
- **Likely sources:** UNHCR Emergency Handbook (Principles & Standards
  for Settlement Planning; Safe and Secure Settlements)
- **Safety-critical claims:** distance-from-hazard rules (A5), slope/
  drainage (A1-A2) - not literally §9.3's five named categories, but
  getting site selection wrong can create flood/contamination
  exposure for many people; flagged for careful, conservative wording,
  not necessarily mandatory human confirmation (see Part 5 below).
- **Overlap/cross-links:** `basic_shelter_construction.md`
  (individual-scale siting), Water Treatment at Scale
  (water-source/distribution figures), sanitation article (latrine
  distance rules).
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** not yet decided - defer to Writing stage per
  `WRITING_GUIDELINES.md`'s "don't tag by default" rule; candidate
  reasoning (flood/wind hazard avoidance matters most in coastal/
  tropical_rainforest/desert contexts) noted for later review, not
  frozen here.

### Article 2: Tarps, Tents, and Rapidly-Deployable Shelter Forms

- **Purpose:** What a manufactured or improvised-from-sheeting shelter
  actually is, as distinct from the natural-material lean-to already
  covered elsewhere.
- **Scope:** Minimum covered floor area per person by climate, a
  comparison of shelter-form types (tents, plastic sheeting,
  construction kits, prefab units) and their tradeoffs, design
  principles (allow occupant modification, prioritize family privacy
  where feasible).
- **Explicit exclusions:** Does not cover natural-material lean-to
  construction (cross-link to `basic_shelter_construction.md`); does
  not cover permanent building techniques (cross-link to
  `simple_structural_building_techniques.md`).
- **Core claim IDs:** B1-B6
- **Likely sources:** UNHCR Emergency Handbook (Emergency Shelter
  Solutions and Standards)
- **Safety-critical claims:** none load-bearing/numeric in the §9.3
  sense - this article is comparative/descriptive.
- **Overlap/cross-links:** `basic_shelter_construction.md`,
  `simple_structural_building_techniques.md`.
- **Proposed category:** Construction
- **Proposed knowledge_level:** Level 1
- **Proposed terrain:** deferred, as Article 1.

### Article 3: Anchoring, Wind, and Weather Resistance for Shelter Systems

- **Purpose:** How a tarp/tent/rapidly-deployable shelter is kept
  standing under wind and snow load.
- **Scope:** The general principle that cold-climate and high-wind
  shelters require structural stability and ground anchoring; sourced
  caution about tent vulnerability to high wind/snow.
- **Explicit exclusions:** Does not restate the knot/lashing technique
  itself (cross-link to Field Comm's article); does not attempt to
  reproduce formal engineering load calculations (kPa/kg-per-m² style
  figures) - this pack's general-reader register and the current
  source-access gap (below) both argue against it.
- **Core claim IDs:** C1-C4
- **Likely sources:** UNHCR Emergency Handbook (Emergency Shelter
  Solutions and Standards, "Cold Weather Considerations" and the
  shelter-type comparison table)
- **KNOWN GAP - the pack's weakest-sourced article:** the specific
  guy-rope/peg anchoring instruction and family-tent pole/guy-rope
  hardware counts were found only via a `WebSearch` summary this pass
  (attributed to UNHCR's Shelter Design Catalogue and a "Family Tent"
  spec sheet) - **not directly read**. Two direct-fetch attempts this
  pass failed: the Family Tent PDF exceeded the fetch tool's size
  limit, and a UNHCR print/PDF export of the standards page returned
  only binary/unreadable content. The IFRC Shelter Safety Handbook
  (the other strong candidate for this article, per search results)
  returned HTTP 403 on both attempts. Only the *general* principle
  (cold-climate/high-wind shelters need structural stability; tents
  are specifically noted as unstable in high wind/snow) is directly
  verified. **This article should not proceed to Writing until either
  the Family Tent/Shelter Design Catalogue source is successfully
  re-fetched (e.g. a smaller page range or an alternate host) or a
  substitute authoritative source for anchoring technique is found and
  directly read.**
- **Safety-critical claims:** anchoring failure under wind is a
  genuine structural-safety concern; any future specific anchoring
  procedure/hardware claim should receive the same heightened scrutiny
  Water Treatment at Scale applied to its chemical-dosing claims (see
  Part 5).
- **Overlap/cross-links:** `basic_knots_for_shelter_and_gear_lashing.md`.
- **Proposed category:** Construction
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred.

### Article 4: Thermal Management, Ventilation, and Fire Safety in Shelter Systems

- **Purpose:** How to stay warm (or cool) and avoid fire/CO hazards
  when occupying a shelter, especially with a heating/cooking device.
- **Scope:** Insulation principles, indoor combustion/CO hazards
  (generators, unvented devices, charcoal), safe vs. unsafe heating
  practices, vented-fireplace precautions, CO alarm placement,
  firebreak spacing between shelters at settlement scale, stove-
  capacity-to-floor-area relationship.
- **Explicit exclusions:** Does not repeat general open-campfire
  safety already covered in `emergency_fire_safety.md` (cross-link);
  does not repeat hypothermia/heatstroke medical treatment (cross-link
  to the Mass Casualty pack).
- **Core claim IDs:** D1-D8
- **Likely sources:** U.S. Fire Administration (USFA/FEMA), EPA, UNHCR
  Emergency Handbook
- **Safety-critical claims:** **This is the pack's highest-risk
  article**, directly comparable to Water Treatment at Scale's
  Disinfection article. Indoor CO poisoning is a leading cause of
  accidental death in exactly the sheltering-in-place / temporary-
  heating scenario this pack addresses. See Part 5 for the explicit
  §9.3 applicability determination.
- **Overlap/cross-links:** `emergency_fire_safety.md`,
  `fire_starting_without_matches.md`.
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred (cold-climate relevance is strong but
  CO risk is universal, so terrain tagging needs real thought, not
  default coverage-tagging, per the lesson already learned during
  Water Treatment at Scale's Stage 6 pass).

### Article 5: Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation

- **Purpose:** How individual shelters combine into a functioning camp
  or transitional settlement over time.
- **Scope:** Settlement typologies (formal settlements, transit
  centres, collective centres, informal settlements), infrastructure
  ratios (toilets/water points/health/education per capita, cross-
  linked rather than re-derived), occupant modification/privacy
  design principles, the emergency-to-durable transition progression.
- **Explicit exclusions:** Does not re-derive water/sanitation
  figures already owned by Water Treatment at Scale and the core
  sanitation article - cross-links only.
- **Core claim IDs:** E1-E6
- **Likely sources:** UNHCR Emergency Handbook (Settlement Typologies,
  Emergency Shelter Solutions and Standards)
- **KNOWN GAP:** two candidate claims (shelters should open onto
  common space rather than another shelter's entrance; vulnerable
  groups should be housed together without being isolated in ways
  that increase risk) were found only via the Sphere Handbook search
  summary this pass - Sphere's own site (spherestandards.org and its
  interactive handbook) returned HTTP 403 on every attempt. **Not
  included in the frozen claim set below** unless a direct read
  becomes possible; noted as a possible future addition, not invented
  content.
- **Safety-critical claims:** none load-bearing/numeric in the §9.3
  sense.
- **Overlap/cross-links:** Water Treatment at Scale,
  `sanitation_hygiene_and_disease_prevention.md`.
- **Proposed category:** Survival
- **Proposed knowledge_level:** Level 2
- **Proposed terrain:** deferred.

## Safety-Critical Claim Families (Part 5)

Investigated against the task's full list. Applying
`pack_production_workflow/QUALITY_STANDARD.md` §9.3 exactly as
written - **no new governance rule was invented**. §9.3's five named
categories are: specific medication dosages, invasive medical/surgical
procedures, childbirth/obstetric management, specific toxic-substance
handling thresholds, and specific electrical/structural load-bearing
figures.

| Claim family | Authoritative source needed | Exact numeric guidance involved? | §9.3 literal match? | Determination |
|---|---|---|---|---|
| Carbon monoxide from indoor combustion/generators | USFA, EPA - both directly read this pass | Somewhat (alarm placement guidance) but mostly qualitative (never/always rules) | **Yes - functionally equivalent to "specific toxic-substance handling threshold."** CO is a toxic gas; the claim family is "which devices are safe indoors vs. never safe indoors," a binary safety rule closely analogous to §9.3's toxic-substance category. | **§9.3 mandatory human confirmation applies** once specific claims are frozen for Writing (not yet, since claims aren't finalized this sprint) |
| Structural collapse / wind-loading anchoring | UNHCR (general principle only, directly read); specific hardware/procedure - not yet directly read (see Article 3's Known Gap) | Potentially yes, if a future source gives specific load figures | **Yes - directly matches "specific structural load-bearing figures."** | **§9.3 mandatory human confirmation applies to any future specific structural/anchoring claim** - and per the Known Gap, this article cannot even reach a frozen claim needing that confirmation yet, since the underlying source itself isn't directly verified |
| Flash-flood/drainage hazards, falling trees, unstable terrain | UNHCR (directly read for drainage/slope); `basic_shelter_construction.md` (existing, already-published) | Some (slope percentages) | No literal match (not toxic/medical/structural-load in the strict sense) | Normal §9.2 verification - conservative, qualitative framing (as already modeled in Water Treatment at Scale's Article 1) is sufficient, no mandatory gate |
| Snow loading | Not yet sourced beyond the general "must resist snow weight" principle | Unknown - no specific figure found yet | Would match "structural load-bearing" if a specific figure is later found | No claim exists yet to gate - flag for Article 3's closure work |
| Occupancy density | UNHCR (directly read: 3.5-5.5 sqm/person figures) | Yes, but a planning target, not a life-safety threshold | No literal match | Normal §9.2 verification, framed as a planning target per the same pattern as Water Treatment at Scale's distribution-design figures |
| Sanitation proximity, emergency exits, damaged buildings/post-earthquake hazards | Not sourced this pass (occupancy/exit content deferred to Article 5's known gap; damaged-building/post-earthquake structural hazard assessment not researched - UNHCR's own guidance explicitly says to "seek specialized technical advice" for seismic risk even for simple shelter design) | Unknown | Post-earthquake structural assessment is arguably outside this pack's appropriate scope entirely - a general-public offline knowledge pack should not attempt to substitute for the specialized technical advice UNHCR itself says is required | **Recommend treating as OUT OF SCOPE** rather than a claim to verify - see Part 4 equivalent decision below |
| Fire separation / firebreak spacing | UNHCR (directly read: 30m/300m, 2m/2x-height figures) | Yes, specific figures | No literal match (settlement planning figures, not medical/toxic/structural-load) | Normal §9.2 verification, already directly read and corroborated across two UNHCR pages |

**Ambiguity flagged, not silently resolved:** §9.3's five categories
were written with Water Treatment at Scale's chemical-dosing claims
specifically in mind. Whether CO-safety rules and structural-
anchoring claims count as "toxic-substance" and "structural load-
bearing" respectively is a reasonable extension by analogy, not an
exact literal match in every phrase - this Research Plan treats them
as applying (the conservative, safety-preserving reading), but this
is a judgment call worth the Founder's awareness, not a silent
policy decision.

## Visual Knowledge Opportunity Audit (Part 10)

Research/planning only - no image generated, no schema change, no
article metadata added. Humanity Vault's long-range Visual Knowledge
Engine is not implemented in this sprint.

| Concept | Classification | Semantic visual brief (if strongly recommended) |
|---|---|---|
| Good vs. dangerous shelter site selection | **Visual strongly recommended** | Side-by-side comparison: a safe site (level ground, away from dead trees/dry streambeds/ridgelines, upslope of hazards) vs. a dangerous one (in a dry streambed, under a dead tree, on an exposed ridge) - must show the *reasoning* (why each hazard is dangerous), not just label them, matching Canon Philosophy's fidelity requirement that a diagram assert only what the source supports |
| Drainage around a shelter/settlement | Visual helpful | A cross-section or plan view showing slope direction, a shelter/settlement sited on the 2-4% grade UNHCR describes, and water flowing away from (not toward) structures |
| Tarp/tent configurations | Visual helpful | Two or three named configurations (e.g. A-frame, lean-to tarp) - genuinely improves comprehension but text alone is workable given the article's comparative, non-procedural framing |
| Anchoring and guy-line geometry | **Visual strongly recommended** | How a guy-line's angle and stake placement resist wind pull - this is inherently a spatial/geometric concept poorly served by prose; **explicitly blocked on the same Known Gap as Article 3's text content** - no visual brief should be finalized until the underlying technique is itself source-verified, to avoid illustrating an unverified claim |
| Ventilation and combustion hazards | **Visual strongly recommended** | A cutaway showing a vented vs. unvented heating device in an enclosed shelter, with CO accumulation implied in the unvented case and airflow shown in the vented case - directly serves Article 4's highest-risk claim family |
| Insulation from the ground | Visual helpful | Cross-section showing an insulating layer between occupant and cold ground, reinforcing (not duplicating) the same principle already in `basic_shelter_construction.md` |
| Wind orientation | Visual helpful | Shelter opening/closed-wall orientation relative to prevailing wind direction |
| Shelter-system/camp layout | **Visual strongly recommended** | A settlement plan view showing spacing between shelters, firebreak placement (30m/300m), and common-space/circulation - directly serves Article 1's and Article 5's spatial-planning content, which is inherently difficult to convey in prose alone |
| Condensation management | Text sufficient | The underlying principle (warm moist air meeting a cold surface) is adequately conveyed in prose; no meaningful comprehension gap identified |
| Emergency exits | Text sufficient | A simple rule-based caution, not a spatial/geometric concept requiring illustration |

Four concepts rated "Visual strongly recommended": site-selection
comparison, ventilation/combustion hazards, camp layout, and
anchoring/guy-line geometry (the last explicitly gated on Article 3's
source-verification gap being closed first, so no illustration
misrepresents an unverified claim as settled).

## Article Count Freeze - Deferred

Per the task's own instruction, the article list above is not treated
as automatically final. It should be re-examined after the Article 3
and Article 5 known gaps are closed (or formally accepted as scoped
out), before Writing begins.

## Ready to write? — NO

- [ ] Every planned article has at least one directly-read candidate
      source - **NOT MET for Article 3** (anchoring/wind resistance
      has only the general principle directly read, not the specific
      anchoring technique).
- [x] No planned claim requires a source known in advance to be
      inaccessible without a fallback plan - Article 3's and Article
      5's gaps are stated plans (find a substitute or formally narrow
      scope), not silent gaps.
- [x] Safety-sensitive claim families identified and mapped to
      `QUALITY_STANDARD.md` §9.3 or explicitly determined not to match
      it, with the one genuine ambiguity flagged rather than resolved
      silently.

**This Research Plan does not authorize Writing.** Per the Founder's
decision, this sprint's authorization covers research, scope
definition, and source collection only.
