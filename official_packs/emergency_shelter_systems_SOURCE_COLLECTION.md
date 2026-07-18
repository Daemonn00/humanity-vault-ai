---
pack_id: hv_official_emergency_shelter_systems
---

# Source Collection — Emergency Shelter Systems

Every source below was actually attempted this pass (2026-07-18), via
direct `WebFetch`/`WebSearch` tool access, not recalled from training
data. Search-result summaries are recorded honestly as summaries, not
as direct reads, per `QUALITY_STANDARD.md` §4 and §9.

## Source log

### Source: UNHCR Emergency Handbook (emergency.unhcr.org)

- **Citation/URL:** Multiple pages under
  https://emergency.unhcr.org/emergency-assistance/settlement-and-shelter/
  (listed individually below)
- **Publisher:** UNHCR (UN Refugee Agency) - primary global authority
  on refugee/displacement settlement and shelter, co-lead of the
  Global Shelter Cluster with IFRC.
- **Which claims it supports:** Article 1 (all claims), Article 2 (all
  claims), Article 3 (general principle only, see Known Gap), Article
  5 (most claims).
- **Source quality tier:** [x] Tier 1 (official UN agency, primary
  operational guidance for exactly this domain)
- **Directly opened and read in full, per page:**
  - [x] "Principles & Standards for Settlement Planning" - slope
    2-4% ideal (max 10%), groundwater table ≥3m below surface, max
    toilet pit depth 1.5m above groundwater, 45/30/15 sqm-per-person
    space-allocation tiers (29 sqm/person "strongly discouraged" as a
    floor), minimum 2m spacing between structures (ideally 2x height),
    30m firebreak every 300m, infrastructure ratios (1 toilet/50
    people emergency, 1 water tap/500, 1 health facility/10,000, 1
    school/5,000).
  - [x] "Safe and Secure Settlements" - distance-from-hazard rules
    (≥1km from standard dumpsites, ≥5km from hazardous-waste
    dumpsites, ≥15km from ecologically protected areas, ≥1km from
    military installations), hazard avoidance (steep/landslide-prone/
    flood-prone/animal-crossing areas), 50m buffer zones around
    surface water, landmine/UXO clearance requirement, firebreak
    spacing (re-confirms 30m/300m and 2x-height figures), evacuation-
    friendly hardware (sliding latches vs. padlocks).
  - [x] "Emergency Shelter Solutions and Standards" - minimum covered
    living space (3.5 sqm/person warm climates, 4.5-5.5 sqm/person
    cold climates), shelter-type comparison table (tents, plastic
    sheeting, construction kits, prefab/container units, Refugee
    Housing Units, rental subsidies) with explicit tradeoffs including
    "Family Tents... Unstable in high winds/snow; difficult to heat,"
    cold-weather stove sizing (5-7 kW for 40-70 m² floor area),
    insulation guidance (sealing with plastic sheeting/tape, wall/
    roof/floor insulation), design principles (allow occupant
    modification, prioritize individual family shelters over communal
    arrangements where feasible, use local materials, respect cultural
    practices), general cold-climate structural-stability requirement
    ("shelters in cold conditions have to resist snow weight and wind
    forces... structural stability to withstand snow- and wind-
    loads").
  - [x] "/emergency-assistance/settlement-and-shelter" (index page) -
    confirmed the existence and exact titles of settlement typologies
    (formal settlements, transit centres, collective centres, hosting
    arrangements, individual accommodation in communities, informal
    settlements) - page titles only; individual typology pages not
    yet opened this pass.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-18

### Source: U.S. Fire Administration (USFA/FEMA)

- **Citation/URL:**
  https://www.usfa.fema.gov/prevention/life-safety-hazards/carbon-monoxide/
- **Which claims it supports:** Article 4 (CO source identification,
  generator/vent guidance, CO alarm placement).
- **Source quality tier:** [x] Tier 1 (federal fire-safety authority;
  already used successfully as a source in the released Field
  Communication & Wayfinding pack)
- **Directly opened and read in full:**
  - [x] CO source list (furnaces, heaters, generators, dryers, stoves,
    fireplaces), generator placement guidance (outdoors, away from
    doors/windows/vents), vent-maintenance guidance, CO alarm
    placement (central location outside each sleeping area, every
    level), health-impact figure (150+ annual U.S. deaths from
    accidental non-fire CO, sourced to CPSC).
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-18

### Source: U.S. Environmental Protection Agency (EPA)

- **Citation/URL:**
  https://www.epa.gov/emergencies-iaq/power-outages-and-indoor-air-quality-iaq
- **Which claims it supports:** Article 4 (safe/unsafe heating and
  cooking devices indoors during an outage, fireplace precautions,
  battery/solar generator alternative, ventilation balance).
- **Source quality tier:** [x] Tier 1 (federal environmental/health
  authority)
- **Directly opened and read in full:**
  - [x] Explicit prohibition list (gas stoves/ovens/grills/dryers,
    vehicles in attached garages, unvented combustion appliances
    indoors), fireplace precautions (inspect flue/chimney seasonally,
    keep damper open until ashes cool, never burn charcoal in a
    fireplace, use only dry seasoned wood, maintain spark screens),
    battery/solar generator guidance (safer than fuel generators, can
    be used indoors/near windows), fuel-generator placement (outside,
    away from buildings, never under windows/doors/vents/near sleeping
    areas), ventilation-balance guidance (crack windows during cooking
    even when otherwise sealing for temperature).
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-18

### Source: U.S. Fire Administration (USFA/FEMA), "Heating Fire Safety" page

*(Added 2026-07-18, Targeted Verification Closure - a second, distinct
USFA page from the Carbon Monoxide page above.)*

- **Citation/URL:**
  https://www.usfa.fema.gov/prevention/home-fires/prevent-fires/heating/
- **Which claims it supports:** Article 4, D6 (space heater clearance
  and operational rules).
- **Source quality tier:** [x] Tier 1 (federal fire-safety authority)
- **Directly opened and read in full:**
  - [x] "Keep anything that can burn at least 3 feet from all heat
    sources including fireplaces, wood stoves, radiators, space
    heaters or candles." "Turn space heaters off when leaving the room
    or going to bed." "Never use an oven to heat your home." Annual
    professional heating-equipment/chimney maintenance guidance.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-18

## Sources attempted but not directly readable (recorded honestly, not cited as verified)

- **Sphere Handbook** (spherestandards.org, handbook.spherestandards.org,
  and all PDF mirrors attempted - spherestandards.org's own PDFs, a
  shelterprojects.org-hosted mirror, and a UNHCR-S3-hosted mirror) -
  every URL attempted returned either HTTP 403 or was not attempted a
  second way after an initial 403, consistent with this project's
  established, repeated Sphere/large-NGO domain-blocking pattern
  (already documented across all four prior pack productions). The
  interactive handbook subdomain also 403'd. **Not directly read.**
  Two candidate claims found only via `WebSearch` summary (shelter
  orientation - opening onto common space, not another shelter's
  entrance; grouping vulnerable populations without isolating them)
  are **excluded from the frozen claim set** as a result.
- **IFRC Shelter Safety Handbook** (ifrc.org-hosted PDF) - HTTP 403 on
  the direct fetch attempt. Not directly read. This was the strongest
  candidate source for Article 3's anchoring/foundation technique;
  its absence is the direct cause of Article 3's Known Gap.
- **UNHCR "Family Tent" specification PDF**
  (emergency.unhcr.org/sites/default/files/Family%20Tent.pdf) - fetch
  failed with "maxContentLength size of 10485760 exceeded" (the file
  is too large for the fetch tool as configured). Not directly read.
  A `WebSearch` summary attributed specific pole/guy-rope counts (3
  upright poles, 1 ridge pole, 6 side poles, 4 door poles, 3 guy
  ropes) and a "securely anchored... with guy ropes and pegs"
  anchoring instruction to this document and/or the Shelter Design
  Catalogue, but neither was independently confirmed by direct read
  this pass. **Not cited as verified; excluded from the frozen claim
  set.**
- **UNHCR Emergency Shelter Solutions and Standards, print/PDF export**
  (emergency.unhcr.org/print/pdf/node/538) - fetched successfully as a
  binary file, but the content was graphic/compressed-stream data with
  no extractable text (the same illustrated-PDF failure class already
  seen with the WHO Technical Notes in the Water Treatment at Scale
  research pass). A `WebSearch` summary attributed a "15 to 19°C
  comfortable indoor temperature" figure to this document, but it is
  **not independently confirmed by direct read**. Not cited as
  verified; excluded from the frozen claim set. (Note: the HTML
  version of this same page, listed above, WAS successfully read and
  supplies the stove-sizing and space-standard figures that are cited
  - only this specific temperature figure and the PDF export itself
  remain unconfirmed.)

### Additional attempts, 2026-07-18 (Targeted Verification Closure)

- **ICRC/IFRC Frame Tent Specification**
  (procurement.ifrc.org/catalogue/upload/products_data/files/HSHETENT07.pdf)
  - the fetch tool rejected this host outright: "Hostname/IP does not
  match certificate's altnames: Host: procurement.ifrc.org. is not in
  the cert's altnames: DNS:perrytrader.com, DNS:www.perrytrader.com" -
  a TLS certificate mismatch pointing to an unrelated domain, a
  different and more serious failure mode than a simple HTTP block.
  **Not attempted further; not directly read.**
- **UNHCR "New Self Standing Family Tent" PDF**
  (emergency.unhcr.org/sites/default/files/New%20Self%20Standing%20Tent.pdf)
  - fetched successfully as a binary file, but returned only graphic/
  compressed-stream content, no extractable text - the same
  illustrated-PDF failure class as the Family Tent PDF and the print/
  PDF export above. **Not directly read.**
- **REI, "How to Set Up/Pitch a Tent" (rei.com/learn/expert-advice/tent-set-up.html)**
  - attempted as a Tier 2/3 substitute (a recognized outdoor-recreation
  technical authority, per this task's explicit permission when
  stronger humanitarian/government guidance is unavailable) after
  UNHCR/IFRC/Sphere all proved inaccessible. **3 consecutive attempts
  all failed with a connection reset (`read ECONNRESET`)** - a
  network-level failure, not a content block or an HTTP error status.
  Not directly read. Not retried a 4th time, per this sprint's
  instruction not to over-invest in a single blocked source.
- **NOLS (National Outdoor Leadership School)** - searched for a
  specific, directly-fetchable page on tent siting/anchoring; no
  single NOLS-hosted page was identified (only general references to
  NOLS's own printed curriculum/handbook, which is not
  freely web-accessible). **Not attempted via direct fetch - no
  fetchable URL was found to attempt.**

**Conclusion after 8 total access attempts across two organizations,
two sprints, and multiple hosts/formats (UNHCR ×2 distinct PDFs, IFRC
×2 distinct sources, Sphere ×3 mirrors, REI ×3 attempts):** the
specific anchoring technique for Article 3 is not directly verifiable
with the tools and access available this sprint. This is recorded as
a closed, resolved outcome (Article 3 narrowed to its general
principle - see the Human Verification Workbook's Pre-Writing Claim
Freeze), not an open item to keep retrying indefinitely.

## Collection summary (superseded by the Update below - preserved as the prior sprint's accurate record)

| Article | Claims with a Tier 1 source directly read | Claims with no directly-read source | Realistic `verification_level` if written today |
|---|---|---|---|
| 1. Shelter Site Selection and System Planning | 7 of 7 (A1-A7) | 0 | Verified Source achievable, pending Editorial Review of the individual-to-settlement-scale generalization (A6) |
| 2. Tarps, Tents, and Rapidly-Deployable Shelter Forms | 6 of 6 (B1-B6) | 0 | Verified Source achievable |
| 3. Anchoring, Wind, and Weather Resistance for Shelter Systems | 1 of 4 (C1 - general principle only) | 3 of 4 (C2-C4 - specific anchoring technique, foundation guidance, and any load figures) | **Not achievable yet - do not proceed to Writing on this article until the Known Gap is closed** |
| 4. Thermal Management, Ventilation, and Fire Safety in Shelter Systems | 8 of 8 (D1-D8) | 0 | Verified Source achievable, subject to §9.3 mandatory human confirmation on the CO-safety claims before Writing finalizes them |
| 5. Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation | 5 of 6 planned (E1, E4-E6 fully; E2-E3 excluded, not attempted as claims) | 0 unresolved (2 candidate claims deliberately excluded rather than left open) | Verified Source achievable on the claims actually included |

### Update, 2026-07-18 (Targeted Verification Closure)

| Article | Final claim status | Realistic `verification_level` if written today |
|---|---|---|
| 1. Shelter Site Selection and System Planning | 7/7 verified, unchanged | Verified Source achievable |
| 2. Tarps, Tents, and Rapidly-Deployable Shelter Forms | 6/6 verified, unchanged | Verified Source achievable |
| 3. Anchoring, Wind, and Weather Resistance for Shelter Systems | **CLOSED**: C1 verified (general principle), C2 replaced (general knowledge, no source needed), C3 removed, C4 confirmed out of scope. 2 active claims, 0 unresolved | Verified Source achievable on the narrowed scope actually retained |
| 4. Thermal Management, Ventilation, and Fire Safety in Shelter Systems | 8/8 verified (D6 newly verified this pass) | Verified Source achievable, subject to Founder high-risk confirmation on D1-D4, D6 before Writing finalizes them |
| 5. Communal and Transitional Shelter: Occupancy, Maintenance, and Adaptation | 5/6 verified, unchanged | Verified Source achievable on the claims actually included |

This table is the honest basis for the next stage (Founder high-risk
confirmation, then Writing) - it is not yet the Editorial Review's own
independent Claim-to-Source Map, which re-checks everything again per
`editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`.
