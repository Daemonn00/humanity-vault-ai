# Source Collection — Survival Physical Readiness

*File placement note: sibling of `official_packs/`, same safe pattern
as the Research Plan above.*

**Stage note, stated plainly per this project's established
discipline:** every source below was found via `WebSearch` during the
original planning sprint. Two Human Source Verification passes (via
direct `WebFetch` reads) have since been performed - results are
recorded per-source below and in full in
`survival_physical_readiness_HUMAN_VERIFICATION_WORKBOOK.md`'s
"Verification Pass #1 Results" and "Verification Pass #2 Results"
sections. As of Pass #2 (targeted closure sprint), **all 16 planned
claims across the pack's five articles have either direct source
support, a source-backed replacement or narrowing, or an explicit
conservative fallback - zero remain open.** **No claim in this pack is
yet `Verified Source`** - even sources that were successfully read
still require the corresponding articles to actually be drafted and
checked against the confirmed wording (per this project's standard
process, never assumed from a plan alone).

## Pack

- **`pack_id` (proposed):** `hv_official_survival_physical_readiness`

## Source Log

### Source: WHO Guidelines on Physical Activity and Sedentary Behaviour (2020)

- **Citation/URL:** World Health Organization, 2020, available in full
  via NCBI Bookshelf: `ncbi.nlm.nih.gov/books/NBK566048/` (Executive
  Summary) and related PMC-hosted copies
  (`pmc.ncbi.nlm.nih.gov/articles/PMC7719906/`,
  `pmc.ncbi.nlm.nih.gov/articles/PMC9219310/`)
- **Which claim(s) it supports:** Article 1 Claims 1 & 3; Article 2
  Claim 1; Article 3 Claim 2
- **Source quality tier:** Tier 1 - official international health
  agency, primary guideline document
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17. Confirmed the
        NCBI Bookshelf hosting is directly readable, matching the CDC
        Yellow Book pattern from the Mass Casualty pack's Sprint #006.
        Confirmed specific, quotable wording for Claims A1, A2, A3, B1,
        B2, and C1 - see the Human Verification Workbook for exact
        quotes.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-17

### Source: CDC Physical Activity Basics — "Adult Activity: An Overview"

- **Citation/URL:** `cdc.gov/physical-activity-basics/guidelines/adults.html`
- **Which claim(s) it supports:** Article 2 Claims 1 & 2
- **Source quality tier:** Tier 1 - official national public-health
  agency
- **Was it directly opened and read in full during this pass?**
  - [x] No - direct `WebFetch` attempted on 2026-07-17, returned HTTP
        403, as flagged as a risk in advance. Claims B1 and B2, which
        this source was meant to support, were fully confirmed via the
        WHO 2020 Guidelines instead (see above), so this source is no
        longer required for this pack's currently-planned claims.

### Source: CDC Physical Activity Basics — "Older Adult Activity: An Overview" and "What Counts as Physical Activity for Older Adults"

- **Citation/URL:** `cdc.gov/physical-activity-basics/guidelines/older-adults.html`;
  `cdc.gov/physical-activity-basics/adding-older-adults/what-counts.html`
- **Which claim(s) it supports:** Article 1 Claim 2 (partial); Article
  2 Claim 3; Article 3 Claims 1 & 3
- **Source quality tier:** Tier 1
- **Was it directly opened and read in full during this pass?**
  - [x] No - direct `WebFetch` attempted on 2026-07-17, returned HTTP
        403. A `restoredcdc.org` mirror attempt for the same content
        was also tried and also returned HTTP 403. Claim C1 was fully
        confirmed via WHO instead; Claims B3 and C3 remain unconfirmed
        and need either a further access attempt against this exact
        content or a substitute source before drafting - see the
        Human Verification Workbook's Verification Pass #1 Results.

### Source: NIOSH, "Ergonomic Guidelines for Manual Material Handling" (DHHS/NIOSH Publication No. 2007-131)

- **Citation/URL:** `cdc.gov/niosh/docs/2007-131/pdfs/2007-131.pdf`
- **Which claim(s) it supports:** Article 4 Claim 1
- **Source quality tier:** Tier 1 - official national occupational-
  safety research agency, primary technical guideline
- **Was it directly opened and read in full during this pass?**
  - [x] No - direct `WebFetch` attempted on 2026-07-17, returned HTTP
        403, as flagged as a risk in advance (same `cdc.gov` block
        affecting the CDC pages above). Claim D1 remains entirely
        unconfirmed - this is the pack's most significant remaining
        sourcing gap. A future pass should try an alternative NIOSH
        access path (e.g. a non-`cdc.gov`-hosted mirror) or a
        substitute Tier 1/2 occupational-safety source.

### Source: ACSM Position Stand, "Progression Models in Resistance Training for Healthy Adults" (2009)

- **Citation/URL:** originally *Medicine and Science in Sports and
  Exercise*, Vol. 41, No. 3, 2009, pp. 687-708 (DOI:
  10.1249/MSS.0b013e3181915670); a full-text PDF mirror was located at
  an EMS/first-aid training resource site
  (`tourniquets.org/wp-content/uploads/PDFs/ACSM-Progression-models-in-resistance-training-for-healthy-adults-2009.pdf`)
- **Which claim(s) it supports:** Article 1 Claim 1; Article 2 Claim
  2; Article 3 Claim 2 (progression principle)
- **Source quality tier:** Tier 1 - established exercise-science
  professional society position stand (ACSM); the specific PDF mirror
  used for access is a secondary hosting of the same primary document,
  not an independent secondary source - if used, this should be noted
  explicitly in the eventual `## Sources` citation as "ACSM Position
  Stand (2009), accessed via [host]" per this project's honesty
  discipline, not cited as if accessed directly from ACSM/the journal.
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17, using the
        `tourniquets.org` mirror (the original journal/ACSM-hosted
        version was not separately attempted in this pass - a future
        pass should still try it first per the Research Plan's note,
        and this mirror-sourced read should be cited honestly as such
        if the mirror remains the actual access path used). Confirmed
        specific wording for Claims A1 and B2.
- **Note:** search results also surfaced a newer 2026 ACSM update,
  "Resistance Training Prescription for Muscle Function, Hypertrophy,
  and Physical Performance in Healthy Adults." This is not adopted as
  a planned source for this pack - it is very recent, its own
  accessibility and stability as a citable public document were not
  confirmed during this pass, and the 2009 position stand remains the
  long-established, widely-cited reference. This should be revisited
  at Human Source Verification if the 2026 update is confirmed
  accessible and is judged to materially change the guidance.

### Source: ACSM/ECSS Joint Consensus Statement, "Prevention, diagnosis and treatment of the overtraining syndrome" (Meeusen et al., 2013)

- **Citation/URL:** *European Journal of Sport Science*; PubMed entry
  `pubmed.ncbi.nlm.nih.gov/23247672/`; related summary in *ACSM's
  Health & Fitness Journal* (2015), "Overreaching/Overtraining"
- **Which claim(s) it supports:** Article 5 Claims 1, 2, & 3
- **Source quality tier:** Tier 1 - joint official position/consensus
  statement of two established sports-medicine professional societies
  (ACSM and ECSS)
- **Was it directly opened and read in full during this pass?**
  - [x] Yes, the PubMed abstract - directly read via `WebFetch` on
        2026-07-17. **Abstract only, not the full consensus
        statement** - the complete original document's accessibility
        was not tested this pass. Confirmed wording for Claims E1 and
        E2. Claim E3 (pain-vs-discomfort) is not addressed by the
        abstract text and remains unconfirmed - the full statement (or
        the *ACSM's Health & Fitness Journal* companion summary) should
        be attempted in a future pass if more detail is needed, though
        the Verification Workbook's conservative fallback for E3 does
        not depend on finding it.

### Source: OSHA, Heat Illness Prevention guidance ("Heat - Overview," "Heat Illness Prevention Campaign," OSHA-NIOSH Heat Illness Infosheet)

- **Citation/URL:** `osha.gov/heat`; `osha.gov/heat/worker-information`;
  `osha.gov/sites/default/files/publications/osha-niosh-heat-illness-infosheet.pdf`
- **Which claim(s) it supports:** supports Article 3's work-capacity
  framing and cross-links to the Mass Casualty pack's existing
  heat-illness sourcing; not the sole support for any new claim in
  this pack, since emergency heat-illness treatment is intentionally
  owned by `mcfa_hypothermia_and_heatstroke_field_response.md`, not
  duplicated here.
- **Source quality tier:** Tier 1 - official national occupational
  safety agency. Already proven directly readable for the Mass
  Casualty pack (`osha.gov/heat-exposure/illness-first-aid` was
  successfully read via `WebFetch` during that pack's Sprint #006) -
  a genuinely positive accessibility signal for this domain, though it
  must still be independently re-attempted, not assumed.
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - `osha.gov/heat/worker-information` directly read via
        `WebFetch` on 2026-07-17, confirming this domain remains
        directly accessible (as it was for the Mass Casualty pack's
        Sprint #006). Used only as supplementary cross-reference
        content for Article 3's work-pacing framing, per plan - not
        the sole support for any Critical claim.

### Source: Peer-reviewed review, "Physiological impact of load carriage exercise" (PMC)

- **Citation/URL:** `pmc.ncbi.nlm.nih.gov/articles/PMC9630762/`
- **Which claim(s) it supports:** Article 4 Claim 2, cautiously (see
  Research Plan's flag on this claim)
- **Source quality tier:** Tier 2 - peer-reviewed academic review
  article, not a primary public-health/occupational guideline
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17. **This read
        materially changed this pack's plan for the better**: it
        explicitly confirmed no established civilian load-threshold
        percentage exists in this literature and that available data
        is almost exclusively military/occupational - positively
        validating, rather than merely assuming, the qualitative
        fallback already planned for Claim D2. It also explicitly does
        not address gradual load-progression protocols (Claim D3),
        which now falls back to the general progression principle
        already confirmed via WHO/ACSM.
- **Note:** this source supports the *general physiological
  principle* (load increases physical strain, injury risk rises past a
  threshold) reasonably well, but the *specific numeric
  bodyweight-percentage thresholds* circulating in fitness content
  (e.g., "10%," "22%") were not traced to this or any other clearly
  primary civilian source during this pass - see the Research Plan's
  explicit flag. Military-context load-carriage research (a DTIC
  report, "Foot Marching, Load Carriage, and Injury Risk") was also
  found and is genuine official research, but is not adopted as a
  planned source for civilian-facing claims, per Part 5's explicit
  caution against treating military doctrine as automatically
  civilian-appropriate.

### Source: MedlinePlus (U.S. National Library of Medicine, National Institutes of Health), "Muscle aches"

- **Citation/URL:** `medlineplus.gov/ency/article/003178.htm`
- **Which claim(s) it supports:** Article 5 Claims E3 (partially) and
  E4 - found and directly read independently during this sprint's own
  quality check (separate from, and additional to, the sources
  originally identified in this pack's planning pass), specifically
  because E3 and E4 were both flagged as unconfirmed. This is the same
  Tier 1 NIH/NLM source family already directly verified and used in
  `hv_official_mass_casualty_first_aid`.
- **Source quality tier:** Tier 1 - official U.S. government medical
  reference (NIH/NLM)
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17. Confirms
        general muscle-pain-from-overuse framing ("pain tends to
        involve specific muscles and starts during or just after the
        activity") and, more usefully, a concrete, quotable
        duration-based warning threshold: **"Contact your provider if:
        Your muscle pain lasts more than 3 days"** - along with severe
        unexplained pain, signs of infection (swelling/redness), and
        emergency-level signs (muscle weakness, inability to move a
        body part). This is genuinely better sourcing for E4 than
        anything found in the original planning pass, and gives E3 a
        concrete, source-backed duration threshold it previously
        lacked, though the page does not itself use the words
        "soreness vs. injury" - the article should paraphrase this
        distinction from the duration/severity signs actually given,
        not invent a soreness-specific framing MedlinePlus doesn't use.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-17

### Source: MedlinePlus (NIH/NLM), "Exercise and Physical Fitness"

- **Citation/URL:** `medlineplus.gov/exerciseandphysicalfitness.html`
- **Which claim(s) it supports:** Article 1 Claim A3 (replaces the
  original, unconfirmed WHO quotation)
- **Source quality tier:** Tier 1 - official U.S. government medical
  reference (NIH/NLM), same source family already established in this
  pack line
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17, during the
        targeted closure sprint. Confirms: "Before you start, check
        with your health care provider, especially if you have
        trouble moving, balancing, or worry that exercise might not
        be safe for you," plus general "build up your activity level
        slowly" guidance.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-17

### Source: MedlinePlus (NIH/NLM), "Exercise for Older Adults"

- **Citation/URL:** `medlineplus.gov/exerciseforolderadults.html`
- **Which claim(s) it supports:** Article 2 Claim B3
- **Source quality tier:** Tier 1 - official U.S. government medical
  reference (NIH/NLM)
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17. Confirms:
        "If you have not been active, you can start slowly and work up
        to your goal." Also independently re-confirms C1 (balance
        exercises prevent falls) as a secondary benefit of this read.
        Does **not** address alternative activities for mobility
        limitations (was considered, but not used, for C3 - WHO was
        the better-matched source for that claim instead).
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-17

### Source: CCOHS (Canadian Centre for Occupational Health and Safety), "NIOSH Lifting Equation - Assessing Relevant Handling Factors"

- **Citation/URL:** `ccohs.ca/oshanswers/ergonomics/niosh/assessing.html`
- **Which claim(s) it supports:** Article 4 Claim D1 - a directly-read
  substitute for the NIOSH primary document, which remained blocked
  (HTTP 403) through two separate verification passes.
- **Source quality tier:** Tier 1 - recognized national occupational-
  health authority (Canadian government-affiliated), per this sprint's
  own explicitly allowed source classes. Directly summarizes and cites
  the same underlying NIOSH Lifting Equation research this claim
  always targeted - if used, the eventual article's `## Sources` entry
  must cite CCOHS explicitly, not NIOSH directly, since NIOSH's own
  document was never successfully read.
- **Was it directly opened and read in full during this pass?**
  - [x] Yes - directly read via `WebFetch` on 2026-07-17. Confirms
        distance-from-body and lifting frequency as explicit injury-
        risk factors beyond load weight, plus posture-dependent
        multipliers in the underlying NIOSH equation.
- **Collected by:** Claude (AI agent)
- **Date:** 2026-07-17

## Collection Summary (updated after Verification Pass #2 / Targeted Closure Sprint, 2026-07-17)

| Article | Claims directly confirmed, replaced, or narrowed via a real read | Claims with an explicit conservative fallback (source read, doesn't support the specific claim) | Claims still entirely unread/unconfirmed | Realistic status if drafted today |
|---|---|---|---|---|
| 1. Understanding Physical Readiness and Progressive Adaptation | 3 of 3 (A1, A2, A3-replaced via MedlinePlus) | 0 | 0 | `Community Verified` - A3 is a replaced/narrowed claim, not a verbatim WHO quotation, so `Verified Source` is not automatic even though every claim now has support |
| 2. Building Functional Strength and Aerobic Endurance | 3 of 3 (B1, B2, B3-verified via MedlinePlus) | 0 | 0 | Could reach `Verified Source` if drafted to match confirmed wording exactly |
| 3. Mobility, Balance, and Sustained Work Capacity | 2 of 3 (C1, C3-narrowed via WHO) | 1 (C2 - source read, doesn't address this specific claim; leans on A1) | 0 | `Community Verified` - C3's narrowed scope and C2's fallback keep this below `Verified Source` |
| 4. Load Carrying and Physically-Loaded Survival Tasks | 1 of 4 directly (D1-verified via CCOHS), plus D2's qualitative fallback positively confirmed | 1 (D3 - source read, doesn't address progression; leans on A1) | 0 | `Community Verified` - D1 is sourced via CCOHS (not NIOSH directly), D2 stays deliberately non-numeric |
| 5. Recovery and Injury Prevention for Physical Training | 3 of 4 (E1, E2, E4) | 1 (E3 - partially supported by MedlinePlus's duration threshold, not its own soreness-specific framing) | 0 | `Community Verified`, close to `Verified Source` pending E3's exact final wording |

**No article is ready to be marked `Verified Source` yet, but zero
claims remain open across all 16.** Every planned claim across all
five articles now has one of: direct source support, a source-backed
replacement/narrowing, or an explicit conservative fallback already
assigned. See
`survival_physical_readiness_HUMAN_VERIFICATION_WORKBOOK.md`'s
Verification Pass #1 and Pass #2 Results sections for the complete,
preserved history of every attempt - successful and blocked alike.
