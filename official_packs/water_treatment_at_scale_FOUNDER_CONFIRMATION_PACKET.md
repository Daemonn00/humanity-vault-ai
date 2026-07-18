---
pack_id: hv_official_water_treatment_at_scale
---

# Founder Confirmation Packet — Water Treatment at Scale

**Temporary production/governance artifact - not pack content. Never
packaged, never released, never referenced by `manifest.md`.**

Purpose: make the Founder's required §9.3 mandatory human confirmation
of 8 claims (B2, D1, D2, D3, D4, D5, E3, F3) as precise, short,
auditable, and difficult to misunderstand as possible. Every quote
below comes from a **fresh re-read performed this sprint** (2026-07-18),
not carried forward from the prior sprint's memory - see Section
"Files read" in the accompanying report for exactly which pages were
re-opened.

Two genuine findings emerged from this re-audit that change how two
claims must be presented - flagged explicitly at D1/D3 and E3 below,
rather than silently smoothed over.

---

### Claim B2

**Article:** 2 - Pre-Treating Water at Community Scale

**Risk category:** Specific toxic-substance/chemical handling
threshold (coagulant residual health limit)

**Planned published claim:** Aluminum-based coagulants work within a
pH range of roughly 6-8, and the aluminum remaining in clarified water
must not exceed a specific health-based limit.

**Source:** Global WASH Cluster / German WASH Network / FHNW / SuSanA
eCompendium, "(Assisted) Sedimentation" (technology T.4)

**Source access location:**
https://www.emergency-wash.org/water/en/technologies/technology/assisted-sedimentation

**What the source actually says:**
> "Where aluminium sulphate is used as coagulant, the aluminium
> concentration in clarified water cannot exceed 0.2 mg/L for health
> reasons."

**Required surrounding context:** The sentence immediately before
notes chemicals "must be treated with care since they are corrosive"
(a handling caution, not part of the numeric claim). The sentence
immediately after states: "If problematic, this can be reduced by
adjusting the pH of the raw water or by filtering through a Rapid Sand
Filter [T.2]" - i.e. the source itself names a remedy if the limit is
exceeded, which is useful context for the article's safety framing.
The pH range (6-8) for aluminum-based coagulant effectiveness was
independently confirmed as directly stated on the same page in the
prior sprint's read and is not itself the escalated figure - only the
0.2 mg/L health limit is.

**Claude verification result:** PASS

**Exact drafting boundary if confirmed:** The article may state that
aluminum-based coagulants work best around pH 6-8, and that clarified
water's aluminum concentration must not exceed 0.2 mg/L for health
reasons, attributed to this source, with the source's own remedy
(pH adjustment or rapid sand filtration) noted as the corrective
action if exceeded.

**What the article must NOT claim:** Must not imply this is the only
possible coagulant (iron-based and organic/Moringa-based alternatives
exist per the same research pass, not re-confirmed this sprint). Must
not imply 0.2 mg/L is a drinking-water safety limit in general - it is
specifically the *post-coagulation, pre-further-treatment* aluminum
limit from this one process step.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 against the exact drafting boundary above.

---

### Claim D1

**Article:** 4 - Disinfection at Batch and Community Scale

**Risk category:** Specific toxic-substance handling threshold
(chlorine dose)

**Planned published claim:** Chlorine dosing for community-scale
disinfection is normally determined experimentally (a "jar test"),
because the correct dose depends on the water's turbidity and
chlorine demand - not a single fixed number.

**Source:** eCompendium, "Chlorination" (T.6) **and** Oxfam WASH,
"Chlorination in Emergencies" (two independent sources - see finding
below)

**Source access location:**
https://www.emergency-wash.org/water/en/technologies/technology/chlorination
and
https://www.oxfamwash.org/chlorination-in-emergencies/

**What the source actually says:**
> eCompendium: "For drinking water, chlorine dosages range from 1–6
> mg/L (0.5–2 mg/L for non-turbid water) for a standard 30-minute
> contact period."

> Oxfam WASH: "Typically, the dosage will be: 2.0 mg/l in less turbid
> waters (<10 NTU) and; 4.0 – 5.0 mg/l in more turbid waters (10-100
> NTU)." Immediately following: "It is possible to start a programme
> using these typical figures."

**Required surrounding context - GENUINE FINDING, not reconciled:**
The two sources give **materially different dosage figures for
similar water conditions**: eCompendium's "non-turbid" range tops out
at 2 mg/L (0.5-2 mg/L), while Oxfam's "less turbid (<10 NTU)" figure
is a single point value of 2.0 mg/L - at the very top of eCompendium's
range, not inside its middle. For "turbid" water, eCompendium's
overall ceiling is 6 mg/L while Oxfam specifies 4.0-5.0 mg/L for
10-100 NTU water specifically. These are not contradictory in the
sense of one being wrong - they are two independent organizations'
typical-figures guidance, expressed with different turbidity
brackets and different precision - but they must not be silently
merged into one number. Both sources independently agree the real
answer is "determine by jar test," which is why this claim's planned
published form is about the *method* (jar testing), not a single
dose figure.

**Claude verification result:** PASS (as a claim about method); **the
two sources' example dosage figures diverge and must be presented
side by side, not merged - see drafting boundary**

**Exact drafting boundary if confirmed:** The article may state that
chlorine dosing depends on turbidity and chlorine demand and is
normally determined by a jar test, not a fixed universal number, and
may cite **both** sources' example ranges explicitly labeled by
source and turbidity bracket (e.g. "eCompendium's Global WASH Cluster
guidance reports roughly 0.5-2 mg/L for non-turbid water and up to 6
mg/L for turbid water; Oxfam WASH reports roughly 2.0 mg/L below 10
NTU and 4.0-5.0 mg/L for 10-100 NTU water") rather than picking one.

**What the article must NOT claim:** Must not present either source's
figure as *the* dose, must not imply the two sources agree exactly,
and must not omit the jar-test method in favor of a table of numbers
that looks like a ready-to-apply instruction.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18. Both sources' ranges must be presented side by side, attributed by name, never merged.

---

### Claim D2

**Article:** 4 - Disinfection at Batch and Community Scale

**Risk category:** Specific toxic-substance handling threshold
(contact time)

**Planned published claim:** A minimum chlorine contact time of 30
minutes is standard at normal temperature and pH; colder water and
higher pH both require more contact time.

**Source:** eCompendium, "Chlorination" (T.6) **and** Oxfam WASH,
"Chlorination in Emergencies"

**Source access location:** same two URLs as D1.

**What the source actually says:**
> eCompendium: "...for a standard 30-minute contact period" (states
> the figure but does not itself state the temperature/pH
> dependency).
> Oxfam WASH: "The minimum contact time is 30 minutes." ... "The
> standard contact time of 30 minutes applies at 25°C, but this must
> be doubled with each 10°C temperature drop." ... "Chlorination is
> most effective at a pH < 8.0. Where the pH is greater than 8.0,
> higher free residual chlorine concentrations and/or more contact
> time will be required."

**Required surrounding context:** The temperature-doubling and pH
dependency rules are stated explicitly only by Oxfam WASH in this
pack's source set - the eCompendium page confirms the 30-minute figure
itself but does not itself state how it changes with temperature or
pH. Both sources should be cited for what each actually says, not
merged as if both stated the full rule.

**Claude verification result:** PASS

**Exact drafting boundary if confirmed:** The article may state the
30-minute standard contact time (both sources), and the temperature-
doubling-per-10°C-drop and pH<8.0 rules specifically attributed to
Oxfam WASH.

**What the article must NOT claim:** Must not attribute the
temperature/pH dependency rule to the eCompendium, since that source
does not itself state it.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 against the exact drafting boundary above.

---

### Claim D3

**Article:** 4 - Disinfection at Batch and Community Scale

**Risk category:** Specific toxic-substance handling threshold (target
free residual chlorine)

**Planned published claim:** A target free residual chlorine (FRC)
range exists, with different figures depending on whether it's
measured at the treatment/distribution point or at the point of
consumption.

**Source:** eCompendium, "Chlorination" (T.6) **and** Oxfam WASH,
"Chlorination in Emergencies"

**Source access location:** same two URLs as D1.

**What the source actually says:**
> eCompendium: "...the amount remaining is known as 'free residual
> chlorine' (FRC), which should be between 0.2–0.5 mg/L." ...
> "Residual chlorine should still be present at 0.2 mg/l or more when
> the last cup is consumed at the household."
> Oxfam WASH gives **three separate figures for three separate
> points in the system**: "reasonable target values for FRC at water
> distribution points would be: Good WASH Conditions, cool
> temperatures: 0.5 mg/l" / "Poor WASH Conditions, high temperatures:
> 1.2 mg/l"; separately, "At the point of delivery, the minimum
> residual concentration of free chlorine should be 0.2 mg/l"; and
> separately, "0.2 mg/l should be the minimum FRC at household level,
> at the time of consumption."

**Required surrounding context - GENUINE FINDING:** This is not one
number with two names - Oxfam WASH distinguishes **three different
figures for three different points in the system** (a distribution-
point *operational target*, ranging 0.5-1.2 mg/L depending on
conditions; a point-of-delivery *minimum*, 0.2 mg/L; and a household-
consumption *minimum*, also 0.2 mg/L). The eCompendium's simpler
"0.2-0.5 mg/L" figure appears to describe the same general
point-of-delivery-to-household range but does not itself break it
into Oxfam's three-tier structure. Collapsing these into a single
"target: 0.2-0.5 mg/L" statement, as the pre-existing Workbook entry
effectively did, is imprecise - the article needs to say which point
in the system a figure applies to.

**Claude verification result:** NARROWED - the claim as originally
planned ("a target FRC range exists... with a lower minimum at
consumption") is directionally correct but must be rewritten to
name the specific point in the system for each figure, per Oxfam's
three-tier breakdown, rather than presented as one range.

**Exact drafting boundary if confirmed:** The article may state: a
minimum of 0.2 mg/L FRC is required both at the point of delivery and
at the point of consumption (both sources agree on 0.2 mg/L as the
consumption-point minimum); and that a higher *operational target* at
the distribution point itself (0.5-1.2 mg/L depending on conditions,
per Oxfam) is used to ensure enough residual survives the journey to
the household.

**What the article must NOT claim:** Must not state "the target FRC is
0.2-0.5 mg/L" as a single undifferentiated figure - it must specify
which point in the system each number describes.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 - the narrowed, three-tier wording specifically, not the original single-range wording.

---

### Claim D4

**Article:** 4 - Disinfection at Batch and Community Scale

**Risk category:** Specific toxic-substance handling threshold (upper
FRC limit)

**Planned published claim:** An upper safety/palatability limit on FRC
exists, above which the water becomes unpalatable and should never be
exceeded.

**Source:** Oxfam WASH, "Chlorination in Emergencies" **only** - see
finding below.

**Source access location:**
https://www.oxfamwash.org/chlorination-in-emergencies/

**What the source actually says:**
> "The FRC should never exceed 4.0 – 5.0 mg/l, although many
> individuals would find the taste and smell of the water unpalatable
> at levels much below this."

**Required surrounding context - GENUINE FINDING:** The eCompendium's
Chlorination page, re-read this sprint, does **not** itself state a
specific upper numeric FRC limit - it only says chlorine taste "can
also lead to rejection," with no figure attached. The 4.0-5.0 mg/L
"never exceed" ceiling is sourced to Oxfam WASH alone. The
pre-existing Workbook implicitly presented this as if both sources
supported it; that is a citation-precision gap this re-audit found and
corrects.

**Claude verification result:** NARROWED - single-source claim, not
dual-source as previously implied; attribute to Oxfam WASH only.

**Exact drafting boundary if confirmed:** The article may state the
4.0-5.0 mg/L upper limit, attributed specifically to Oxfam WASH, and
may separately note (attributed to the eCompendium) that chlorine
taste can cause rejection even without citing that source's own
number for it.

**What the article must NOT claim:** Must not present the 4.0-5.0
mg/L ceiling as agreed by both sources.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 - single-source (Oxfam WASH) attribution specifically.

---

### Claim D5

**Article:** 4 - Disinfection at Batch and Community Scale

**Risk category:** Specific toxic-substance handling threshold
(disinfection hardware calibration)

**Planned published claim:** Point-of-supply chlorination hardware
(tablet chambers, venturi liquid dosing) releases chlorine at
approximately 2 mg/L, adjustable to demand, with typical flow rates
of 10-30 L/min and tablet capacity of 1,500-2,500 L per tablet.

**Source:** eCompendium, "Point-of-Supply Chlorination" (H.7)

**Source access location:**
https://www.emergency-wash.org/water/en/technologies/technology/point-of-supply-chlorination

**What the source actually says:**
> "The chlorine is released into the water at concentrations of
> around 2 mg/L of free chlorine, which can be adjusted based on the
> chlorine demand." ... "Typical flows are around 10–30 L/min." ...
> "The volume of water that can be treated with one tab depends on
> the manufacturer, the specific device used and the tablet
> concentration. Common commercially available tabs can treat between
> 1500–2500 L of water."

**Required surrounding context:** The source itself flags that tablet
capacity varies by manufacturer/device/concentration - the 1,500-2,500
L figure is explicitly a "common" range, not a fixed spec. All three
numbers were confirmed present verbatim on re-read, unchanged from the
prior sprint.

**Claude verification result:** PASS

**Exact drafting boundary if confirmed:** The article may state all
three figures as reported, explicitly noting tablet capacity varies by
product per the source's own caveat.

**What the article must NOT claim:** Must not present tablet capacity
as a fixed universal number; must not imply this ~2 mg/L figure is a
drinking-water FRC target (it is the concentration released at the
device, upstream of the contact/consumption points covered in D3).

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 against the exact drafting boundary above.

---

### Claim E3

**Article:** 5 - Safe Storage, Distribution, and Preventing Recontamination

**Risk category:** Specific toxic-substance handling threshold (tank
shock disinfection)

**Planned published claim:** Shock disinfection, at a much higher
chlorine concentration than routine drinking-water dosing, is used to
disinfect a storage tank before it returns to service, followed by
thorough flushing.

**Source:** eCompendium, "Water Storage Tank (Long-Term, Locally
Built)" (D.6)

**Source access location:**
https://www.emergency-wash.org/water/en/technologies/technology/water-storage-tank-long-term-locally-built

**What the source actually says:**
> "Shock chlorination (at a rate of 50mg/L) can also be used for
> disinfection." This is the final sentence of the page's Operation
> and Maintenance section, following a sentence about "washing out the
> inside, and carrying out any repairs necessary."

**Required surrounding context - GENUINE FINDING:** On this fresh
re-read, the source states the 50 mg/L figure and its O&M context
(tank cleaning/disinfection) **but does not itself say this differs
from routine drinking-water dosing, and does not itself mention a
flushing requirement before returning the tank to service.** Both of
those framings were present in the prior sprint's Workbook entry as if
sourced - they are not. The "much higher than routine dosing"
comparison is arithmetically defensible as general knowledge (this
pack's own directly-verified routine FRC figures, D1-D4, top out at
4.0-5.0 mg/L - ten to twenty-five times lower than 50 mg/L), but it is
Claude's inference from cross-referencing this pack's own other
claims, not a statement this source itself makes. The flushing
requirement is not stated by any source collected this pass.

**Claude verification result:** NARROWED - the 50 mg/L figure and its
O&M context are verified; the safety framing around it ("different
from routine dosing," "flush before use") is general-knowledge
inference, not sourced, and must be labeled as such or omitted.

**Exact drafting boundary if confirmed:** The article may state the 50
mg/L shock-chlorination figure, attributed to this source, in the
context of tank cleaning/disinfection during maintenance. If the
"far higher than routine dosing, must be fully flushed before use"
framing is kept, it must be written as the article's own safety
reasoning (general knowledge, cross-referencing this pack's own
routine-dosing figures), not attributed to this source.

**What the article must NOT claim:** Must not attribute the
"different from routine dosing" comparison or any specific flushing
procedure/duration to this source, since it does not state either.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 - the 50 mg/L figure only; the "differs from routine dosing" framing to be written as the article's own general reasoning, not attributed to this source.

---

### Claim F3

**Article:** 6 - Monitoring Water Quality and Maintaining the System Over Time

**Risk category:** Specific toxic-substance handling thresholds
(chemical contaminant guideline values)

**Planned published claim:** WHO-style chemical guideline values exist
for specific contaminants, distinguishing health-based limits from
aesthetic/taste-based ones, tested only when a specific problem is
suspected.

**Source:** Oxfam WASH, "Water Quality Analysis in Emergency
Situations"

**Source access location:**
https://www.oxfamwash.org/water-quality-analysis-in-emergency-situations/

**What the source actually says:**
> "WHO guideline value (health) for arsenic is 0.01mg/l." (long-term
> exposure; cancer risk)
> "WHO allowable guideline value (health – long term consumption) for
> Fluoride is 1.5 mg/l." (dental staining below, bone deformity above)
> "WHO guideline figures (health – short term use) for Nitrate is
> 11mg/l as N (50 mg/l as NO₃–)" (methaemoglobinaemia risk in infants
> under one year)
> "WHO allowable guideline figure of manganese (health based) in water
> is 0.4 mg/l, but it notes that lower levels, from 0.1 mg/l may cause
> users to reject water." (dual figure: health-based vs. taste-
> rejection)
> "WHO (2004, 3rd Edn) does not provide a health based guideline for
> iron but notes that due to staining and taste, users may find water
> unacceptable when iron is above 0.3 mg/l." (explicitly aesthetic
> only, not health-based)

**Required surrounding context:** The source itself already
distinguishes health-based from aesthetic values precisely (per Part
E's requirement) - iron is explicitly marked as having no WHO health
guideline at all; manganese has both a health figure (0.4) and a
separate, lower taste-rejection figure (0.1); nitrate's guideline is
explicitly a *short-term* figure specific to infant risk, not a
general long-term limit like arsenic/fluoride. This distinction must
be preserved, not flattened into one "safe below / unsafe above" line
per contaminant.

**Claude verification result:** PASS - and the source's own framing
already satisfies Part E's requirement without needing additional
editorial invention.

**Exact drafting boundary if confirmed:** The article may state each
figure with its correct category (health-based long-term, health-based
short-term/infant-specific, or aesthetic-only), attributed to WHO via
this source, and may state that this level of testing is only
recommended when a specific contaminant is suspected, not routinely.

**What the article must NOT claim:** Must not present all five values
under one undifferentiated "safe/unsafe" framing; must not state iron
has a WHO health limit (it explicitly does not); must not generalize
nitrate's infant-specific short-term figure as a general population
long-term limit.

**Founder Decision:**

[x] CONFIRMED
[ ] REJECTED
[ ] NEEDS REVISION

Founder notes: Confirmed 2026-07-18 against the exact drafting boundary above - health-based/short-term/dual/aesthetic-only distinctions preserved.

---

## Efficient Source Review Order

Grouped so the Founder opens each source once, even though several
claims share it.

### Session 1: eCompendium (Global WASH Cluster / German WASH Network / FHNW / SuSanA)

1. **Assisted Sedimentation** (T.4)
   - Organization: Global WASH Cluster eCompendium
   - URL: https://www.emergency-wash.org/water/en/technologies/technology/assisted-sedimentation
   - Claims covered: B2
   - Section to inspect: the paragraph beginning "Where aluminium
     sulphate is used as coagulant..."
   - Confirming: the 0.2 mg/L aluminum health limit and its stated
     remedy.
   - Estimated reading time: 2 minutes

2. **Chlorination** (T.6)
   - Same organization
   - URL: https://www.emergency-wash.org/water/en/technologies/technology/chlorination
   - Claims covered: D1, D2, D4 (absence check - confirm no numeric
     upper limit is stated here)
   - Section to inspect: the paragraphs on dosage, contact time, and
     FRC (roughly the middle third of the page)
   - Confirming: 1-6 mg/L / 0.5-2 mg/L dosage figures, 30-minute
     contact period, 0.2-0.5 mg/L FRC figure, and that no specific
     upper FRC number appears on this page
   - Estimated reading time: 4 minutes

3. **Point-of-Supply Chlorination** (H.7)
   - Same organization
   - URL: https://www.emergency-wash.org/water/en/technologies/technology/point-of-supply-chlorination
   - Claims covered: D5
   - Section to inspect: the paragraphs describing dosing mechanism
     and flow/tablet figures
   - Confirming: ~2 mg/L target, 10-30 L/min, 1,500-2,500 L per tablet
   - Estimated reading time: 3 minutes

4. **Water Storage Tank (Long-Term, Locally Built)** (D.6)
   - Same organization
   - URL: https://www.emergency-wash.org/water/en/technologies/technology/water-storage-tank-long-term-locally-built
   - Claims covered: E3
   - Section to inspect: the final sentence of the Operation and
     Maintenance section
   - Confirming: the 50 mg/L shock-chlorination figure, and that no
     flushing procedure or "differs from routine dosing" statement
     appears on this page
   - Estimated reading time: 2 minutes

**Session 1 subtotal: ~11 minutes, 4 pages, 1 organization.**

### Session 2: Oxfam WASH

5. **Chlorination in Emergencies**
   - Organization: Oxfam WASH
   - URL: https://www.oxfamwash.org/chlorination-in-emergencies/
   - Claims covered: D1, D2, D3, D4
   - Section to inspect: the dosage table near the top, the "Chlorine
     efficacy depends on" list (contact time/temperature/pH), and the
     FRC target section (distribution point / point of delivery /
     household, three separate figures)
   - Confirming: 2.0 / 4.0-5.0 mg/L dosage figures, 30-minute contact
     at 25°C doubling per 10°C drop, pH<8.0 rule, the three-tier FRC
     figures (0.5-1.2 distribution target / 0.2 point-of-delivery
     minimum / 0.2 household minimum), and the 4.0-5.0 mg/L upper
     limit
   - Estimated reading time: 6 minutes (this is the single most
     information-dense page in the packet - it alone supports 4 of
     the 8 flagged claims)

6. **Water Quality Analysis in Emergency Situations**
   - Same organization
   - URL: https://www.oxfamwash.org/water-quality-analysis-in-emergency-situations/
   - Claims covered: F3
   - Section to inspect: the WHO chemical guideline values list
     (arsenic, fluoride, nitrate, manganese, iron)
   - Confirming: all 5 figures and which are health-based vs.
     aesthetic-only
   - Estimated reading time: 3 minutes

**Session 2 subtotal: ~9 minutes, 2 pages, 1 organization.**

**Total: 6 pages, 2 organizations, 2 reading sessions, ~20 minutes.**
No source needs to be opened twice.

---

## D1-D5 Interdependency Audit (Part F)

The sources support treating D1-D5 as one connected operational
sequence, not five isolated numbers - this is directly stated by the
sources themselves, not invented:

1. **Source water condition** (turbidity) determines which dosage
   bracket applies (both sources condition their dosage figures on
   turbidity explicitly).
2. **Dose determination** - both sources agree the actual dose is set
   experimentally via a jar test against the water's real chlorine
   demand, using the typical figures only as a starting point ("It is
   possible to start a programme using these typical figures" -
   Oxfam).
3. **Contact time** - fixed at a 30-minute floor, explicitly modified
   by temperature (doubling per 10°C drop below 25°C) and pH (>8.0
   requires more time or more chlorine) - Oxfam's explicit chain.
4. **Residual measurement (FRC)** - the point of the whole sequence:
   confirms whether steps 2-3 actually achieved a safe result, with
   different minimum/target figures depending on where in the system
   (distribution point vs. delivery vs. household) the measurement is
   taken (D3's finding).
5. **Adjustment** - if FRC reads low, more chlorine or more contact
   time is needed (implicit in the pH-dependency statement extending
   to "more contact time will be required").
6. **Distribution/use** - the household-consumption minimum (0.2 mg/L)
   is the sequence's actual end goal, per both sources.

This sequence is real and source-supported - D1-D5 are not safely
presentable as five independent facts, because a reader who takes D1's
dose figure without D2's contact-time/temperature adjustment, or
without D4's upper limit, could either under-treat or over-dose.
Article 4 must present this as one connected procedure with an
explicit jar-test/monitor/adjust loop, not a table of five unrelated
numbers.

## Article 4 Verification Gate (Part G)

**READY FOR WRITING AFTER FOUNDER CONFIRMATION**

Reasoning: none of the 5 claims (D1-D5) individually failed
verification, and the one genuine cross-source numeric divergence
(dosage figures, D1) is resolvable *without* picking a winner, because
both sources themselves point to the same resolution (jar-test
determination, with their example figures presented side by side and
attributed by name). D3's three-tier FRC structure and D4's
single-source attribution are precision corrections, not blockers -
both are fully sourced once stated correctly. D2's temperature/pH
dependency is fully sourced (to Oxfam). The interdependency audit above
confirms the 5 claims combine into one coherent, source-supported
procedure rather than a misleading assembly of independently-true
numbers. Article 4 is blocked only on the Founder's actual
confirmation of D1-D5 below - not on any unresolved technical or
sourcing problem.

---

## Founder Confirmation Summary

| Claim | Result | Founder Decision |
|---|---|---|
| B2 | PASS | **CONFIRMED**, 2026-07-18 |
| D1 | PASS (method); dual-source figures must stay separate | **CONFIRMED**, 2026-07-18 |
| D2 | PASS | **CONFIRMED**, 2026-07-18 |
| D3 | NARROWED | **CONFIRMED**, 2026-07-18 (narrowed three-tier wording) |
| D4 | NARROWED | **CONFIRMED**, 2026-07-18 (single-source attribution) |
| D5 | PASS | **CONFIRMED**, 2026-07-18 |
| E3 | NARROWED | **CONFIRMED**, 2026-07-18 (figure only, framing separated) |
| F3 | PASS | **CONFIRMED**, 2026-07-18 |

**0 claims failed outright (no CONFLICT FOUND / NOT READY result).**
**3 of 8 were narrowed by this re-audit** (D3, D4, E3) - all 3
confirmed in their narrowed, corrected form, not the original
pre-existing Workbook wording.

## Record of Completion

**All 8 claims requiring `QUALITY_STANDARD.md` §9.3 mandatory human
confirmation are now CONFIRMED by the Founder, 2026-07-18, in their
final, narrowed form as recorded in this packet.** This satisfies the
§9.3 mandatory-human-confirmation requirement for these 8 claims, for
`hv_official_water_treatment_at_scale` this pack/version only - it
does not waive §9.3 for any other pack, any future version of this
pack, or any claim not listed here. It does not itself set any
article's `verification_level`, and it does not constitute Editorial
Review, post-drafting Human Source Verification, or Founder
Publication Approval - each remains a separate, later gate.
