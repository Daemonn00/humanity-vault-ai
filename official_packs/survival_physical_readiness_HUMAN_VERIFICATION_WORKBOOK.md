# Human Verification Workbook (Pre-Drafting) — Survival Physical Readiness

**This workbook was produced before any article was written**, based
on the planned claims in `survival_physical_readiness_RESEARCH_PLAN.md`
and the candidate sources in
`survival_physical_readiness_SOURCE_COLLECTION.md` - not on drafted
article prose, since none exists yet. This follows the same
pre-drafting ordering established for
`mass_casualty_first_aid_HUMAN_VERIFICATION_WORKBOOK.md`.

**Consequence of this ordering, stated plainly:** once Writing happens,
the actual article sentences may phrase things differently than the
"planned claim" wording below. **This workbook must be re-checked
against the real article text once drafted** - treat the claims below
as a verification target for drafting to hit, not a guarantee that the
final article text will match word-for-word.

**File placement note:** sibling of `official_packs/`, same safe
pattern as the Research Plan and Source Collection above.

## Verification Pass #1 Results (2026-07-17)

A first real Human Source Verification pass was performed via direct
`WebFetch` reads of the candidate sources logged in
`survival_physical_readiness_SOURCE_COLLECTION.md`. Results, honestly,
were mixed - consistent with this pack line's own established pattern
of some sources being directly readable and others blocked:

**Successfully opened and read in full:**
- WHO 2020 Guidelines on Physical Activity and Sedentary Behaviour
  (NCBI Bookshelf) - strong, specific confirmation for multiple claims.
- ACSM Position Stand, "Progression Models in Resistance Training for
  Healthy Adults" (2009), via the `tourniquets.org` mirror.
- ACSM/ECSS Joint Consensus Statement on overtraining syndrome
  (PubMed abstract).
- Peer-reviewed review, "Physiological impact of load carriage
  exercise" (PMC) - notably, this read **confirmed the absence** of an
  established civilian load-threshold figure, which validates rather
  than weakens the Research Plan's conservative fallback for Claim D2.
- OSHA worker-facing heat guidance (`osha.gov/heat/worker-information`)
  - supplementary cross-reference only, as planned.

**Blocked or not successfully read this pass:**
- Both CDC direct pages (`cdc.gov/physical-activity-basics/...`) -
  HTTP 403, matching the exact risk already flagged in the Research
  Plan from the Mass Casualty pack's prior experience.
- A `restoredcdc.org` mirror attempt for the same content - also HTTP
  403.
- NIOSH's Manual Material Handling PDF (`cdc.gov/niosh/...`) - HTTP
  403 (same `cdc.gov` domain block).
- A specific OSHA lifting/carrying sub-page - HTTP 404 at the
  attempted URL (a wrong path, not a confirmed absence of OSHA content
  on this topic - worth a corrected re-attempt in a future pass).
- A clean, primary, lay-public source for cardiovascular exercise
  warning signs (Claim E4) was not pinned down this pass. A widely
  corroborated "chest pain / severe shortness of breath / dizziness or
  faintness / new confusion / sudden sweating or pallor" list was
  found, but traced to secondary health-content sites, not a directly
  read primary AHA or CDC page. **A separate, genuinely different
  source was also found and deliberately rejected as a poor claim
  match**: ACSM's clinical exercise-*testing* termination criteria
  (ECG changes, blood-pressure-drop thresholds) - these require
  equipment this pack's reader won't have and are the wrong claim for
  a lay, unsupervised-training audience. Using them would have been a
  real citation-discipline failure (a real Tier 1 source, wrongly
  matched to a claim it doesn't actually support for this audience) -
  flagged here explicitly as a mismatch that was caught and avoided,
  not used.

Article-by-article claim tables below are updated with these real
results. **No article reaches `Verified Source` in this pass** - each
still has at least one claim either unconfirmed or requiring
conservative rewording before that status would be honestly earned.

## Verification Pass #2 Results (2026-07-17, Targeted Closure Sprint)

A second, narrowly-targeted pass addressed only the four claims left
open after Pass #1 (A3, B3, C3, D1), per this sprint's explicit scope.
No other claim was re-opened or re-litigated.

**Re-attempted and still blocked (confirming Pass #1's findings were
not one-time issues):**
- `cdc.gov/physical-activity-basics/guidelines/chronic-health-conditions-and-disabilities.html`
  - HTTP 403 (the A3/C3 substitute candidate).
- `nia.nih.gov/health/exercise-and-physical-activity/exercising-safely`
  and `nia.nih.gov/health/exercise-and-physical-activity` - both HTTP
  405 (a different failure mode than `cdc.gov`'s 403, but still not
  directly readable).
- `medlineplus.gov/seniorshealth.html` - readable, but confirmed to be
  a hub page with no specific content on gradual progression or
  mobility-limitation alternatives; correctly not used as a source for
  any claim, only as a pointer to the page that was actually used
  (`exerciseforolderadults.html`).

**Newly and successfully read, closing all four gaps:**
- MedlinePlus, "Exercise and Physical Fitness"
  (`medlineplus.gov/exerciseandphysicalfitness.html`) - resolves A3.
- MedlinePlus, "Exercise for Older Adults"
  (`medlineplus.gov/exerciseforolderadults.html`) - resolves B3.
- WHO 2020 Guidelines (NCBI Bookshelf, `NBK566046`), re-read for a
  different section than Pass #1's - resolves C3 (narrowed).
- CCOHS, "NIOSH Lifting Equation - Assessing Relevant Handling
  Factors" (`ccohs.ca/oshanswers/ergonomics/niosh/assessing.html`) -
  resolves D1 (source substituted for the still-blocked NIOSH primary
  document).

**Closure outcomes:** A3 Replaced, B3 Verified, C3 Narrowed, D1
Verified (source substituted). No claim was Removed - a genuine,
appropriately-scoped source was found for all four. No rejected
universal load-percentage figure was reintroduced (D1 concerns risk
*factors*, not a specific number - D2's own separate, already-resolved
qualitative fallback is unaffected and unchanged). No unsupported
medical-clearance rule was introduced - A3's final claim is narrower
and more conservative than the original plan, not broader.

---

## Article 1: Understanding Physical Readiness and Progressive Adaptation

**Sources:** WHO 2020 Guidelines on Physical Activity and Sedentary
Behaviour; ACSM Position Stand, "Progression Models in Resistance
Training for Healthy Adults" (2009); MedlinePlus, "Exercise and
Physical Fitness" (added Verification Pass #2, resolves A3)

| # | Planned claim | Priority |
|---|---|---|
| A1 | Physical capability develops through progressive overload balanced with adequate recovery, not through reading alone | **Critical** - this is the article's core Canon-Law-8 framing claim |
| A2 | A "start low, go slow" progression approach reduces injury risk for beginners/deconditioned individuals versus starting at high intensity | Important |
| A3 | Some people should consult a professional before beginning a new physical training program | **Critical** - safety-boundary claim, must not become individualized medical prescription |

**Quotation/confirmation/removability:**
- A1: factual confirmation is sufficient for the general principle,
  but this claim is also the article's explicit Canon Section 11
  disclaimer and must be written in the article's own voice regardless
  of exact source phrasing - it is a framing commitment as much as a
  sourced claim.
- A2: factual confirmation sufficient - this is a widely-documented
  exercise-science principle across multiple candidate sources.
- A3: **needs careful, general wording, not close quotation** - the
  goal is a general caveat matching WHO/CDC's own general-population
  framing, never a specific list of conditions presented as medical
  triage criteria. If the exact source wording is more specific than
  intended, deliberately generalize rather than reproduce a clinical
  checklist.
- Not removable if unconfirmed: A1 (it is the pack's foundational
  disclaimer, independent of any single source) and A3 (dropping a
  professional-consultation caveat entirely is less safe than keeping
  a general one).

**Estimated verification effort:** ~30-40 minutes (two sources, both
previously identified as at least partially accessible via known-good
mirrors).

### Verification table

| # | Claim | Source | Page/Section | Result | Notes |
|---|---|---|---|---|---|
| A1 | Progressive overload + recovery required for adaptation | WHO 2020 Guidelines; ACSM Progression Models | Executive Summary; ACSM PDF body | **Pass** | ACSM: "continued progression is necessary for continued improvements in strength." WHO's older-adult section confirms gradual-increase language. |
| A2 | "Start low, go slow" reduces injury risk | WHO 2020 Guidelines | Executive Summary (older adults section) | **Pass, exact wording found** | WHO: "should start by doing small amounts of physical activity, and gradually increase the frequency, intensity and duration over time." Article should use this phrasing closely. |
| A3 | General professional-consultation caveat | WHO 2020 Guidelines (attempt 1, failed recheck) → **MedlinePlus, "Exercise and Physical Fitness" (Verification Pass #2, 2026-07-17)** | Executive Summary (WHO, unconfirmed); full article (MedlinePlus, confirmed) | **RESOLVED - REPLACED** | **History, preserved:** the original WHO "medical clearance generally unnecessary" quotation did not survive an independent recheck (see the entry this replaces, retained below for the record). A `cdc.gov` chronic-conditions substitute was then attempted directly via `WebFetch` and returned HTTP 403 (same domain block affecting this pack's other CDC candidates). **Resolution:** MedlinePlus (NIH/NLM), `medlineplus.gov/exerciseandphysicalfitness.html`, directly read via `WebFetch` on 2026-07-17, confirms: "Before you start, check with your health care provider, especially if you have trouble moving, balancing, or worry that exercise might not be safe for you." **Final claim (replaced, narrower and more conservative than originally planned):** most people can begin light or moderate activity without special clearance; check with a healthcare provider first specifically if you have trouble moving or balancing, or are otherwise unsure whether activity is safe for you - not a generic "some people should consult a professional" caveat, and not a clinical checklist of conditions. |
| *(superseded, retained per this project's "never silently overwrite a failed attempt" discipline)* | A3 original attempt | WHO 2020 Guidelines | Executive Summary | **Not independently reproduced on recheck** | The original claimed "medical clearance generally unnecessary" quotation was not found on independent re-fetch of this page on 2026-07-17. Not used in the final claim above. |

---

## Article 2: Building Functional Strength and Aerobic Endurance

**Sources:** WHO 2020 Guidelines; CDC "Adult Activity: An Overview"
(blocked, not required - WHO fully supports B1/B2); MedlinePlus,
"Exercise for Older Adults" (added Verification Pass #2, resolves B3)

| # | Planned claim | Priority |
|---|---|---|
| B1 | Adults benefit from a combination of aerobic and muscle-strengthening activity most weeks | Important |
| B2 | Muscle-strengthening activity should work the major muscle groups, not just one area | Important |
| B3 | Older adults or those returning after a break should reduce starting intensity and rebuild gradually | **Critical** - directly relevant to deconditioned/older readers, a named safety-boundary population |

**Quotation/confirmation/removability:**
- B1: factual confirmation sufficient; **any specific minute/day
  figures used must be directly confirmed exactly**, not carried over
  from general fitness-culture knowledge, per Part 4's explicit
  warning against unsupported universal numeric targets.
- B2: factual confirmation sufficient.
- B3: **needs close reading** - the exact rebuilding guidance (how
  much to reduce, how to rebuild) must match the source's own stated
  approach; if precise figures aren't confirmable, state the principle
  qualitatively ("reduce intensity and rebuild gradually" without a
  specific percentage or timeline).
- If B1's specific numeric guidance can't be confirmed precisely: state
  the qualitative principle (regular aerobic and strength activity,
  most weeks) without a specific minute count, consistent with the
  Research Plan's fallback.

**Estimated verification effort:** ~35-45 minutes (two sources; B1's
numeric claims warrant careful, exact reading rather than skimming).

### Verification table

| # | Claim | Source | Page/Section | Result | Notes |
|---|---|---|---|---|---|
| B1 | Aerobic + strength activity combination, most weeks | WHO 2020 Guidelines | Executive Summary | **Pass, exact figures found** | WHO: "at least 150–300 minutes of moderate-intensity aerobic physical activity; or at least 75–150 minutes of vigorous-intensity" + "muscle-strengthening activities... all major muscle groups on 2 or more days a week." CDC page (originally planned second source) was blocked (HTTP 403); WHO alone fully supports this claim. |
| B2 | Major muscle groups, not one area | WHO 2020 Guidelines; ACSM Progression Models | Executive Summary; ACSM PDF body | **Pass** | Confirmed independently by both sources. CDC (originally planned) blocked; not needed given WHO+ACSM confirmation. |
| B3 | Reduced/gradual rebuilding for older/deconditioned readers | CDC Older Adult Activity (blocked) → **MedlinePlus, "Exercise for Older Adults" (Verification Pass #2, 2026-07-17)** | | **RESOLVED - VERIFIED** | **History, preserved:** CDC direct page and its `restoredcdc.org` mirror both remained blocked (HTTP 403) on re-attempt. **Resolution:** MedlinePlus (NIH/NLM), `medlineplus.gov/exerciseforolderadults.html`, directly read via `WebFetch` on 2026-07-17, confirms exactly this claim's core: "If you have not been active, you can start slowly and work up to your goal." Same page also independently re-confirms C1 (balance exercises prevent falls), corroborating rather than contradicting the already-verified claim. **Final claim (verified, narrowed to match exact source support):** someone who hasn't been active can start slowly and work up gradually toward their goal, rather than starting at full intensity - the more specific "restarting after a break/illness" framing originally envisioned is dropped as not directly supported by this source. |

---

## Article 3: Mobility, Balance, and Sustained Work Capacity

**Sources:** WHO 2020 Guidelines (primary, replacing blocked CDC
pages - supports C1 and, via Verification Pass #2, C3-narrowed); ACSM
progression-principle material (does not address C2 - see fallback)

| # | Planned claim | Priority |
|---|---|---|
| C1 | Balance-specific activity reduces fall risk and supports mobility, especially for older adults | Important |
| C2 | Sustaining physical work over a prolonged period draws on different capacities than short, intense effort, trainable by increasing duration before intensity | Important |
| C3 | Mobility limitations can be worked around with alternative activities rather than treated as a reason to avoid activity entirely | **Critical** - inclusion/safety framing for readers with existing limitations |

**Quotation/confirmation/removability:**
- C1: factual confirmation sufficient.
- C2: factual confirmation sufficient for the general principle;
  specific progression schedules should not be invented if not
  directly supported.
- C3: **needs careful, encouraging-but-honest wording** - must not
  imply alternative activities are equivalent substitutes for full
  mobility, only that some activity is safely possible and valuable;
  matches CDC's own stated framing per initial research ("even if it's
  hard to do some types of activities... you can safely do other types").
- Not removable if unconfirmed: C3 - dropping this claim risks
  implying readers with mobility limitations have no safe path
  forward, which is both inaccurate and against the pack's inclusive
  intent; if precise source wording can't be confirmed, state the
  principle in general, conservative terms.

**Estimated verification effort:** ~25-35 minutes (two related CDC
pages plus cross-reference to Article 1-2's already-verified
progression sourcing).

### Verification table

| # | Claim | Source | Page/Section | Result | Notes |
|---|---|---|---|---|---|
| C1 | Balance activity reduces fall risk | WHO 2020 Guidelines | Executive Summary | **Pass, strong exact confirmation** | WHO: "varied multicomponent physical activity that emphasizes functional balance and strength training at moderate or greater intensity, on 3 or more days a week, to enhance functional capacity and prevent falls." CDC (originally planned) blocked; WHO alone fully supports this claim, arguably more precisely than originally planned. |
| C2 | Duration-before-intensity progression for sustained work | ACSM progression material | | **Not directly confirmed this pass** | ACSM's read content addressed resistance-training progression (sets/reps/load) specifically, not endurance/sustained-work duration-vs-intensity progression. **Fallback: rephrase to lean on the general progressive-overload principle already confirmed (A1), rather than an endurance-specific claim this source doesn't actually make.** |
| C3 | Alternative activities for mobility limitations | CDC What Counts (blocked) → **WHO 2020 Guidelines, re-read for its disability/functional-ability section (Verification Pass #2, 2026-07-17)** | | **RESOLVED - NARROWED** | **History, preserved:** CDC page remained blocked (HTTP 403) on re-attempt; no substitute directly supporting the specific "alternative/substitute activities" framing was found. **Resolution:** a second, targeted re-read of the WHO 2020 Guidelines (NCBI Bookshelf, `NBK566046`) - the same source already used for A1/A2/B1/B2/C1 - specifically for disability/functional-ability content confirms: "Older adults should be as physically active as their functional ability allows, and adjust their level of effort for physical activity relative to their level of fitness," and, more broadly, "Doing some physical activity is better than doing none." **Final claim (narrowed - this is the correct closure option, not a full verification):** activity should be scaled to a person's current functional ability rather than avoided entirely because of a limitation, and some activity is always better than none. The original, more specific "alternative activities can substitute for standard ones" framing is **dropped** - WHO's own guidelines do not provide specific modified-activity protocols for particular limitations, and inventing that specificity would go beyond what any source here supports. |

---

## Article 4: Load Carrying and Physically-Loaded Survival Tasks

**Sources:** NIOSH, "Ergonomic Guidelines for Manual Material
Handling" (blocked throughout - never directly read); CCOHS, "NIOSH
Lifting Equation - Assessing Relevant Handling Factors" (added
Verification Pass #2, resolves D1 as a directly-read substitute);
peer-reviewed review, "Physiological impact of load carriage exercise"
(resolves D2's qualitative fallback)

| # | Planned claim | Priority |
|---|---|---|
| D1 | Manual lifting/carrying risk rises with load, distance from the body, frequency, and awkward posture, not load alone | Important |
| D2 | Injury risk from a loaded pack rises sharply above a load threshold relative to body weight | **Critical** - flagged in Source Collection as the pack's weakest-sourced claim |
| D3 | Gradual progression (duration/frequency before weight) reduces injury risk when building load-carrying capacity | Important |
| D4 | Survival-relevant physical tasks (walking distances, carrying water/supplies, repeated lifting) draw on capacities built in Articles 2-3 | Low - synthesis/framing claim, not an independent factual claim |

**Quotation/confirmation/removability:**
- D1: factual confirmation sufficient - this is NIOSH's core,
  well-established ergonomic principle.
- D2: **needs the most careful handling in this entire pack** - per
  Source Collection's explicit flag, no clearly primary civilian
  source for a specific percentage figure was found during planning.
  **If Human Source Verification cannot find a Tier 1/2 civilian-
  context source stating a specific number, this claim must be written
  qualitatively** ("injury risk rises sharply once a pack becomes
  heavy relative to the carrier's own body weight - add weight
  gradually and conservatively"), with no percentage stated, rather
  than adopting a fitness-culture figure with no traceable primary
  source. This is a **do-not-invent-a-source** case per
  `QUALITY_STANDARD.md` Section 4.
- D3: factual confirmation sufficient for the general principle.
- D4: requires no independent verification - flag as a framing
  statement whose factual support comes entirely from Articles 2-3's
  own already-verified claims, not a new claim needing its own source.
- Not removable if unconfirmed: D1 and D3 are foundational injury-
  prevention content and should stay in some form even if only
  generally confirmed; D2 is not removable either, but its *specificity*
  is negotiable - the underlying caution ("heavier loads are riskier,
  progress gradually") must remain even if no exact threshold survives
  verification.

**Estimated verification effort:** ~40-55 minutes (NIOSH document is a
substantial technical PDF requiring careful navigation; D2 specifically
may require additional search beyond the two candidate sources already
identified if neither directly supports a civilian-specific number).

### Verification table

| # | Claim | Source | Page/Section | Result | Notes |
|---|---|---|---|---|---|
| D1 | Lifting/carrying risk factors beyond load alone | NIOSH Manual Material Handling (blocked) → **CCOHS, "NIOSH Lifting Equation - Assessing Relevant Handling Factors" (Verification Pass #2, 2026-07-17)** | Full page | **RESOLVED - VERIFIED (source substituted)** | **History, preserved:** the NIOSH PDF remained blocked (HTTP 403, same `cdc.gov` domain block) on re-attempt this pass; a corrected OSHA lifting/carrying URL was not located either. **Resolution:** the Canadian Centre for Occupational Health and Safety (CCOHS) - a recognized national occupational-health authority, per this sprint's own allowed source classes - directly read via `WebFetch` on 2026-07-17 (`ccohs.ca/oshanswers/ergonomics/niosh/assessing.html`). This page explicitly summarizes and cites the same NIOSH Lifting Equation research this claim originally targeted, and confirms each named risk factor directly: "if the situation requires frequent lifts or lifting loads far away from the body, there is an increased risk of injury" (distance, frequency), plus the equation's own Frequency Multiplier and posture/coupling-dependent Vertical Multiplier factors (posture). **Final claim (verified, source honestly cited as CCOHS's summary of NIOSH's research, not as a direct NIOSH read):** lifting and carrying injury risk rises with load, distance from the body, frequency of lifting, and posture - not from load weight alone. The eventual article's `## Sources` entry must cite CCOHS explicitly (summarizing NIOSH research), not NIOSH directly, since NIOSH's own primary document was never successfully read. |
| D2 | Load-threshold injury risk (qualitative only) | Load carriage physiological review | Body text | **Pass - confirms the fallback itself, not a number** | Source explicitly states "no explicit threshold is identified" and that data is "almost exclusively from military and occupational populations... Civilian data are minimal." This *positively confirms* the Research Plan's own fallback decision: write this claim qualitatively (risk rises with load, no established civilian number) rather than stating any specific percentage. Do not use the "10%/22% of bodyweight" figures found during initial search - now confirmed as unsupported by the one peer-reviewed source that was actually read. |
| D3 | Gradual duration/frequency-before-weight progression | Load carriage physiological review | | **Not addressed by this source** | The review "does not address gradual load progression protocols." **Fallback: lean on the already-confirmed general progression principle (A1) rather than a load-carriage-specific claim.** |
| D4 | Framing synthesis - no independent source required | N/A | N/A | N/A | Confirm only that it accurately reflects Articles 2-3 once drafted. |

---

## Article 5: Recovery and Injury Prevention for Physical Training

**Sources:** ACSM/ECSS Joint Consensus Statement on overtraining
syndrome (Meeusen et al., 2013); companion *ACSM's Health & Fitness
Journal* summary

| # | Planned claim | Priority |
|---|---|---|
| E1 | Recovery (rest, sleep, nutrition/hydration) is a required part of adaptation, not optional | Important |
| E2 | Overtraining/non-functional overreaching is a real, recognized risk of insufficient recovery, with symptoms distinct from normal fatigue | Important |
| E3 | There is a distinction between normal training discomfort and pain signaling injury, though not always sharp | **Critical** - inherently judgment-dependent, highest risk of overstatement in this pack |
| E4 | Certain warning signs during exertion (chest pain, severe shortness of breath, dizziness) warrant stopping and seeking medical evaluation | **Critical** - direct safety-critical instruction |

**Quotation/confirmation/removability:**
- E1: factual confirmation sufficient.
- E2: factual confirmation sufficient for the general principle;
  the specific "125+ signs and symptoms" figure found during research
  should not be reproduced as a specific number unless directly
  confirmed - state generally ("many possible signs and symptoms have
  been documented") rather than citing a specific count that could
  become stale or be misremembered.
- E3: **needs the most conservative possible wording, not close
  quotation of any single source's exact threshold** - per the
  Research Plan's own flag, this must be stated as a general caution
  ("if in doubt, treat it as an injury signal and stop") rather than a
  precise rule, regardless of what any one source says, because a
  false-negative here (telling someone normal soreness that's actually
  an injury) has real consequences.
- E4: **needs close, exact reading against general cardiovascular
  warning-sign guidance** - this is a "call for help" style claim,
  matching this project's own established pattern (Mass Casualty
  pack's Critical claims) of using the most conservative version if
  precise wording can't be pinned down.
- Not removable if unconfirmed: E3 and E4 - both are core safety
  content; if verification cannot achieve precision, keep the
  conservative caution rather than removing it, per this pack line's
  own established precedent (Mass Casualty pack's H2/H4 handling).

**Estimated verification effort:** ~35-50 minutes (consensus statement
may be a long document; E3 and E4 both warrant slow, careful reading
rather than skimming).

### Verification table

| # | Claim | Source | Page/Section | Result | Notes |
|---|---|---|---|---|---|
| E1 | Recovery required for adaptation | ACSM/ECSS Consensus Statement | Abstract | **Pass** | "Successful training must... avoid the combination of excessive overload plus inadequate recovery." Functional overreaching "will eventually lead to an improvement in performance after recovery." |
| E2 | Overtraining is real, recognized, distinct from normal fatigue | ACSM/ECSS Consensus Statement | Abstract | **Pass** | Confirms the three-state distinction (functional overreaching / non-functional overreaching / overtraining syndrome) and lists "fatigue, performance decline, and mood disturbances" plus hormonal/immune changes as recognized signs. |
| E3 | Discomfort-vs-pain distinction (conservative framing) | ACSM/ECSS Consensus Statement; MedlinePlus "Muscle aches" (found and read after the initial pass) | Abstract; full article | **Partially confirmed** | ACSM/ECSS does not address this distinction. MedlinePlus, found independently during this sprint's own quality check, gives a concrete, quotable duration threshold - "muscle pain lasts more than 3 days" - as one of several signs warranting contact with a provider, alongside severe unexplained pain and signs of infection. The article should paraphrase this duration/severity-based threshold rather than presenting a "soreness vs. injury" framing MedlinePlus itself doesn't use in those words - still requires conservative wording (per the original plan) since MedlinePlus's list is for muscle pain generally, not specifically post-exercise soreness. |
| E4 | Warning signs requiring medical evaluation | MedlinePlus "Muscle aches" (found and read after the initial pass) | Full article | **Pass** | Confirms concrete, quotable warning signs: pain lasting more than 3 days, severe unexplained pain, signs of infection (swelling/redness), and emergency-level signs (muscle weakness or inability to move a body part, sudden weight gain/water retention/reduced urination - call 911). This closes the gap the original planning pass could not close: the previously-considered ACSM clinical exercise-testing criteria remain correctly rejected as a claim mismatch (see Verification Pass #1 Results above) - MedlinePlus is a better-matched Tier 1 source for this lay-audience claim. Note: MedlinePlus's warning signs are for muscle pain in general, not exercise-specific cardiovascular symptoms (chest pain, severe shortness of breath) originally envisioned for E4 - the article's claim should be narrowed to match what MedlinePlus actually supports (muscle-pain warning signs) rather than the broader cardiovascular-emergency framing originally planned, which remains unconfirmed and should be omitted or written as general, unattributed safety knowledge if included at all. |

---

## Summary Across All Five Articles

| Article | Critical claims | Important claims | Low-priority claims | Estimated effort |
|---|---|---|---|---|
| 1. Understanding Physical Readiness | 2 (A1, A3) | 1 | 0 | ~30-40 min |
| 2. Strength & Aerobic Endurance | 1 (B3) | 2 | 0 | ~35-45 min |
| 3. Mobility, Balance, Work Capacity | 1 (C3) | 2 | 0 | ~25-35 min |
| 4. Load Carrying & Survival Tasks | 1 (D2) | 2 | 1 (D4) | ~40-55 min |
| 5. Recovery & Injury Prevention | 2 (E3, E4) | 2 | 0 | ~35-50 min |

**Total estimated verification effort: roughly 2.75-3.75 hours** across
7 distinct candidate sources (WHO, CDC ×2 pages, NIOSH, ACSM ×2
documents, one peer-reviewed review, OSHA as supplementary
cross-reference) and 16 planned claims - broadly comparable to the
Mass Casualty pack's effort, with a higher proportion of claims
(D2, E3) flagged for deliberately conservative, non-quantitative
fallback wording rather than exact-quotation targets, reflecting this
domain's greater reliance on general principle over precise numeric
instruction.

**Every Critical claim in this pack shares one property, matching this
pack line's own established precedent:** getting it wrong in the
conservative direction (a vaguer caution, no specific number, "stop and
seek assessment") is always safer than getting it wrong in the
permissive direction (a specific number or threshold that turns out to
be unsupported or misapplied to an individual reader). This principle
should govern every fallback decision during future Writing and
Verification stages - **especially D2 and E3, which this workbook
identifies as the two claims most likely to need their planned
specificity reduced during actual verification.**

## Verification Outcome Summary (Pass #1 + Pass #2, 2026-07-17)

Of 16 planned claims, after Pass #1, its same-day independent
spot-check, and this targeted closure sprint's Pass #2: **12 directly
confirmed or replaced with quotable wording** (A1, A2, A3-replaced,
B1, B2, B3, C1, C3-narrowed, E1, E2, E4, plus D1 and D2's fallback
each independently confirmed), **1 partially confirmed** with a
narrower scope than originally planned (E3 - a concrete duration
threshold exists, but not a "soreness vs. injury" framing in those
words), and **2 confirmed as not addressed by their planned source,
with an explicit conservative fallback already assigned** (C2, D3 -
both instructed to lean on the already-confirmed general
progressive-overload principle, A1, rather than an endurance/load-
specific claim their sources don't actually make). **Zero claims
remain open.** One deliberate rejection is recorded from Pass #1: a
real ACSM source was originally considered for E4 and correctly judged
the wrong claim match, later closed by MedlinePlus instead.

**Independent quality-check spot-check (Pass #1, same day):** per
`QUALITY_STANDARD.md`'s citation discipline, five of Pass #1's claimed
reads were independently re-attempted via fresh `WebFetch` calls
before that pass's report was finalized. Four of five reproduced
exactly or substantively; one (A3's original WHO quotation) did not
and was downgraded - the exact failure this targeted closure sprint
then resolved via a replacement source.

**This pack is now ready for Writing with an honest,
evidence-supported drafting target.** No article should be drafted
directly to `Verified Source` without a final check against the actual
written prose (per this project's standard process - direct source
confirmation of a plan is never the same as confirming the final
sentences), but every one of the 16 planned claims now has either
direct source support, an explicit narrowed/replaced final form, or an
explicit conservative fallback - none remain genuinely open. See the
Research Plan's companion "Pre-Writing Claim Freeze" section for the
full per-claim audit.
