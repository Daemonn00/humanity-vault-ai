---
pack_id: hv_official_emergency_shelter_systems
---

# Human Verification Workbook — Emergency Shelter Systems

Pre-writing claim-by-claim verification map, built before drafting per
the Founder's decision ("this approval authorizes research, scope
definition, and source collection only"). The filename preserves this
project's established naming convention; standing governance
(`pack_production_workflow/QUALITY_STANDARD.md` §9) permits qualified
AI-agent verification, so "Human" in this filename describes the
required *rigor*, not exclusively who performs it - per §9.4.

No claim below is marked verified merely because a source appears
relevant. Two candidate claims for Article 5 (shelter orientation
and vulnerable-group housing) found only via a blocked source's search
summary were **not assigned claim IDs at all**, rather than being
entered as unresolved rows - they do not yet exist as claims this pack
intends to publish.

**Update, 2026-07-18 (Targeted Verification Closure):** Article 3's
two previously-`UNRESOLVED` claims (C2, C3) and D6 were closed this
pass - see the "Pre-Writing Claim Freeze" section at the end of this
document for the full record. C2 was **replaced** with a narrower,
non-procedural general-knowledge claim after 8 total access attempts
(across this and the prior sprint) failed to directly verify the
specific anchoring hardware/technique originally planned. C3 was
**removed** entirely - its underlying concern (site drainage) is
already covered at the correct scope by Article 1's directly-verified
A1-A2. D6 was **verified** against a freshly-found USFA source. No
claim was left `UNRESOLVED` after this pass.

## Claim map

| Claim ID | Article | Exact claim boundary | Source | Access status | Verification status | Safety criticality | Numeric/operational status | Drafting boundary | Conservative fallback |
|---|---|---|---|---|---|---|---|---|---|
| A1 | 1 | A site should have roughly 2-4% slope for drainage, not exceeding 10% | UNHCR Settlement Planning | Directly read | Verified | Normal | Numeric (percentage range) | State as a planning target with the source's own range | If narrower confirmation needed later, present as "gentle slope, not flat and not steep" qualitatively |
| A2 | 1 | Groundwater table should be at least 3m below the surface; toilet pits no deeper than 1.5m above the water table | UNHCR Settlement Planning | Directly read | Verified | Normal (protects water supply, cross-links to Water Treatment at Scale) | Numeric | State plainly, cross-link to Water Treatment at Scale for the water-supply-protection rationale | N/A |
| A3 | 1 | Space allocation tiers exist for settlement planning: ~45 sqm/person recommended, 30 sqm/person minimum (excl. agriculture), 15 sqm/person for household gardens; below ~29 sqm/person is strongly discouraged | UNHCR Settlement Planning | Directly read | Verified | Normal | Numeric | State as planning targets, not guarantees of what any real site achieves | N/A |
| A4 | 1 | Minimum 2m spacing between structures, ideally 2x structure height; 30m firebreak every 300m between built-up areas | UNHCR Settlement Planning + Safe and Secure Settlements (both directly read, cross-corroborating) | Directly read (2 independent pages) | Verified | Elevated (fire-spread prevention) | Numeric | State plainly, cross-link to Article 4's fire-safety content | N/A |
| A5 | 1 | Distance-from-hazard rules: ≥1km from standard dumpsites, ≥5km from hazardous-waste dumpsites, ≥15km from ecologically protected areas, ≥1km from military installations, 50m buffer around surface water | UNHCR Safe and Secure Settlements | Directly read | Verified | Elevated (population-scale exposure risk if wrong) | Numeric | State as settlement-siting guidance for those planning a camp/settlement, not individual household advice | If a reader might apply distances to an individual household context, clarify this is settlement-scale guidance |
| A6 | 1 | The same hazard-avoidance principle already used for a single shelter (`basic_shelter_construction.md`) applies at settlement scale, generalized | Cross-link to existing core article | N/A - internal cross-link | N/A - editorial generalization | Normal | N/A | Frame explicitly as "the same principle, at a larger scale," cross-link rather than restate | If Editorial Review finds this unfair, narrow to a purely settlement-scale framing with no generalization claim |
| A7 | 1 | Infrastructure ratios exist for settlement planning: 1 toilet/50 people (emergency), 1 water tap/500 people, 1 health facility/10,000, 1 school/5,000 | UNHCR Settlement Planning | Directly read | Verified | Normal | Numeric | State as planning ratios, cross-link to Water Treatment at Scale and the sanitation article for the underlying systems | N/A |
| B1 | 2 | Minimum covered living space: 3.5 sqm/person in warm climates | UNHCR Emergency Shelter Solutions and Standards | Directly read | Verified | Normal | Numeric | State as a minimum standard | N/A |
| B2 | 2 | Minimum covered living space: 4.5-5.5 sqm/person in cold climates | Same | Directly read | Verified | Normal | Numeric | State as a minimum standard | N/A |
| B3 | 2 | A comparison of shelter-form types exists (tents, plastic sheeting, construction kits, prefab/container units, Refugee Housing Units, rental subsidies) with distinct tradeoffs | Same | Directly read | Verified | Normal | N/A | Present as a comparison, not a ranking - each has a real use case | N/A |
| B4 | 2 | Family tents are specifically noted as unstable in high winds/snow and difficult to heat | Same | Directly read | Verified | Normal (sets up Article 3's topic) | N/A | State plainly, cross-link to Article 3 | N/A |
| B5 | 2 | Design principles: allow occupant modification, prioritize individual family shelters over communal arrangements where feasible, use local materials, respect cultural practices | Same | Directly read | Verified | Normal | N/A | State plainly | N/A |
| B6 | 2 | This pack's shelter forms are distinct from the natural-material lean-to already covered elsewhere | Cross-link to `basic_shelter_construction.md` | N/A - internal cross-link | N/A | Normal | N/A | Cross-link, do not restate lean-to construction | N/A |
| C1 | 3 | Cold-climate and high-wind conditions require structural stability specifically to resist snow and wind loads | UNHCR Emergency Shelter Solutions and Standards | Directly read | Verified | Elevated (structural safety) | N/A (general principle, no figure) | State as the general principle only | N/A |
| C2 | 3 | **REPLACED, 2026-07-18.** Was: specific ground-anchoring technique (guy ropes and pegs, specific angles/spacing). Now: a general, non-procedural claim that a shelter not securely anchored is more vulnerable to wind damage, and that the correct anchoring method depends on the shelter/tent design and ground conditions - follow the manufacturer's instructions (manufactured tents) or a qualified/experienced source (improvised anchoring), rather than a universal technique | No specific source; general engineering/common-sense knowledge, same class as other general-knowledge statements already accepted elsewhere in this corpus (e.g. "a smaller enclosed space is easier to keep warm" in `basic_shelter_construction.md`) | N/A - general knowledge | **GENERAL KNOWLEDGE / EDITORIAL** | Normal (no longer asserts a specific procedure that could be wrong) | N/A - explicitly defers to manufacturer/expert rather than stating a technique | State only the general vulnerability principle and the explicit referral to manufacturer instructions/qualified sources - never a specific angle, depth, spacing, or hardware count | N/A - this IS the fallback for the original C2 |
| C3 | 3 | **REMOVED, 2026-07-18.** Was: foundation/base guidance (stable, well-drained ground, erosion protection) attributed to IFRC. | IFRC Shelter Safety Handbook - HTTP 403 on every attempt, both sprints | Not directly read (final) | **REMOVED** | N/A | N/A | Do not include as a standalone claim; the underlying concern is already covered at the correct scope by Article 1's A1-A2 (directly-verified UNHCR slope/drainage/groundwater figures) - cross-link Article 3 to Article 1 instead | N/A |
| C4 | 3 | Specific snow/wind structural load figures (e.g. kg/m² or kPa) | Never sourced; deliberately not pursued | Not attempted (by design) | **OUT OF SCOPE (confirmed, 2026-07-18)** | Would be highest-elevated (directly matches §9.3's "structural load-bearing figures") if it existed | N/A - no claim exists | **Confirmed out of scope this pass** - a general-public offline knowledge pack is not the right vehicle for formal structural load calculations, matching this project's established practice elsewhere (e.g. Field Comm's declined visual-code figures) | Direct a reader needing precise load calculations to a qualified structural engineer - stated once, generally, not per-claim |
| D1 | 4 | Fuel-burning devices (generators, charcoal grills, gas stoves/ranges) must never be used indoors - CO risk | USFA + EPA (both directly read, cross-corroborating) | Directly read (2 independent Tier 1 sources) | Verified | **High - toxic-substance handling (CO), §9.3-analogous** | N/A (categorical rule, not a dose figure) | Do not present as ready-to-publish `Verified Source` wording until §9.3-equivalent human confirmation occurs, per this Research Plan's Part 5 determination | State the categorical rule only; do not soften into a conditional |
| D2 | 4 | Generators must run outdoors, away from doors/windows/vents/sleeping areas | USFA + EPA | Directly read (2 sources) | Verified | **High** | N/A | Same as D1 | Same as D1 |
| D3 | 4 | CO alarms should be installed in a central location outside each sleeping area, on every level | USFA | Directly read | Verified | **High** | N/A | Same as D1 | Same as D1 |
| D4 | 4 | Vented-fireplace precautions: inspect flue/chimney seasonally, keep damper open until ashes cool, never burn charcoal in a fireplace, use only dry seasoned wood, maintain spark screens | EPA | Directly read | Verified | **High** | N/A | Same as D1 | Same as D1 |
| D5 | 4 | Battery/solar generators avoid toxic fumes and can be used more safely indoors/near windows than fuel generators | EPA | Directly read | Verified | Elevated (contrast case to D1/D2, not itself a hazard) | N/A | State as the safer alternative, explicitly contrasted with D1/D2 | N/A |
| D6 | 4 | **VERIFIED, 2026-07-18.** Keep anything that can burn at least 3 feet from any heat source (space heaters, fireplaces, wood stoves, radiators, candles); turn space heaters off when leaving the room or going to bed; never use an oven to heat a home | USFA, "Heating Fire Safety" page (directly read this pass - not the CO page previously cited) | Directly read | Verified | **High - conservative Founder confirmation (explicitly a "heater... fire" claim family)** | Numeric (3 feet, a fixed federal-authority figure, not manufacturer-specific) | Include in the Founder Confirmation set alongside D1-D4 | State the 3-foot figure and the two operational rules exactly as sourced; do not generalize to other heater types not covered by this source |
| D7 | 4 | Cold-climate stove sizing: a 5-7 kW stove can heat roughly 40-70 sqm of floor area | UNHCR Emergency Shelter Solutions and Standards | Directly read | Verified | Normal (a sizing planning figure, not a life-safety threshold on its own) | Numeric | State as a planning figure | N/A |
| D8 | 4 | Settlement-scale firebreak spacing (30m/300m) applies to shelter/thermal-safety planning, cross-referencing A4 | UNHCR (already directly read for A4) | Directly read | Verified | Elevated | Numeric (same as A4) | Cross-reference A4 rather than restate | N/A |
| E1 | 5 | Settlement typologies exist: formal settlements, transit centres, collective centres, hosting arrangements, individual accommodation in communities, informal settlements | UNHCR (index page - titles confirmed; individual typology page content not yet read) | Partially read (titles only) | Verified at the "these typologies exist and are named thus" level; NOT verified for any typology's specific content | Normal | N/A | State only that these typologies exist and are named thus; do not describe any typology's specific operational content until its own page is directly read | If a typology's specific details are wanted for Writing, read that typology's own page first |
| E4 | 5 | Infrastructure ratios (same as A7) inform occupancy/settlement-life planning | UNHCR (already directly read for A7) | Directly read | Verified | Normal | Numeric (same as A7) | Cross-reference A7 rather than restate | N/A |
| E5 | 5 | Design principles (same as B5): occupant modification, family privacy | UNHCR (already directly read for B5) | Directly read | Verified | Normal | N/A | Cross-reference B5 rather than restate | N/A |
| E6 | 5 | A described progression exists from emergency to durable/transitional shelter solutions, via coordination with government/development partners | UNHCR Emergency Shelter Solutions and Standards | Directly read | Verified | Normal | N/A | State the progression conceptually | N/A |

## Claims deliberately not assigned an ID

Two candidate claims were identified only through a `WebSearch`
summary of Sphere Handbook content (a source blocked on every direct
access attempt this pass) and are **not entered above as unresolved
rows** - they are not yet claims this pack intends to publish at all:

1. A shelter should open onto common space, not directly onto another
   shelter's entrance.
2. Vulnerable population groups should be housed together for social
   cohesion without being clustered in ways that increase their
   vulnerability.

If a future pass successfully reads Sphere Handbook content (or an
equivalent authoritative source covering the same ground) directly,
these can be promoted to real claim IDs at that point - not before.

## Summary (superseded by the Pre-Writing Claim Freeze below - preserved as the accurate record of the prior sprint's own state at the time)

- **Total claims mapped:** 29 (A1-A7, B1-B6, C1-C4, D1-D8, E1, E4-E6)
- **Verified, ready for Writing:** 24 (A1-A7, B1-B6, C1, D1-D5, D7-D8,
  E4-E6)
- **Verified at a limited scope only (titles, not content):** 1 (E1)
- **UNRESOLVED - do not write from these:** 4 (C2, C3, C4, D6)
- **Deliberately unassigned (not yet real claims):** 2 (the Sphere-
  sourced items above)

Article 3 (Anchoring, Wind, and Weather Resistance) has 3 of its 4
claims UNRESOLVED - this is the pack's clear pre-writing bottleneck.
Article 4 (Thermal Management, Ventilation, and Fire Safety) has 7 of
8 claims verified but is flagged for §9.3-equivalent mandatory human
confirmation before any of its high-severity claims (D1-D4) may be
marked `Verified Source` in a future Editorial Review, matching
exactly how Water Treatment at Scale's Disinfection article was
handled.

---

## PRE-WRITING CLAIM FREEZE (2026-07-18, Targeted Verification Closure)

This section supersedes the Summary above as the current state -
the Summary is preserved unchanged as the historical record of the
prior sprint, not deleted, per this document's append-only
convention.

### Final claim count

**27 active claims** (down from 29): A1-A7 (7), B1-B6 (6), C1+C2 (2,
C3 removed and C4 confirmed out-of-scope), D1-D8 (8), E1+E4-E6 (4).

### Removed claims

- **C3** (foundation/drainage guidance attributed to IFRC) - source
  never became accessible after repeated attempts across two sprints;
  the underlying concern is already covered at the correct scope by
  Article 1's A1-A2.

### Replaced claims

- **C2** - was a specific ground-anchoring technique (guy ropes and
  pegs, implied angles/hardware); replaced with a general,
  non-procedural claim (anchoring matters for wind resistance; follow
  manufacturer instructions or a qualified source for the specific
  technique) after 8 total access attempts across two sprints failed
  to directly verify the specific technique. Classified `GENERAL
  KNOWLEDGE / EDITORIAL`, not requiring further source citation.

### Confirmed out of scope (never real claims)

- **C4** (specific snow/wind structural load figures) - confirmed
  this pass as intentionally excluded; a general-public offline
  knowledge pack is not the right vehicle for formal structural load
  calculations.
- Snow-accumulation removal / shelter-deformation monitoring guidance
  - investigated per Part 4's explicit request; no directly-read
    source was found supporting this specific operational guidance
    (only the general "must resist snow weight" design requirement,
    already captured in C1). **Left out entirely, per instruction,
    rather than invented.**

### Newly verified this pass

- **D6** (space heater 3-foot clearance + operational rules) -
  verified against USFA's "Heating Fire Safety" page, directly read
  this pass.

### Unresolved claims remaining

**Zero.** Every claim that existed at the start of this sprint now has
a final status: Verified, Replaced, Removed, or Confirmed Out of
Scope.

### Claims requiring Founder confirmation

**5: D1, D2, D3, D4, D6** - all in Article 4. See
`emergency_shelter_systems_FOUNDER_CONFIRMATION_PACKET.md` for the
full record. C1/C2 (Article 3) do **not** require Founder confirmation
- C1 is a qualitative, non-procedural general principle, and C2's
replacement explicitly defers to manufacturer instructions rather than
asserting a specific technique that could be wrong, which removes the
risk that would have warranted the gate.

### Claims ready for normal Writing (no Founder confirmation needed)

22: A1-A7, B1-B6, C1, C2 (replaced form), D5, D7-D8, E1 (title-scope
only), E4-E6.

**This Workbook does not itself verify anything and does not
authorize Writing.** It is the claim-by-claim map a future Editorial
Review will re-check independently, per
`editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`. The
claim set is now frozen for the next stage (Founder high-risk
confirmation, then Writing) - any further change requires a new,
explicitly-recorded revision, not a silent edit.
