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

---

## Article 1: Understanding Physical Readiness and Progressive Adaptation

**Sources:** WHO 2020 Guidelines on Physical Activity and Sedentary
Behaviour; ACSM Position Stand, "Progression Models in Resistance
Training for Healthy Adults" (2009)

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
| A3 | General professional-consultation caveat | WHO 2020 Guidelines | Executive Summary | **Pass, rewritten** | Actual confirmed wording is more specific than originally planned: WHO states pre-exercise medical clearance is "generally unnecessary" for light/moderate activity without contraindications - the claim should be rewritten to say most people can begin light-to-moderate activity without clearance, while those with existing conditions or planning vigorous activity should check first, rather than a generic blanket caveat. |

---

## Article 2: Building Functional Strength and Aerobic Endurance

**Sources:** WHO 2020 Guidelines; CDC "Adult Activity: An Overview"

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
| B3 | Reduced/gradual rebuilding for older/deconditioned readers | CDC Older Adult Activity | | **Not confirmed this pass** | CDC page blocked (HTTP 403); `restoredcdc.org` mirror attempt also blocked. WHO's general older-adult "start small, gradually increase" language (already used for A2) partially supports a general version of this claim, but not the more specific "restarting after a break/illness" framing originally planned. **Fallback: write this claim as the same general gradual-start principle already confirmed for A2, not a more specific restart-after-break claim, unless a working CDC source is found in a future pass.** |

---

## Article 3: Mobility, Balance, and Sustained Work Capacity

**Sources:** CDC "Older Adult Activity" and "What Counts as Physical
Activity for Older Adults"; ACSM progression-principle material

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
| C3 | Alternative activities for mobility limitations | CDC What Counts (Older Adults) | | **Not confirmed this pass** | CDC page blocked (HTTP 403). No substitute source was found in this pass. **This is the pack's least-supported planned claim; write conservatively and generally (e.g., "some activity is possible and valuable even with limitations, and any activity is better than none") without attributing specific phrasing to an unread source, or seek a substitute Tier 1/2 source in a future pass.** |

---

## Article 4: Load Carrying and Physically-Loaded Survival Tasks

**Sources:** NIOSH, "Ergonomic Guidelines for Manual Material
Handling"; peer-reviewed review, "Physiological impact of load
carriage exercise"

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
| D1 | Lifting/carrying risk factors beyond load alone | NIOSH Manual Material Handling | | **Not confirmed this pass** | NIOSH PDF blocked (HTTP 403, same `cdc.gov` domain block as the CDC pages). An OSHA lifting/carrying sub-page was also attempted at a guessed URL and returned HTTP 404 - a wrong path, not a confirmed absence of OSHA content; worth a corrected re-attempt. **This is the pack's most significant remaining sourcing gap.** |
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
| E3 | Discomfort-vs-pain distinction (conservative framing) | ACSM/ECSS Consensus Statement | Abstract | **Not directly confirmed** | The abstract discusses fatigue/performance/mood symptoms, not a specific pain-vs-normal-discomfort framework. **Fallback required exactly as planned: write this claim in general, cautious terms ("if in doubt, treat it as an injury signal and stop") without attributing a precise boundary to this or any source.** |
| E4 | Cardiovascular warning signs requiring medical evaluation | Not yet pinned to a primary source | | **Not confirmed this pass** | A widely corroborated lay-public list (chest pain, severe shortness of breath, dizziness/faintness, new confusion, sudden sweating/pallor) was found but traced to secondary health-content sites, not a directly read primary source. A genuinely different ACSM source (clinical exercise-*testing* termination criteria - ECG/blood-pressure-based) was found and **deliberately rejected as a claim mismatch**: it requires monitoring equipment this pack's reader won't have and is written for supervised clinical testing, not unsupervised lay training - using it would misattribute a real source to a claim it doesn't actually support for this audience. **This claim needs either a corrected search for a genuine lay-public primary source (CDC/AHA), or must be written as general safety knowledge without a specific citation, in a future pass.** |

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

## Verification Pass #1 — Outcome Summary (2026-07-17)

Of 16 planned claims: **9 directly confirmed** with quotable wording
(A1, A2, A3, B1, B2, C1, E1, E2, plus D2's fallback itself positively
confirmed), **3 confirmed as not addressed by their planned source**
(C2, D3, E3 - meaning the source was actually read, and honestly does
not support that specific claim, which is different from and more
useful than "not yet checked"), and **4 remain genuinely unread or
unconfirmed** (B3, C3, D1, E4), each blocked by a specific, named
access failure or an as-yet-unfound primary source rather than by lack
of effort. One deliberate rejection is recorded: a real ACSM source
was found for E4 and correctly judged the wrong claim match (clinical
testing criteria, not lay training guidance) rather than force-fit.

**This pack is not ready for Writing to begin with the expectation of
`Verified Source` status.** A realistic path forward: draft all five
articles now at `Unverified`/`Community Verified` as appropriate,
writing every flagged claim to its stated conservative fallback where
verification is incomplete, then run a second Human Source
Verification pass specifically targeting the four open gaps (B3, C3,
D1, E4) before requesting Editorial Review - mirroring this pack
line's own Mass Casualty precedent, where Editorial Review preceded
final Human Source Verification and multiple passes were normal, not
exceptional.
