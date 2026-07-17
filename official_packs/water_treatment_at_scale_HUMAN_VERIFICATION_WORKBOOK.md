---
pack_id: hv_official_water_treatment_at_scale
---

# Human Verification Workbook — Water Treatment at Scale

Pre-writing claim-by-claim verification map, built before drafting per
the Founder's decision ("this approval authorizes research and
pre-writing preparation only"). The filename preserves this project's
established naming convention; standing governance
(`pack_production_workflow/QUALITY_STANDARD.md` §9) now permits
qualified AI-agent verification, so "Human" in this filename describes
the required *rigor*, not exclusively who performs it - per §9.4.

No claim below is marked verified merely because a source appears
relevant. "Verification result: Verified" is used only where the
source was directly read (see `water_treatment_at_scale_SOURCE_COLLECTION.md`)
and the source's actual text was checked against the claim as stated.

## Claim map

| Claim ID | Article | Exact claim boundary | Source | Source access status | Direct-read status | Verification result | Safety escalation status | Human confirmation required | Drafting boundary | Fallback if verification fails |
|---|---|---|---|---|---|---|---|---|---|---|
| A1 | 1 | A commonly-cited minimum water quantity target (~15 L/person/day) exists for planning a community distribution system | eCompendium D.7 | Accessed | Yes | Verified | Normal | No | State as "a commonly used planning figure," attributed | Present as a range/planning figure, not an absolute universal minimum |
| A2 | 1 | Distribution planning limits exist: ≥5m pressure, ≥0.125 L/s/tap, ≤250 users/tap, ≤500m walking distance, ≤30-min round trip | eCompendium D.7 | Accessed | Yes | Verified | Normal | No | State as design targets, not guarantees of achieved service | Same |
| A3 | 1 | Protecting a shared/community source follows the same underlying separation-from-contamination principle as a single well, generalized to larger scale | Cross-link to `well_digging_and_safe_water_access.md` (existing, already-published core article) | N/A - internal cross-link | N/A | N/A - editorial generalization, not a new external claim | Normal | No | Explicitly frame as "the same underlying principle, at a larger scale" and cross-link rather than restate | If Editorial Review finds the generalization unfair, narrow to "consult a water/sanitation authority for community-scale siting" |
| A4 | 1 | A systematic, risk-based, catchment-to-consumer planning approach ("water safety planning") is the recommended way to think about a community water system | WHO water safety planning page | Accessed | Yes | Verified | Normal | No | Describe the approach conceptually; do not claim WHO endorses this specific pack | N/A |
| B1 | 2 | Sedimentation lets suspended particles settle before further treatment; ~1 hour settling + 80% clarity is a practical field test | eCompendium T.4 | Accessed | Yes | Verified | Normal | No | State as a rule of thumb, attributed | N/A |
| B2 | 2 | Aluminum-based coagulants work best at pH 6-8 and have a health-based upper concentration limit in clarified water | eCompendium T.4 | Accessed | Yes (pH range); limit figure directly read but flagged (see escalation) | Verified (pH range); **Escalated** (health limit) | **High - specific toxic-substance/chemical threshold** | **Yes** | Do not state the specific mg/L limit in the article until a named human reviewer confirms it in a Reviewer Sign-off block, per §9.3 | State generally: "a recognized upper safety limit exists for coagulant residue; do not exceed manufacturer/authority dosing guidance" without the exact figure |
| B3 | 2 | Roughing filtration pre-treats highly turbid water (up to several hundred NTU) down to a level suitable for slow sand filtration | eCompendium T.1 | Accessed | Yes | Verified | Normal (pre-treatment sizing/engineering, not a dosing/toxicity figure) | No | State the ~500→~10 NTU figures as sourced, with the explicit caveat that this is pre-treatment only, not a substitute for disinfection | N/A |
| B4 | 2 | A target turbidity (roughly 5-10 NTU depending on the next step) is the practical goal of pre-treatment | eCompendium T.4, T.6, T.9 (cross-corroborated across 3 pages) | Accessed | Yes | Verified | Normal | No | State as a range, explicitly tied to which treatment step follows | N/A |
| C1 | 3 | Slow sand filtration requires low raw-water turbidity (roughly <10 NTU, occasional peaks tolerated) | eCompendium T.9 + SSWM Module 6 | Accessed (both) | Yes (both) | Verified (two independently corroborating sources) | Normal | No | State the range from both sources | N/A |
| C2 | 3 | Specific flow-rate and dimension design parameters exist (flow ~0.1-0.4 m/h or 0.1-0.3 m³/h/m²; sand depth 0.6-1.2m; water height 1.0-1.5m) | eCompendium T.9 + SSWM Module 6 | Accessed (both) | Yes (both) | Verified, with both sources' slightly different ranges stated honestly | Normal (engineering sizing, not a health-dosing figure) | No | Present both ranges rather than collapsing to one number | N/A |
| C3 | 3 | Properly built/maintained slow sand filters can achieve high pathogen removal (figures range 90-99%+ across sources, varying by organism) | eCompendium T.9 + SSWM Module 6 | Accessed (both) | Yes (both) | Verified, but **flagged for conservative framing** | **Elevated - microbiological safety claim, not literally in the 5 named §9.3 categories but judged functionally equivalent in health consequence** | Recommended (not strictly mandatory under §9.3's literal list, but a Founder/human spot-check is recommended before this claim ships) | State as "can achieve high removal when properly built and maintained (exact figures vary by source and organism - see Sources)," never as a guarantee, and pair with a caution not to rely on filtration alone without disinfection | If no spot-check occurs, keep the language qualitative ("substantially reduces") rather than citing a specific percentage as the headline claim |
| C4 | 3 | A household-scale biosand filter and an institutional-scale variant (iSSF, for settings like schools) both exist | CAWST WASH Resources | Accessed | Yes | Verified | Normal | No | State plainly, cross-link to the concept of household vs. community scale | N/A |
| C5 | 3 | Maintenance requires periodically scraping the top sand layer | eCompendium T.9 + SSWM Module 6 | Accessed (both) | Yes (both) | Verified | Normal | No | State plainly | N/A |
| D1 | 4 | Chlorine dosing depends on raw-water turbidity and is normally determined experimentally (jar test), not a single fixed number | eCompendium T.6 + Oxfam WASH | Accessed (both) | Yes (both) | Verified | **High - toxic-substance handling** | **Yes** | Do not present as a ready-to-apply instruction until human-confirmed | State the *existence* of the jar-test method and cite typical reported ranges, explicitly labeled "confirm with a qualified authority before field dosing" |
| D2 | 4 | A standard minimum contact time (commonly 30 minutes at pH<8, doubling per 10°C temperature drop) | eCompendium T.6 + Oxfam WASH | Accessed (both) | Yes (both) | Verified | **High** | **Yes** | Same as D1 | Same as D1 |
| D3 | 4 | A target free residual chlorine (FRC) range exists at point of delivery (0.2-0.5 mg/L), with a lower minimum (0.2 mg/L) still required at point of consumption | eCompendium T.6 + Oxfam WASH (attributes point-of-delivery figure to Sphere) | Accessed (both) | Yes (both) | Verified | **High** | **Yes** | Same as D1 | Same as D1 |
| D4 | 4 | An upper safety/palatability limit on FRC exists (never exceed ~4-5 mg/L; palatability concerns above ~1-2 mg/L) | Oxfam WASH | Accessed | Yes | Verified | **High** | **Yes** | Same as D1 | Same as D1 |
| D5 | 4 | Point-of-supply chlorination hardware (tablet chambers, venturi liquid dosing) exists, with typical flow-rate (10-30 L/min) and tablet-capacity (1,500-2,500 L) figures | eCompendium H.7 | Accessed | Yes | Verified | **High (dosing-adjacent, describes disinfection hardware calibration)** | **Yes** | Describe the hardware concept; do not present the specific capacity figures as field-ready calibration without confirmation | Describe qualitatively ("chlorine is released as water flows through the device, requiring periodic monitoring and adjustment") without the exact figures if unconfirmed |
| D6 | 4 | High organic content can produce harmful disinfection by-products (e.g. trihalomethanes) when chlorinated | eCompendium T.6 | Accessed | Yes | Verified | Normal (a caution, not a dosing figure) | No | State as a reason to pre-treat turbid/organic-rich water before chlorinating | N/A |
| E1 | 5 | Community storage tanks range widely in size (~10L to 1,000L+) and are sized to daily demand plus a contingency margin (≥1 day, up to 3 days for solar/wind-pumped systems) | eCompendium D.6 | Accessed | Yes | Verified | Normal | No | State as sizing guidance, not a fixed rule | N/A |
| E2 | 5 | Tanks need ventilation, screened inlet/outlet/overflow openings, and periodic cleaning to prevent contamination and pest/insect breeding | eCompendium D.6 | Accessed | Yes | Verified | Normal | No | State plainly | N/A |
| E3 | 5 | Shock disinfection (a much higher chlorine concentration than routine dosing, ~50 mg/L) is used to clean/disinfect a tank before return to service, never for routine drinking-water dosing | eCompendium D.6 | Accessed | Yes | Verified, but **flagged** | **High - toxic-substance handling threshold, elevated further by being a much higher concentration than routine dosing** | **Yes** | Do not state the specific mg/L figure until human-confirmed; the qualitative safety point (much higher than drinking concentration, must be fully flushed before use) may still be stated | State qualitatively: "a much higher chlorine concentration than routine drinking-water dosing is used for tank disinfection, followed by thorough flushing before the tank returns to service - confirm exact concentration and flush procedure with a qualified authority" |
| E4 | 5 | Distribution networks have design limits and specific cross-contamination risks (intermittent operation causing negative pressure at leaky joints; water pipes must run above wastewater pipes) | eCompendium D.7 | Accessed | Yes | Verified | Normal (engineering/hygiene principle, not a dosing figure) | No | State plainly | N/A |
| F1 | 6 | Field-level chlorine residual testing methods exist (DPD1 tablets/photometer, test strips) with stated accuracy trade-offs | Oxfam WASH | Accessed | Yes | Verified | Normal (describes a testing method, not a dosing instruction) | No | State plainly | N/A |
| F2 | 6 | A simple field classification of bacteriological contamination risk exists, based on indicator-organism counts (0 / 1-10 / 10-100 / >100 per 100mL) | Oxfam WASH | Accessed | Yes | Verified, but **flagged for conservative framing** | **Elevated - directly informs a drink/don't-drink judgment** | Recommended (spot-check) | State the classification as a general planning/monitoring reference, explicitly not a substitute for professional lab confirmation where available | If no spot-check occurs, present qualitatively ("higher counts mean higher risk and a stronger case for treatment") alongside the numeric table, not the numeric table alone |
| F3 | 6 | WHO-style chemical guideline values exist for specific contaminants (arsenic 0.01 mg/L, fluoride 1.5 mg/L, nitrate 11 mg/L as N, manganese 0.4/0.1 mg/L) | Oxfam WASH | Accessed | Yes | Verified, but **flagged** | **High - specific toxic-substance handling thresholds, the clearest §9.3 match in this pack besides Article 4** | **Yes** | Do not state the specific figures until human-confirmed; may state that WHO guideline values exist and testing is only needed when a specific problem is suspected | State qualitatively: "WHO publishes specific guideline values for certain chemical contaminants; testing for these is only recommended when a specific risk is suspected - consult WHO's guidelines or a local water-testing authority for exact figures" |
| F4 | 6 | Recommended monitoring frequency varies by source type (open wells monthly; covered/piped/spring sources twice yearly; rainwater yearly) | Oxfam WASH | Accessed | Yes | Verified | Normal | No | State plainly | N/A |
| F5 | 6 | Maintaining/rebuilding a community water system after damage or infrastructure loss is best approached incrementally, re-securing disinfection first | No single source found this pass; generalized from WHO's water safety plan "incremental improvement" framing (A4) | N/A | N/A | N/A - written as general knowledge | Normal | No | Write as general, non-source-specific practical knowledge (`N/A - general knowledge` row in the eventual Claim-to-Source Map), not attributed to a specific document | If Editorial Review wants a named source, research a dedicated post-disaster WASH recovery reference before this claim ships |

## Summary

- **Total claims mapped:** 28 (A1-A4, B1-B4, C1-C5, D1-D6, E1-E4,
  F1-F5)
- **Verified via direct read, no further action needed:** 16 (A1, A2,
  A4, B1, B3, B4, C1, C2, C4, C5, D6, E1, E2, E4, F1, F4)
- **Verified via direct read, but require §9.3 mandatory human
  confirmation before the specific figure may ship:** 8 (B2, D1, D2,
  D3, D4, D5, E3, F3) - concentrated almost entirely in Article 4
  (Disinfection) plus one claim each in Articles 2, 5, and 6.
- **Verified via direct read, recommended (not mandatory) human
  spot-check for conservative framing:** 2 (C3, F2)
- **No source found; planned as general knowledge:** 1 (F5 -
  rebuilding after failure)
- **Editorial generalization from an existing core article (not a new
  external claim):** 1 (A3)

Article 4 (Disinfection at Batch and Community Scale) is this pack's
single highest-verification-burden article: every one of its 6 claims
either requires §9.3 mandatory human confirmation or is a non-dosing
caution. Writing should not proceed on Article 4's specific numeric
claims until that confirmation happens, or the article must be drafted
using only the qualitative fallback language specified above.

**This Workbook does not itself verify anything and does not
authorize Writing.** It is the claim-by-claim map Editorial Review
will re-check independently, per
`editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`, exactly
as this project's prior three packs' workbooks were used.
