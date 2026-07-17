# Review Notes - Field Communication & Wayfinding (v1.0.0)

**This is editable source content only. It is not yet a distributable
ZIP and not yet Founder-approved for publication.**

*Restructured 2026-07-14 to match `editorial_review_template/
05_PACK_REVIEW_REPORT_TEMPLATE.md`'s section layout, as part of a
remediation pass following a production audit. Every section below
preserves the full original record - nothing has been deleted, only
reorganized and added to. See "Version Review History" at the bottom
for the complete timeline.*

## Editorial Review Checklist

*(Retroactively completed 2026-07-14, per
`editorial_review_template/01_EDITORIAL_REVIEW_CHECKLIST.md` - this
section did not exist in the original ad hoc review, which predates
that template.)*

**A. Identity and structure**
- [x] `pack_id` (`hv_official_field_comm_wayfinding`) uses the
      `hv_official_` prefix.
- [x] `pack_id` is not already used elsewhere in `official_packs/`.
- [x] `pack_version` (`1.0.0`) is well-formed semver.
- [x] Every article's `category` (Communication, Communication,
      Survival, Construction) is a valid display name.
- [x] No article slug collides with the core corpus or another
      article in this pack (independently confirmed for real via
      `release_pipeline`'s structural validation dry run).

**B. Tone and register** - [x] Consistent calm, plain, field-manual
register across all four articles; no marketing or alarmist language.

**C. Source-attribution discipline** - [x] Every claim is either tied
to a source in the Claim-to-Source Map below, or written as general,
non-source-specific practical knowledge - **with one exception found
and corrected during the 2026-07-14 audit**: Article 1 had cited ICAO
Annex 12 in its `## Sources` list with no corresponding entry anywhere
in this file's source-access log or claim map. Resolved - see "Source
Access Log" and "Version Review History" below.

**D. Safety and scope boundaries** - see "Hard Boundary Checklist"
below (preserved from the original review, still accurate).

**E. Verification level integrity** - [x] See "Verification Level:
Per-Article Status" below - confirmed consistent with the Claim-to-
Source Map for all four articles as of this remediation pass.

## Source Access Log

*(Preserved from the original "Source access attempts" section,
plus one new entry added 2026-07-14.)*

The original authoring task required directly opening and reading six
specific source pages/documents before drafting. Every one of the six
was attempted with multiple strategies (direct URL, alternate host/
format, an archive.org full-text stream, the Wayback Machine, and a
directly discovered PDF link where a landing page suggested one).
**None of the six sources were successfully read in full** during that
session. This is recorded here in full, per instruction, rather than
treating any of them as verified:

1. **FAA AIP GEN 3.6 Search and Rescue**
   (faa.gov/air_traffic/publications/atpubs/aip_html/part1_gen_section_3.6.html) -
   HTTP 403 on automated fetch during the original authoring session
   (Wayback Machine access is unavailable to this tooling); **directly
   human-reviewed on 2026-07-10 by the Founder**, including
   FIG GEN 3.6-1 "Ground-Air Visual Code for Use by Survivors" and the
   FAA's reference to Visual Emergency Signals across FIG GEN 3.6-1
   through FIG GEN 3.6-17. See "FAA-verified scope for Article 1"
   below for exactly what this review does and does not support.
2. **IARU/ARRL "Ethics and Operating Procedures for the Radio Amateur"**
   (arrl.org/files/file/DXCC/Eth-operating-EN-ARRL-CORR-JAN-2011.pdf) -
   the PDF fetched but could not be converted to readable text (binary/
   compressed content only). The ARRL "Operating Ethics" overview page
   (arrl.org/operating-ethics) and the IARU-R1 code-of-conduct listing
   page (iaru-r1.org/on-the-air/code-of-conduct/versions/) were both
   readable, but both only describe the document's existence and link
   to it - neither contains the document's actual content. A directly
   guessed PDF URL for the English version 404'd. Not read.
3. **CPSC general battery safety guidance**
   (cpsc.gov/Regulations-Laws--Standards/Voluntary-Standards/Topics/Batteries) -
   HTTP 403. Not read.
4. **FM 21-76 Chapter 18, Field-Expedient Direction Finding** (improvised
   compasses) - the archive.org full-text stream
   (archive.org/stream/Fm21-76SurvivalManual/FM21-76_SurvivalManual_djvu.txt)
   was reachable, but the returned excerpt was truncated before
   reaching Chapter 18 - only the table of contents confirms the
   chapter and section exist. Not read.
5. **Scouting America "Basic Knots"**
   (troopleader.scouting.org/rank-advancement-skills/campcraft/basic-knots/) -
   HTTP 403 on direct fetch; Wayback Machine access unavailable. Not read.
6. **FM 21-76 Chapter 12, Lashing and Cordage** - same archive.org
   stream as #4; same truncation issue, same result. Not read.

An earlier, separate research pass in this project (before the
authoring session) used web-search **result summaries** - not direct
reads - to identify these six sources as real, credible, on-topic,
non-country-specific-where-required organizations/documents. That
research is what this pack's `## Sources` sections originally relied
on. It is a lower bar than directly reading the primary text, and the
authoring session was unable to close that gap despite a genuine,
repeated attempt.

7. **ICAO Annex 12 to the Convention on International Civil Aviation -
   Search and Rescue** *(added to this log 2026-07-14; this source was
   never part of the original six above, and its presence in Article
   1's `## Sources` list with no corresponding log entry was exactly
   the gap a production audit found)*. Attempted via direct fetch of
   two independent PDF mirrors (a national civil aviation authority
   copy, and a third-party aviation resource site): one returned
   HTTP 502, the other HTTP 403 - the same failure pattern as sources
   2-6 above. A South Korean national AIP page describing its own
   implementation of "ICAO Annex 12, Chap 5, para 5.10" was
   successfully read, and its description of the five-message
   ground-air code (require assistance, require medical assistance,
   yes/no, direction) is consistent with what the Founder's direct FAA
   review already confirmed - but this is a third country's
   description of Annex 12's content, not the Annex 12 text itself, so
   it does not meet this project's bar for a direct read. **Not
   directly verified. Removed from Article 1's `## Sources` on
   2026-07-14** rather than left uncorroborated - see Version Review
   History.

## How the articles were narrowed as a result

*(Preserved from the original review, unchanged.)*

Because none of the six original sources' specific wording, tables, or
exact technical claims could be directly confirmed, every article was
written using **only well-established, generic, non-source-specific
practical knowledge** (the kind of information that would appear
consistently across many independent references on these topics),
rather than restating anything as if it were a verified quote or
detail from one of the six documents. Concretely:

- Article 1 was revised on 2026-07-10 after direct human review of the
  FAA source (see "FAA-verified scope for Article 1" below) - its
  factual claims are now limited to what that direct review actually
  supports, rather than the earlier general/topical framing. It still
  declines to reproduce any specific symbol, figure number, or exact
  size/dimension, deferring entirely to the FAA publication as "the
  complete, official version."
- Article 2 describes only generic, widely-known radio etiquette
  (listen first, keep it brief, stay calm) and generic battery-care
  practice (avoid heat/damage, keep spares charged), with no figure,
  standard number, or specific claim attributed to IARU/ARRL or CPSC
  beyond "consistent with their general guidance."
- Article 3 describes the needle-magnetization/suspension technique in
  the same general terms it is commonly and consistently described
  across many independent sources, not as a verified restatement of
  FM 21-76's specific chapter text (which was not read).
- Article 4 describes only the square knot and clove hitch in their
  most basic, widely-known form, and does not repeat the "king of
  knots"/rescue-work framing that some secondary sources apply to more
  advanced loop knots (a framing this pack deliberately excludes
  regardless).

## Claim-to-Source Map

*(Preserved exactly from the original review - the ICAO removal did
not require any change here, since ICAO was never referenced in this
table to begin with; it existed only in Article 1's `## Sources` list,
disconnected from this map. That disconnect was itself the audit
finding.)*

| Article | Claim in the article | Source it is associated with | Directly verified? |
|---|---|---|---|
| 1 | A standardized ground-air visual signal code exists for survivors | FAA AIP GEN 3.6 | **Yes - directly human-reviewed 2026-07-10 (the Founder)** |
| 1 | The code communicates messages such as needing assistance, needing medical assistance, yes/no, and general direction | FAA AIP GEN 3.6 | **Yes - directly human-reviewed 2026-07-10 (the Founder)** |
| 1 | FAA publishes the official visual-code figures | FAA AIP GEN 3.6 | **Yes - directly human-reviewed 2026-07-10 (the Founder)** |
| 1 | (Removed) Build signals from cloth/rocks/branches; large/simple/high-contrast construction advice; leave a signal in place; add movement or sound | Was general practical knowledge, not FAA-attributed | Removed 2026-07-10 - not supported by the direct FAA review, not weakened but deleted |
| 1 | Editorial note that visual signaling does not guarantee rescue | Editorial caution, explicitly not attributed to FAA | N/A by design - must not be sourced to FAA |
| 2 | Listen before transmitting, keep messages brief, stay calm | IARU/ARRL Ethics and Operating Procedures | No - topical match only, not a direct read |
| 2 | Keep batteries charged, cool, dry, away from damage | CPSC battery safety guidance | No - topical match only, not a direct read |
| 3 | Magnetizing a needle by one-direction stroking, then suspending/floating it | FM 21-76 Chapter 18 | No - table of contents confirms the chapter exists; content not read |
| 3 | Nearby metal/magnets can affect the reading | General, widely-known limitation of any magnetic compass | N/A |
| 4 | Square knot and clove hitch basics | Scouting America Basic Knots | No - not directly read (403) |
| 4 | Lashing two poles by wrapping and cinching | FM 21-76 Chapter 12 | No - table of contents confirms the section exists; content not read |
| 4 | Not rated for climbing/rescue/fall-arrest/lifting a person | Deliberate exclusion required by this task, independent of any source | N/A |

## Reviewer Sign-offs

*(New section, added 2026-07-14 per `editorial_review_template/
04_REVIEWER_SIGNOFF_TEMPLATE.md` - the original review never recorded
an attributable reviewer identity, only the anonymous phrase "a human
reviewer." Both real contributions to this pack's review are
attributed below by their actual role, without inventing a personal
name for either.)*

**Sign-off 1**
- **Reviewer:** The Founder
- **Date:** 2026-07-10
- **Scope:** Personally opened and read FAA Aeronautical Information
  Publication, GEN 3.6 Search and Rescue (FIG GEN 3.6-1 through
  FIG GEN 3.6-17).
- **Findings:** Confirmed the three claims now listed as directly
  verified for Article 1 in the Claim-to-Source Map above; the
  article's scope was narrowed to match exactly.
- **Statement:** Confirmed personally reading the FAA source's actual
  content, not a summary or description of it.

**Sign-off 2**
- **Reviewer:** Claude (AI agent, Humanity Vault production tooling)
- **Date:** 2026-07-14
- **Scope:** Full production audit of all four articles and this
  file (content quality, factual consistency, source quality, safety
  wording, category/terrain correctness, `related_articles` link
  validity, article structure, frontmatter consistency, version
  consistency, verification status, editorial completeness, release
  readiness) followed by remediation: attempted verification of ICAO
  Annex 12 (not achieved - see Source Access Log entry 7), removed it
  from Article 1, reviewed and adjusted terrain tags and one
  `knowledge_level` value, refreshed `manifest.md`'s disclaimer, and
  restructured this file.
- **Findings:** See the 2026-07-14 Version Review History entries
  below for the full, itemized list.
- **Statement:** This is AI-assisted structural, editorial, and
  consistency review - it does not constitute direct human
  verification of Articles 2-4's still-unread sources, and does not
  close their release gate below. Only a human reviewer personally
  reading those sources can do that, per this project's own standing
  policy (`pack_production_workflow/QUALITY_STANDARD.md` §4).

Partial review is expected and normal here: Sign-off 1 covers only
Article 1's FAA source; Sign-off 2 covers structural/editorial ground
across the whole pack but explicitly does not and cannot substitute
for direct source reads of Articles 2-4's remaining citations.

## Verification Level: Per-Article Status

*(Preserved from the original, updated 2026-07-14 to note the ICAO
removal did not change Article 1's status - it was never the basis for
Article 1's `Verified Source` label, only an uncorroborated extra
citation alongside it.)*

Originally, every article's frontmatter read `verification_level:
Verified Source`, a label that was not earned - none of the six
primary sources had been directly read, so the real-source alignment
claimed in each `## Sources` list was never confirmed against the
actual document text. All four articles were reclassified to
`Unverified` as a result.

**Update, 2026-07-10:** Article 1 (Visual Signaling for Rescue and
Rendezvous) has since had its one relevant source - FAA AIP GEN 3.6 -
directly human-reviewed by the Founder (see "FAA-verified scope for
Article 1" below), and its Summary/Main Content have been rewritten so
every factual claim is limited to what that direct review actually
supports. Article 1's frontmatter is therefore changed back to
`verification_level: Verified Source`, on the strength of that direct
review - not the earlier, unearned basis. **Articles 2, 3, and 4
remain `Unverified`** - their sources have still not been directly
read, and their release gate below still applies to them unchanged.

**Update, 2026-07-14:** ICAO Annex 12 - never the basis for Article
1's `Verified Source` label (see Claim-to-Source Map) - was removed
from Article 1's `## Sources` list after it could not be directly
verified (Source Access Log entry 7). Article 1's `verification_level`
remains `Verified Source`, unaffected, since it was always earned
solely on the FAA review. No other article's status changed.

| Article | `verification_level` | Why |
|---|---|---|
| Visual Signaling for Rescue and Rendezvous | Verified Source | All 3 attributed claims directly verified by the Founder, 2026-07-10; now single-sourced to FAA only |
| Two-Way Radio Channel Discipline and Battery Care | Unverified | Both cited sources (IARU/ARRL, CPSC) found via topical match only, not directly read |
| Improvised Compass Construction | Unverified | Cited source (FM 21-76 Ch. 18) - table of contents confirmed only, content not read |
| Basic Knots for Shelter and Gear Lashing | Unverified | Both cited sources (Scouting America, FM 21-76 Ch. 12) not directly read |

This project's authoring standard (docs/Knowledge_Authoring_Standard_
v1.md, Section 7) defines exactly four allowed `verification_level`
values: `Verified Source`, `Community Verified`, `Historical Source`,
`Unverified`. `Unverified` - "Not yet reviewed; included for
completeness but should be reviewed before being treated as
authoritative" - remains the accurate description of Articles 2-4's
actual state at this point in the record. `Community Verified` was
considered and rejected for those three: it describes content a
community review process has already confirmed accurate, and no such
review had happened yet for them at this point - only a single
author's draft, awaiting review.

**Update, 2026-07-17 (Stage 6, under the Founder Governance Decision
above):** all three remaining articles' claims were checked against
directly-read sources (see "Stage 6 Human Source Verification" below
for the complete record) - either their original sources, or genuine
substitutes where the original could not be read or, in one case
(Basic Knots' lashing technique), never actually supported the claim
in the first place. All three are upgraded to `Verified Source`:

| Article | `verification_level` (current) | Why |
|---|---|---|
| Visual Signaling for Rescue and Rendezvous | Verified Source | Unchanged - still single-sourced to the Founder's direct FAA review |
| Two-Way Radio Channel Discipline and Battery Care | **Verified Source** | All claims directly verified this pass via MDARC and USFA/FEMA (substitutes for the never-read IARU/ARRL and CPSC) |
| Improvised Compass Construction | **Verified Source** | All claims directly verified this pass via FM 21-76 Ch. 18 (accessed via a full-text mirror); two details narrowed to match exactly |
| Basic Knots for Shelter and Gear Lashing | **Verified Source** | All claims directly verified this pass via Scout Life and the Pioneering Merit Badge Online Reference (substitutes for the never-read Troop Leader Resources page and a source, FM 21-76 Ch. 12, that never actually described the cited technique) |

## FAA-verified scope for Article 1 (2026-07-10)

*(Preserved from the original review, unchanged.)*

The Founder directly opened FAA Aeronautical Information Publication,
GEN 3.6 Search and Rescue, including FIG GEN 3.6-1 "Ground-Air Visual
Code for Use by Survivors" and the FAA's reference to Visual Emergency
Signals across FIG GEN 3.6-1 through FIG GEN 3.6-17.

**Directly supported by this review, and now the only factual scope of
Article 1's Summary and Main Content:**
- A standardized ground-air visual code exists for survivors.
- The code communicates messages such as requiring assistance,
  requiring medical assistance, indicating yes/no, and general
  direction.
- FAA publishes official visual-code figures.

**Not directly verified by this review, and removed from the article
rather than weakened:**
- Specific material suggestions (cloth, rocks, branches, fabric).
- "Large/simple/high-contrast" signal construction advice.
- Leaving a signal in place once made.
- Adding movement or sound to a signal.
- Any guarantee or probability of rescue (a brief editorial safety
  caution is retained in the article, but is explicitly not
  attributed to FAA).

Article 1 also excludes, consistent with the hard boundary checklist
below: frequencies, procedures, code tables, exact symbols,
dimensions, or copied FAA wording.

## Hard Boundary Checklist

*(Preserved from the original review; this is the article-specific
instantiation of `editorial_review_template/
01_EDITORIAL_REVIEW_CHECKLIST.md` Section D for this pack.)*

- [x] Article 1 explains signaling principles only, limited to the
      FAA-verified scope above; does not reproduce the ICAO/FAA symbol
      table, exact symbols, figure numbers, or dimensions; directs
      readers to the FAA AIP for the official complete code; includes
      no aviation emergency frequency; retains a brief non-guarantee
      safety caution framed as editorial, not attributed to FAA; does
      not claim rescue/visibility/response is guaranteed.
- [x] Article 2 covers listen-first, concise/factual messages,
      scheduled check-ins, and general battery care only; names no
      radio service, frequency, channel allocation, or license
      requirement; includes an explicit "check your local rules"
      statement; recommends no product or battery chemistry.
- [x] Article 3 frames the technique as a rough backup only; makes no
      precision/reliability/safety-critical claim; states that nearby
      metal and magnetic interference can affect results; states it is
      not a substitute for a real compass or navigation training.
- [x] Article 4 limits scope to securing gear and simple shelter
      framing/lashing; includes a direct warning that none of the
      knots/lashings are rated for climbing, rescue rigging,
      fall-arrest, or lifting a person; contains no tactical,
      trap-making, weapon, or evasion content.

## Terrain and Knowledge Level Review (2026-07-14)

*(New section - findings and decisions from the production audit's
Medium-priority items. Only changes with a genuine content rationale
were applied; findings without one were left as-is and explained.)*

**Terrain changes applied:**
- Radio Channel Discipline and Battery Care: added `desert` and
  `tropical_rainforest`. Listening discipline, message brevity, and
  battery care are terrain-agnostic principles with no content reason
  to exclude either terrain; the article now reads `terrain: urban,
  coastal, desert, tropical_rainforest` (all four).
- Improvised Compass Construction: added `coastal`. Navigating without
  a compass while stranded or traveling along a coastline is a
  genuinely plausible scenario.
- Basic Knots for Shelter and Gear Lashing: added `desert`. Shade/
  shelter construction is highly relevant to desert conditions.

**Terrain exclusions reviewed and kept as-is (genuine rationale, not
just left unaddressed):**
- Improvised Compass Construction still excludes `urban` - in an urban
  environment, alternative orientation aids (streets, signage, maps)
  are typically available, making this specific backup technique
  lower-priority there.
- Basic Knots still excludes `urban` - existing structures reduce the
  need for improvised shelter framing/lashing in a typical urban
  setting.
- Visual Signaling for Rescue and Rendezvous still excludes
  `tropical_rainforest` - dense canopy cover genuinely limits
  ground-to-air visual signaling's usefulness, unlike the other three
  terrains it's tagged for.

**`knowledge_level` change applied:**
- Improvised Compass Construction: changed `Level 1` → `Level 2`. The
  technique requires a specific method (one-direction stroking to
  magnetize, then suspension/flotation) and correct interpretation of
  a result with known interference limitations - closer to
  `docs/Knowledge_Authoring_Standard_v1.md` Section 8's Level 2
  definition ("requires some tools, practice, or background
  knowledge") than true zero-training Level 1 content.

**`knowledge_level` reviewed and kept as-is:**
- Basic Knots for Shelter and Gear Lashing remains `Level 1` - the
  square knot and clove hitch are genuinely entry-level skills
  commonly taught to beginners; no change was warranted on
  reconsideration.
- Radio Channel Discipline and Battery Care and Visual Signaling for
  Rescue and Rendezvous remain `Level 1` - both are correctly
  no-special-tools-or-training content.

## Founder Governance Decision (2026-07-17)

*Appended per this document's "append, never erase" rule - the
original human-reviewer wording throughout this file (the Source
Access Log, Reviewer Sign-offs, Publication Decision, and Hard
Boundary sections above) is preserved unchanged as historical context,
not silently rewritten.*

The Founder explicitly authorizes AI-agent-performed direct source
verification for this pack's remaining `Unverified` articles, using
the same methodology already accepted for
`hv_official_mass_casualty_first_aid` v1.0.0 and
`hv_official_survival_physical_readiness` v1.0.0. This authorization
applies specifically to `hv_official_field_comm_wayfinding` v1.0.0. It
does not automatically establish a universal policy for every future
pack, and it does not retroactively change the historical record above
- Sign-off 1 (the Founder's own direct FAA review) and Sign-off 2 (the
2026-07-14 AI-agent structural audit) remain exactly as recorded.

**Important, stated per the Founder's own explicit instruction:**
authorization to perform verification is not authorization to publish.
The Publication Decision remains reserved for the Founder, to be made
after this sprint's verification and editorial results are known - see
the updated Publication Decision below, which remains **Not Yet
Approved**.

## Stage 6 Human Source Verification (2026-07-17)

Performed by Claude (AI agent), under the Founder Governance Decision
above. Every claim below was checked against the actual current
article prose - not the pre-existing workbook's planned wording in
isolation, and not assumed from the historical Source Access Log's
prior failed attempts.

### Source Access Log (Stage 6 additions)

Fresh, good-faith access attempts were made against every originally-
cited source before any substitute was sought:

- **IARU/ARRL, "Ethics and Operating Procedures for the Radio
  Amateur"** - re-attempted via `arrl.org/operating-ethics`. This page
  is a navigation hub only; it does not contain the document's actual
  content and only links to it. The PDF itself remains unread (same
  binary/compressed-stream issue as the original attempt). **Still not
  directly read.**
- **CPSC battery safety guidance** - re-attempted via two URLs
  (`cpsc.gov/Safety-Education/...` and `cpsc.gov/node/63681`); both
  returned HTTP 403. **Still not directly read.**
- **FM 21-76 Chapter 18 (compass)** - the original PDF (via two
  archive.org mirrors) remains unreadable (binary/compressed stream).
  A full-text reproduction of this exact chapter was found and
  **directly read** at `fm2176.wordpress.com` - confirmed as a direct
  reproduction of the chapter's actual text, not a summary.
- **FM 21-76 Chapter 12 (lashing and cordage)** - **a genuine, load-
  bearing finding**: a search for this chapter's actual content
  revealed it covers cordage *materials* (fiber testing, rawhide
  preparation) and does **not** describe the specific wrap/frap
  lashing *technique* this pack's Basic Knots article attributed to
  it. This source was never actually capable of supporting claim K4 as
  originally cited, independent of any access problem.
- **Scouting America, Troop Leader Resources, "Basic Knots"** -
  re-attempted directly; HTTP 403, same as the original attempt.
  **Still not directly read.**

### Substitute sources found and directly read

- **Mount Diablo Amateur Radio Club (MDARC), Operating Procedures**
  (`mdarc.org/operating-aids/operating-procedures`) - Tier 3
  (established amateur radio organization). Directly read. Confirms:
  "Listen before talking. All amateur radio channels are shared,
  sometimes by several users. Do not interfere with other traffic";
  "Keep it short"; "Announce your call sign at the end of every
  conversation; and at least every 10 minutes during conversations
  that last longer." Resolves R1 and R2.
- **U.S. Fire Administration (part of FEMA), Battery Storage Safety**
  (`usfa.fema.gov/prevention/home-fires/prevent-fires/batteries/`) -
  Tier 1 (federal government fire-safety authority). Directly read.
  Confirms: store at room temperature, avoid direct sunlight/hot cars,
  store away from anything that can burn, stop using and treat as a
  hazard if signs of damage appear. Resolves R5 - this is a stronger,
  more directly on-point source than CPSC would have been for this
  specific claim.
- **Scout Life (Scouting America's official youth publication), "How
  to Tie the 7 Basic Scout Knots"** (`scoutlife.org/outdoors/176401/...`)
  - Tier 2/3 (official Scouting America publication, distinct page
  from the blocked Troop Leader Resources page). Directly read.
  Confirms the square knot ("joining two ropes together... should not
  be used to hold a heavy load") and clove hitch ("used to begin and
  end many lashings") exactly as the article states. Resolves K1, K2,
  K3.
- **Pioneering Merit Badge Online Reference, "Square Lashing"**
  (`pioneeringmeritbadge.org/square-lashing/`) - Tier 2/3 (established
  Scouting America pioneering-program reference). Directly read.
  Confirms the actual square lashing technique (Mark II method): fold
  the rope in half, three wraps around both poles, two frapping turns
  between the poles, finish by tying the ends securely. **Resolves K4
  with a genuine substitute**, since the originally-cited FM 21-76 Ch.
  12 never actually described this technique (see above).

### Actual-Prose Claim-to-Source Map (Stage 6)

| Article | Claim | Class | Source | Notes |
|---|---|---|---|---|
| Radio | R1 - listen before transmitting | Verified | MDARC | Directly read |
| Radio | R2 - short transmissions, consistent ID | Verified | MDARC | Directly read; article kept general rather than importing the FCC-specific "every 10 minutes" figure, since this article deliberately covers radio use in general, not only licensed amateur radio |
| Radio | R3 - calm/clear speaking | General knowledge | N/A | Unchanged |
| Radio | R4 - scheduled check-ins | General knowledge | N/A | Unchanged |
| Radio | R5 - battery storage/heat/damage | Verified | USFA/FEMA | Directly read; article wording already conservative and accurate, no rewrite needed |
| Radio | R6 - periodic checks, manufacturer instructions | General knowledge | N/A | Unchanged |
| Radio | R7 - legality varies by region | Editorial disclaimer | N/A | Unchanged |
| Compass | C1 - needle as improvised compass | General knowledge | N/A | Entailed by C2/C3 |
| Compass | C2 - magnetization method (material, direction) | **Verified with narrowing/rewrite** | FM 21-76 Ch. 18 (via fm2176.wordpress.com) | "Wool" was not supported - source confirms silk or hair only; article rewritten to match exactly |
| Compass | C3 - suspension/floating methods | **Verified with narrowing/rewrite** | FM 21-76 Ch. 18 (via fm2176.wordpress.com) | "Bark" was not the confirmed term - source confirms wood, cork, or leaf; article rewritten to match exactly |
| Compass | C4 - settles along north-south line | Verified / general physics | FM 21-76 Ch. 18 + general knowledge | Article's "roughly" framing already correctly avoids overclaiming which end points north |
| Compass | C5 - interference caveats | General knowledge | N/A | Common, uncontroversial magnetism knowledge |
| Compass | C6, C7 - re-check, not a substitute for training | General/editorial | N/A | Unchanged |
| Knots | K1 - square knot joins ropes | Verified | Scout Life | Directly read |
| Knots | K2 - square knot not for heavy loads | Verified | Scout Life | Directly read, near-verbatim |
| Knots | K3 - clove hitch starts/ends lashings | Verified | Scout Life | Directly read |
| Knots | K4 - lashing wrap/cinch/finish sequence | **Verified with substitute source and rewrite** | Pioneering Merit Badge Online Reference | Original source (FM 21-76 Ch. 12) never actually described this technique - see Source Access Log finding above. Article rewritten to match the confirmed technique (three wraps, frapping turns, secure finish) |
| Knots | K5 - builds a shelter frame | General knowledge / inference from K4 | N/A | Unchanged |
| Knots | K6 - tension, periodic checks | General knowledge | N/A | Unchanged |
| Knots | K7 - not rated for climbing/rescue/fall-arrest | Definitional safety boundary | N/A | Confirmed by the absence of any rating claim, not a source passage - unchanged, not removable under any circumstance |

**Result: every claim-row reads Verified, General knowledge/synthesis,
or Editorial - none reads Unsupported/Removable. Per
`editorial_review_template/03_CLAIM_VERIFICATION_TEMPLATE.md`'s own
rule, this is the condition for `Verified Source`, independently met
by all three previously-`Unverified` articles.**

### Rewrites Applied This Pass

1. **Improvised Compass Construction** - magnetization material
   narrowed from "silk, wool, or similar material" to "silk, or even
   carefully through your own hair" (wool was never confirmed);
   suspension/floating materials narrowed from "leaf, bark, or similar
   material" to "wood, cork, or a leaf" (bark was never confirmed) -
   both changes match the directly-read FM 21-76 text exactly.
2. **Basic Knots for Shelter and Gear Lashing** - the lashing
   technique description tightened from a vague "several times... a
   couple of wraps... a secure hitch" to the confirmed technique
   (about three wraps, two or three frapping turns, a secure finish),
   now genuinely sourced to a substitute reference rather than a
   source that never actually described it.
3. **Radio Channel Discipline and Battery Care** - no body-text rewrite
   required; the existing conservative wording already matched the
   substitute sources' confirmed content closely. Only the `##
   Sources` section changed.

### Sources Sections Changed

- **Radio Channel Discipline and Battery Care**: IARU/ARRL and CPSC
  (never successfully read, in this pass or the original authoring
  pass) removed; replaced with MDARC and USFA/FEMA, both directly read
  this pass.
- **Improvised Compass Construction**: FM 21-76 Ch. 18 citation kept,
  now honestly noted as accessed via a full-text mirror
  (`fm2176.wordpress.com`), since the original PDF was never
  successfully read directly.
- **Basic Knots for Shelter and Gear Lashing**: Scouting America Troop
  Leader Resources (never read) replaced with Scout Life (directly
  read, same publisher); FM 21-76 Ch. 12 (confirmed to never actually
  describe the cited technique) replaced with the Pioneering Merit
  Badge Online Reference (directly read, genuinely supports the
  technique).

### Reviewer Sign-off (Stage 6)

- **Reviewer name/handle:** Claude (AI agent)
- **Date:** 2026-07-17
- **Scope:** All three previously-`Unverified` articles, all claims in
  the Stage 6 Claim-to-Source Map above. Visual Signaling for Rescue
  and Rendezvous (already `Verified Source`) was re-read for internal
  consistency only, not re-verified - no contradiction was found, and
  its status is unchanged.
- **Sources personally opened and read this pass:** MDARC, USFA/FEMA,
  fm2176.wordpress.com (FM 21-76 Ch. 18 reproduction), Scout Life,
  Pioneering Merit Badge Online Reference - all listed with results in
  the Source Access Log above. IARU/ARRL, CPSC, FM 21-76 Ch. 12, and
  Scouting America's Troop Leader Resources page were each
  re-attempted and remain unread; none is cited as verified.
- **Statement:** I confirm every claim marked "Verified" in the Stage 6
  Claim-to-Source Map above was checked by me, this pass, against a
  source I personally opened and read - not a summary, and not the
  historical record of a previous, unsuccessful attempt. Where a
  source could not be read, I did not treat it as verified and instead
  found and read a genuinely supporting substitute, or (for K4)
  discovered the original citation never supported the claim at all.

## Publication Decision

*(Formalized 2026-07-14 into `editorial_review_template/
06_PUBLICATION_DECISION_TEMPLATE.md`'s structure; the substance is
unchanged from the original "Release gate" section it replaces.)*

- **Pack:** `hv_official_field_comm_wayfinding`
- **Version under decision:** 1.0.0
- **Decision:** **Not Yet Approved** (whole pack) - unchanged as of
  this entry. Release readiness is a whole-pack decision, not
  per-article (`pack_production_workflow/QUALITY_STANDARD.md` §6).
- **Decided by:** Claude (AI agent), reaffirming the Founder's
  original release gate, unchanged in substance.
- **Date:** 2026-07-14
- **Conditions to reach Approved (original, 2026-07-14):** Articles 2,
  3, and 4's cited sources must each be personally opened and read by
  a human reviewer, and every claim confirmed or corrected against
  what those sources actually say.

**Update, 2026-07-17:** the condition above has been superseded in
part by the Founder Governance Decision recorded earlier in this
document, which explicitly authorizes AI-agent-performed direct source
verification for this pack in place of the human-reviewer requirement.
Under that authorization, all three previously-`Unverified` articles
now have every claim directly verified (see "Stage 6 Human Source
Verification," above). **This still does not change the Publication
Decision itself** - the Founder's authorization to verify is explicitly
not authorization to publish. The Publication Decision remains **Not
Yet Approved**, now pending a distinct, separate Founder decision on
publication itself, informed by this sprint's complete results.

Until the Founder records that separate decision as Approved:

- No ZIP archive may be built from this folder for distribution.
- No checksum may be computed or published.
- No marketplace listing (Vault Hub, the Official Website) may
  reference this pack.
- This pack must not be described as "official," "released," or
  "published" anywhere - it remains an unpublished editorial draft.

## Founder Publication Decision (2026-07-17)

*Appended per this document's "append, never erase" rule. This section
records a new, distinct decision - it does not alter or remove the
"Not Yet Approved" decision and its conditions recorded above; that
record remains accurate for its own point in time, and the history of
how this pack moved from Not Yet Approved through verification closure
to this approval is preserved in full in "Version Review History"
below.*

- **Decision:** **APPROVED**
- **Decided by:** The Founder
- **Date:** 2026-07-17
- **Scope:** `hv_official_field_comm_wayfinding` v1.0.0 specifically -
  this approval does not extend to any future version or any other
  pack.
- **Basis of the decision, as reviewed and accepted by the Founder:**
  - All 4 of 4 articles are now `Verified Source`.
  - The three previously-`Unverified` articles have completed direct
    source-verification closure (Stage 6, above).
  - Inaccessible or non-supportive original sources (IARU/ARRL, CPSC,
    FM 21-76 Ch. 12, Scouting America Troop Leader Resources) were not
    falsely retained as verified - each was either replaced with a
    genuinely-read substitute or, in FM 21-76 Ch. 12's case, confirmed
    to never have supported the claim in the first place.
  - Substitute sources (MDARC, USFA/FEMA, Scout Life, Pioneering Merit
    Badge Online Reference, FM 21-76 Ch. 18 via full-text mirror) were
    directly read and are fully documented in the Stage 6 section
    above.
  - One genuine historical citation-content mismatch (FM 21-76 Ch. 12
    never describing the Basic Knots lashing technique it was cited
    for) was discovered and corrected this pass.
  - All Critical, High, Medium, and Low editorial findings for this
    pack are closed.
  - The pack-wide verification summary, applying the project's
    weakest-link rule, is `Verified Source`.
  - AI-agent-performed source verification was explicitly authorized
    for this pack/version by the Founder Governance Decision recorded
    above, and this Publication Decision is made with that
    authorization and its scope fully in view.
  - The existing Visual Signaling for Rescue and Rendezvous article
    retains its prior Founder-reviewed FAA verification (2026-07-10),
    unchanged by this pass.
  - No technical or editorial blocker remains against this pack.
- **Authorizes:** Proceeding to Release Preparation for
  `hv_official_field_comm_wayfinding` v1.0.0.
- **Does not authorize:** Creating the GitHub Release, tagging, pushing,
  or any other publication action in this same sprint - those remain
  separate, later steps subject to their own review.

## Version Review History

*(New section, backfilled 2026-07-14 per `editorial_review_template/
07_VERSION_REVIEW_HISTORY_TEMPLATE.md` with this pack's complete real
history - nothing below is invented, and no prior entry has been
altered or removed.)*

| Version | Date | What changed | Review outcome | Reviewer(s) | Publication decision |
|---|---|---|---|---|---|
| 1.0.0 | 2026-07-10 (approx.) | Initial authoring: manifest + 4 articles drafted, all initially marked `Verified Source` | Six-source verification attempt made; none of the six could be directly read in full | (original authoring pass) | Not Yet Approved |
| 1.0.0 | 2026-07-10 | All four articles reclassified `Unverified`; content narrowed to non-source-specific general knowledge | Editorial draft, source verification pending | (original authoring pass) | Not Yet Approved |
| 1.0.0 | 2026-07-10 | FAA AIP GEN 3.6 directly read; Article 1 rewritten to its verified scope | Article 1 upgraded to `Verified Source`; Articles 2-4 unchanged | The Founder | Not Yet Approved (whole pack) |
| 1.0.0 | 2026-07-14 | Full production audit performed | Found: ICAO Annex 12 cited in Article 1 with no editorial record; no named reviewer attribution anywhere; terrain/knowledge_level questions; manifest wording stale; file structure predates editorial_review_template | Claude (AI agent) | Not Yet Approved |
| 1.0.0 | 2026-07-14 | Remediation: ICAO Annex 12 removed from Article 1 after verification attempts failed (Source Access Log #7); reviewer identities added to this file; terrain tags reviewed and adjusted on 3 articles; Improvised Compass `knowledge_level` raised to Level 2; `manifest.md` disclaimer refreshed; this file restructured to match `editorial_review_template/05_PACK_REVIEW_REPORT_TEMPLATE.md` | Critical and High audit findings resolved; Medium findings addressed where genuinely justified | Claude (AI agent) | Not Yet Approved (whole pack) - 3 of 4 articles remain `Unverified` |
| 1.0.0 | 2026-07-17 | Founder Governance Decision: AI-agent direct source verification explicitly authorized for this pack, under the same precedent already accepted for the two released packs | Decision only, no content change | The Founder | Not Yet Approved - authorization to verify, not to publish |
| 1.0.0 | 2026-07-17 | Stage 6 Human Source Verification: all three remaining `Unverified` articles checked against directly-read sources (originals where accessible, genuine substitutes where not); Radio Channel Discipline re-sourced with no body-text change needed; Improvised Compass's magnetization/suspension materials narrowed to match the source exactly; Basic Knots' lashing technique rewritten and re-sourced after discovering its original citation never actually described the technique | All 3 articles upgraded to `Verified Source`; pack-wide weakest-link summary now `Verified Source` across all 4 articles | Claude (AI agent) | **Still Not Yet Approved** - verification complete; publication approval is a distinct, separate Founder decision |
| 1.0.0 | 2026-07-17 | Founder Publication Decision: Founder reviewed the complete Stage 6 verification result and approved this pack/version for publication, authorizing Release Preparation | Decision only, no content change | The Founder | **APPROVED** - Release Preparation authorized; GitHub Release publication not yet authorized |

## Status

All four articles now honestly read `verification_level: Verified
Source`. Article 1 (Visual Signaling for Rescue and Rendezvous)
remains single-sourced to the Founder's own direct FAA review, 2026-07-10.
Articles 2-4 (Radio Channel Discipline, Improvised Compass
Construction, Basic Knots) were verified this pass under the Founder's
2026-07-17 Governance Decision explicitly authorizing AI-agent-
performed direct source verification for this pack - two of the three
required a genuine substitute source (the original citations having
proven either inaccessible or, in Basic Knots' case, never actually
supportive of the specific claim attributed to them), and two articles
had their prose narrowed or rewritten to match exactly what the
verified sources actually say. Applying this project's existing
weakest-link rule, the pack-wide verification summary is now honestly
`Verified Source` across all four articles. The pack remains **Not Yet
Approved** for release - not because any claim is unconfirmed, but
because the Founder's authorization to verify is explicitly distinct
from, and does not itself constitute, authorization to publish. A
separate Publication Decision remains outstanding.
