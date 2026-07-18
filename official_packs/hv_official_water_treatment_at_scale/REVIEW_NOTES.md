# Review Notes - Water Treatment at Scale (v1.0.0)

**This is editorial source content only. It is not yet a distributable
ZIP and not yet approved for publication until the Publication
Decision section below says otherwise.**

This is the pack's first Editorial Review, performed against the
actual final draft prose in `official_packs/hv_official_water_treatment_at_scale/`,
not merely against the pre-writing Research Plan, Source Collection,
Human Verification Workbook, or Founder Confirmation Packet (all of
which were re-read fresh this pass, but treated as background, not as
a substitute for reading the shipped sentences themselves).

## Editorial Review Checklist

*(Per `editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md`.)*

**A. Identity and structure**
- [x] `pack_id` (`hv_official_water_treatment_at_scale`) uses the
      `hv_official_` prefix.
- [x] `pack_id` is not already used elsewhere in `official_packs/`.
- [x] `pack_version` (`1.0.0`) is well-formed semver.
- [x] Every article's `category` (Survival; Engineering ×5) is a valid
      display name.
- [x] No article slug collides with the core corpus (checked directly
      against `registry_generator/lib/src/validation.dart`'s 31-slug
      snapshot) or another article in this pack.

**B. Tone and register** - [x] Consistent calm, plain, field-manual
register across all six articles; no marketing or alarmist language.

**C. Source-attribution discipline** - [x] Every non-obvious claim is
either attributed to a directly-read source or written as general
knowledge - see the Claim-to-Source Map below for the full trace. One
synthesis phrasing (Article 2's coagulant-dose paragraph) combines a
sourced method with a reasonable operational implication not verbatim
in the source quote - flagged in the Map, not treated as unsupported.

**D. Safety and scope boundaries** - see "Content Boundaries Audit"
and "Heightened Review: Article 4" below.

**E. Verification level integrity** - [x] All six articles read
`verification_level: Unverified`. None claims `Verified Source`
despite extensive pre-writing claim confirmation - correct, since a
verification pass on the claim *plan* is not the same as verifying the
final *prose*, and formal post-drafting Human/AI Source Verification
has not yet been performed (out of scope this sprint).

## Source Access Log

Carried forward in full from `water_treatment_at_scale_SOURCE_COLLECTION.md`
and `water_treatment_at_scale_FOUNDER_CONFIRMATION_PACKET.md` - both
re-read fresh this pass and confirmed unchanged since the prior
sprint. Five sources directly read and cited: the Global WASH Cluster
eCompendium (9 pages), Oxfam WASH (2 pages), SSWM University Course
Module 6 (1 page), CAWST WASH Resources (1 page), and WHO Water Safety
Planning (1 page). See those two files for the complete per-page
record, access-attempt log for inaccessible sources (WHO Technical
Notes, Sphere Handbook, ReliefWeb, UNICEF Sudan, CDC, oasisdesign.net),
and the verbatim quotes behind the 8 §9.3 claims. Not duplicated here
to avoid a second, potentially-drifting copy of the same record.

## Claim-to-Source Map

Built fresh this pass by re-reading all 6 final articles end to end
and tracing every meaningful factual claim, operational instruction,
quantitative value, and safety-sensitive statement back to its claim
ID and source. 28 of the pack's pre-writing claim IDs (A1-A4, B1-B4,
C1-C5, D1-D6, E1-E4, F1-F5) were found intact in the final prose - all
trace cleanly, none was dropped, and no claim ID's content was
expanded beyond its Research-Plan/Workbook boundary. One synthesis
statement and several pure editorial/framing sentences were also
identified (rows marked accordingly).

| Article | Claim in the article | Source | Directly verified? | Reviewer | Date | Notes |
|---|---|---|---|---|---|---|
| 1 | ~15 L/person/day community planning figure (A1) | eCompendium D.7 | Yes | Claude (AI agent) | 2026-07-18 | Traced to final prose exactly; presented as "commonly used... not a guarantee" |
| 1 | Distribution planning limits: ≤250 users/tap, ≥0.125 L/s, ≤500m, ≤30min (A2) | eCompendium D.7 | Yes | Claude (AI agent) | 2026-07-18 | The source's ≥5m pressure figure was NOT included in final prose (only "enough pressure to reach the farthest point") - a conservative omission, not an error |
| 1 | Source protection generalized from single-well siting (A3) | Cross-link to `well_digging_and_safe_water_access.md` | N/A - editorial generalization | Claude (AI agent) | 2026-07-18 | Explicitly framed as "the same underlying principle... scaled up," matches the confirmed drafting boundary |
| 1 | Water Safety Plan / catchment-to-consumer / incremental approach (A4) | WHO Water Safety Planning | Yes | Claude (AI agent) | 2026-07-18 | No WHO endorsement of this specific pack implied |
| 1 | "Getting these right shapes every later stage..." (Summary framing) | N/A | N/A - editorial framing | Claude (AI agent) | 2026-07-18 | Connective sentence, no independent factual content |
| 2 | Sedimentation + 1-hour/clarity field test (B1) | eCompendium T.4 | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 2 | Aluminum coagulant pH 6-8 + 0.2 mg/L health limit + stated remedy (B2) | eCompendium T.4 | **Yes - §9.3 Founder-confirmed** | Claude (AI agent); Founder | 2026-07-18 | Matches confirmed drafting boundary exactly, including the source's own remedy |
| 2 | "determined experimentally, using a side-by-side settling test... picking the smallest dose that clears the water adequately" | eCompendium T.4 (jar-test method) | **Synthesis - flag for Stage 6** | Claude (AI agent) | 2026-07-18 | The jar-test *method* is directly sourced; "picking the smallest dose" is a reasonable operational implication of dose-testing, not a verbatim source quote - should be specifically re-checked word-for-word against source text during formal Source Verification, not assumed |
| 2 | Roughing filtration pre-treats highly turbid water; pre-treatment only, not a disinfection substitute (B3) | eCompendium T.1 | Yes | Claude (AI agent) | 2026-07-18 | Specific NTU figures (~500→~10) were authorized but not included in final prose - conservative, not an error |
| 2 | Target turbidity depends on next treatment step (B4) | eCompendium T.4/T.6/T.9 | Yes | Claude (AI agent) | 2026-07-18 | Specific 5-10 NTU figure omitted in final prose - conservative |
| 3 | SSF requires low turbidity, <10 NTU typical, peaks to 30-50 tolerated (C1) | eCompendium T.9 + SSWM Module 6 | Yes | Claude (AI agent) | 2026-07-18 | Both sources' ranges given together honestly |
| 3 | Flow rate and dimension design figures (C2) | eCompendium T.9 (dimensions + one flow range) + SSWM Module 6 (other flow range) | Yes | Claude (AI agent) | 2026-07-18 | **See "Article 3 Flow-Rate Audit" below - re-verified this pass, the previously-corrected false equivalence remains fixed and no new instance was found** |
| 3 | High pathogen removal when properly built/maintained, not a guarantee (C3) | eCompendium T.9 + SSWM Module 6 | Yes (recommended spot-check never performed - see Note) | Claude (AI agent) | 2026-07-18 | Framed conservatively as required; the Workbook's *recommended* (non-mandatory) human spot-check for this claim was never done - noted, not a blocker, since §9.3 does not literally require it |
| 3 | Biosand filter (household) + iSSF (institutional) variant (C4) | CAWST WASH Resources | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 3 | Maintenance: scrape top sand layer (C5) | eCompendium T.9 + SSWM Module 6 | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 4 | Dose depends on turbidity/demand; jar-test method; both sources' example ranges shown separately (D1) | eCompendium T.6 + Oxfam WASH | **Yes - §9.3 Founder-confirmed** | Claude (AI agent); Founder | 2026-07-18 | **See "Heightened Review: Article 4" below** |
| 4 | 30-min contact time; temp-doubling and pH<8 rule attributed to Oxfam only (D2) | eCompendium T.6 (30-min figure) + Oxfam WASH (temp/pH rule) | **Yes - §9.3 Founder-confirmed** | Claude (AI agent); Founder | 2026-07-18 | Attribution now explicit in prose ("Oxfam WASH reports that...") |
| 4 | Three-tier FRC: distribution target 0.5-1.2, delivery min 0.2, consumption min 0.2 mg/L (D3) | Oxfam WASH (three-tier) + eCompendium T.6 (simpler figure, not conflated) | **Yes - §9.3 Founder-confirmed, NARROWED form** | Claude (AI agent); Founder | 2026-07-18 | Final prose uses the narrowed three-tier wording, not the original single-range wording |
| 4 | Upper FRC limit 4.0-5.0 mg/L, Oxfam-only (D4) | Oxfam WASH only | **Yes - §9.3 Founder-confirmed, NARROWED form** | Claude (AI agent); Founder | 2026-07-18 | Final prose explicitly names Oxfam WASH for this figure and explicitly states eCompendium does not give a number |
| 4 | Point-of-supply hardware: ~2 mg/L, 10-30 L/min, 1,500-2,500 L/tablet (D5) | eCompendium H.7 | **Yes - §9.3 Founder-confirmed** | Claude (AI agent); Founder | 2026-07-18 | Manufacturer-variance caveat included |
| 4 | Organic content → harmful by-products caution (D6) | eCompendium T.6 | Yes | Claude (AI agent) | 2026-07-18 | Framed as a reason to pre-treat, not as a chlorination limitation on chemical contaminants generally |
| 5 | Tank sizing ~10L-1,000L+, ≥1 day + up to 3 days contingency (E1) | eCompendium D.6 | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 5 | Ventilation, screening, cleaning frequency (E2) | eCompendium D.6 | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 5 | Shock chlorination 50 mg/L, O&M context only (E3) | eCompendium D.6 | **Yes - §9.3 Founder-confirmed, NARROWED form** | Claude (AI agent); Founder | 2026-07-18 | **See "Article 5 Shock-Chlorination Audit" below** |
| 5 | Distribution design limits + cross-contamination mechanisms (E4) | eCompendium D.7 | Yes | Claude (AI agent) | 2026-07-18 | Correctly cross-references Article 1's A2 figures rather than restating as new |
| 6 | Chlorine residual testing methods (DPD1, test strips) (F1) | Oxfam WASH | Yes | Claude (AI agent) | 2026-07-18 | Specific mg/L measurement ranges omitted in final prose - conservative |
| 6 | E. coli field classification, conservative framing (F2) | Oxfam WASH | Yes (recommended spot-check never performed) | Claude (AI agent) | 2026-07-18 | "Roughly" hedging used throughout, matches confirmed conservative framing |
| 6 | WHO chemical guideline values, 4 distinct categories preserved (F3) | Oxfam WASH | **Yes - §9.3 Founder-confirmed** | Claude (AI agent); Founder | 2026-07-18 | **See "Article 6 F3 Audit" below** |
| 6 | Monitoring frequency by source type (F4) | Oxfam WASH | Yes | Claude (AI agent) | 2026-07-18 | Traced exactly |
| 6 | Rebuilding after failure - incremental, disinfection-first (F5) | No source; general knowledge | N/A - general knowledge | Claude (AI agent) | 2026-07-18 | Correctly not attributed to any specific document |

**Weakest-link check:** every row reads `Yes`, `Yes (§9.3
Founder-confirmed)`, or `N/A` - no row reads `No`. Per
`03_CLAIM_VERIFICATION_TEMPLATE.md`'s own rule, this is the
*precondition* for `Verified Source`, but is explicitly **not**
sufficient by itself - see "Why `verification_level` stays
`Unverified`" under Publication Decision, below. This Map traces
pre-writing verification against final prose; it is not itself the
formal, dedicated post-drafting Human/AI Source Verification pass.

## Heightened Review: Article 4

Full operational chain re-audited: **source-water condition → dose
determination/jar testing → chlorine application → contact time →
residual measurement → adjustment → distribution/consumption.**

- **eCompendium and Oxfam WASH dosage figures remain separately
  attributed** - confirmed. Final prose names both organizations
  explicitly ("the Global WASH Cluster eCompendium reports... Oxfam
  WASH reports...").
- **The genuine D1 numeric divergence is visible, not hidden** -
  confirmed. Both ranges are stated side by side with their own
  turbidity brackets; the text explicitly says these reflect
  "different organizations' typical guidance rather than one single
  correct number."
- **No single universal chlorine dosage is implied** - confirmed. The
  paragraph ends "not a number to apply directly without testing the
  actual water."
- **Contact time is not detached from source conditions** - confirmed.
  Temperature-doubling and pH dependency are stated in the same
  paragraph as the 30-minute figure, explicitly attributed to Oxfam
  WASH.
- **FRC values are not collapsed into one universal target** -
  confirmed. Three tiers (distribution target / delivery minimum /
  consumption minimum) are named individually with their own figures.
- **Distribution-point, point-of-delivery, and household-consumption
  values remain conceptually distinct** - confirmed, per above.
- **The 4.0-5.0 mg/L figure is attributed only to Oxfam** - confirmed,
  final prose explicitly says "Oxfam WASH reports that... The Global
  WASH Cluster eCompendium does not itself state a specific upper
  number."
- **No number is presented as universally safe outside its source
  context** - confirmed; every figure carries an explicit qualifier
  ("roughly," "commonly cited," "reported by") and the dose/contact-
  time/residual figures are each explicitly tied to the condition they
  depend on.
- **Measurement and adjustment are part of the procedure, not
  background** - confirmed. "If a reading comes back low at any of
  these points, that signals more chlorine or more contact time is
  needed - the sequence loops back rather than ending" makes the
  adjustment loop explicit, and the closing paragraph restates the
  whole sequence as one connected procedure.

**No ambiguity found that would let a reader apply a source-specific
number as a universal field instruction.** No genuine source conflict
was silently resolved - the D1 dosage divergence is preserved
in full for Stage 6, not smoothed over.

## Numeric-Claim Audit (All 6 Articles)

| Article | Number/range | Refers to | Claimed source | Attribution explicit? | Units consistent? | Transformed/converted? | Heightened verification needed? |
|---|---|---|---|---|---|---|---|
| 1 | ~15 L/person/day | Community distribution planning | eCompendium D.7 | Yes | Yes | No | No |
| 1 | ≤250 users/tap, ≥0.125 L/s, ≤500m, ≤30min | Distribution design limits | eCompendium D.7 | Yes | Yes | No | No |
| 2 | pH 6-8 | Aluminum coagulant effectiveness range | eCompendium T.4 | Yes | Yes | No | No (already §9.3-confirmed as part of B2) |
| 2 | 0.2 mg/L | Aluminum health limit | eCompendium T.4 | Yes | Yes | No | Already §9.3 Founder-confirmed |
| 3 | <10 NTU (peaks 30-50) | SSF influent turbidity | eCompendium T.9 + SSWM | Yes | Yes | No | No |
| 3 | 0.1-0.4 m/h + 0.6-1.2m/1.0-1.5m dims | SSF flow/dimensions (source 1) | eCompendium T.9 | Yes | Yes | No | No |
| 3 | 0.1-0.3 m³/h/m² (≈100-300 L/h/m²) | SSF flow rate (source 2) | SSWM Module 6 | Yes | **Yes - re-verified this pass, see below** | Yes, but correctly (internal unit conversion within the same source's own figure, not cross-source) | No |
| 3 | 90-99%+ pathogen removal | SSF effectiveness | eCompendium T.9 + SSWM | Yes | Yes | No | Recommended (not performed - see Claim-to-Source Map, C3) |
| 4 | 0.5-2 / up to 6 mg/L | Chlorine dose (non-turbid/turbid) | eCompendium T.6 | Yes | Yes | No | Already §9.3 Founder-confirmed (D1) |
| 4 | 2.0 / 4.0-5.0 mg/L | Chlorine dose (<10 NTU / 10-100 NTU) | Oxfam WASH | Yes | Yes | No | Already §9.3 Founder-confirmed (D1) |
| 4 | 30 min, doubling per 10°C, pH<8 | Contact time | eCompendium (30 min) + Oxfam (rest) | Yes | Yes | No | Already §9.3 Founder-confirmed (D2) |
| 4 | 0.5-1.2 / 0.2 / 0.2 mg/L | FRC, 3 tiers | Oxfam WASH | Yes | Yes | No | Already §9.3 Founder-confirmed (D3) |
| 4 | 4.0-5.0 mg/L | FRC upper limit | Oxfam WASH | Yes | Yes | No | Already §9.3 Founder-confirmed (D4) |
| 4 | ~2 mg/L, 10-30 L/min, 1,500-2,500 L | Point-of-supply hardware | eCompendium H.7 | Yes | Yes | No | Already §9.3 Founder-confirmed (D5) |
| 5 | ~10L-1,000L+, ≥1 day, ≤3 days | Tank sizing | eCompendium D.6 | Yes | Yes | No | No |
| 5 | 50 mg/L | Shock chlorination | eCompendium D.6 | Yes | Yes | No | Already §9.3 Founder-confirmed (E3) |
| 5 | ≥5m, ≥0.125 L/s, ≤250/tap, 0.7-3 m/s | Distribution network (cross-ref to Art 1) | eCompendium D.7 | Yes | Yes | No | No |
| 6 | monthly / twice-yearly / yearly | Monitoring frequency by source | Oxfam WASH | Yes | Yes | No | No |
| 6 | roughly 0 / ≤10 / 10-100 / >100 per 100mL | E. coli classification | Oxfam WASH | Yes | Yes | No | Recommended (not performed - F2) |
| 6 | (no specific mg/L figures stated) | WHO chemical guideline values | Oxfam WASH | N/A - figures deliberately omitted from prose | N/A | N/A | Already §9.3 Founder-confirmed (F3), figures themselves not published in article text |

**Arithmetic/unit re-check performed independently this pass:** 0.1
m³/h per m² = 100 L/h per m² (1 m³ = 1,000 L; 1,000 L ÷ 10 = 100 L);
0.3 m³/h per m² = 300 L/h per m². The article's "0.1 to 0.3 cubic
meters per hour... equivalently, about 100 to 300 liters per hour"
statement is **arithmetically correct** as a same-source unit
conversion. Confirmed this is *not* compared against the other
source's 0.1-0.4 m/h figure as if equivalent (the previously-corrected
false equivalence, described below, remains fixed).

**No new conversion or range-combination error found** anywhere else
in the pack this pass.

## Article 3 Flow-Rate Audit

Re-checked the corrected passage word-for-word. Confirmed:

- 0.1-0.4 m/h (eCompendium) and 0.1-0.3 m³/h/m² (SSWM) are presented
  as two separately-attributed source ranges ("one source reports...
  another reports...").
- Neither is described as mathematically equivalent to the other -
  the "equivalently" phrase now applies only to the SSWM figure's own
  internal unit restatement (m³/h/m² ↔ L/h/m²), not a cross-source
  comparison.
- No incorrect conversion remains anywhere else in Summary, Main
  Content, or Benefits - checked all three sections plus Article 4's
  and Article 6's cross-references to Article 3, none restate the
  flow-rate figures at all (they only reference the article by title),
  so there is no second location where the error could have
  propagated.
- Readers are explicitly told **not** to treat either range as a
  universal spec: "a specific design should be checked against a real
  reference rather than either figure alone."

**Result: the correction holds. No regression found.**

## Article 5 - Shock Chlorination Audit

Separated per the task's three-part test:

1. **What the source actually states:** "Shock chlorination (at a
   rate of 50mg/L) can also be used for disinfection," in the page's
   Operation and Maintenance section, following a sentence about
   washing out the tank interior and repairs.
2. **What the article presents as general safety reasoning (not
   source-attributed):** the final prose explicitly separates these -
   "Because this concentration is far higher than water intended for
   drinking (tens of times higher than the doses used for routine
   disinfection), a tank treated this way should not be returned to
   normal use until it has been thoroughly flushed and is confirmed to
   be back within normal drinking-water disinfection levels - **this
   is a common-sense precaution given how much higher the cleaning
   concentration is, not a specific flushing procedure recommended by
   name in this article's sources.**" The bolded clause (present
   verbatim in the article) is the article doing exactly what was
   required: labeling its own reasoning as its own, not the source's.
3. **Any operational instruction added during drafting:** the
   "thoroughly flushed... confirmed to be back within normal
   drinking-water disinfection levels" language is an instruction, but
   it is explicitly self-identified as general reasoning, not sourced
   fact - no specific flush duration, volume, or number of cycles is
   given (which would have been an unsupported invented number; none
   was added).

**Result: no general safety reasoning is falsely source-attributed.**
The flushing guidance is present but explicitly and correctly labeled
as the article's own reasoning, cross-referencing the pack's own
verified routine-dosing figures (D1-D4) rather than citing a source
that doesn't support it - exactly matching the Founder-confirmed
drafting boundary for E3.

## Article 6 - F3 Guideline-Value Audit

Confirmed the article preserves all four distinct categories from the
source without collapsing them:

- Health-based long-term (arsenic, fluoride) - present as a named
  category with example contaminants.
- Short-term/population-specific (nitrate, infant-specific) - present,
  explicitly marked as "not a general long-term limit for everyone."
- Combined health/aesthetic (manganese) - present, explicitly
  described as "two different figures for two different reasons."
- Aesthetic-only (iron) - present, explicitly states "no published
  health-based guideline value at all."

**No sentence found that could be read as "below the number =
universally safe" or "above the number = universally unsafe."** The
article's own framing sentence directly forecloses this reading:
"treating them as one universal 'safe below, unsafe above' rule would
be misleading." Specific mg/L figures (0.01 arsenic, 1.5 fluoride, 11
nitrate, 0.4/0.1 manganese, 0.3 iron) were confirmed available and
Founder-confirmed, but the final prose deliberately did not publish
them, describing categories only - more conservative than the
confirmed boundary required, not a violation of it. No additional
contaminant interpretation beyond the confirmed boundary was found.

**Result: PASS, exceeds the required conservatism.**

## §9.3 Eight-Claim Traceability (Final Prose vs. Founder-Confirmed Boundary)

| Claim | Result |
|---|---|
| B2 | **(A) Stays within boundary.** Aluminum pH range + 0.2 mg/L limit + stated remedy, attributed exactly as confirmed. |
| D1 | **(A) Stays within boundary.** Both sources' dose ranges shown separately, explicitly named, jar-test method stated as the actual determination method. |
| D2 | **(A) Stays within boundary.** 30-min figure + Oxfam-attributed temp/pH dependency, matching exactly. |
| D3 | **(A) Stays within the narrowed boundary.** Three-tier FRC structure used, not the original single-range wording. |
| D4 | **(A) Stays within the narrowed boundary.** Single-source (Oxfam) attribution used explicitly. |
| D5 | **(A) Stays within boundary.** All three figures + manufacturer-variance caveat included. |
| E3 | **(A) Stays within the narrowed boundary.** 50 mg/L figure sourced; "differs from routine dosing"/flushing framing explicitly self-labeled as general reasoning, not source-attributed. |
| F3 | **(B) Narrows conservatively.** All four category distinctions preserved per the confirmed boundary, but the specific mg/L figures themselves - though confirmed and permitted - were omitted from final prose entirely. |

**No claim falls into (C) expands beyond, (D) changes operational
meaning, or (E) introduces a new number/instruction.** All 8 either
stay exactly within their confirmed boundary or narrow it further.
None requires treatment as a new, unconfirmed claim.

## Content Boundaries Audit

Checked the whole pack for the six prohibited implications:

- **"Clear water is necessarily safe water"** - not found. Article 2
  explicitly frames clarity as a precondition for the *next* treatment
  step, never as an endpoint.
- **"Filtration alone guarantees microbiological safety"** - not
  found. Article 3 explicitly states filtration "should not be relied
  on as the only barrier" and recommends pairing with disinfection.
- **"Chlorination removes chemical contaminants"** - not found.
  Article 4 states the opposite risk (chlorine reacting with organic
  matter to *create* by-products), never claims chemical removal.
- **"One treatment method handles every contamination type"** - not
  found; the manifest and every article's framing explicitly divides
  responsibility across stages.
- **"A fixed chlorine dose works for all source waters"** - not found;
  explicitly disclaimed multiple times in Article 4.
- **"A single water-quality measurement proves long-term safety"** -
  not found; Article 6's Summary explicitly states monitoring "is not
  a one-time task."

**Result: no Critical or High content-boundary finding.**

## Metadata and Structural Review

- **manifest.md:** `pack_id`, `pack_name`, `pack_version` (1.0.0),
  `description` all present and accurate; body text correctly
  contains no editorial-process language, matching the established
  pattern from the three released packs' manifests.
- **Frontmatter:** all 6 articles have required `title`/`category`;
  optional fields consistently populated.
- **Categories:** Survival (Article 1), Engineering (Articles 2-6) -
  all valid.
- **`knowledge_level`:** Level 2 for Articles 1, 2, 3, 5, 6; Level 3
  for Article 4 - a reasonable fit, since Article 4 is the one article
  genuinely requiring specialized judgment and carrying real risk if
  performed incorrectly, per `docs/Knowledge_Authoring_Standard_v1.md`
  §8's own definition of Level 3.
- **Terrain fields - genuineness evaluated, not just presence:**
  Article 4 originally tagged all 4 valid terrain IDs
  (tropical_rainforest, urban, desert, coastal) with no differentiated
  reasoning - chlorine disinfection chemistry does not actually vary
  by biome in a way this taxonomy captures. This read as coverage
  tagging, not genuine relevance, contrary to `WRITING_GUIDELINES.md`'s
  explicit instruction not to "tag all four IDs by default just to
  maximize visibility." **Fixed this pass:** terrain field removed
  entirely from Article 4 (terrain is optional; omitting it is safer
  than an indefensible partial subset). Articles 1, 2, 3, 5, 6 retain
  their terrain tags from Writing - each has at least a plausible,
  if modest, content-based rationale (e.g., Article 1's desert/
  coastal/urban tags relate to water-scarcity and piped-infrastructure
  planning contexts) - **flagged as a Low finding for a future pass to
  reconsider with fresher eyes**, rather than unilaterally stripped,
  since systems/infrastructure content is generally less
  terrain-differentiated than a specific field technique and this
  project's terrain taxonomy was not designed with that content type
  specifically in mind.
- **Related-article validation:** every `related_articles` slug across
  all 6 articles checked directly against real files on disk this
  pass (both this pack's own filenames and the referenced core-corpus
  slugs against `registry_generator`'s 31-slug snapshot). All resolve
  correctly. No typo, no broken reference. Cross-link symmetry: all 6
  in-pack articles have at least one inbound and one outbound
  `related_articles` link to a sibling article; no article is a pure
  sink or pure source within the pack.
- **Sources sections:** every article's `## Sources` list matches
  exactly what's cited in `## Main Content` - no source listed that
  isn't used, no claim attributed to a source absent from `## Sources`.

## Visual Comprehension Review

Recorded for future Visual Knowledge Engine planning only - no image
generation, schema change, or article metadata was added this sprint.

| Concept | Classification | Why |
|---|---|---|
| Community water-treatment process flow (source→pre-treatment→filtration→disinfection→storage→distribution→monitoring) | **Visual strongly recommended** | The pack's central systems-knowledge concept (Canon Philosophy §16's "must not silently flatten a loop/chain into a misleading linear read"); currently conveyed only through six separate articles' cross-links and manifest prose - a single diagram would let a reader grasp the whole chain before reading any one article in depth |
| Sedimentation/clarification sequence (settle → optional coagulant → optional roughing filter) | Visual helpful | Text conveys the decision logic adequately; a diagram would reinforce it, not replace a genuine gap |
| Slow sand filter structure (tank, sand bed, standing water layer, underdrain) | **Visual strongly recommended** | A cross-section is a fundamentally spatial concept; a reader with no prior exposure to sand filters is unlikely to form an accurate mental model from prose alone |
| Chlorine dosing → contact time → residual testing → adjustment loop | **Visual strongly recommended** | This is Article 4's core "connected sequence, not five numbers" claim - a flowchart with an explicit loop-back arrow would make the adjustment step far less missable than prose alone, directly serving this article's own stated purpose |
| Safe storage and distribution layout (tank placement, screened openings, pipe-above-wastewater rule) | Visual helpful | The individual rules are each simple; a layout diagram would mainly help by showing them together in one place |
| Sampling/measurement points across the system (source, distribution point, delivery, household) | Visual helpful | Directly serves Article 4's D3 three-tier FRC distinction and Article 6's monitoring content - a labeled system diagram would make "which point are we talking about" immediately visually clear where prose currently requires careful reading |

## Reviewer Sign-offs

**Sign-off 1**
- **Reviewer:** Claude (AI agent)
- **Date:** 2026-07-18
- **Scope:** Full Editorial Review of the final draft (all 6 articles
  + manifest.md) - structural checklist, Claim-to-Source Map built
  fresh against final prose, heightened Article 4 review, numeric-
  claim audit, Article 3/5/6 targeted audits, §9.3 eight-claim
  traceability check, content-boundaries audit, metadata/terrain
  review, related-article validation, visual comprehension review.
- **Findings:** See sections above. One synthesis phrasing flagged
  (Article 2), one terrain over-tagging found and fixed (Article 4),
  no Critical or High findings, no unsupported factual claim found.
- **Statement:** This review confirms every claim in the final prose
  traces to a source or is honestly written as general knowledge, and
  confirms the pre-writing §9.3 confirmations still match the final
  wording. **This review is explicitly a structural/traceability
  Editorial Review, not the formal post-drafting Human/AI-agent
  Source Verification pass required by `QUALITY_STANDARD.md` §9** -
  it does not re-derive verification independently from first
  principles the way a dedicated Stage 6 sign-off would, and does not
  close that stage's gate.

## Verification Level: Per-Article Status

| Article | Current `verification_level` | Why |
|---|---|---|
| Assessing Community Water Needs and Protecting the Source | Unverified | Claims trace cleanly to source, but formal post-drafting Source Verification not yet performed |
| Pre-Treating Water at Community Scale | Unverified | Same - includes one flagged synthesis phrasing to specifically re-check at Stage 6 |
| Filtration Systems Beyond Single-Person Scale | Unverified | Same - flow-rate correction re-confirmed holding; C3's recommended spot-check still outstanding |
| Disinfection at Batch and Community Scale | Unverified | Same - all 6 claims individually strong (5 §9.3 Founder-confirmed), but this remains the pack's highest-risk article and its Stage 6 pass should be the most thorough |
| Safe Storage, Distribution, and Preventing Recontamination | Unverified | Same - E3 already carefully separated sourced fact from reasoning |
| Monitoring Water Quality and Maintaining the System Over Time | Unverified | Same - F2's recommended spot-check still outstanding; F3 exceeds required conservatism |

Not one article is `Verified Source`. Not one claim-row reads `No`,
but per `QUALITY_STANDARD.md` §9.1's four-layer model, Verification
*Status* still requires the Evidence to come from a completed
verification pass against the actual claim as published - this
Editorial Review traced and confirmed that evidence exists and is
consistent, but did not itself perform or formally close that pass.

## Publication Decision

- **Pack:** `hv_official_water_treatment_at_scale`
- **Version under decision:** 1.0.0
- **Decision:** **Not Yet Approved.** One or more articles' claims are
  not yet formally verified against final prose (no article is
  `Verified Source`); nothing in this pack may be packaged or
  released.
- **Decided by:** Claude (AI agent) - Editorial Review only; this is
  not, and does not purport to be, a Founder Publication Decision.
- **Date:** 2026-07-18
- **Conditions to reach Approved:** (1) formal post-drafting Human/
  AI-agent Source Verification per `QUALITY_STANDARD.md` §9, covering
  every claim row in the Claim-to-Source Map above against the exact
  final wording - with particular attention to the flagged synthesis
  phrasing (Article 2) and the two outstanding recommended spot-checks
  (C3, F2); (2) each article's `verification_level` updated honestly
  from that pass; (3) a separate, explicit Founder Publication
  Decision, matching the precedent of every previously-released pack.

### Why `verification_level` stays `Unverified`

Every claim row in the Claim-to-Source Map reads `Yes` or `N/A` - none
reads `No`. This might look, at first glance, like the precondition
for `Verified Source` is already met. It is not, for one specific
reason: the `Yes` marks in that Map represent claims that were
verified *before* Writing (against the planned claim wording in the
Research Plan/Workbook), then *traced* against final prose this
Editorial Review - which confirmed the final wording matches what was
verified, but is a structural/traceability check, not a fresh,
independent, word-for-word re-verification of the shipped sentences
against source text performed as its own dedicated stage. That
dedicated stage - formal Human/AI-agent Source Verification against
the actual final prose - is explicitly out of scope for this sprint
and remains the next required step.

## Version Review History

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| 1.0.0 | 2026-07-17 | Topic approved by the Founder; Research Plan, Source Collection, and pre-writing Human Verification Workbook completed (28 claims mapped, 8 flagged for §9.3 mandatory human confirmation) | Pre-writing planning complete | Claude (AI agent) | Not Yet Approved (pre-writing stage) |
| 1.0.0 | 2026-07-18 | 8 §9.3 claims re-audited fresh (3 narrowed: D3, D4, E3), Founder Confirmation Packet created and all 8 claims CONFIRMED by the Founder | Pre-writing §9.3 gate closed | Claude (AI agent); The Founder | Not Yet Approved (still pre-writing) |
| 1.0.0 | 2026-07-18 | Stage 4 Writing: manifest.md + 6 articles drafted from the frozen, confirmed claim set; self-audit found and fixed one numeric equivalence error (Article 3 flow rates) and tightened Article 4 source attribution | Draft complete, all 6 articles `Unverified` | Claude (AI agent) | Not Yet Approved |
| 1.0.0 | 2026-07-18 | Editorial Review of final draft: Claim-to-Source Map built fresh against final prose; heightened Article 4 review; numeric-claim audit; targeted Article 3/5/6 audits; §9.3 eight-claim traceability check; content-boundaries, metadata/terrain, related-article, and visual-comprehension reviews; one terrain over-tagging fixed (Article 4) | 0 Critical, 0 High, 1 Medium (terrain over-tagging, fixed), 1 Low (terrain genuineness on remaining 5 articles, flagged not fixed), 1 informational (Article 2 synthesis phrasing flagged for Stage 6) | Claude (AI agent) | **Not Yet Approved** - pending formal post-drafting Source Verification and a separate Founder Publication Decision |

## Status

Editorial draft, structurally sound: 6 of 6 articles internally
consistent, every claim traceable to a source or honestly general
knowledge, no unsupported factual addition found, no prohibited
safety-boundary implication found, all `related_articles` slugs valid,
one metadata defect found and fixed. All 6 articles remain
`verification_level: Unverified` pending formal post-drafting Human/
AI-agent Source Verification against the exact final wording - not yet
performed. Publication Decision: **Not Yet Approved.**
