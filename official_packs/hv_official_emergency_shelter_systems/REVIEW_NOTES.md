# Review Notes - Emergency Shelter Systems (v1.0.0)

**This is editorial source content only. It is not yet a distributable
ZIP and not yet approved for publication until the Publication
Decision section below says otherwise.**

This is the pack's first Editorial Review, performed against the
actual final draft prose in
`official_packs/hv_official_emergency_shelter_systems/`, not merely
against the pre-writing Research Plan, Source Collection, Human
Verification Workbook, or Founder Confirmation Packet (all re-read
fresh this pass as background, not as a substitute for reading the
shipped sentences themselves).

**This sprint performs Editorial Review only.** It is explicitly
distinct from, and does not substitute for, formal post-drafting
Human/AI-agent Source Verification (a separate, later stage) or a
Founder Publication Decision (later still). Traceability confirmed in
this review is not the same as verification - see "Why
`verification_level` stays `Unverified`" near the end of this
document.

## Editorial Review Checklist

*(Per `editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md`.)*

**A. Identity and structure**
- [x] `pack_id` (`hv_official_emergency_shelter_systems`) uses the
      `hv_official_` prefix.
- [x] `pack_id` is not already used elsewhere in `official_packs/`.
- [x] `pack_version` (`1.0.0`) is well-formed semver.
- [x] Every article's `category` (Survival ×3, Construction ×1) is a
      valid display name.
- [x] No article slug collides with the core corpus (checked directly
      against `registry_generator/lib/src/validation.dart`'s 31-slug
      snapshot - all four `ess_`-prefixed slugs are unique) or another
      article in this pack.

**B. Tone and register** - [x] Consistent calm, plain, field-manual
register across all four articles; no marketing or alarmist language.

**C. Source-attribution discipline** - [x] Every non-obvious claim is
either attributed to a directly-read source or written as general
knowledge - see the Claim-to-Source Map below. Two minor overreach
issues were found and fixed this pass (Section "Fixes Applied During
Review").

**D. Safety and scope boundaries** - see "Anchoring/Structural-Safety
Audit" and "Article 3 Heightened Safety Audit" below.

**E. Verification level integrity** - [x] All four articles read
`verification_level: Unverified`. Correct - Founder pre-writing
confirmation of 5 claims is not the same as verifying the final prose,
and formal post-drafting Source Verification has not been performed
(explicitly out of scope this sprint).

## Article Architecture Audit

The former standalone "Anchoring, Wind, and Weather Resistance"
article was folded into "Tarps, Tents, and Rapidly-Deployable Shelter
Forms" during Writing. Re-examined against the actual final prose,
not just the Writing-stage rationale:

- **Flows naturally:** yes - the folded section opens with "Weather
  resistance is a real limitation, not just a comfort issue,"
  directly continuing from the immediately preceding shelter-type
  comparison paragraph, which already raises tent wind/snow
  vulnerability. The transition reads as a continuation, not a
  bolt-on.
- **Duplicates earlier sections:** no - it expands on, rather than
  repeats, the shelter-type comparison's brief "unstable in high
  winds/snow" note.
- **Feels artificially appended:** no.
- **Article has become too broad:** no - the article's single
  coherent theme ("what shelter forms are and how they compare,
  including their weather performance") still holds; space standards,
  shelter-type comparison, design principles, and weather resistance
  are all facets of the same question.
- **Narrow anchoring boundary remains clear:** yes, after one fix (see
  below) - the article explicitly states no universal technique
  exists and defers to manufacturer/expert guidance.
- **Unsupported detail added to pad the folded section:** **one
  instance found and fixed** - see below.

**Result: the fold works in the actual final prose. Reverting to a
5th standalone article is not recommended** - it would not improve
the pack, and Article 3 (now Article 2) is not "too short" in a way
that suggests missing coverage; it is exactly as long as its
genuinely-supported content warrants.

## Claim-to-Source Map

Built fresh this pass by reading all 4 final articles end to end and
tracing every meaningful factual claim, operational instruction, and
quantitative value back to its claim ID and source. All 27 frozen
active claims were found intact in the final prose - none dropped,
none expanded beyond its confirmed/verified boundary after the two
fixes applied this pass. Several editorial-synthesis sentences were
also identified (noted in the Notes column) - reasonable elaborations
that introduce no new number or contradict nothing, not treated as new
factual claims requiring separate sourcing.

| Claim | Article | Final prose location | Represented? | Within frozen boundary? | Stage 6 re-verification needed? | Notes |
|---|---|---|---|---|---|---|
| A1 | 1 | "A site's slope matters..." paragraph | Yes | Yes | Yes (standard) | Traced exactly; "planning target" framing preserved |
| A2 | 1 | Same paragraph, groundwater sentence | Yes | Yes | Yes | Traced exactly |
| A3 | 1 | "Planning space for a group..." paragraph | Yes | Yes | Yes | Traced exactly; explicit "not guarantees... not a hard rule" caveat present |
| A4 | 1 | "Spacing between shelters..." paragraph | Yes | Yes | Yes | Traced exactly; cross-refs Article 3 for fire context |
| A5 | 1 | "A settlement also needs to be sited..." paragraph | Yes | Yes | Yes | Traced exactly; explicit settlement-vs-individual-household distinction present (see Humanitarian Planning Target Audit) |
| A6 | 1 | "Protecting a shared water source..." paragraph | Yes | Yes | N/A - editorial generalization | Cross-links `basic_shelter_construction.md` correctly |
| A7 | 1 | "Beyond the site itself..." paragraph | Yes | Yes | Yes | Cross-links Water Treatment at Scale and sanitation article correctly |
| B1 | 2 | "Minimum covered living space..." paragraph | Yes | Yes | Yes | Traced exactly |
| B2 | 2 | Same paragraph | Yes | Yes | Yes | Traced exactly |
| B3 | 2 | "Several shelter-form options exist..." paragraph | Yes | Yes | Yes | Traced exactly, tradeoffs framing preserved |
| B4 | 2 | Same paragraph ("tents... unstable in high winds or snow") | Yes | Yes | Yes | Traced exactly |
| B5 | 2 | "A few design principles apply..." paragraph | Yes | Yes | Yes | Traced exactly |
| B6 | 2 | "This pack's shelter forms are distinct..." paragraph | Yes | Yes | N/A - cross-link | Correctly distinguishes from `basic_shelter_construction.md` |
| C1 | 2 (folded) | "Weather resistance is a real limitation..." paragraph | Yes | Yes | Yes | Traced exactly - qualitative, no figure |
| C2 (replaced) | 2 (folded) | Same paragraph, anchoring sentences | Yes | Yes, **after this pass's fix** | N/A - general knowledge | **Fixed this pass**: removed unconfirmed ground-type examples (sand/soil/rock) not part of the confirmed boundary - see Fixes Applied |
| D1 | 3 | "Fuel-burning devices must never be used indoors" paragraph | Yes | Yes | Yes (§9.3-analogous, already Founder-confirmed) | One added explanatory clause traced to the same USFA source; general-knowledge CO properties statement acceptable |
| D2 | 3 | "Generators specifically need to be kept well away..." paragraph | Yes | Yes | Yes (Founder-confirmed) | One added sentence is editorial synthesis (reinforces, doesn't expand) |
| D3 | 3 | "Carbon monoxide alarms are a last line of defense..." paragraph | Yes | Yes | Yes (Founder-confirmed) | Same - added sentence is synthesis |
| D4 | 3 | "A vented fireplace or wood stove..." paragraph | Yes | Yes | Yes (Founder-confirmed) | All 5 precautions present together, matches exactly |
| D5 | 3 | "A battery or solar-powered alternative..." paragraph | Yes | Yes | Yes (standard) | Traced exactly |
| D6 | 3 | "Space heaters need their own clearance..." paragraph | Yes | Yes, **after this pass's fix** | Yes (Founder-confirmed) | **Fixed this pass**: removed an unsupported causal claim about ovens and CO/fire risk not stated by the source - see Fixes Applied |
| D7 | 3 | "Planning ahead reduces how much heating is needed..." paragraph | Yes | Yes | Yes | Traced exactly, explicit "not a guarantee" caveat present |
| D8 | 3 | "Fire risk isn't only about individual devices..." paragraph | Yes | Yes | N/A - cross-reference | Correctly cross-references Article 1 rather than restating |
| E1 | 4 | "Shelter and settlement responses take several different forms..." paragraph | Yes | Yes | Yes (title-scope only) | Correctly states typologies exist and are named thus; does not describe any typology's specific operational content |
| E4 | 4 | "The same planning ratios..." paragraph | Yes | Yes | N/A - cross-reference | Correctly cross-references Article 1 |
| E5 | 4 | "A few design principles matter just as much..." paragraph | Yes | Yes | N/A - cross-reference | Correctly cross-references Article 2 |
| E6 | 4 | "Shelter responses are generally understood as a progression..." paragraph | Yes | Yes | Yes | Traced exactly |

**Confirmed explicitly:**
- All 27 active claims remain represented where appropriate.
- **C3 remains removed** - no foundation/drainage/erosion claim
  appears anywhere in the final prose; the concern is correctly left
  to Article 1's A1-A2.
- **C4 remains out of scope** - no structural load figure (kg/m²,
  kPa, or otherwise) appears anywhere.
- No removed or rejected claim returned.
- No new *operational* claim entered through examples, transitions,
  warnings, or explanatory prose - two instances of prose that drifted
  slightly beyond their confirmed boundary were found and corrected
  (not merely noted) this pass, per the "safe editorial fix" authority
  this sprint was given.

**Total meaningful final-prose claims identified: 27 frozen claims +
approximately 6 editorial-synthesis sentences** (reinforcing
statements in Article 3's D1-D4 paragraphs, and the CO-properties
sentence) that introduce no new number, fact, or instruction and are
not treated as new claims requiring their own sourcing.

## Anchoring/Structural-Safety Audit

Every sentence discussing anchoring, stakes, guy lines, wind
resistance, snow, structural stability, shelter failure, or ground
conditions was read individually (all located in Article 2's folded
section).

- **No universal guy-line angle, stake angle, stake depth, anchor
  spacing, anchoring hardware, wind-speed limit, snow-load limit,
  structural load calculation, or generic structural guarantee was
  found** - confirmed clean.
- **One issue found and fixed:** the original text named specific
  ground-type examples ("loose sand, hard-packed soil, and rocky
  ground all call for different approaches") that were not part of
  the confirmed C2 boundary. While the sentence stopped short of
  prescribing a specific technique per ground type, naming them
  created a procedural implication - a reader could reasonably infer
  Humanity Vault had assessed anchoring needs per ground type, which
  it has not. **Fixed**: the examples were removed, leaving "the
  ground conditions it's set up on" as a general phrase with no
  implied per-type guidance.
- The retained text correctly preserves the verified boundary exactly:
  inadequate anchoring increases vulnerability; the correct method
  depends on shelter design and ground conditions; manufacturer or
  qualified guidance should be followed instead of a Humanity-Vault-
  authored universal technique.
- No accidental procedural implication remains after the fix.

## Article 3 Heightened Safety Audit

*(Article numbering note: this is the pack's 3rd final article,
"Thermal Management, Ventilation, and Fire Safety in Shelter Systems"
- the same article the task instructions refer to as "Article 3.")*

Every statement involving fuel-burning devices, generators, carbon
monoxide, CO alarms, fireplaces, wood stoves, space heaters,
ventilation, combustible materials, fire separation, and heater
clearance was individually compared against the Founder-confirmed
drafting boundaries for D1, D2, D3, D4, and D6.

- **D1:** stays within its confirmed boundary. The one added
  explanatory clause (CO is colorless/odorless; poisoning can occur
  "whether or not it seems to be working normally") traces to the
  same USFA source already confirmed for D1 and to uncontroversial
  general knowledge about CO's physical properties - not a new,
  separately-sourced claim.
- **D2:** stays within its confirmed boundary (the "house"→"shelter"
  substitution is the same generalization the Founder was asked to
  and did verify). The added sentence about "even a short distance
  from an opening" is editorial emphasis, not a new distance figure -
  no number was introduced.
- **D3:** stays within its confirmed boundary (same generalization).
  The added sentence warning against treating an alarm as permission
  to violate D1/D2 is editorial synthesis reinforcing, not expanding,
  the rule.
- **D4:** stays within its confirmed boundary - all five precautions
  present together, none dropped, none presented as optional.
- **D6:** **one issue found and fixed.** The original text added,
  beyond the confirmed boundary, a causal claim that ovens "are not
  designed for sustained heating use and add to the carbon-monoxide
  and fire risks already described above." The source (USFA) states
  only "never use an oven to heat your home," with no stated
  mechanism. Critically, **not all ovens are gas-fueled** - an
  electric oven carries no carbon monoxide risk at all, only
  electrical/fire risk from unintended sustained use, so asserting a
  CO-risk mechanism for "an oven" generally overstates what the
  source supports and could mislead a reader with an electric oven
  into over- or under-weighting the actual risk. **Fixed**: the
  causal clause was removed; the article now states the categorical
  rule ("never use an oven to try to heat a shelter") exactly as
  confirmed, with no invented mechanism.
- **D6's 3-foot figure specifically:** unit preserved exactly ("3
  feet," no metric conversion introduced, avoiding a second unsourced
  number); source context preserved (space heaters, fireplaces, wood
  stoves, radiators, candles - the same list as the source); no
  implication that 3 feet overrides a manufacturer's own greater
  clearance requirement - the article does not claim this figure is
  the maximum possible or sufficient for every device, only states it
  as the sourced general figure.
- **No equipment category was collapsed into another** - fuel-burning
  devices, generators, CO alarms, vented fireplaces, and space heaters
  each have their own clearly separated paragraph with its own bolded
  lead sentence.
- **No new CO exposure threshold (ppm or otherwise) or poisoning
  symptom was introduced anywhere.**
- **No CO poisoning treatment or hypothermia/heatstroke treatment was
  included** - both correctly cross-link to
  `mcfa_hypothermia_and_heatstroke_field_response.md` instead.

**No case was found requiring a Stage 6 flag instead of a direct fix**
- both issues found were mechanical overreach (unconfirmed elaboration
beyond a source), correctable by removal without creating a new claim,
exactly the kind of fix this sprint's authority permits.

## Founder-Confirmed D1/D2/D3/D4/D6 Boundary Audit

See "Article 3 Heightened Safety Audit" above for the full claim-by-
claim comparison. **Summary: 3 of 5 (D1, D2, D3) matched their
confirmed boundary exactly with only additive editorial synthesis; 1
of 5 (D4) matched exactly; 1 of 5 (D6) required a fix to remove an
unconfirmed causal claim, now corrected.** None expanded equipment
scope, weakened a categorical prohibition, converted a contextual rule
into a universal one, or introduced a new number.

## Full Numeric-Claim Audit

| Number | Unit | Article | Context | Claim ID | Source | Qualifiers preserved? |
|---|---|---|---|---|---|---|
| 2-4 | % slope | 1 | Drainage | A1 | UNHCR | Yes ("roughly") |
| 10 | % slope | 1 | Max before unbuildable | A1 | UNHCR | Yes ("about") |
| 3 | meters | 1 | Groundwater depth | A2 | UNHCR | Yes ("at least") |
| 1.5 | meters | 1 | Toilet pit above water table | A2 | UNHCR | Yes ("at least") |
| 45 | sqm/person | 1 | Comprehensive planning figure | A3 | UNHCR | Yes ("around") |
| 30 | sqm/person | 1 | Minimum, excl. agriculture | A3 | UNHCR | Yes ("about") |
| 29 | sqm/person | 1 | Discouraged floor | A3 | UNHCR | Yes ("roughly") |
| 2 | meters | 1 | Min shelter spacing | A4 | UNHCR | Yes ("about") |
| 2x | height | 1 | Ideal shelter spacing | A4 | UNHCR | Yes ("ideally") |
| 30 | meters | 1 | Firebreak width | A4 | UNHCR | Yes ("roughly") |
| 300 | meters | 1 | Firebreak interval | A4 | UNHCR | Yes ("roughly") |
| 1 | km | 1 | Standard dumpsite distance | A5 | UNHCR | Yes ("at least"), settlement-scope clarified |
| 5 | km | 1 | Hazardous dumpsite distance | A5 | UNHCR | Yes |
| 15 | km | 1 | Protected-area distance | A5 | UNHCR | Yes |
| 1 | km | 1 | Military installation distance | A5 | UNHCR | Yes |
| 50 | meters | 1 | Water-source buffer | A5 | UNHCR | Yes ("commonly around") |
| 1 per 50 | people | 1 | Toilet ratio, emergency phase | A7 | UNHCR | Yes ("roughly," "reasonable... target") |
| 3.5 | sqm/person | 2 | Min covered space, warm climate | B1 | UNHCR | Yes ("roughly," "commonly used minimum") |
| 4.5-5.5 | sqm/person | 2 | Min covered space, cold climate | B2 | UNHCR | Yes ("roughly") |
| 3 | feet | 3 | Combustible-material clearance | D6 | USFA | Yes, exact unit preserved, no conversion |
| 5-7 | kW | 3 | Stove heating capacity | D7 | UNHCR | Yes ("roughly," "a useful planning number... not a guarantee") |
| 40-70 | sqm | 3 | Floor area heated by that stove | D7 | UNHCR | Yes ("roughly") |

**21 distinct numeric claims found, all traced to a valid frozen claim
ID and source. No changed units, no accidental conversions, no merged
ranges, no lost qualifiers.** No context-dependent figure is presented
as universal - each explicitly carries its "roughly/about/commonly
used" hedge, and A5 explicitly distinguishes settlement-scale from
individual-household application (see next section).

## Humanitarian Planning-Target Audit

Every A-series and B-series figure was checked for the specific
failure modes this audit targets:

- **Universal guarantee of safety:** not found - A1's slope figure is
  framed as "gentle grade... lets rainwater drain away," not a safety
  guarantee; A3 explicitly states its figures are "not guarantees of
  comfort or a hard rule that every real settlement meets."
- **Exact requirement for every emergency:** not found - "commonly
  used," "roughly," and "reasonable... target" framing appears
  throughout.
- **Substitute for local assessment:** not found - no sentence implies
  these figures replace an actual site assessment.
- **Individual life-safety threshold:** not found, and explicitly
  guarded against - A5's closing sentence is the clearest example:
  "These are settlement-scale planning distances for whoever is
  choosing where an entire camp or settlement goes - they are not
  advice for where an individual family should camp for a night." No
  paragraph was found where a reasonable reader could mistake a
  settlement-planning figure for personal-safety advice.

**Result: PASS, no finding.**

## Ownership/Overlap Audit

Confirmed against the established corpus ownership map:

- **Wilderness/natural-material shelter** - not restated; both
  Article 1 (A6) and Article 2 (B6) explicitly cross-link to
  `basic_shelter_construction.md` and name what it covers instead of
  repeating it.
- **Permanent building construction** - not present anywhere in this
  pack.
- **Fire-making** - not restated; Article 3 cross-links
  `fire_starting_without_matches.md`.
- **General fire-safety basics** - not restated; Article 3 explicitly
  names what `emergency_fire_safety.md` covers ("clearing a burn area,
  keeping water or dirt nearby...") and states this article covers
  "additional, distinct risks" instead.
- **Knot/lashing instruction** - not restated; Article 2 cross-links
  `basic_knots_for_shelter_and_gear_lashing.md` and explicitly
  distinguishes lashing technique from anchoring.
- **Hypothermia/heatstroke treatment** - not present; Article 3
  cross-links `mcfa_hypothermia_and_heatstroke_field_response.md`
  rather than describing symptoms or treatment.
- **Water-treatment infrastructure** - not re-derived; Article 1
  cross-links a Water Treatment at Scale article for the water-system
  side of planning ratios.
- **Sanitation infrastructure** - not re-derived; Article 1 cross-links
  the sanitation article for the sanitation side of planning ratios.
- **Formal structural engineering, damaged-building assessment,
  seismic assessment, professional certification** - none present
  anywhere in the pack, consistent with the confirmed out-of-scope
  boundary (C4).
- **Medical treatment already owned elsewhere** - none present.

**Result: PASS, no finding.**

## Sources-Section Audit

Every article's `## Sources` section checked against the Source
Collection's access log:

- **Article 1:** UNHCR Settlement Planning + Safe and Secure
  Settlements - both directly read, both genuinely used (traced to
  A1-A5, A7 above). No unused or inaccessible source cited.
- **Article 2:** UNHCR Emergency Shelter Solutions and Standards -
  directly read, genuinely used (B1-B4, C1). No unused or inaccessible
  source cited.
- **Article 3:** USFA Carbon Monoxide, USFA Heating Fire Safety, EPA
  Power Outages and IAQ, UNHCR Emergency Shelter Solutions and
  Standards - all four directly read, all four genuinely used (D1-D4,
  D6-D7). No unused or inaccessible source cited.
- **Article 4:** UNHCR Settlement and Shelter (typology listing),
  UNHCR Emergency Shelter Solutions and Standards, UNHCR Principles &
  Standards for Settlement Planning - all three directly read, all
  three genuinely used (E1, E5-E6, E4's cross-reference). No unused or
  inaccessible source cited.

**Confirmed: no inaccessible IFRC, Sphere, or REI material appears
anywhere in any article's Sources section.** No claim's intended
source is missing from its article's Sources list.

**Result: PASS, no finding.**

## Metadata and Terrain Review

- **manifest.md:** `pack_id`, `pack_name`, `pack_version` (1.0.0), and
  `description` all accurate and consistent with the actual 4-article
  pack. Body text correctly names all four articles' themes with no
  stale reference to a 5th article, no temporary sprint/process
  language, and no publication or verification claim exceeding the
  pack's actual current state. **No fix needed.**
- **Frontmatter:** all four articles have required `title`/`category`;
  `knowledge_level` (Level 2 ×3, Level 1 for the comparative,
  non-technical Tarps/Tents article) is a reasonable fit.
- **Terrain - independently reconsidered, not merely re-confirmed:**
  all four articles omit terrain. Re-examined each article's actual
  content once more this pass for a genuine per-terrain case: site
  selection/settlement planning (Article 1), shelter-form comparison
  (Article 2), thermal/CO/fire safety (Article 3), and communal/
  transitional occupancy (Article 4) are all systems/settlement-scale
  content that applies essentially identically regardless of biome -
  displacement and disaster response happen in every terrain this
  taxonomy covers. No genuine differentiated case was found for any
  of the four (unlike Water Treatment at Scale, where a modest but
  real case existed for some articles). **Omission confirmed as the
  strongest decision - no terrain added.**

## Related-Articles Validation

Every slug re-verified directly against real files this pass (not
assumed from the prior sprint's report): all 4 internal (`ess_`)
slugs confirmed to match actual filenames; all 7 external slugs
(`sanitation_hygiene_and_disease_prevention`,
`wts_assessing_community_water_needs_and_protecting_the_source`,
`mcfa_hypothermia_and_heatstroke_field_response`,
`basic_shelter_construction`,
`basic_knots_for_shelter_and_gear_lashing`, `emergency_fire_safety`,
`fire_starting_without_matches`) independently confirmed to exist on
disk via direct `find`/`test -f` checks.

**One missing reciprocal link found and fixed:** Article 4 explicitly
states its design-principles content is where these principles "first
come up" in Article 2, but Article 2 did not link forward to Article
4. **Fixed** - added
`ess_communal_and_transitional_shelter_occupancy_and_maintenance` to
Article 2's `related_articles`.

No orphan articles (every article has at least one inbound and
outbound in-pack link). No unnecessary link explosion - each article
links to 2-5 targets, all genuinely relevant.

## Visual Comprehension Review

Recorded for future Visual Knowledge Engine planning only - no image
generated, no schema change, no article metadata added.

| Concept | Classification | Notes |
|---|---|---|
| Shelter-site/settlement-layout selection (Article 1) | **Visual strongly recommended** | Spacing, firebreaks, and distance-from-hazard rules are inherently spatial; a settlement plan-view diagram would convey this far more directly than prose enumeration of distances |
| Shelter-form comparison (Article 2) | Visual helpful | A comparison table/matrix of tradeoffs would reinforce, not replace, the article's existing comparative prose |
| Anchoring/guy-line geometry (Article 2, folded section) | **Text sufficient - no detailed visual recommended** | The verified claim boundary is explicitly non-procedural (no angle, spacing, or hardware); a detailed geometry diagram would depict more operational specificity than the text supports, exactly the failure mode this review was instructed to guard against |
| Ventilation and combustion hazards (Article 3) | **Visual strongly recommended** | A vented-vs-unvented device cutaway would directly serve this article's highest-risk content |
| Communal/transitional shelter layout (Article 4) | Visual helpful | Less spatial/geometric than Article 1's site-planning content, but a settlement-typology diagram could still aid comprehension |

## Fixes Applied During Review

1. **Article 2 (Tarps, Tents...)** - removed unconfirmed ground-type
   examples ("loose sand, hard-packed soil, and rocky ground") from
   the anchoring paragraph; not part of the confirmed C2 boundary and
   created an unintended procedural implication.
2. **Article 3 (Thermal Management...)** - removed an unsupported
   causal claim that ovens "are not designed for sustained heating use
   and add to the carbon-monoxide and fire risks" - the source states
   only the categorical rule with no stated mechanism, and the claim
   incorrectly implied CO risk applies to all ovens including electric
   ones.
3. **Article 2 (Tarps, Tents...)** - added a missing reciprocal
   `related_articles` link to Article 4.

No factual content was invented to replace what was removed; no new
operational number was introduced; no safety-critical claim was
materially redesigned. Both content fixes were narrowing corrections
back to the already-confirmed/verified boundary, within this sprint's
explicit "safe editorial fix" authority.

## Reviewer Sign-off

- **Reviewer name/handle:** Claude (AI agent)
- **Date:** 2026-07-18
- **Scope:** Full Editorial Review of the final draft (manifest.md +
  4 articles) - structural checklist, article architecture audit,
  Claim-to-Source Map built fresh against final prose, heightened
  anchoring and Article 3 safety audits, full numeric-claim audit,
  humanitarian-planning-target audit, ownership/overlap audit,
  Sources-section audit, metadata/terrain review, related-articles
  validation, visual comprehension review.
- **Findings:** 3 fixes applied (2 content overreach corrections, 1
  missing reciprocal link); 0 Critical, 0 High, 0 Medium findings left
  open (the 2 content issues found were fixed within this sprint's
  authority, not merely logged); 0 Stage 6 blockers identified beyond
  the standard requirement that formal Source Verification has not yet
  occurred.
- **Statement:** This review confirms every claim in the final prose
  traces to a source or is honestly written as general knowledge/
  editorial synthesis, confirms the pre-writing Founder confirmations
  still match the corrected final wording, and confirms no removed or
  out-of-scope claim (C3, C4) returned. **This review is explicitly a
  structural/traceability Editorial Review, not the formal post-
  drafting Human/AI-agent Source Verification pass required by
  `QUALITY_STANDARD.md` §9** - it does not re-derive verification
  independently from first principles the way a dedicated Stage 6 pass
  would, and does not close that stage's gate. Traceability is not
  verification.

## Verification Level: Per-Article Status

| Article | `verification_level` | Why |
|---|---|---|
| Shelter Site Selection and System Planning | Unverified | Claims trace cleanly to source; formal post-drafting Source Verification not yet performed |
| Tarps, Tents, and Rapidly-Deployable Shelter Forms | Unverified | Same - includes the corrected anchoring section |
| Thermal Management, Ventilation, and Fire Safety in Shelter Systems | Unverified | Same - the pack's highest-risk article; its Stage 6 pass should be the most thorough |
| Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation | Unverified | Same |

## Publication Decision

- **Pack:** `hv_official_emergency_shelter_systems`
- **Version under decision:** 1.0.0
- **Decision:** **Not Yet Approved.** No article is `Verified Source`;
  nothing in this pack may be packaged or released.
- **Decided by:** Claude (AI agent) - Editorial Review only; this is
  not, and does not purport to be, a Founder Publication Decision.
- **Date:** 2026-07-18
- **Conditions to reach Approved:** (1) formal post-drafting Human/
  AI-agent Source Verification per `QUALITY_STANDARD.md` §9, covering
  every claim row in the Claim-to-Source Map above against the exact
  (now-corrected) final wording; (2) each article's
  `verification_level` updated honestly from that pass; (3) a
  separate, explicit Founder Publication Decision, matching the
  precedent of every previously-released pack.

**Update, 2026-07-18 (Stage 6):** condition (1) above is now complete
- see "Stage 6 Formal Post-Drafting Source Verification" below. All 4
articles are honestly `Verified Source` and condition (2) is complete.
**This does not change the Decision itself, which remains Not Yet
Approved above** - condition (3), a separate and explicit Founder
Publication Decision, has not been made and is not made by this
update. This document continues to record the pack as **Not Yet
Approved** until the Founder records that decision.

### Why `verification_level` stays `Unverified` (superseded, see Stage 6 update above - preserved as the accurate record of the Editorial Review pass's own reasoning at the time)

Every claim row in the Claim-to-Source Map above reads "Yes" for
representation and boundary-adherence - this might look like the
precondition for `Verified Source` is already met. It is not: those
"Yes" marks reflect claims that were verified or confirmed *before or
during* Writing (against planned wording, then Founder-confirmed for
the 5 highest-risk claims), then *traced and corrected* against final
prose this Editorial Review - which is a structural/traceability
pass, not the dedicated, independent, word-for-word re-verification of
the shipped sentences against source text that formal Source
Verification performs as its own stage. Founder pre-writing
confirmation is not final-prose verification either - it confirmed
drafting *boundaries*, and this review found and fixed two places
where the initial draft drifted slightly past those boundaries in
ways the Founder never saw or approved. That is exactly why Stage 6
exists as a separate, later step, not folded into this one.

## Stage 6 Formal Post-Drafting Source Verification (2026-07-18)

Performed by Claude (AI agent), under the ratified standing AI-Agent
Verification Policy (`pack_production_workflow/QUALITY_STANDARD.md`
§9). This is the independent, word-for-word verification pass Stage 5
Editorial Review explicitly deferred. Every source below was
re-opened and re-read fresh this pass via direct `WebFetch` - not
recalled from the Research Plan, Source Collection, Founder
Confirmation Packet, or Editorial Review's own quotations.

### Source Access Log (Stage 6)

All 7 distinct source pages underlying the pack's claims were
re-fetched fresh this pass. **All 7 were successfully accessed - no
substitute source was needed.**

| Source | Organization | Claims covered | Result |
|---|---|---|---|
| Principles & Standards for Settlement Planning | UNHCR | A1, A2, A3, A4, A7 | Re-read; all figures re-confirmed exactly, **plus new, unused-but-available figures noted (toilet-to-shelter 50m, water-source 500m, ventilation-opening 10%/5%) - not added to the frozen claim set, see below** |
| Safe and Secure Settlements | UNHCR | A4, A5 | Re-read; **discrepancy found and corrected** - see "Genuine Findings," below |
| Emergency Shelter Solutions and Standards | UNHCR | B1-B5, C1, D7, E5, E6 | Re-read; all figures re-confirmed exactly |
| Settlement and Shelter (index/typology page) | UNHCR | E1 | Re-read; all 6 typology names re-confirmed exactly |
| Carbon Monoxide | USFA | D1 (partial), D2 (partial), D3 | Re-read; exact match, zero drift |
| Heating Fire Safety | USFA | D6 | Re-read; exact match, zero drift |
| Power Outages and Indoor Air Quality (IAQ) | EPA | D1 (partial), D2 (partial), D4 | Re-read; exact match, zero drift, confirmed the "gas stoves or ovens" phrasing is gas-specific (relevant to the Genuine Findings below) |

### Genuine Findings This Pass

**1. Article 1, A5 - military-installation distance figure could not
be re-confirmed.** The final prose stated "Military installations and
similarly dangerous locations are also kept at a distance, commonly
at least 1 kilometer." A fresh, targeted re-read of the "Safe and
Secure Settlements" page - specifically searching for every sentence
mentioning "military" - found only: *"Ensure the site is an
appropriate distance from military installations and other
potentially dangerous locations."* **No numeric distance is stated
for military installations anywhere on this page** - the page's only
"1 km" figure applies to standard dumpsites, a different hazard
category entirely. This appears to be a carry-over imprecision from
the original Research sprint's read (likely a conflation of the
dumpsite figure with the separately-stated, unnumbered military-
distance qualifier, both appearing near each other in the source).
**Fixed**: the specific "1 kilometer" figure was removed and replaced
with the source's own qualitative "an appropriate distance" language,
explicitly noting no fixed figure exists for this hazard category the
way it does for dumpsites and protected areas. The correctly-sourced
dumpsite (1km/5km) and protected-area (15km) figures were not
touched.

**2. Article 4, E6 - named coordinating actors not explicitly stated
by the source.** The final prose attributed the emergency-to-durable
shelter progression to "coordination between affected communities,
government authorities, and development partners." The directly-read
source states only: *"an approach that is able to breach the division
between emergency, transitional, and durable shelter and that links
relief, rehabilitation and development should be sought"* - it does
not name specific coordinating actors. **Fixed**: rewritten to track
the source's own framing (linking relief/rehabilitation/development,
breaching the division between shelter stages) without asserting a
specific list of named actors the source doesn't state.

**3. Available-but-unused precision, noted and deliberately not
added:** the fresh re-read of "Principles & Standards for Settlement
Planning" surfaced three figures not in the pack's frozen claim set -
toilets "not more than 50m from shelter," water sources "max. 500m
from household," and ventilation/window openings "at least 10 per
cent"/"at least 5 per cent" of floor area. **None were added this
pass.** Adding new factual claims during Stage 6 verification - even
from an already-cited source - would introduce content that never
went through Writing, Editorial Review, or (for the ventilation
figures, which are safety-adjacent) Founder confirmation. These are
recorded here as legitimate candidates for a future version, not
inserted into v1.0.0's frozen architecture.

### Final-Prose Claim-to-Source Verification Map

All 27 frozen active claims independently re-verified against fresh
source reads and the corrected final wording. Result: **27 of 27 PASS
after the 2 fixes above** (2 required PASS WITH NARROWING before
reaching this state; 25 PASS without further change). No claim reads
REWRITE REQUIRED (unresolved), REMOVE, or UNRESOLVED. C3 confirmed
still absent; C4 confirmed still out of scope; no removed or rejected
claim returned. No meaningful factual claim was found outside the
frozen 27 requiring its own new entry (the "available-but-unused"
figures above are source content, not article content).

### Anchoring/Ground-Condition Verification Result

Re-verified against a fresh read of "Emergency Shelter Solutions and
Standards": tent wind/snow vulnerability re-confirmed exactly ("may
be unstable in high winds or heavy snow; difficult to heat"). No
source this pass yielded any specific anchoring technique, hardware,
angle, or spacing content - the corrected general/qualitative wording
from Stage 5 remains the most that can be honestly supported. **PASS,
no further change needed** - independently re-confirmed clean, no new
procedural implication found.

### Oven/Heater/CO/Fire-Safety Verification Result

Re-verified against fresh EPA and USFA reads. **Confirmed the Stage 5
fix genuinely resolved the overreach, not merely reworded it**: EPA's
own CO-risk sentence specifically names "gas stoves or ovens" (gas-
specific), which the article's D1 paragraph already correctly mirrors
("Gas stoves and ovens"). USFA's separate Heating Fire Safety page
states only "Never use an oven to heat your home" with no stated
mechanism and no gas/electric distinction - exactly matching the
article's corrected D6 sentence ("Never use an oven to try to heat a
shelter"), which no longer asserts an invented CO mechanism. The two
"oven" mentions in the article (D1's gas-specific CO context, D6's
general fire-safety context) are correctly kept in their own sourced
scopes, not merged into one over-broad claim.

### Founder-Confirmed D1-D6 Re-Verification

| Claim | Fresh source result | Current prose result | Verdict |
|---|---|---|---|
| D1 | Exact match (USFA + EPA) | Matches confirmed boundary; added CO-properties clause traces to the same source + uncontroversial general knowledge | **PASS** |
| D2 | Exact match (USFA + EPA) | Matches confirmed boundary ("shelter" generalization); added sentence is synthesis, no new figure | **PASS** |
| D3 | Exact match (USFA) | Matches confirmed boundary; added sentence is synthesis | **PASS** |
| D4 | Exact match (EPA), all 5 precautions confirmed present in source | Matches confirmed boundary, all 5 present together | **PASS** |
| D6 | Exact match (USFA) | Matches confirmed boundary exactly after Stage 5's fix; independently re-confirmed the fix was correct, not cosmetic | **PASS** |

**5 of 5 remain inside both their source boundary and their Founder-
confirmed drafting boundary.** None expanded, weakened a categorical
rule, converted a contextual rule into a universal one, or introduced
a new number.

### Article 3 Heightened Safety Verification Result

Every categorical word ("never," "must," "keep") checked against its
source: all are directly justified - the sources themselves use
equally categorical language ("Never use charcoal in a fireplace,"
"Never close the damper," "Never run a car... inside a garage," "Keep
anything that can burn at least 3 feet..."). No categorical,
source-supported rule was softened for stylistic caution; no
contextual rule (e.g. the pH/temperature-style conditionals that don't
apply here) was strengthened into a false universal. Fuel-burning
devices, generators, CO alarms, vented fireplaces, and space heaters
remain distinctly separated, not generalized into each other.

### Full Numeric Verification (Independently Rebuilt, Not Copied)

21 numbers independently re-found across all 4 current article files
(same count as Editorial Review's, confirmed by independent rebuild,
not assumed): A1 (2-4%, 10%), A2 (3m, 1.5m), A3 (45, 30, 29 sqm), A4
(2m, 2x, 30m, 300m), A5 (1km, 5km, 15km, 50m - **the military "1km"
figure removed this pass, so A5 now contributes 3 numbers instead of
4**), A7 (1:50), B1 (3.5 sqm), B2 (4.5-5.5 sqm), D6 (3 feet), D7 (5-7
kW, 40-70 sqm). Every remaining number re-verified against a freshly
re-read source with exact unit, range, and qualifier preserved. No
transcription error, no changed unit, no accidental conversion, no
merged range found anywhere else. No independent arithmetic
verification was required (this pack contains no unit-conversion
claim, unlike Water Treatment at Scale's L/h/m² example).

### Humanitarian Planning-Figure Verification Result

Every A-series and B-series figure re-classified against the source's
own category: A1 (drainage guidance), A2 (siting/water-protection
guidance), A3 (space-allocation planning standard), A4 (spacing/
firebreak planning standard), A5 (distance-from-hazard planning
standard, now correctly missing a figure it never had for the
military sub-case), A7 (infrastructure planning ratio), B1-B2 (minimum
planning standard by climate). **None reclassified as an individual
safety requirement** - the source material itself frames all of these
as settlement/planning-level guidance, and the article's existing
"planning target, not a guarantee" framing (and A5's explicit
settlement-vs-individual-household sentence) correctly preserves this
throughout.

### Shelter-Form/Structural-Boundary Verification Result

Re-verified against "Emergency Shelter Solutions and Standards":
shelter-type comparisons (tents, plastic sheeting, prefab units)
match the source's own comparison table content exactly; tent
vulnerability statement matches exactly; structural-demand statements
remain qualitative (no figure introduced); anchoring statements remain
inside the verified boundary (re-confirmed above); manufacturer/
qualified-guidance referral is represented honestly, with no invented
technical detail added during this verification pass.

### Article 4 Verification Result

E1 (typologies) re-confirmed exact match against a fresh read of the
index page (all 6 names identical). E4/E5 cross-references correctly
point back to already-verified A7/B5 content rather than restating
figures. E6 required and received the fix described above. No source-
specific planning figure was found generalized beyond its actual
context (E4's infrastructure ratios remain explicitly "the same
planning ratios... continue to matter," not restated with new
numbers).

### Claims Rewritten

1. **Article 1 (Shelter Site Selection and System Planning)** - A5's
   military-installation distance sentence rewritten to remove the
   unconfirmable "1 kilometer" figure, replaced with the source's own
   qualitative framing.
2. **Article 4 (Communal and Transitional Shelter...)** - E6's
   progression sentence rewritten to remove the unconfirmed named-
   actor list, replaced with framing that tracks the source's actual
   language.

### Claims Removed

None - both issues were resolved by narrowing/rewriting, not removing
the underlying claim entirely (A5 still correctly states military
installations are sited at a distance; E6 still correctly states a
progression exists).

### Sources Sections Changed

None. Every source cited in every article's `## Sources` section was
re-confirmed this pass to have been actually opened and to genuinely
support that article's content. No source was added or removed.

### Per-Article Verification Result

| Article | Result | Reasoning |
|---|---|---|
| Shelter Site Selection and System Planning | **Verified Source** | All 7 claims (A1-A7) PASS after the A5 fix; re-verified independently against fresh source reads |
| Tarps, Tents, and Rapidly-Deployable Shelter Forms | **Verified Source** | All 8 claims (B1-B6, C1-C2) PASS; the Stage 5 anchoring fix re-confirmed clean with no further drift |
| Thermal Management, Ventilation, and Fire Safety in Shelter Systems | **Verified Source** | All 8 claims (D1-D8) PASS, including all 5 Founder-confirmed high-risk claims re-verified individually against both source and confirmed boundary |
| Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation | **Verified Source** | All 4 claims (E1, E4-E6) PASS after the E6 fix |

Applied honestly per-article, not as a batch - each article was
independently re-derived from its own claim rows, and 2 of the 4
articles required an actual content fix before reaching this result,
not a rubber stamp.

## Verification Level: Per-Article Status (Updated, Stage 6)

| Article | `verification_level` | Why |
|---|---|---|
| Shelter Site Selection and System Planning | **Verified Source** | All claims independently re-verified against fresh source reads, 2026-07-18; 1 claim (A5's military-distance figure) corrected |
| Tarps, Tents, and Rapidly-Deployable Shelter Forms | **Verified Source** | All claims independently re-verified; Stage 5's anchoring fix re-confirmed clean |
| Thermal Management, Ventilation, and Fire Safety in Shelter Systems | **Verified Source** | All claims, including all 5 Founder-confirmed high-risk claims, independently re-verified against both fresh source reads and their confirmed boundaries |
| Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation | **Verified Source** | All claims independently re-verified; 1 claim (E6's actor-list) corrected |

### Expected Pack-Wide Verification Summary

Applying `registry_generator`'s existing weakest-link rule
(`PackValidation.verificationSummary`): all 4 articles read `Verified
Source`, and the set contains no `Unverified` article, so the
pack-wide verification summary is **`Verified Source`**.

### Unresolved Findings

None blocking. The three "available-but-unused precision" figures
noted above (toilet/water distances, ventilation-opening percentages)
are recorded as legitimate future-version candidates, not open
blockers for v1.0.0.

## Reviewer Sign-off (Stage 6)

- **Reviewer name/handle:** Claude (AI agent)
- **Date:** 2026-07-18
- **Scope:** Formal post-drafting source verification of all 4
  articles' final prose (post-Editorial-Review, commit `c8e900a`), all
  27 frozen claims, all 5 Founder-confirmed high-risk claims, all 21
  numeric claims, and dedicated re-audits of the two areas Editorial
  Review had already found drift in.
- **Sources personally opened and read this pass:** all 7 - UNHCR's
  Principles & Standards for Settlement Planning, Safe and Secure
  Settlements, Emergency Shelter Solutions and Standards, and the
  Settlement and Shelter index page; USFA's Carbon Monoxide and
  Heating Fire Safety pages; EPA's Power Outages and Indoor Air
  Quality page - each independently re-fetched this pass, not
  recalled from any planning artifact or the Editorial Review's own
  quotations.
- **Statement:** I confirm every claim marked `Verified Source` above
  was checked by me, this pass, against a source I personally opened
  and read fresh. This pass did **not** rubber-stamp the frozen 27
  claims or the Founder-confirmed 5 - it independently found and
  corrected two genuine cases where final prose exceeded what a fresh,
  careful re-read of the cited source actually supports (A5's
  military-distance figure, E6's named-actor list), neither of which
  Stage 5 Editorial Review had caught. This satisfies
  `pack_production_workflow/QUALITY_STANDARD.md` §9's formal post-
  drafting Human/AI-agent Source Verification requirement for this
  pack/version. It does not constitute, and is explicitly not, a
  Founder Publication Decision.

## Version Review History

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| 1.0.0 | 2026-07-18 | Topic approved by the Founder; Research Plan, Source Collection, and pre-writing Human Verification Workbook completed (29 claims mapped) | Pre-writing planning complete | Claude (AI agent) | Not Yet Approved (pre-writing stage) |
| 1.0.0 | 2026-07-18 | Targeted Verification Closure: Article 3 (anchoring) claims resolved after 8 total access attempts (C1 verified, C2 replaced, C3 removed, C4 confirmed out of scope); D6 verified against USFA; claim set frozen at 27 active claims, 0 unresolved; Founder Confirmation Packet created for D1, D2, D3, D4, D6 | Pre-writing closure complete | Claude (AI agent) | Not Yet Approved (still pre-writing) |
| 1.0.0 | 2026-07-18 | Founder high-risk confirmation recorded for D1, D2, D3, D4, D6 in their exact drafting boundaries | Pre-writing confirmation gate closed | Claude (AI agent); The Founder | Not Yet Approved (still pre-writing) |
| 1.0.0 | 2026-07-18 | Stage 4 Writing: manifest.md + 4 articles drafted from the frozen, confirmed claim set; former Article 3 (anchoring) folded into Tarps/Tents article after its verified content proved too thin to stand alone | Draft complete, all 4 articles `Unverified` | Claude (AI agent) | Not Yet Approved |
| 1.0.0 | 2026-07-18 | Editorial Review of final draft: Claim-to-Source Map built fresh against final prose; article-architecture, anchoring/structural-safety, Article 3 heightened-safety, full numeric-claim, humanitarian-planning-target, ownership/overlap, Sources-section, metadata/terrain, related-articles, and visual-comprehension audits performed; 2 content-overreach issues found and fixed (Article 2 ground-type examples, Article 3 oven CO-risk causal claim), 1 missing reciprocal link fixed | 0 Critical, 0 High, 0 Medium findings remain open (3 found, all fixed) | Claude (AI agent) | **Not Yet Approved** - pending formal post-drafting Source Verification and a separate Founder Publication Decision |
| 1.0.0 | 2026-07-18 | Stage 6 formal post-drafting Human/AI-agent Source Verification: all 7 underlying sources re-opened and re-read fresh against final prose; found and corrected 2 genuine cases of claim drift Editorial Review had not caught (A5's unconfirmable military-distance figure, E6's unconfirmed named-actor list); all 5 Founder-confirmed high-risk claims re-verified individually against both source and confirmed boundary, all PASS; 3 available-but-unused source figures noted for a future version, deliberately not added | All 4 articles upgraded to `Verified Source`; pack-wide weakest-link summary now `Verified Source` | Claude (AI agent) | **Still Not Yet Approved** - source verification complete; publication approval is a distinct, separate Founder decision |

## Status

Editorial draft, structurally sound: 4 of 4 articles internally
consistent, every claim traceable to a source or honestly general
knowledge/editorial synthesis, no removed or out-of-scope claim
returned, no prohibited safety-boundary implication found, all
`related_articles` slugs valid, three genuine defects found and fixed
during this review (two content-overreach corrections, one missing
cross-link). All 4 articles remain `verification_level: Unverified`
pending formal post-drafting Human/AI-agent Source Verification
against the exact, now-corrected final wording - not yet performed.
Publication Decision: **Not Yet Approved.**

**Editorial readiness: READY FOR FORMAL SOURCE VERIFICATION.** No
Critical or High finding remains unresolved (none was found). The two
Medium-equivalent findings (the content-overreach issues) were fixed
during this pass, not merely logged as Stage 6 blockers. The
Claim-to-Source Map is complete.

**Update, 2026-07-18 (Stage 6):** formal post-drafting source
verification is now complete - see "Stage 6 Formal Post-Drafting
Source Verification" above for the full record. This independent pass
found and corrected 2 further genuine cases of claim drift that
Editorial Review had not caught (A5's military-distance figure, E6's
named-actor list) - confirming why Stage 6 exists as its own separate,
independent step rather than being assumed from Stage 5's traceability
work. All 4 articles are now honestly upgraded to `verification_level:
Verified Source`, and the pack-wide weakest-link summary is `Verified
Source`. The pack remains **Not Yet Approved** for release - not
because any claim is unconfirmed, but because a separate, explicit
Founder Publication Decision has not yet been made. Nothing about this
update erases or reinterprets the Editorial Review findings above,
which remain the accurate record of that pass.
