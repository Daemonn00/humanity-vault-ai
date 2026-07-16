# Research Plan — Survival Physical Readiness

*File placement note: sibling of `official_packs/`, not inside any
pack directory - the established safe pattern (see the Field Comm and
Mass Casualty workbooks' own headers) so this pre-writing document can
never be accidentally swept into a release ZIP, since `release_pipeline`'s
`Packager` only scans the specific pack directory it's given, and no
pack directory exists yet.*

## Pack

- **`pack_id` (proposed):** `hv_official_survival_physical_readiness`
- **Working title:** Survival Physical Readiness
- **Article slug prefix:** `spr_`
- **Category:** Survival (all five articles - see `docs/Knowledge_Authoring_Standard_v1.md`'s
  11 valid category names; this pack introduces no new category)

## Governing framing (Canon Philosophy v1, Section 11)

Every article in this pack preserves knowledge *for building* physical
capability - training principles, conditioning progressions,
nutrition/recovery/injury-prevention knowledge. **No article may
imply that reading it creates strength, endurance, mobility, physical
skill, trained competence, or field experience.** Actual adaptation
requires the reader's own body and their own repeated practice over
time. This constraint must be stated explicitly in each article's
Summary or early Main Content, not left implicit.

## Article Architecture (5 articles - rationale)

Nine approved scope items were grouped into five articles, avoiding
both one-article-per-bullet fragmentation and a single oversized
catch-all article:

1. **Understanding Physical Readiness and Progressive Adaptation**
   (foundational - covers *progressive physical adaptation* directly,
   and grounds every other article's "why" before any specific
   capability is discussed, per Canon Philosophy Section 15's
   grounding principle)
2. **Building Functional Strength and Aerobic Endurance** (covers
   *functional strength* + *aerobic endurance* - grouped because WHO
   and CDC's own public guidance already treats these as one
   combined weekly framework, not two separate programs)
3. **Mobility, Balance, and Sustained Work Capacity** (covers
   *mobility* + *work capacity* - grouped because both concern
   sustaining functional movement over a work session, distinct from
   Article 2's base-building framing)
4. **Load Carrying and Physically-Loaded Survival Tasks** (covers
   *load carrying* + the *physically-loaded survival skills* bullet
   list from the task - the survival-specific application article)
5. **Recovery and Injury Prevention for Physical Training** (covers
   *recovery* + *injury prevention* - closes the loop back to Article
   1's adaptation principle: adaptation requires recovery, not only
   training load)

**Baseline-framework research finding (Part 8):** a functional-
capability framing (move / carry / lift / push-pull / climb / sustain
effort / recover) is better supported by the actual source material
than a conventional gym-program structure - WHO and CDC's own public
guidance is already organized by functional category (aerobic,
strength, balance) rather than by fixed program, and NIOSH/occupational
material is inherently task-functional (lifting, carrying) rather than
athletic. This pack should use functional-capability language
throughout, not gym-culture terminology (no "leg day," no bodybuilding
splits), and should present this as an organizing lens for existing,
independently-sourced content - **not as an invented proprietary
system**. This finding should guide Article 1's framing during
writing.

---

## Article 1: Understanding Physical Readiness and Progressive Adaptation

- **Category:** Survival
- **Key claims this article will need to make:**
  1. Physical capability develops through progressive overload
     (gradually increasing training stress) balanced with adequate
     recovery - not through reading alone.
  2. A "start low, go slow" progression approach reduces injury risk
     for beginners and deconditioned individuals compared to starting
     at a high intensity.
  3. Some people should consult a professional before beginning a new
     physical training program (general caveat, not individualized
     medical prescription).
- **Candidate sources for each claim:**
  - Claim 1 → ACSM Position Stand, "Progression Models in Resistance
    Training for Healthy Adults" (2009); WHO 2020 Guidelines on
    Physical Activity and Sedentary Behaviour
  - Claim 2 → ACSM/CDC "start low, go slow" exercise-prescription
    principle (FITT-VP framework); CDC Older Adult Activity guidance
  - Claim 3 → WHO 2020 Guidelines (general population caveats); CDC
    Physical Activity Basics
- **Target `verification_level` if research succeeds:** Verified
  Source
- **Fallback if a claim's source cannot be found or directly read:**
  Rewrite as general, non-source-specific practical knowledge
  (progressive overload and gradual progression are widely-documented
  foundational premises, not narrow claims), or mark `Community
  Verified` if only broad confirmation, not exact wording, is
  achieved.
- **Safety sensitivity:**
  - [x] Yes - the professional-consultation caveat is safety-adjacent
        and must not become an individualized medical clearance
        statement.

## Article 2: Building Functional Strength and Aerobic Endurance

- **Category:** Survival
- **Key claims this article will need to make:**
  1. Adults benefit from a combination of aerobic activity and
     muscle-strengthening activity most weeks (general population
     guidance, not a rigid prescription).
  2. Muscle-strengthening activity should work the major muscle
     groups, not just one area.
  3. Older adults or those returning after a break should reduce
     starting intensity and rebuild gradually.
- **Candidate sources for each claim:**
  - Claim 1 → WHO 2020 Guidelines on Physical Activity and Sedentary
    Behaviour; CDC "Adult Activity: An Overview"
  - Claim 2 → CDC "What Counts as Physical Activity for Adults";
    ACSM Progression Models position stand
  - Claim 3 → CDC "Older Adult Activity: An Overview"; CDC guidance on
    restarting after a break/illness
- **Target `verification_level` if research succeeds:** Verified
  Source
- **Fallback:** general, non-numeric framing (e.g., "regular aerobic
  and strength activity, most weeks" rather than a specific minute
  count) if exact figures cannot be directly confirmed at drafting
  time; per Part 4's instruction, no universal numeric target should
  be stated unless it is directly, specifically source-supported.
- **Safety sensitivity:**
  - [x] Yes - intensity/progression guidance is safety-adjacent per
        Part 4's explicit list.

## Article 3: Mobility, Balance, and Sustained Work Capacity

- **Category:** Survival
- **Key claims this article will need to make:**
  1. Balance-specific activity (distinct from strength/aerobic
     activity) reduces fall risk and supports mobility, especially for
     older adults.
  2. Sustaining physical work over a prolonged period draws on
     different capacities than short, intense effort, and can be
     trained by gradually increasing duration before increasing
     intensity.
  3. Mobility limitations can be worked around with alternative
     activities rather than treated as a reason to avoid physical
     activity entirely.
- **Candidate sources for each claim:**
  - Claim 1 → CDC "Older Adult Activity: An Overview" (balance
    activities); CDC "What Counts as Physical Activity for Older
    Adults"
  - Claim 2 → ACSM FITT-VP framework material; WHO 2020 Guidelines
  - Claim 3 → CDC guidance on scaled/alternative activity for less
    mobile individuals
- **Target `verification_level` if research succeeds:** Verified
  Source, with Claim 2 possibly `Community Verified` if only the
  general principle, not a specific progression method, can be
  directly confirmed.
- **Fallback:** state the general principle (duration before
  intensity) without a specific numeric progression schedule if one
  cannot be directly confirmed.
- **Safety sensitivity:**
  - [x] Yes - balance/fall-risk content for older or deconditioned
        readers is safety-adjacent.

## Article 4: Load Carrying and Physically-Loaded Survival Tasks

- **Category:** Survival
- **Key claims this article will need to make:**
  1. Manual lifting and carrying risk rises with load, distance from
     the body, frequency, and awkward posture, not load alone.
  2. Injury risk from carrying a loaded pack rises sharply above a
     load threshold relative to body weight, though exact civilian
     thresholds are not as well-established as occupational lifting
     guidance.
  3. Gradual progression (increasing duration/frequency before
     increasing weight) reduces injury risk when building load-
     carrying capacity.
  4. General survival-relevant physical tasks (walking long distances,
     carrying water/supplies, repeated lifting) draw on the
     capacities built in Articles 2 and 3, applied together.
- **Candidate sources for each claim:**
  - Claim 1 → NIOSH, "Ergonomic Guidelines for Manual Material
    Handling" (DHHS/NIOSH Publication No. 2007-131)
  - Claim 2 → peer-reviewed review, "Physiological impact of load
    carriage exercise" (PMC); **flagged for careful handling - see
    Research Notes below**, since most specific bodyweight-percentage
    figures found during research trace to secondary/fitness-content
    sources, not a primary civilian guideline
  - Claim 3 → general progression principle, cross-referenced against
    ACSM's progression-model source already used in Articles 1-2
  - Claim 4 → this is a synthesis/framing claim, not a new factual
    claim - no additional source needed beyond Articles 2-3's own
    sources
- **Target `verification_level` if research succeeds:** Article likely
  starts at `Community Verified` rather than `Verified Source`,
  because Claim 2's exact numeric thresholds could not be traced to a
  clearly primary, civilian-specific source during this research pass
  (see Research Notes).
- **Fallback:** state Claim 2 qualitatively ("injury risk rises
  sharply once a pack becomes heavy relative to the carrier's own
  body weight, so add weight gradually and conservatively") without
  asserting a specific percentage figure, unless a Tier 1/2 source for
  a specific civilian number is found during actual verification.
- **Safety sensitivity:**
  - [x] Yes - **Critical** candidate: load-carrying injury guidance
        is squarely inside Part 4's safety-boundary list (load
        progression).

## Article 5: Recovery and Injury Prevention for Physical Training

- **Category:** Survival
- **Key claims this article will need to make:**
  1. Recovery (rest, sleep, adequate nutrition/hydration) is a
     required part of adaptation, not optional downtime.
  2. Overtraining/non-functional overreaching is a real, recognized
     risk of insufficient recovery relative to training load, with
     symptoms distinct from normal training fatigue.
  3. There is a meaningful distinction between normal training
     discomfort and pain signaling injury, though this distinction is
     not always sharp and warrants caution.
  4. Certain warning signs during physical exertion (e.g.,
     chest pain, severe shortness of breath, dizziness) warrant
     stopping activity and seeking medical evaluation.
- **Candidate sources for each claim:**
  - Claim 1 → ACSM/ECSS Joint Consensus Statement on overtraining
    syndrome (Meeusen et al.); WHO 2020 Guidelines
  - Claim 2 → ACSM/ECSS Joint Consensus Statement on overtraining
    syndrome
  - Claim 3 → ACSM/ECSS Joint Consensus Statement (discusses
    persistent soreness/fatigue as a warning sign); **flagged as
    needing careful, conservative wording** - this is inherently a
    judgment-call distinction and must not be stated as a bright
    line
  - Claim 4 → MedlinePlus (NIH/NLM), "Muscle aches"
    (medlineplus.gov/ency/article/003178.htm) - found and directly
    read during Source Collection, closing this claim's original
    sourcing gap with a muscle-pain-specific (not general
    cardiovascular) warning-sign list; cross-link to
    `recognizing_and_treating_dehydration` and the Mass Casualty
    pack's `mcfa_shock_recognition_and_management` /
    `mcfa_hypothermia_and_heatstroke_field_response` for what to do if
    a warning sign actually occurs, rather than duplicating emergency
    treatment content here
- **Target `verification_level` if research succeeds:** Verified
  Source for Claims 1, 2, 4; Claim 3 likely needs conservative,
  qualified wording regardless of source strength, given its
  inherently judgment-dependent nature.
- **Fallback:** for Claim 3, state the distinction in general,
  cautious terms ("some discomfort is a normal part of training;
  sharp, localized, or worsening pain is not, and is a signal to stop
  and seek assessment") without claiming a precise, universal
  boundary.
- **Safety sensitivity:**
  - [x] Yes - **Critical** candidate: pain-vs-discomfort and
        cardiovascular warning signs are directly named in Part 4's
        safety boundary list.

## Existing-Content Overlap Notes (feeds the Overlap Audit)

- **Heat illness / dehydration treatment** — owned by
  `knowledge/medicine/recognizing_and_treating_dehydration.md` and
  `official_packs/hv_official_mass_casualty_first_aid/mcfa_hypothermia_and_heatstroke_field_response.md`.
  This pack must stay on the *prevention-during-training* side
  (pacing, acclimatization, work-rest cycles) and cross-link rather
  than duplicate treatment steps.
- **Fracture/sprain treatment** — owned by
  `mcfa_fracture_and_sprain_stabilization.md`. Article 5 stays on
  *injury prevention*, cross-linking to that article for what to do
  if an injury actually occurs.
- **Navigation/evacuation routing** — owned by
  `basic_navigation_without_gps_or_compass.md`. Article 4 owns the
  *physical capability* to walk/carry during evacuation, not the
  wayfinding procedure itself.
- **Food production/preservation** — owned by
  `growing_staple_food_crops.md`, `food_preservation_basics.md`.
  Article 5's nutrition-for-recovery content stays general, cross-
  linking rather than re-teaching production/preservation.
- **Manual-labor survival tasks** — `basic_shelter_construction.md`,
  `well_digging_and_safe_water_access.md`,
  `simple_structural_building_techniques.md` assume physical capability
  to perform the described work but don't teach how to build it. This
  pack is complementary; `related_articles` should reference these as
  forward-links from Article 4.

## Research Notes (freeform)

- OSHA's domain (`osha.gov`) was directly, successfully read via
  `WebFetch` for the Mass Casualty pack's heat-illness sourcing
  (Sprint #006) - a reasonable signal it may be directly readable for
  this pack's heat/hydration-during-work content too, though this must
  be independently re-attempted at Source Collection/Verification
  time, not assumed from the prior pack's outcome.
- CDC's domain (`cdc.gov`) previously returned HTTP 403 to automated
  `WebFetch` attempts during the Mass Casualty pack's verification
  sprint. Several strong candidate sources for this pack are on
  `cdc.gov` directly (Physical Activity Basics pages). If the same
  block recurs, the WHO 2020 Guidelines' NCBI Bookshelf mirror
  (`ncbi.nlm.nih.gov/books/...`) is a promising Tier 1 alternative,
  matching the pattern that worked for the CDC Yellow Book in the Mass
  Casualty pack.
- Load-carriage-specific civilian weight thresholds (e.g., "10% of
  body weight," "22% of body weight") found during this research pass
  trace overwhelmingly to fitness blogs and rucking-culture content,
  not to a clearly primary civilian public-health or occupational
  source. Military load-carriage research (DTIC reports) is genuine
  official research but is explicitly military-context per Part 5's
  own caution against treating military doctrine as automatically
  civilian-appropriate. **Recommendation: Article 4 should not assert
  a specific bodyweight-percentage number as a rule unless a Tier 1/2
  civilian-context source is found during Source Collection; if not
  found, state the principle qualitatively (see Article 4, Claim 2
  fallback above).**
- ACSM's position stands are frequently paywalled at their original
  journal DOI but are mirrored as PDFs by secondary hosts (e.g. an EMS
  training-resource site hosting the 2009 progression-models PDF).
  Source Collection should attempt the original journal/ACSM-hosted
  version first and only use a mirror if the original cannot be
  reached, noting the mirror explicitly if used.

## Ready to write?

- [x] Every planned article has at least one candidate source
      identified, or an explicit decision to write it as general
      knowledge with a realistic (not optimistic) target
      `verification_level`.
- [x] No planned claim requires a source known in advance to be
      inaccessible with no fallback plan - the one genuine access risk
      (CDC direct pages) has an identified fallback (NCBI Bookshelf
      mirror), consistent with this project's prior experience.
- [x] Safety-sensitive articles are flagged for explicit warning
      drafting during writing (all five articles carry at least one
      safety-sensitive claim).

Proceed to `SOURCE_COLLECTION_TEMPLATE.md`-equivalent logging (this
pass's candidate sources are logged in
`survival_physical_readiness_SOURCE_COLLECTION.md`) once research
begins in earnest - direct reading and verification-level confirmation
is a later, separate stage (Human Source Verification), not performed
in this planning sprint.
