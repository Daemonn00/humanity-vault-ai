# Review Notes - Community & Camp Sanitation Systems (v1.0.0)

**This is editorial source content only. It is not yet a distributable
ZIP and not yet approved for publication until the Publication
Decision section below says otherwise.**

This is the pack's first Editorial Review, performed against the
actual final draft prose in
`official_packs/hv_official_community_camp_sanitation_systems/`, not
merely against `community_camp_sanitation_systems_RESEARCH_PLAN.md`,
`community_camp_sanitation_systems_SOURCE_COLLECTION.md`, or the prior
Stage 4 Writing report (all re-read fresh this pass as background, not
as a substitute for reading the shipped sentences themselves).

**This sprint performs Editorial Review only.** It is explicitly
distinct from, and does not substitute for, formal post-drafting
Human/AI-agent Source Verification (a separate, later Stage 6) or a
Founder Publication Decision (later still). No claim in this pack
required Founder pre-writing confirmation (§9.3 Determination A for
D5, recorded in the Research Plan) - that determination is not the
same as verifying the final prose, and is not treated as one here. See
"Why `verification_level` stays `Unverified`" near the end of this
document.

## Editorial Review Checklist

*(Per `editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md`.)*

**A. Identity and structure**
- [x] `pack_id` (`hv_official_community_camp_sanitation_systems`) uses
      the `hv_official_` prefix.
- [x] `pack_id` is not already used elsewhere in `official_packs/`.
- [x] `pack_version` (`1.0.0`) is well-formed semver.
- [x] Every article's `category` (Survival ×4, Construction ×1) is a
      valid display name.
- [x] No article slug collides with the core corpus or another pack -
      independently re-checked this pass via a repo-wide search for
      each of the 5 `ccss_` slugs; each appears exactly once.

**B. Tone and register** - [x] Consistent calm, plain, field-manual
register across all five articles; no marketing or alarmist language;
no implied endorsement by any named source organization.

**C. Source-attribution discipline** - [x] Every non-obvious claim is
either attributed to a directly-read source or written as general
knowledge/cross-link - see the Claim-to-Source Map below. One scope-
clarity issue was found and fixed this pass (see "Fixes Applied
During Review").

**D. Safety and scope boundaries** - see the B7, C6, and D5 heightened
audits and the "Safety and Scope Audit" below.

**E. Verification level integrity** - [x] All five articles read
`verification_level: Unverified`. Correct - the §9.3 Determination A
for D5 (no Founder confirmation required) is not the same as verifying
the final prose, and formal post-drafting Source Verification has not
been performed (explicitly out of scope this sprint).

## Source Access Log

*(Per `editorial_review_template/02_SOURCE_VERIFICATION_CHECKLIST.md`.
Every source below was already directly opened and read during
Research/Source Collection - re-confirmed here as still accurately
represented in the final prose, not re-fetched this pass, since this
sprint is a traceability/representation audit, not Stage 6
re-verification.)*

| Source | Organization | Directly read? | Article(s) it supports | Representation check |
|---|---|---|---|---|
| eCompendium - homepage/overview | Global WASH Cluster / German WASH Network / Eawag / SuSanA | Yes | 1 (A1) | Correctly cited; service-chain framing matches |
| Potential Sanitation Solutions During an Emergency Response | CDC (archived) | Yes | 1 (A2, A3), 2 (B1, B2) | Correctly cited in both articles; the 1:50 baseline itself is referenced only descriptively in Article 1, never restated as a number - confirmed |
| Immediate and Short-Term Emergency Sanitation | SSWM | Yes | 1 (A4), 2 (B2, B3, B4, B6) | Correctly cited in both articles |
| Handwashing Stations | Oxfam WASH | Yes | 1 (A5) | Correctly cited; product-specific water-volume figures correctly excluded |
| Tippy Tap Handwashing Station Construction Guide | Watershed Management Group | Yes | 1 (A6) | Correctly cited |
| eCompendium - Single Ventilated Improved Pit (S.4) | Global WASH Cluster / German WASH Network / Eawag / SuSanA | Yes | 2 (B7) | Correctly cited; see B7 Heightened Audit below |
| Humanitarian Hub of Tools - Latrine | CBM | Yes | 3 (C1, C2, C3, C4, C5, C7) | Correctly cited |
| Preventing Gender-Based Violence (Camps and Prolonged Encampments) | SSWM | Yes | 3 (C6) | Correctly cited; see C6 Heightened Audit below |
| Domestic and Refugee Camp Waste Management | Oxfam WASH | Yes | 4 (D1, D2, D3, D4, D6, D7) | Correctly cited |
| Health-care waste (fact sheet) | World Health Organization | Yes | 4 (D5) | Correctly cited; see D5 Heightened Audit below |
| eCompendium - Single Pit Latrine (S.3) | Global WASH Cluster / German WASH Network / Eawag / SuSanA | Yes | 5 (E1, E2) | Correctly cited |

**Confirmed: no source that failed access during Research/Source
Collection (WHO Technical Note 14 PDF, WHO Module 17 PDF, UNHCR
Emergency Sanitation Standards, IFRC Epidemic Control Toolkit, the
dead-linked Oxfam Views & Voices GBV article, CDC's live
regulated-medical-waste page) appears in any article's Sources section
as though it were directly read.** Every substitute-sourcing situation
(SSWM's GBV page standing in for the dead-linked Oxfam article; WHO's
HTML fact sheet standing in for the two blocked WHO PDFs) is
represented honestly, naming only the actual directly-read source.

## Claim-to-Source Map

Built fresh this pass by reading all 5 final articles end to end and
tracing every meaningful factual claim, operational instruction, and
quantitative value back to its claim ID and source. All 32 claims from
the frozen inventory were found intact in the final prose after this
pass's one fix - none dropped, none expanded beyond its confirmed
boundary, none newly introduced outside the frozen set.

| Claim | Article | Final prose location | Within frozen boundary? | Type | Notes |
|---|---|---|---|---|---|
| A1 | 1 | "A sanitation system is more than a latrine..." paragraph | Yes | Directly sourced | Traces to eCompendium overview |
| A2 | 1 | "Because a full, ideal system rarely exists on day one..." paragraph | Yes | Directly sourced | Traces to CDC |
| A3 | 1 | Same paragraph, "improving toward roughly one facility for every 20 people" sentence | Yes | Directly sourced | The 1:50 baseline is cross-linked (referenced only as "the wider ratio used at the very start," never restated as a number) |
| A4 | 1 | "Not every population can be served by a dug facility right away..." paragraph | Yes | Directly sourced | Traces to SSWM |
| A5 | 1 | "Handwashing infrastructure is part of the same planning..." paragraph | Yes | Directly sourced | Traces to Oxfam WASH |
| A6 | 1 | Same paragraph, tippy-tap sentence | Yes | Directly sourced | Traces to Watershed Management Group (15-30 people/gallon) |
| A7 | 1 | Closing paragraph ("This kind of system-level planning is specific to a group, camp, or settlement...") | Yes | Editorial boundary framing | No source needed; correctly distinguishes this pack from household guidance and other packs' planning content |
| B1 | 2 | "Several latrine technologies are used across different phases..." paragraph | Yes | Directly sourced | Traces to CDC; narrowed this pass to remove an unsupported timing claim - see Fixes Applied |
| B2 | 2 | "Because trench and pit latrines are the default choice..." paragraph | Yes | Directly sourced | Traces to CDC/SSWM |
| B3 | 2 | "Where digging is possible, dimensions matter..." paragraph | Yes | Directly sourced | Traces to SSWM (20-30cm/15cm shallow; up to 2m deep) |
| B4 | 2 | Same paragraph, groundwater-siting sentence | Yes | Directly sourced | Traces to SSWM (15-30m); explicitly distinguished from the vertical water-table clearance cross-link |
| B5 | 2 | Same paragraph, cross-link sentence ("vertical clearance... covered in 'Shelter Site Selection...'") | Yes | Cross-link | No number restated - correct |
| B6 | 2 | "During use, a pit doesn't need to be filled completely..." paragraph | Yes | Directly sourced | Traces to SSWM (~20cm below slab) |
| B7 | 2 | "One well-documented weakness of a basic pit latrine..." paragraph | Yes | Directly sourced | Traces to eCompendium S.4; see B7 Heightened Audit below |
| C1 | 3 | "Space and layout affect who can actually use a facility..." paragraph | Yes | Directly sourced | Traces to CBM HHoT (120x120cm / 180x180cm) |
| C2 | 3 | Same paragraph, door sentence | Yes | Directly sourced | Traces to CBM HHoT (≥90cm) |
| C3 | 3 | "For a wheelchair user specifically..." paragraph | Yes | Directly sourced | Traces to CBM HHoT (80x130cm, 150x150cm, ~80cm grabrail) |
| C4 | 3 | Same paragraph, accessible-ratio sentence | Yes | Directly sourced | Traces to CBM HHoT (~1 in 10) |
| C5 | 3 | "Distance from where people sleep also affects real usability..." paragraph | Yes | Directly sourced | Traces to CBM HHoT (50m/30m); explicitly distinguished from B4's groundwater distance |
| C6 | 3 | "Reducing the risk of gender-based violence..." paragraph | Yes | Directly sourced | Traces to SSWM GBV page; see C6 Heightened Audit below |
| C7 | 3 | Closing paragraph ("Beyond these specific figures, every facility should have separate male and female sections...") | Yes | Directly sourced | Corroborated across CBM HHoT |
| D1 | 4 | "Getting solid waste away from where people live..." paragraph | Yes | Directly sourced | Traces to Oxfam WASH (100m/10m) |
| D2 | 4 | Same paragraph, bin-ratio sentence | Yes | Directly sourced | Traces to Oxfam WASH (1 per 10 families, ≥15m) |
| D3 | 4 | "How waste moves from collection points onward..." paragraph | Yes | Directly sourced | Traces to Oxfam WASH (10,000-20,000/1km; 50,000 threshold) |
| D4 | 4 | "Where waste is disposed of by burial..." paragraph | Yes | Directly sourced | Traces to Oxfam WASH (30m/1.5m); explicitly disclaims equivalence with latrine-siting and settlement-hazard figures |
| D5 | 4 | "Not all waste generated in a community belongs in this ordinary refuse system..." paragraph | Yes | Directly sourced | Traces to WHO fact sheet (85%/15%); see D5 Heightened Audit below |
| D6 | 4 | "When ordinary community waste has to be burned rather than buried..." paragraph | Yes | Directly sourced | Traces to Oxfam WASH; scope-clarified this pass - see Fixes Applied |
| D7 | 4 | Closing paragraph ("For planning purposes, rough reference capacity figures...") | Yes | Directly sourced | Traces to Oxfam WASH (6m³/50 people/week; 3m³/200 people/week) |
| E1 | 5 | "Flies and odor are a well-documented, common weakness..." paragraph | Yes | Directly sourced | Traces to eCompendium S.3; cross-links Article 2 rather than repeating construction detail |
| E2 | 5 | "Every pit latrine eventually fills up..." paragraph | Yes | Directly sourced | Traces to eCompendium S.3 |
| E3 | 5 | "This same underlying principle... applies just as much to a single household's own latrine..." paragraph | Yes | Cross-link | Correctly cross-references `sanitation_hygiene_and_disease_prevention.md` without restating its content |
| E4 | 5 | Closing paragraph ("Construction is only the starting point...") | Yes | Editorial synthesis | No source needed; general maintenance framing |

**No new final-prose claim was found that doesn't map to the frozen
32-claim set.** Every meaningful factual/operational statement in the
final prose traces to an existing claim ID.

## B7 Heightened Audit - VIP Latrine Mechanism

Audited the final prose (Article 2, paragraph 5) word-for-word against
the narrowed, source-confirmed boundary: light-attraction fly-trap
mechanism, continuous-airflow odor control, vent pipe ≥11cm internal
diameter, vent extending >30cm above the superstructure.

- **Light-attraction fly-trap mechanism:** present and accurate -
  "flies that hatch in the pit are drawn toward the light at the top
  of the vent - when they try to escape toward it, a screen across the
  opening traps them."
- **Continuous-airflow odor control:** present and accurate -
  "continuous airflow moving up and out through the pipe carries odor
  away from the latrine rather than letting it build up inside."
- **Vent pipe internal diameter:** "at least 11 centimeters across on
  the inside" - matches the source exactly.
- **Vent height above superstructure:** "extending more than 30
  centimeters above its highest point" - matches the source exactly
  ("highest point" correctly refers to the latrine structure, matching
  the source's "highest point of the toilet superstructure").
- **Universal pit dimensions:** not found - no pit depth or footprint
  figure appears anywhere in the B7 paragraph.
- **Vent materials:** not found - the source's own detail about
  painting the pipe black to improve low-wind performance was
  deliberately not included in Stage 4 Writing and remains absent.
  Confirmed correct: this is genuinely supplementary detail, not
  required for the core mechanism, and omitting it does not create an
  inaccuracy.
- **Mesh specification:** not found - the article says only "a screen
  across the opening traps them," with no mesh size or material
  specified. Correct - the source gives no such specification either.
- **Orientation requirements:** not found beyond the already-confirmed
  height figure - no additional angle, direction, or placement rule is
  stated.
- **Construction formulas:** not found.
- **Performance guarantees:** not found - the article explicitly
  states the design "reduces flies and odor rather than eliminating
  them outright."

**Evaluating "reduces flies and odor rather than eliminating them
outright":**
- **(A) Directly source-supported?** No - the source describes the
  mechanism (flies trapped, odor carried away) but does not itself
  state a "does not eliminate" qualifier in those words.
- **(B) Reasonable editorial synthesis within the supported
  mechanism?** **Yes - this is the correct classification.** The
  source never claims total elimination of flies or odor, and
  `QUALITY_STANDARD.md` Section 3 explicitly prohibits content that
  "claim[s] or imply[s] a guaranteed outcome." Stating the honest,
  more conservative framing - a design that reduces two documented
  problems rather than promising to remove them - is the safety-
  appropriate way to describe a mechanism the source itself does not
  claim is total. This does not invent a new fact; it declines to
  overclaim one the source never made.
- **(C) Unsupported claim requiring correction?** No.

**Result: PASS, no finding.** B7's final prose stays entirely within
its narrowed boundary; the "reduces rather than eliminates" framing is
appropriate conservative synthesis, not an overclaim.

## C6 Heightened Audit - GBV/Lighting/Sanitation-Facility Safety

Audited the final prose (Article 3, paragraph 4) against the four
coordinated measures and their required framing.

- **Four measures present:** gender segregation, locks/privacy,
  lighting, and safe travel routes/distances - all four named
  explicitly.
- **"Lighting alone... guarantees safety" - checked, not found:** the
  article states "Lighting alone, without the other measures, is not
  enough to make a facility safe," directly foreclosing this
  misreading.
- **"These measures eliminate GBV risk" - checked, not found:** the
  article consistently uses "reducing the risk," never "eliminates,"
  "prevents," or "guarantees."
- **"One universal facility configuration applies everywhere" -
  checked, not found:** the article frames the four measures as
  general coordinated considerations, not a single mandated
  configuration.
- **<500m water-point figure restated - checked, not found:**
  independently re-searched the full pack for "500" - zero
  occurrences anywhere. The cross-link sentence references "Assessing
  Community Water Needs and Protecting the Source" by title only, with
  no number given.
- **Water-system guidance transferred into this pack's sanitation
  boundary - checked, not found:** the cross-link sentence only points
  to the water article; it does not restate or teach any water-system
  planning content itself.

**Result: PASS, no finding.** C6's final prose stays entirely within
its narrowed boundary.

## D5 Heightened Audit - Health-Care Waste Segregation

Audited the final prose (Article 4, "Not all waste generated in a
community belongs in this ordinary refuse system..." paragraph)
against the narrowed boundary.

- **85%/15% composition distinction:** present and accurate - "roughly
  85 percent of it is general, non-hazardous material... the remaining
  15 percent is hazardous."
- **Named hazardous categories:** present and accurate - "infectious
  waste, pathological waste, sharps, chemical waste, pharmaceutical or
  cytotoxic waste, and radioactive waste," matching the WHO fact
  sheet's six named categories exactly.
- **Segregation as the actionable principle:** present - "The key
  principle is segregation: keeping that hazardous fraction separated
  out from general community waste and burial systems."
- **Explicit boundary that this pack does not teach specialized
  treatment/disposal:** present - "This article does not cover how to
  treat or dispose of hazardous health-care waste itself - that
  requires specialized handling beyond the scope of a general
  community waste system."
- **Sharps handling, container specs, incineration, treatment
  temperatures, chemical concentrations, burial procedures, disposal
  technology:** none found anywhere in the D5 paragraph - confirmed by
  direct re-read.
- **"All medical waste is hazardous" - checked, not found:** the
  85%/15% split directly forecloses this misreading.
- **"All health-care waste may enter ordinary community waste systems"
  - checked, not found:** the segregation principle directly forecloses
  this.
- **"Segregation alone constitutes complete hazardous-waste
  management" - checked, potential ambiguity, already foreclosed:** the
  paragraph's own closing sentence ("that requires specialized handling
  beyond the scope of a general community waste system") already
  states that more than segregation is needed - no fix required for
  this specific concern.
- **Sequencing ambiguity found and fixed - ONE ISSUE:** the paragraph
  immediately following D5 (D6, on incineration) began "When waste has
  to be burned rather than buried..." with no explicit scope marker,
  directly after a paragraph that had just carved out health-care
  waste as outside this article's coverage. A reader moving directly
  from D5's disclaimer into D6 could momentarily read D6's incineration
  guidance as filling the gap D5 just described, when D6 in fact
  concerns ordinary community refuse (its source, Oxfam WASH, is the
  general camp waste-management guide, not a health-care-waste
  source). **Fixed:** D6's opening sentence now reads "When ordinary
  community waste has to be burned rather than buried, incineration
  should be treated as a last resort..." - a scope clarification only,
  no new claim or number introduced.

**Result: PASS after 1 fix.** The fix was a scope-clarifying word
change, not a redesign; D5's own boundary content (85%/15%, named
categories, segregation principle, explicit treatment-scope
disclaimer) was never altered.

## Full Numeric-Claim Audit (Independently Rebuilt, Not Copied)

Every number across all 5 final articles was independently located
this pass via direct text search and re-read - not assumed from the
Stage 4 Writing report.

| Number | Unit | Article | Context | Claim ID | Source | Qualifiers preserved? |
|---|---|---|---|---|---|---|
| 20 | people/facility | 1 | Longer-term facility ratio target | A3 | CDC | Yes ("roughly," "typically") |
| 15 to 30 | people/gallon | 1 | Handwashing device capacity | A6 | Watershed Management Group | Yes ("roughly," "depending on how carefully it's used") |
| 20 to 30 | cm (width) | 2 | Shallow trench latrine | B3 | SSWM | Yes ("typically") |
| 15 | cm (depth) | 2 | Shallow trench latrine | B3 | SSWM | Yes ("about") |
| 2 | m (depth) | 2 | Deep trench latrine | B3 | SSWM | Yes ("up to about") |
| 15 to 30 | m | 2 | Groundwater-siting distance | B4 | SSWM | Yes ("roughly"), explicitly distinguished from B5's vertical clearance |
| 20 | cm | 2 | Backfill threshold below slab | B6 | SSWM | Yes ("roughly") |
| 11 | cm (internal diameter) | 2 | VIP vent pipe | B7 | eCompendium S.4 | Yes ("at least") |
| 30 | cm (height) | 2 | VIP vent pipe above superstructure | B7 | eCompendium S.4 | Yes ("more than") |
| 120 by 120 | cm | 3 | Minimum transitional/mobile latrine space | C1 | CBM HHoT | Yes ("roughly") |
| 180 by 180 | cm | 3 | Ideal transitional/mobile latrine space | C1 | CBM HHoT | Yes ("though... is a better target") |
| 90 | cm (width) | 3 | Door width | C2 | CBM HHoT | Yes ("at least") |
| 80 by 130 | cm | 3 | Wheelchair transfer space | C3 | CBM HHoT | Yes ("roughly") |
| 150 by 150 | cm | 3 | Wheelchair turning space | C3 | CBM HHoT | Yes ("about") |
| 80 | cm (height) | 3 | Grabrail height | C3 | CBM HHoT | Yes ("approximately") |
| 1 in 10 | ratio | 3 | Accessible-latrine planning target | C4 | CBM HHoT | Yes ("roughly") |
| 50 | m | 3 | Dwelling-to-latrine distance, short-term | C5 | CBM HHoT | Yes ("no more than roughly"), explicitly distinguished from B4 |
| 30 | m | 3 | Dwelling-to-latrine distance, longer-term | C5 | CBM HHoT | Yes ("tightening to no more than about"), explicitly distinguished from B4 |
| 100 | m | 4 | Household-to-collection-point distance | D1 | Oxfam WASH | Yes ("no more than roughly") |
| 10 | m | 4 | Same, initial response phase | D1 | Oxfam WASH | Yes ("tightened further, to no more than about") |
| 100 | liters | 4 | Communal bin size | D2 | Oxfam WASH | Yes ("roughly") |
| 10 | families/bin | 4 | Communal bin ratio | D2 | Oxfam WASH | Yes ("one... for every") |
| 15 | m | 4 | Bin-to-residence distance | D2 | Oxfam WASH | Yes ("at least") |
| 10,000 to 20,000 | people | 4 | Hand-cart transport scale | D3 | Oxfam WASH | Yes ("roughly"), radius qualifier preserved |
| 1 | km (radius) | 4 | Hand-cart transport scale | D3 | Oxfam WASH | Yes ("within about") |
| 50,000 | people | 4 | Motorized-truck threshold | D3 | Oxfam WASH | Yes ("once... exceeds roughly") |
| 30 | m | 4 | Waste-burial-pit siting distance | D4 | Oxfam WASH | Yes ("at least"), explicitly disclaimed as distinct from latrine-siting/hazard figures |
| 1.5 | m (above water table) | 4 | Waste-burial-pit siting | D4 | Oxfam WASH | Yes ("at least"), same explicit disclaimer |
| 85 | % | 4 | General/non-hazardous health-care waste | D5 | WHO | Yes ("roughly") |
| 15 | % | 4 | Hazardous health-care waste | D5 | WHO | Yes ("the remaining") |
| 6 | m³ / 50 people/week | 4 | Burial capacity reference figure | D7 | Oxfam WASH | Yes ("about") |
| 3 | m³ / 200 people/week | 4 | Landfill design capacity reference figure | D7 | Oxfam WASH | Yes ("about") |

**32 distinct numeric figures found across 5 articles, all tracing to
a valid frozen claim ID and a source confirmed as directly read.** No
changed units, no merged ranges, no lost qualifiers, no duplicated
number carrying two different unacknowledged meanings. Article 5
independently confirmed to contain zero numeric figures, matching its
frozen claim set (E1-E4 are all mechanism/procedure/synthesis claims
with no operational number).

## Similar-but-Distinct Numeric Claims Audit

Independently searched the full pack for every occurrence of "30" (the
number appearing most often across genuinely different claims) and
verified each is properly disambiguated:

| Occurrence | Article | Unit | Claim | Disambiguation present in text? |
|---|---|---|---|---|
| "20 to 30 centimeters" | 2 | cm | B3, trench width | Yes - clearly a width figure in a construction paragraph, different order of magnitude and unit from the meter-scale siting figures |
| "15 to 30 meters" | 2 | m | B4, groundwater siting | Yes - explicit sentence: "This siting distance is separate from the vertical clearance... covered in 'Shelter Site Selection...'" |
| "more than 30 centimeters" | 2 | cm | B7, VIP vent height | Yes - clearly a vent-pipe construction figure, distinct paragraph and unit from the meter-scale siting figures |
| "no more than about 30 meters" | 3 | m | C5, dwelling-to-latrine distance | Yes - explicit sentence: "this is a different measurement from how far a latrine needs to sit from a groundwater source (see 'Latrine Types...' for that separate figure)" |
| "at least 30 meters" | 4 | m | D4, waste-burial-pit siting | Yes - explicit sentence: "it is not the same measurement as, and should not be confused with, the separate distance figures used for latrine siting or for settlement-wide hazard distances covered elsewhere" |

**Result: no accidental conflation found.** Three genuinely distinct
30-meter figures exist across the pack (B4 groundwater siting, C5
dwelling-latrine distance, D4 waste-burial-pit siting), exactly as the
Research Plan's own Source Conflict / Ambiguity Handling section
anticipated - each is explicitly disambiguated in its own paragraph,
consistent with that section's instruction not to assert equivalence
between numerically similar but independently-sourced figures.

Also independently checked: the pack's single "1.5 meters" occurrence
(D4, waste-burial-pit water-table clearance) is not accompanied by any
sentence implying it is the same rule as Emergency Shelter Systems'
already-published 1.5m toilet-pit water-table clearance (which is
never restated as a number anywhere in this pack, correctly
cross-linked instead via B5). The "500" figure (Water Treatment at
Scale's water-point distance) does not appear anywhere in this pack,
confirmed via full-text search.

## Cross-Pack Ownership Audit

Independently re-inspected every cross-pack reference in the final
prose.

- **Household 30m latrine/well guidance:** does not appear anywhere in
  this pack - confirmed via full-text search for "well" and "stream"
  in a household-distance context; the core article is referenced only
  by title (Article 5's E3 cross-link, Article 1's A5 handwashing
  cross-link), never by restating its 30m figure.
- **Emergency 1:50 toilet ratio:** does not appear as a number anywhere
  in this pack - Article 1's A3 sentence references "the wider ratio
  used at the very start" and points to "Shelter Site Selection and
  System Planning" by title, without restating "50."
- **1.5m water-table clearance (Emergency Shelter Systems' toilet-pit
  figure):** does not appear as a restatement anywhere - Article 2's
  B5 cross-link sentence names the concept ("vertical clearance a
  latrine needs above the water table itself") and points to the ESS
  article by title, with no number given. The one "1.5 meters" that
  does appear in the pack (Article 4, D4) is a distinct, independently
  sourced claim about waste-burial-pit siting, not a restatement of
  ESS's figure, and is explicitly disclaimed as such in-text.
- **<500m water-point figure (Water Treatment at Scale):** confirmed
  absent via full-text search - see C6 Heightened Audit above.

**Numbers that appear in this pack for a distinct, supported claim
were correctly retained, not removed merely because the same number
appears elsewhere** (D4's 30m/1.5m, C5's 30m, B7's 30cm) - each is a
genuinely different, independently-sourced claim object, and removing
them would have been an over-correction the task specifically warned
against.

**Result: PASS, no finding.**

## Drainage/Greywater Exclusion Audit

Searched the full text of all 5 articles for: drainage, greywater,
graywater, wastewater, runoff, soakaway, soak pit, sullage, effluent.

**Result: zero occurrences of any of these terms anywhere in the
pack.** The v1.0.0 exclusion is intact; no operational drainage/
greywater guidance was accidentally introduced during Stage 4 Writing,
and none was added during this review.

## Article Architecture Audit

- **Duplicated responsibilities:** none found. Each article's claim
  set maps to exactly one article in the final prose; no claim ID
  appears in two articles.
- **Gaps created during drafting:** none found - all 32 claims are
  present and accounted for (see Claim-to-Source Map).
- **Article 3 becoming too broad:** not found - its 7 claims (space/
  layout, door, wheelchair access, accessible-ratio, distance, GBV,
  privacy/segregation) all sit coherently under "accessibility, safety,
  and dignified use," matching the approved architecture; no unrelated
  content drifted in.
- **D5 fitting coherently inside Article 4:** confirmed - D5 sits as a
  boundary/exclusion claim within Article 4's existing solid-waste
  scope, consistent with D1-D4/D6/D7's shared subject.
- **Article 5 duplicating construction or planning guidance:**
  checked specifically - Article 5 cross-links Article 2 for VIP
  construction detail (does not repeat the 11cm/30cm figures) and
  cross-links the core corpus for household-scale pit-closure (does
  not restate its content). No duplication found.

**Result: PASS, no finding. No architecture change recommended** - the
5-article structure remains coherent in the actual final prose, not
just in the pre-writing plan.

## Sources-Section Audit

Every article's `## Sources` section checked directly against the
Source Collection's access log (see the Source Access Log table above
for the full per-source breakdown):

- **Article 1:** eCompendium, CDC, SSWM, Oxfam WASH (Handwashing
  Stations), Watershed Management Group - all five directly read, all
  five genuinely used.
- **Article 2:** CDC, SSWM, eCompendium (VIP S.4) - all three directly
  read, all three genuinely used.
- **Article 3:** CBM HHoT, SSWM (GBV page) - both directly read, both
  genuinely used.
- **Article 4:** Oxfam WASH (Waste Management), WHO (Health-care
  waste) - both directly read, both genuinely used.
- **Article 5:** eCompendium (Single Pit Latrine S.3) - directly read,
  genuinely used.

**Confirmed: no inaccessible or dead-linked source appears in any
article's Sources section as though directly verified.**

**Result: PASS, no finding.**

## Metadata and Terrain Review

- **manifest.md:** `pack_id`, `pack_name`, `pack_version` (1.0.0), and
  `description` all accurate and consistent with the actual 5-article
  pack. No temporary sprint/process language and no publication or
  verification claim exceeding the pack's actual current state. **No
  fix needed.**
- **Frontmatter:** all five articles have required `title`/`category`;
  `knowledge_level: Level 2` is a consistent fit across the pack;
  `verification_level: Unverified` correctly set on all five.
- **Terrain:** none of the 5 articles carry a `terrain` tag.
  Independently reconsidered this pass, not mechanically confirmed:
  every article's content (planning ratios, construction figures,
  accessibility dimensions, waste-management distances, maintenance
  procedures) is genuinely universal - none of it is specific to a
  particular terrain type in the actual final prose. Correctly
  omitted; no fix needed.

## Related-Articles Validation

Every slug independently re-checked this pass via a direct filesystem
search (not assumed from the Stage 4 Writing report) - **13 slug
references across the pack, all valid, 0 missing, 0 invented**: the 5
`ccss_` slugs (each confirmed to exist as a real file in this pack's
own directory), `sanitation_hygiene_and_disease_prevention` (confirmed
in the core corpus), `ess_shelter_site_selection_and_system_planning`
(confirmed in Emergency Shelter Systems), and
`wts_assessing_community_water_needs_and_protecting_the_source`
(confirmed in Water Treatment at Scale). No orphan articles - every
`ccss_` article has at least one inbound and one outbound in-pack
link. No unnecessary link explosion - each article links to 3-5
targets, all genuinely relevant.

## Visual Comprehension Review

Recorded for future Visual Knowledge Engine planning only - no image
generated, no schema change, no article metadata added.

| Concept | Classification | Notes |
|---|---|---|
| VIP latrine airflow/fly-trap mechanism (Article 2, B7) | **Visual strongly recommended, with an explicit caution** | A labeled cross-section diagram showing airflow direction and the fly-trap-via-light path would directly reinforce the mechanism; **must not** depict pipe materials, mesh specifications, or a specific construction sequence beyond the verified 11cm/30cm figures |
| Camp sanitation system planning / service chain (Article 1, A1) | Visual helpful | A simple flow diagram of the five service-chain stages (user interface → containment → collection/transport → treatment → disposal/reuse) would reinforce the article's central framing without adding new specificity |
| Accessible sanitation facility layout (Article 3, C1-C3) | **Visual strongly recommended** | A labeled floor-plan diagram showing door width, transfer space, and turning space would make the wheelchair-accessibility figures much easier to apply correctly than text dimensions alone; must stay within the exact confirmed figures (80x130cm, 150x150cm, 80cm grabrail height) |
| Solid-waste handling boundary between ordinary refuse and hazardous health-care waste (Article 4, D5) | Visual helpful | A simple two-box diagram (85% general / 15% hazardous, with the hazardous box explicitly routed away from ordinary community systems) could reinforce the segregation principle; must not depict any specific treatment/disposal method for the hazardous fraction, consistent with D5's explicit scope limit |
| Distance-figure disambiguation across the pack (B4 groundwater siting, C5 dwelling-latrine distance, D4 waste-burial-pit siting) | Text sufficient - no visual recommended | These three genuinely distinct 30m-scale figures are already disambiguated in prose; a single comparative diagram risks visually implying they're variations of one rule rather than three independent measurements - the current text-only, article-by-article treatment is the safer approach |

## Fixes Applied During Review

1. **Article 2 (Latrine Types and Construction...)** - removed an
   unsupported timing claim from B1's opening paragraph (originally
   stated packet latrines "can be deployed almost immediately" and
   eco-san/UDDT systems are "usually chosen for longer-term or more
   permanent settings"; neither timing pattern is stated in the
   directly-read CDC source, which only confirms immediate-phase use
   of chemical toilets or trench/pit latrines, and elevated toilets
   targeted for high water tables). This fix was applied during Stage
   4's own self-audit, before this Editorial Review began, and is
   recorded here for completeness since this review independently
   re-confirmed it holds.
2. **Article 4 (Solid Waste Collection and Disposal...)** - added the
   word "ordinary community" to D6's opening sentence ("When ordinary
   community waste has to be burned rather than buried...") to close a
   sequencing ambiguity where D6's incineration guidance, appearing
   immediately after D5's explicit disclaimer that this article does
   not cover hazardous health-care waste treatment, could be misread
   as filling that gap. No new claim or number was introduced - this
   is a scope-clarifying word change only.

No factual content was invented to replace what was removed; no new
operational number was introduced; no claim (including B7, C6, and D5)
was materially redesigned - the one genuine fix this review pass found
(D6's scope clarification) preserved every confirmed figure and
boundary exactly, within this sprint's explicit "safe editorial fix"
authority.

## Safety and Scope Audit

Searched the entire pack for every prohibited category and overclaim
pattern:

- **Tactical, weapon-making, trap-making, or evasion content:** none
  found anywhere.
- **Guaranteed-outcome language ("this will get you rescued"-style
  claims):** none found - B7 explicitly avoids a performance
  guarantee (see B7 Heightened Audit); C6 explicitly avoids a safety
  guarantee (see C6 Heightened Audit); no other article makes an
  outcome-guarantee claim.
- **"Reduces risk" silently transformed into "prevents"/"eliminates":**
  specifically searched for this transformation across all 5 articles
  - not found anywhere.
- **Specific medication dosages, invasive procedures, childbirth
  management, toxic-substance handling thresholds, or structural
  load-bearing figures (the §9.3 categories):** none found - D5's
  85%/15% composition figure is categorical, not a handling threshold,
  consistent with the Research Plan's Determination A reasoning,
  independently re-confirmed by this review's D5 Heightened Audit.

**Result: PASS, no finding beyond what's already covered in the
heightened audits above.**

## Reviewer Sign-off

- **Reviewer name/handle:** Claude (AI agent)
- **Date:** 2026-07-20
- **Scope:** Full Editorial Review of the final draft (manifest.md + 5
  articles) - structural checklist, Claim-to-Source Map built fresh
  against final prose, heightened B7/C6/D5 audits, full independently
  rebuilt numeric-claim audit, similar-but-distinct numeric claims
  audit, cross-pack ownership audit, drainage/greywater exclusion
  audit, article architecture audit, Sources-section audit,
  metadata/terrain review, related-articles validation, visual
  comprehension review, pack-wide safety/scope audit.
- **Sources personally re-confirmed as accurately represented this
  pass:** all 11 distinct source entries listed in the Source Access
  Log above - checked against the article prose for honest
  representation, not re-fetched (re-fetching is Stage 6's job, not
  this sprint's).
- **Findings:** 2 fixes applied (1 already applied during Stage 4
  self-audit and independently re-confirmed this pass; 1 new scope-
  clarification fix in Article 4/D6 found and applied this pass); 0
  Critical, 0 High, 0 Medium findings left open; 0 Stage 6 blockers
  identified beyond the standard requirement that formal Source
  Verification has not yet occurred.
- **Statement:** This review confirms every claim in the final prose
  traces to a directly-read source or is honestly written as general
  knowledge/cross-link/editorial synthesis, confirms all 32 frozen
  claims remain present and within their narrowed boundaries (with
  particular confirmation on B7, C6, and D5), confirms no prohibited-
  scope content appears anywhere in the pack, and confirms the
  drainage/greywater exclusion holds. **This review is explicitly a
  structural/traceability Editorial Review, not the formal post-
  drafting Human/AI-agent Source Verification pass required by
  `QUALITY_STANDARD.md` §9** - it does not re-fetch and re-read every
  source from scratch the way a dedicated Stage 6 pass would, and does
  not close that stage's gate. Traceability is not verification.

## Verification Level: Per-Article Status

| Article | `verification_level` | Why |
|---|---|---|
| Assessing Sanitation Needs and Planning a Community System | Unverified | Claims trace cleanly to source; formal post-drafting Source Verification not yet performed |
| Latrine Types and Construction for Camp and Emergency Settings | Unverified | Same - contains B7, the pack's most detailed construction-mechanism claim; its Stage 6 pass should be thorough |
| Accessibility, Safety, and Dignified Use of Sanitation Facilities | Unverified | Same - contains C6, the pack's safety/dignity-sensitive claim |
| Solid Waste Collection and Disposal at Community Scale | Unverified | Same - contains D5, the pack's health-care-waste boundary claim; one scope-clarification fix applied this pass |
| Operation, Maintenance, and Decommissioning of Sanitation Systems | Unverified | Same |

## Publication Decision

- **Pack:** `hv_official_community_camp_sanitation_systems`
- **Version under decision:** 1.0.0
- **Decision:** **Not Yet Approved.** No article is `Verified Source`;
  nothing in this pack may be packaged or released.
- **Decided by:** Claude (AI agent) - Editorial Review only; this is
  not, and does not purport to be, a Founder Publication Decision.
- **Date:** 2026-07-20
- **Conditions to reach Approved:** (1) formal post-drafting Human/
  AI-agent Source Verification per `QUALITY_STANDARD.md` §9, covering
  every claim row in the Claim-to-Source Map above against the exact
  (now-corrected) final wording, with particular rigor on B7, C6, and
  D5; (2) each article's `verification_level` updated honestly from
  that pass; (3) a separate, explicit Founder Publication Decision,
  matching the precedent of every previously-released pack.

### Why `verification_level` stays `Unverified`

Every claim row in the Claim-to-Source Map above reads "Yes" for
within-boundary representation - this might look like the
precondition for `Verified Source` is already met. It is not: those
"Yes" marks reflect claims that were directly read during Research/
Source Collection, then *traced and corrected* against final prose
this Editorial Review - which is a structural/traceability pass, not
the dedicated, independent, word-for-word re-verification of the
shipped sentences against source text that formal Source Verification
performs as its own stage. The §9.3 Determination A for D5 (recorded
in the Research Plan) is not final-prose verification either - it
determined D5's narrowed claim boundary does not require Founder
confirmation, and this review found and fixed one place (D6's scope
clarity) where the draft's sequencing, though not its facts, could
have been misread in a way the Determination never addressed. That is
exactly why Stage 6 exists as a separate, later step, not folded into
this one.

## Version Review History

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| 1.0.0 | 2026-07-19 | Topic approved by the Founder; Research Plan and Source Collection completed, then targeted-closed (B7, C6, D5 resolved with narrowing; D5 given §9.3 Determination A) | Pre-writing and closure stages complete | Claude (AI agent); The Founder | Not Yet Approved (pre-writing stage) |
| 1.0.0 | 2026-07-20 | Stage 4 Writing: manifest.md + 5 articles drafted from the frozen 32-claim set; 1 overreach found and fixed during self-audit | Draft complete, all 5 articles `Unverified` | Claude (AI agent) | Not Yet Approved |
| 1.0.0 | 2026-07-20 | Editorial Review of final draft: Claim-to-Source Map built fresh against final prose; heightened B7/C6/D5 audits; full independently rebuilt numeric-claim and similar-but-distinct numeric audits; cross-pack ownership audit; drainage/greywater exclusion audit; article architecture audit; Sources-section audit; metadata/terrain review; related-articles validation; visual comprehension review; 1 new fix applied (D6 scope clarification) | 0 Critical, 0 High, 0 Medium findings remain open (1 found this pass, fixed; 1 prior fix independently re-confirmed) | Claude (AI agent) | **Not Yet Approved** - pending formal post-drafting Source Verification and a separate Founder Publication Decision |

## Status

Editorial draft, structurally sound: 5 of 5 articles internally
consistent, all 32 claims traceable to a directly-read source or
honestly general knowledge/cross-link/editorial synthesis, B7/C6/D5
confirmed to preserve their exact narrowed boundaries, no prohibited-
scope content found anywhere, drainage/greywater exclusion confirmed
intact, all `related_articles` slugs valid, one genuine defect (D6
scope-sequencing ambiguity) found and fixed during this review. All 5
articles remain `verification_level: Unverified` pending formal
post-drafting Human/AI-agent Source Verification against the exact,
now-corrected final wording - not yet performed. Publication Decision:
**Not Yet Approved.**

**Editorial readiness: READY FOR FORMAL SOURCE VERIFICATION.** No
Critical or High finding remains unresolved (none was found). The one
Medium-equivalent finding (D6 scope-sequencing ambiguity) was fixed
during this pass, not merely logged as a Stage 6 blocker. The
Claim-to-Source Map is complete.

## Stage 6 Targets (Recorded, Not Performed This Sprint)

The following require fresh, independent re-verification against
source text during Stage 6 - none of these are resolved by this
Editorial Review, which is a traceability pass, not a re-verification
pass:

- All 11 distinct sources in the Source Access Log above need to be
  re-fetched and re-read fresh, word-for-word against the current
  (post-fix) final prose - not merely re-confirmed from this pass's
  representation check.
- **B7 (VIP latrine mechanism)** - highest priority given its detailed
  construction figures (11cm, 30cm) and mechanism description.
- **C6 (GBV/lighting)** - re-verify the exact "not sufficient alone"
  framing against a fresh SSWM re-read.
- **D5 (health-care waste)** - re-verify the 85%/15% figures and named
  categories against a fresh WHO re-read; re-confirm the §9.3
  Determination A reasoning still holds against the final, D6-adjusted
  prose.
- Every other claim row in the Claim-to-Source Map (A1-A7, B1-B6,
  C1-C5/C7, D1-D4/D6-D7, E1-E4) still needs its own fresh Stage 6
  re-read, per the standard pipeline - none has been exempted by this
  review.

