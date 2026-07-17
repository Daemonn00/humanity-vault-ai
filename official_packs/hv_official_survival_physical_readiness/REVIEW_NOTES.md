# Review Notes — Survival Physical Readiness (v1.0.0)

Created from `editorial_review_template/05_PACK_REVIEW_REPORT_TEMPLATE.md`.
**This is editorial source content only. It is not yet a distributable
ZIP and not yet approved for publication.**

**Stage clarity, stated plainly per this sprint's explicit instruction:**
this document distinguishes four separate things that must never be
conflated:

1. **Pre-writing source verification** (`survival_physical_readiness_
   HUMAN_VERIFICATION_WORKBOOK.md`, Passes #1-#2) - real, directly-read
   sources confirming the *planned* claim wording, before any article
   existed.
2. **Editorial Review of final prose** (this document, this sprint) -
   checks the actual drafted sentences for structure, tone, internal
   consistency, traceability to the frozen claim set, and safety
   framing. It does **not** re-confirm exact wording against sources.
3. **Future Human Source Verification of final prose** (not yet
   performed) - the still-outstanding step that must check the actual
   published-intent sentences, word for word, against directly-read
   sources before any article's `verification_level` can be upgraded.
4. **Publication approval** (not yet performed, and not authorized by
   this sprint) - a separate Founder decision, per this pack's own
   `pack_production_workflow/` process precedent.

Pre-writing verification is **evidence available to this review** - it
is not automatic verification of the newly written prose, and this
document does not treat it as such anywhere below.

## Editorial Review Checklist

Per `editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md`.

**A. Identity and structure**
- [x] `pack_id` (`hv_official_survival_physical_readiness`) uses the
      `hv_official_` prefix.
- [x] `pack_id` not already used elsewhere in `official_packs/`.
- [x] `pack_version` (`1.0.0`) is well-formed semver.
- [x] Every article's `category` (`Survival`, all five) is a valid
      display name.
- [x] No article slug collides with a core-corpus slug or another
      article in this pack - all five use the `spr_` prefix; checked
      individually against the 31 core-corpus slugs and every existing
      official pack's slugs.
- [x] Every article has exactly the four required `##` sections,
      correctly spelled, in order.

**B. Tone and register**
- [x] Consistent calm, plain, field-manual register across all five
      articles - no fitness-industry hype phrases found on direct
      re-read (checked specifically for "unlock your potential,"
      "elite," "warrior fitness," "push through the pain," "no
      excuses," and equivalents - none present).
- [x] No article implies official endorsement by any cited agency
      beyond citing them as a source.

**C. Source-attribution discipline**
- [x] **Reviewed, not yet fully closed.** Every claim in every article
      traces to either the frozen pre-writing claim set or a clearly
      editorial/synthesis statement requiring no source - see the
      Claim-Set Traceability Audit below. Two minor unsupported
      details (not present in the frozen set) were found during this
      review and removed (see Fixes Applied). No claim is presented as
      "verified" - all five articles honestly remain `Unverified`.

**D. Safety and scope boundaries**
- [x] Every article with a safety-relevant claim states it plainly,
      with an explicit caveat about its own limits (A3's
      healthcare-provider boundary; D2's explicit refusal to state a
      universal load number; E3/E4's stop-and-seek-care guidance).
- [x] Every article frames field/practical knowledge as reducing risk
      while building capability over time, never as a substitute for
      the physical practice, medical evaluation, or emergency
      treatment it consistently cross-links to instead of duplicating.
- [x] No tactical, weapon-making, trap-making, or evasion content
      anywhere in the pack.
- [x] No safety guarantee language found ("this will..." absolute
      claims) - checked directly, none present.

**E. Verification level integrity**
- [x] All five articles correctly read `verification_level: Unverified`
      - none upgraded, per this sprint's explicit mandate. No article's
      Claim-to-Source Map row reads `Yes` for "Directly verified" at
      the final-prose level (see below), so no article could honestly
      support a higher status yet regardless.

## Source Access Log (pre-writing reads, referenced not re-performed)

*(This sprint performed no new source reads. The sources below are
summarized from `survival_physical_readiness_SOURCE_COLLECTION.md`
and `..._HUMAN_VERIFICATION_WORKBOOK.md`, which remain the canonical,
detailed record - see those files for exact URLs, dates, and quoted
text.)*

| Source | Tier | Pre-writing status |
|---|---|---|
| WHO, Guidelines on Physical Activity and Sedentary Behaviour (2020) | 1 | Directly read (NCBI Bookshelf), multiple passes |
| ACSM, "Progression Models in Resistance Training for Healthy Adults" (2009) | 1 | Directly read (via a PDF mirror - see Source Collection's honesty note on citing the mirror, not ACSM/journal, if ever quoted verbatim) |
| ACSM/ECSS, Joint Consensus Statement on overtraining syndrome (2013) | 1 | Directly read (PubMed abstract only, not the full statement) |
| MedlinePlus, "Exercise and Physical Fitness" | 1 | Directly read |
| MedlinePlus, "Exercise for Older Adults" | 1 | Directly read |
| MedlinePlus, "Muscle aches" | 1 | Directly read |
| CCOHS, "NIOSH Lifting Equation - Assessing Relevant Handling Factors" | 1 | Directly read |
| Peer-reviewed review, "Physiological impact of load carriage exercise" (PMC) | 2 | Directly read |
| CDC (multiple pages); NIOSH primary PDF; NIA (2 pages) | 1 | **Blocked across every attempt** (HTTP 403/405) - never directly read, never cited in any article's public `## Sources` section (confirmed below) |

## Claim-Set Traceability Audit

Every meaningful factual claim in the final drafted prose, checked
against the frozen 16-claim pre-writing baseline. Classification:
**A** = directly traceable/near-verbatim, **B** = conservative
paraphrase, **C** = editorial explanation/synthesis needing no
independent source, **D** = a genuinely new factual claim.

| Article | Claim | Frozen ID | Class | Notes |
|---|---|---|---|---|
| 1 | Definitional framing of physical readiness | - | C | Editorial framing, no source needed |
| 1 | Adaptation requires practice, not reading | A1 | B | Matches ACSM + Canon Section 11 framing |
| 1 | "Start low, go slow," gradual increase | A2 | B | Close paraphrase of WHO's exact confirmed wording |
| 1 | Extends gradual-progression to "a new kind of physical task" | A2 | C | Reasonable low-stakes generalization, not independently sourced - **flagged, not fixed** (see Findings, Low-1) |
| 1 | Healthcare-provider boundary | A3 | B | Matches resolved A3 (MedlinePlus) closely |
| 1 | Functional framework (move/carry/lift/...) | - | C | Explicitly disclaimed as organizing lens, not a formal model - matches instruction exactly |
| 2 | Aerobic/strength definitions, illustrative examples | - | C | Explicitly illustrative, not prescriptive |
| 2 | 150-300 min moderate / 75-150 min vigorous; strength 2+ days/week, major muscle groups | B1, B2 | A | Near-verbatim WHO figures |
| 2 | Start slowly, work up if inactive/returning | B3 | B | Matches MedlinePlus's confirmed quote |
| 2 | No invented reps/sets/schedule | - | C | Correctly conservative disclaimer |
| 3 | Balance activity reduces fall risk, maintains functional capacity | C1 | B | Paraphrase omits WHO's specific frequency/intensity figure - **see Article 3 C1 Decision, below** |
| 3 | Falls are a serious risk when infrastructure/medical access is disrupted | - | C | Project-wide contextual framing (consistent with the Charter's own premise), not independently sourced - **flagged, not fixed** (see Findings, Low-2) |
| 3 | Sustained work capacity develops with practice, leaning on A1 | C2 | B | Correctly generic per C2's fallback |
| 3 | Scale activity to functional ability; some is better than none | C3 | B | Matches narrowed WHO quote; population-context precision (older-adult-sourced, presented generally) noted - **see Findings, Medium-1** |
| 4 | Risk factors beyond weight: distance, frequency, posture | D1 | A | Matches CCOHS content directly |
| 4 | No universal safe weight; scale to individual capacity, add gradually | D2 | B | Matches confirmed qualitative fallback |
| 4 | Progress duration/frequency before weight, leaning on A1 | D3 | B | Correctly generic |
| 4 | Recovery between carrying sessions reduces injury risk | E1 (cross-applied) | B | Reasonable application of E1's already-confirmed general recovery principle to this article's context |
| 4 | Survival tasks draw on Articles 2-3 capacities | D4 | C | Synthesis, as planned |
| 4 | "Popping sensation" as an injury sign | - | **D (found, removed)** | Not in the frozen set or MedlinePlus's confirmed content - **fixed this sprint, see Fixes Applied** |
| 5 | Recovery required, balances demand | E1 | A | Near-verbatim ACSM/ECSS |
| 5 | Overtraining real, distinct from normal fatigue | E2 | B | Matches confirmed content |
| 5 | "Settling after a rest day or two" | - | **D (found, softened)** | Unconfirmed specific timeframe - **fixed this sprint, see Fixes Applied** |
| 5 | Muscle-pain warning signs (duration, severity, infection, weakness, weight/urination changes) | E3, E4 | A | Near-verbatim MedlinePlus content |
| 5 | Cross-links to existing emergency content instead of duplicating | - | C | Correctly deflects rather than re-teaches |
| Manifest | Knowledge-vs-capability framing | - | C | Canon-aligned, no factual claim |

**Result: 2 genuinely new factual claims found, both minor and both
fixed during this review by narrowing (removed or softened) rather
than left as findings requiring future research - see Fixes Applied.
No Critical or High-severity new claim was found.**

## Reviewer Sign-offs

- **Reviewer name/handle:** Claude (AI agent)
- **Date:** 2026-07-17
- **Scope of this review:**
  - Articles reviewed: all five, plus `manifest.md`.
  - Claims reviewed: the complete Claim-Set Traceability Audit above -
    every meaningful factual statement in the final prose.
  - Sources personally opened and read as part of *this* review: none
    - per this sprint's explicit scope, no new source verification was
      performed; the Source Access Log above summarizes prior reads
      from the Human Verification Workbook.
- **Findings:**
  - [x] Issues found - listed in the Editorial Findings section below,
        with resolution status.
- **Statement:**
  > I confirm this review checked every claim in the final drafted
  > prose for traceability to the frozen pre-writing claim set, tone,
  > structure, and safety framing. I did **not** personally verify any
  > claim's exact wording against a directly-read source during this
  > pass - that remains the scope of the future Human Source
  > Verification sprint, and no claim in the table above is marked as
  > "Directly verified: Yes" as a result.
- **Signed:** Claude (AI agent), 2026-07-17

## Editorial Findings

### Critical
None found.

### High
None found.

### Medium

**Medium-1 - Article 3's C1 and C3 claims generalize WHO guidance
that is specifically scoped to older adults in the source, presented
in the article as advice for a general audience.**
- Affected file: `spr_mobility_balance_and_sustained_work_capacity.md`
- Explanation: WHO's confirmed balance-activity quote ("Older adults
  should do varied multicomponent physical activity...") and the
  confirmed functional-ability quote ("Older adults should be as
  physically active as their functional ability allows...") are both
  drawn from WHO's older-adult-specific guidance section, but the
  article presents both as general principles for any reader. The
  "some activity is better than none" component is independently
  confirmed as genuinely general across WHO's guidance (not
  age-restricted), which partially supports the general framing, but
  the "scale effort to functional ability" and balance-frequency
  language are not confirmed as general-population statements.
- Recommended fix: at the Human Source Verification stage, either (a)
  locate a general-population (not age-restricted) WHO or equivalent
  statement supporting the same principle, or (b) narrow the article's
  language to note this guidance is drawn from age-related research
  but reasonably extends to functional-limitation contexts generally.
  Not fixed in this sprint - doing so without further source work
  would either overstate or understate what's actually confirmed.

### Low

**Low-1 - Article 1 extends the confirmed gradual-progression
principle to "a new kind of physical task you haven't done before,"
a scope slightly broader than the source's literal text.**
- Affected file:
  `spr_understanding_physical_readiness_and_progressive_adaptation.md`
- Explanation: WHO's confirmed quote concerns starting or resuming
  general physical activity, not explicitly "new kinds of tasks." The
  extension is low-stakes and consistent with the same general
  principle, but is not itself independently sourced.
- Recommended fix: none required - this is common-sense, uncontroversial
  generalization of an already-confirmed principle, acceptable as
  general practical knowledge per `QUALITY_STANDARD.md`. Recorded for
  transparency only.

**Low-2 - Article 3 asserts that fall injuries are harder to treat in
a survival/disrupted-infrastructure context, without independent
sourcing.**
- Affected file: `spr_mobility_balance_and_sustained_work_capacity.md`
- Explanation: This restates this project's own foundational premise
  (medical care is harder to access when infrastructure is
  unavailable) rather than introducing a new empirical claim - similar
  contextual framing appears throughout this project's existing
  content without independent citation.
- Recommended fix: none required. Recorded for transparency only.

## Article 3 — C1 Special Review Decision

Per this sprint's explicit instruction to decide, and record the
reasoning for, whether to add WHO's specific confirmed detail ("on 3
or more days a week, moderate or greater intensity") to Article 3's
balance-activity claim.

**Decision: Option C - do not add the number.** Adding it would import
a second population-context ambiguity (the same issue flagged as
Medium-1 above) while making the article read as a more specific
prescription than this pack's frozen evidence actually supports for a
general audience. The existing broader wording ("varied activity that
emphasizes functional balance and strength together, done regularly,
reduces the risk of a fall") is accurate to the underlying principle
and does not overclaim a specific frequency/intensity target. This is
judged sufficient (Option A's reasoning applies once Option B is
rejected) rather than a gap requiring remediation.

## Article 4 — Heightened Audit Result

Performed directly against the task's specific checklist:

- **Implies a universal safe load?** No - the article explicitly and
  repeatedly states there is no single safe weight number.
- **Weight presented as the sole risk factor?** No - distance,
  frequency, and posture are stated as combining with weight, and the
  article explicitly opens by naming and rejecting the "weight alone"
  assumption.
- **CCOHS represented honestly?** Yes - named explicitly in `##
  Sources`, correctly described as summarizing NIOSH's research.
- **NIOSH accidentally represented as directly read?** No - NIOSH is
  not named anywhere in the article's public `## Sources` section;
  only CCOHS appears.
- **Progression language becomes an unsupported prescription?** No -
  "increasing how long or how often... before increasing how heavy"
  stays general, with no specific schedule, matching D3's fallback.
- **Posture advice exceeds the confirmed source?** No - "awkward or
  bent position" vs. "good posture" matches CCOHS's own
  posture/coupling-dependent risk factors without adding unconfirmed
  technique specifics.
- **Stop/seek-care guidance introduces unsupported medical
  instructions?** One instance found and fixed this sprint - see Fixes
  Applied ("a popping sensation" removed, not independently sourced).
- **Rejected bodyweight-percentage threshold reintroduced?** No -
  confirmed absent by direct re-read; no percentage figure of any kind
  appears anywhere in the article.

**Result: clean after one fix applied this sprint.**

## Fixes Applied During Review

1. **Article 4** - removed "a popping sensation" from the
   stop-activity warning sentence. Not part of the frozen claim set or
   MedlinePlus's confirmed content; "sudden sharp pain or a suspected
   injury" already covers the practical case without the unsourced
   detail.
2. **Article 5** - softened "settling after a rest day or two" to
   "settling with rest," removing an unconfirmed specific timeframe
   while preserving the sentence's actual guidance (this is a safe
   narrowing, not a content change - the underlying instruction to
   reduce demand and prioritize recovery is unchanged).

No other article text was changed. No frontmatter field was changed.
No `verification_level` was changed. No source was added or removed
from any `## Sources` list.

## Visual Comprehension Audit (Future Visual Knowledge Engine Opportunities)

Not implemented - recorded only, per this sprint's explicit scope.

| Concept | Classification | Reasoning |
|---|---|---|
| Load close to body vs. held farther away (Article 4) | **Visual strongly recommended** | A spatial/comparative relationship exactly matching the Canon's own identified gap between text and procedural understanding - a single comparison image would likely convey this faster and more reliably than prose alone. |
| Safer vs. awkward lifting posture (Article 4) | **Visual strongly recommended** | Same reasoning - posture is inherently spatial; text can describe it but a reader benefits from seeing the difference directly. |
| Balance practice concepts (Article 3) | **Visual helpful** | Balance itself cannot be conveyed by any image (it is felt, not seen), but a simple illustration of a balance exercise could help ground the concept for a reader with no prior exposure - genuinely helpful, not strongly necessary, since the article's text does not depend on demonstrating a specific exercise. |
| The move/carry/lift/push-pull/climb/sustain/recover framework (Article 1) | **Text sufficient** | This is an organizational/conceptual framework, not a spatial or procedural relationship - a simple list already conveys it clearly; a diagram would be decorative rather than clarifying. |

## Verification Level: Per-Article Status

| Article | Current `verification_level` | Why |
|---|---|---|
| `spr_understanding_physical_readiness_and_progressive_adaptation` | Unverified | Final prose not yet checked word-for-word against sources (Human Source Verification pending) |
| `spr_building_functional_strength_and_aerobic_endurance` | Unverified | Same |
| `spr_mobility_balance_and_sustained_work_capacity` | Unverified | Same; also carries Medium-1's open population-context question |
| `spr_load_carrying_and_physically_loaded_survival_tasks` | Unverified | Same |
| `spr_recovery_and_injury_prevention_for_physical_training` | Unverified | Same |

## Manifest Review Result

Reviewed as public-facing content. `pack_id`, `pack_name`,
`pack_version` (1.0.0) all correct. `description` accurately frames
the pack's five-article scope. Body text is durable, Canon-aligned
public description with no temporary sprint/project-management
language, no false publication claim, no false verification claim, and
no publication-workflow state (that remains correctly confined to this
document). No changes needed.

## Publication Decision

- **Pack:** `hv_official_survival_physical_readiness`
- **Version under decision:** 1.0.0
- **Decision:** **NOT YET APPROVED.** One or more claims are not yet
  verified against final prose; nothing in this pack may be packaged
  or released.
- **Decided by:** Claude (AI agent).
- **Date:** 2026-07-17.
- **What this decision does not authorize:** No ZIP may be built from
  this folder, no checksum computed, no marketplace listing created,
  and this pack must not be described as official, released, or
  published anywhere.

## Version Review History

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| 1.0.0 | 2026-07-17 | Initial authoring (Writing sprint) and first Editorial Review (this document): 2 minor unsupported details found and fixed by narrowing; 1 Medium population-context finding recorded, unresolved; 2 Low findings recorded, no fix needed | Editorial Review complete; 0 Critical, 0 High, 1 Medium, 2 Low findings; all 5 articles remain `Unverified` | Claude (AI agent) | Not Yet Approved |

## Status

Editorial Review is complete. Two genuinely new factual claims
introduced during drafting were found and removed/narrowed; both were
minor and neither involved a dangerous overclaim. One Medium finding
(Article 3's population-context precision) remains open and is
recorded for the Human Source Verification stage to resolve with
further source work, not guessed at now. All five articles correctly
remain `Unverified` - none were upgraded, and none currently qualify
for an upgrade, since final prose has not yet been checked word-for-
word against directly-read sources. Publication Decision is **Not Yet
Approved**. The pack is judged **ready to proceed to Human Source
Verification** of the actual final article text.
