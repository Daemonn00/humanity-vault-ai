---
pack_id: hv_official_water_treatment_at_scale
pack_name: Water Treatment at Scale
---

# Research Plan — Water Treatment at Scale

## Topic acceptance (Founder-approved directly; no separate Topic Selection file created)

The Founder approved this topic directly (Founder Decision, 2026-07-17),
so this section records the same six `QUALITY_STANDARD.md` §1 criteria
`TOPIC_SELECTION_TEMPLATE.md` would otherwise capture, rather than
creating a second, near-empty file.

- **Criterion 1 (multi-article coherence):** Passes - a real, systems-
  scale theme (source → pre-treatment → filtration → disinfection →
  storage/distribution → monitoring) spans the 6 articles below, not a
  single article dressed up as a pack.
- **Criterion 2 (no duplication):** Passes - see the Overlap Audit
  below. The core corpus already owns household/individual-scale water
  content; this pack is explicitly scoped to community/systems scale.
- **Criterion 3 (plausible source availability):** Passes - confirmed
  during this research pass itself: WHO, Oxfam WASH, the Global WASH
  Cluster eCompendium, and CAWST all publish directly-readable Tier
  1-2 technical content on this exact topic (see Source Collection).
- **Criterion 4 (category fit):** Passes - articles fit `Survival`,
  `Construction`, and `Engineering`, all existing category names; no
  new category is introduced.
- **Criterion 5 (scope safety):** Passes - no tactical, weapon-making,
  trap-making, or evasion content is required.
- **Criterion 6 (roadmap alignment):** No conflict -
  `docs/Knowledge_Expansion_Roadmap_v1.md` was not separately checked
  in depth this pass since this is an Official Knowledge Pack, not a
  core-article roadmap item, but the overlap audit below covers the
  same ground for the actually-relevant existing articles.

## Overlap Audit (Part C)

Read fresh, in full, this pass:
`humanity_vault_app/knowledge/survival/water_purification.md`,
`humanity_vault_app/knowledge/survival/water_storage_and_long_term_water_safety.md`,
`humanity_vault_app/knowledge/construction/well_digging_and_safe_water_access.md`,
`humanity_vault_app/knowledge/medicine/sanitation_hygiene_and_disease_prevention.md`.
No other released Official Knowledge Pack (Mass Casualty, Survival
Physical Readiness, Field Communication & Wayfinding) touches water
treatment at all.

**A. What existing core articles already own (do not re-litigate):**
- `water_purification.md` - boiling as an individual/household
  purification method (rolling boil, 1 minute / 3 at altitude).
- `water_storage_and_long_term_water_safety.md` - household storage
  quantity (1 gallon/person/day, 3-day/2-week targets), household
  container selection, household bleach retreatment ratio (1/8 tsp
  per gallon of 6% sodium hypochlorite).
- `well_digging_and_safe_water_access.md` - single hand-dug well site
  selection (30m from contamination sources), digging/lining/capping
  technique for one family or small group.
- `sanitation_hygiene_and_disease_prevention.md` - latrine siting,
  handwashing, general WASH hygiene practice.

**B. What this new pack should own (systems-scale, non-duplicate):**
- Estimating water demand for a group/community (not one household)
  and the design implications that follow (taps, walking distance,
  collection time).
- Protecting and assessing a source serving many households (piped
  supply, communal borehole, surface intake) - a harder version of the
  existing well-siting problem, at a scale a single family's well
  article doesn't address.
- Pre-treatment for volume: sedimentation, roughing filtration -
  processes with no household-scale equivalent in the corpus.
- Filtration systems designed for continuous/batch community
  throughput (slow sand filtration, its institutional variant) -
  distinct from a single boiling pot or a household biosand filter.
- Disinfection at batch/community scale: dosing a known volume or
  tank, contact-time requirements, point-of-supply chlorination
  hardware - distinct from the existing article's single-container
  household ratio.
- Storage tanks and distribution networks (pipes, tap stands,
  pressure, users-per-tap) for multiple households - distinct from a
  single sealed household container.
- Monitoring water quality with field-level testing (chlorine
  residual, basic contamination classification) and maintaining or
  rebuilding a shared system over time - genuinely new territory, not
  covered anywhere in the existing corpus.

**C. What remains cross-linked rather than duplicated:**
- The boiling procedure itself → `water_purification.md`.
- Household storage container guidance → `water_storage_and_long_term_water_safety.md`.
- Single-family hand-dug well construction → `well_digging_and_safe_water_access.md`.
- Latrine siting and handwashing → `sanitation_hygiene_and_disease_prevention.md`.

## Proposed article architecture, before research (Part E)

1. Assessing Community Water Needs and Protecting the Source
2. Pre-Treating Water at Community Scale (sedimentation, roughing
   filtration)
3. Filtration Systems Beyond Single-Person Scale (slow sand
   filtration)
4. Disinfection at Batch and Community Scale (chlorination)
5. Safe Storage, Distribution, and Preventing Recontamination
6. Monitoring Water Quality and Maintaining the System Over Time

This groups the systems-knowledge chain (Canon Philosophy's
source → collection → treatment → storage → distribution → use →
feedback framing) into 6 operational articles rather than one per
candidate bullet from the task's own list - "estimating demand" and
"source protection" share an article because both are decided at the
same planning stage, before any treatment begins; "sedimentation" and
"roughing filtration" share an article because both are the same
pre-treatment stage answering the same question (how to get raw water
clean enough for filtration/disinfection); "monitoring" and
"maintenance/rebuilding" share an article because in practice the same
operator role does both on an ongoing basis.

## Per-article research plan

### Article 1: Assessing Community Water Needs and Protecting the Source

- **Category:** Survival (or Construction - see Article count freeze
  note below)
- **Key claims:**
  1. A minimum water quantity target per person per day exists for
     planning a shared/community supply.
  2. Distribution design has planning limits: maximum walking
     distance to a source, maximum collection round-trip time, maximum
     users per tap.
  3. Protecting a shared source from contamination follows the same
     underlying principle as protecting a single well (separation from
     waste/contamination sources), generalized to sources serving many
     households.
  4. A systematic, risk-based planning approach ("water safety
     planning," source-to-consumer) is the recommended way to think
     about a community water system as a whole, not just its parts.
- **Candidate sources:**
  - Claim 1 → Global WASH Cluster eCompendium (emergency-wash.org),
    Community Distribution System / Safe Water Storage pages
  - Claim 2 → same, Community Distribution System page
  - Claim 3 → generalized from `well_digging_and_safe_water_access.md`
    (cross-link, not re-verified as a new claim) + WHO water safety
    planning page's "catchment to consumer" framing
  - Claim 4 → WHO water safety planning page
- **Target `verification_level` if research succeeds:** Verified
  Source
- **Fallback:** if a specific quantity/distance figure cannot be
  independently corroborated, present it as a single-source figure
  attributed honestly rather than as an undisputed standard.
- **Safety sensitivity:** No (quantity/distance/planning figures, not
  a treatment dose)
  - [x] No

### Article 2: Pre-Treating Water at Community Scale

- **Category:** Engineering
- **Key claims:**
  1. Sedimentation lets suspended particles settle before filtration/
     disinfection; a simple field test (settle for ~1 hour, check
     clarity) can assess whether it's sufficient.
  2. Chemical coagulation (e.g. aluminum-based) can accelerate
     sedimentation for turbid water, but has its own pH range and a
     health-based upper concentration limit.
  3. Roughing filtration can pre-treat highly turbid water (up to
     several hundred NTU) down to a level suitable for slow sand
     filtration, using graded gravel/media in a horizontal tank.
  4. A target turbidity (below roughly 5-10 NTU, depending on the next
     treatment step) is the practical goal of this stage.
- **Candidate sources:**
  - Claims 1, 2, 4 → eCompendium, Assisted Sedimentation page
  - Claim 3 → eCompendium, Roughing Filtration page
- **Target `verification_level` if research succeeds:** Verified
  Source, **except** the specific aluminum health-limit figure (0.2
  mg/L) - flagged for §9.3 mandatory human confirmation (see
  Verification Workbook) or omission/generalization if not obtained.
- **Fallback:** state the coagulation health limit only in general
  terms ("a recognized upper limit exists; a water-safety authority or
  test kit should confirm local dosing") unless a human reviewer
  confirms the specific figure.
- **Safety sensitivity:** Yes - chemical dosing/threshold.
  - [x] Yes

### Article 3: Filtration Systems Beyond Single-Person Scale

- **Category:** Engineering
- **Key claims:**
  1. Slow sand filtration treats water continuously through a
     biologically active sand layer, requiring low raw-water turbidity
     (roughly below 10 NTU, occasional peaks tolerated).
  2. Specific design parameters exist for flow rate and filter
     dimensions.
  3. Properly built and maintained slow sand filters can achieve high
     pathogen removal, though exact figures vary by source and depend
     on correct construction/maintenance - not a guarantee.
  4. A household-scale relative (the biosand filter) and an
     institutional-scale variant (intermittently-operated slow sand
     filter, for settings like schools) both exist.
  5. Maintenance requires periodically scraping the top sand layer.
- **Candidate sources:**
  - Claims 1, 2, 5 → eCompendium T.9 Slow Sand Filtration page + SSWM
    University Course Slow Sand Filtration page (two independent,
    directly-read sources, cross-corroborating within a normal
    engineering range)
  - Claim 3 → same two sources - present as an approximate range, not
    a single precise guarantee (see safety framing below)
  - Claim 4 → CAWST WASH Resources, Biosand Filter page
- **Target `verification_level` if research succeeds:** Verified
  Source, with pathogen-removal percentage claims (Claim 3) framed
  conservatively per the Safety Boundary Audit below.
- **Fallback:** if the two sources' numeric ranges don't reconcile
  cleanly, state both explicitly rather than picking one silently.
- **Safety sensitivity:** Yes - microbiological effectiveness claims.
  - [x] Yes

### Article 4: Disinfection at Batch and Community Scale

- **Category:** Engineering
- **Key claims:**
  1. Chlorine dosing for community-scale disinfection depends on raw
     water turbidity and is normally determined experimentally (a "jar
     test"), not from a single fixed number.
  2. A standard minimum contact time exists (commonly 30 minutes at
     pH<8, standard temperature), lengthening in colder water.
  3. A target free residual chlorine (FRC) range exists at point of
     delivery, with a lower minimum still required at the point of
     consumption.
  4. An upper safety limit on FRC exists, above which taste/health
     concerns arise.
  5. Point-of-supply chlorination hardware (tablet chambers, venturi
     liquid dosing) exists for community water points, with typical
     flow-rate and tablet-capacity figures.
  6. High organic content can produce harmful disinfection by-products
     when chlorinated.
- **Candidate sources:**
  - Claims 1-4, 6 → eCompendium T.6 Chlorination page + Oxfam WASH
    "Chlorination in Emergencies" page (two independent, directly-read,
    materially corroborating Tier 1-2 sources)
  - Claim 5 → eCompendium H.7 Point-of-Supply Chlorination page
- **Target `verification_level` if research succeeds:** every specific
  numeric dosing/concentration/contact-time claim in this article is
  flagged for §9.3 mandatory human confirmation (see Verification
  Workbook) before it may be marked directly verified - this is the
  pack's single highest-risk article. **Update, 2026-07-18: all 5
  flagged claims (D1-D5) were Founder-confirmed** - see
  `water_treatment_at_scale_FOUNDER_CONFIRMATION_PACKET.md`. Writing
  still starts at `Unverified` per `WRITING_GUIDELINES.md`; this
  confirmation closes the §9.3 pre-writing gate, not Editorial Review.
- **Fallback:** if human confirmation is not completed before writing
  must proceed, state dosing/contact-time/residual figures as
  "typical ranges reported by [named source]" with an explicit
  instruction to have a qualified water/health authority confirm
  before actual field dosing, rather than presenting them as
  ready-to-apply instructions.
- **Safety sensitivity:** Yes - the pack's most safety-critical
  article (specific chemical/toxic-substance dosing).
  - [x] Yes

### Article 5: Safe Storage, Distribution, and Preventing Recontamination

- **Category:** Engineering
- **Key claims:**
  1. Community storage tanks range widely in size (roughly 10 L to
     1,000 L+) and construction material, sized to at least meet daily
     demand plus a contingency margin.
  2. Tanks need ventilation, screened inlet/outlet/overflow openings,
     and periodic cleaning to prevent contamination and pest/insect
     breeding.
  3. Shock disinfection (a much higher chlorine concentration than
     routine dosing) is used to clean/disinfect a tank or well before
     return to service, not for routine drinking-water dosing.
  4. Distribution networks have design limits (minimum pressure, flow
     per tap, maximum users per tap) and specific cross-contamination
     risks (intermittent operation causing negative pressure at leaky
     joints; water pipes must run above wastewater pipes).
- **Candidate sources:**
  - Claims 1, 2 → eCompendium D.6 Long-Term Locally-Built Water
    Storage Tank page
  - Claim 3 → same page (shock chlorination figure)
  - Claim 4 → eCompendium D.7 Community Distribution System page
- **Target `verification_level` if research succeeds:** Verified
  Source, except the shock-chlorination concentration (Claim 3),
  flagged for §9.3 mandatory human confirmation as a specific
  toxic-substance/chemical-handling threshold.
- **Fallback:** state that tank disinfection requires a much higher,
  separately-confirmed concentration than routine drinking-water
  dosing and must never be applied to water intended for immediate
  consumption, without stating the exact figure, unless confirmed.
- **Safety sensitivity:** Yes - shock-chlorination concentration.
  - [x] Yes

### Article 6: Monitoring Water Quality and Maintaining the System Over Time

- **Category:** Engineering
- **Key claims:**
  1. Field-level chlorine residual testing methods exist (DPD1
     tablets/photometer, test strips) with stated accuracy trade-offs.
  2. A simple, field-usable classification of bacteriological
     contamination risk exists based on indicator-organism counts.
  3. WHO-style chemical guideline values exist for certain
     contaminants (e.g. arsenic, fluoride, nitrate, manganese), tested
     only when a specific problem is suspected, not routinely.
  4. Recommended monitoring frequency varies by source type (open
     wells vs. covered/piped sources vs. rainwater).
  5. Maintaining and, after a failure or infrastructure loss,
     rebuilding a community water system is best approached
     incrementally and by re-securing disinfection first - general
     engineering-resilience practice rather than a single named
     technical claim.
- **Candidate sources:**
  - Claims 1-4 → Oxfam WASH "Water Quality Analysis in Emergency
    Situations" page
  - Claim 5 → no single authoritative source identified this pass;
    plan to write as general, non-source-specific practical knowledge
    (per `QUALITY_STANDARD.md` §4's fallback), drawing on WHO's water
    safety plan "incremental improvement" framing already sourced for
    Article 1, rather than inventing a specific rebuilding source.
- **Target `verification_level` if research succeeds:** Verified
  Source for Claims 1-2 and 4; Claim 3 (chemical guideline values)
  flagged for §9.3 mandatory human confirmation; Claim 5 written as
  general knowledge, contributing `N/A` rows rather than `Unverified`
  ones to the eventual Claim-to-Source Map.
- **Fallback:** as above per claim.
- **Safety sensitivity:** Yes - chemical contamination thresholds
  (Claim 3) and contamination classification (Claim 2).
  - [x] Yes

## Research notes (freeform)

- The Global WASH Cluster eCompendium (emergency-wash.org) proved to
  be the single richest, most internally consistent source found this
  pass - it is maintained by the Global WASH Cluster (a UN-coordinated
  inter-agency humanitarian body), the German WASH Network, FHNW
  (a Swiss university), and SuSanA (confirmed by directly reading its
  own credits page). Its numeric claims cross-corroborate closely with
  Oxfam WASH's independently-authored pages on the same topics
  (turbidity <5 NTU for chlorination, FRC 0.2-0.5 mg/L at point of
  delivery, pH<8, 30-minute contact time) - two independent Tier 1-2
  sources agreeing is stronger evidence than either alone.
- Two independent slow sand filtration sources (eCompendium, SSWM
  University Course) gave slightly different flow-rate ranges
  (0.1-0.4 m/h vs. 0.1-0.3 m³/h/m²) and pathogen-removal percentages
  (>95%/>99% vs. 90-99%) - normal variation between independent
  engineering references, not a contradiction; both should be cited
  honestly rather than collapsed into one number.
- `oasisdesign.net` was blocked by a CAPTCHA challenge - a genuine
  access failure, recorded honestly, not treated as unread-but-usable.
- The WHO Technical Notes on WASH in Emergencies (15 numbered notes,
  full list obtained directly from who.int) are the most directly
  on-topic Tier 1 primary source for several claims, but every PDF
  attempted this pass (TN-01, TN-03, TN-05, TN-09, TN-11) failed to
  yield extractable text - they are illustrated/graphic-heavy PDFs
  (the notes are explicitly described as "illustrated"), the same
  extraction-failure class already seen twice before in this project
  (the ACSM PDF, FM 21-76's PDF). They remain a target for a future
  pass (e.g. an image-aware re-read) but are not cited as directly
  verified in the Source Collection below.

## Ready to write?

- [x] Every planned article has at least one directly-read candidate
      source, or (Article 6, Claim 5) an explicit decision to write as
      general knowledge.
- [x] No planned claim requires a source known in advance to be
      inaccessible without a fallback plan - the WHO Technical Notes
      gap (above) has a stated fallback (do not cite as verified).
- [x] Safety-sensitive articles (2, 3, 4, 5, 6) are flagged for
      explicit warning drafting and, where applicable, §9.3 mandatory
      human confirmation before writing proceeds to a `Verified
      Source` claim.

**This Research Plan does not authorize Writing.** Per the Founder's
decision, this sprint's authorization covers research and pre-writing
preparation only.
