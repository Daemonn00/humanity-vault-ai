# Source Collection — Mass Casualty & Trauma First Aid

Produced per `pack_production_workflow/SOURCE_COLLECTION_TEMPLATE.md`,
following on from `mass_casualty_first_aid_RESEARCH_PLAN.md`.

**Important distinction, honestly stated:** every source below was
**found and confirmed to exist** via web search during this sprint -
titles, publishers, and URLs were checked for real, and search-result
summaries of their content were reviewed to confirm they're on-topic
and credible. **None of them has been directly opened and read in
full yet** - that is Stage 6 (Human Verification), explicitly out of
scope for this sprint. Marking a source "found" here is not the same
as "verified," exactly per this project's own established, hard-won
distinction (see `official_packs/field_communication_wayfinding/
REVIEW_NOTES.md`'s own history for why this distinction matters).

## Pack

`hv_official_mass_casualty_first_aid`

## Source log

### Source 1: CHEMM Triage Guidelines
- **Publisher:** Chemical Hazards Emergency Medical Management
  (CHEMM), U.S. Department of Health & Human Services
- **URL:** chemm.hhs.gov/triage.htm
- **Supports:** Article 1 (Triage Basics for Multiple Casualties),
  claims 1-3
- **Tier:** **Tier 1** - official federal health agency technical
  resource
- **Found via:** web search, confirmed as a real, currently-existing
  HHS page describing triage systems including START/SALT
- **Directly read this session?** No - found and confirmed to exist
  only

### Source 2: American Red Cross — Fractures
- **Publisher:** American Red Cross
- **URL:** redcross.org/take-a-class/resources/learn-first-aid/fractures
- **Supports:** Article 2 (Fracture and Sprain Stabilization), claims
  1-2
- **Tier:** **Tier 1**
- **Found via:** web search
- **Directly read this session?** No

### Source 3: American Red Cross — Muscle, Bone and Joint Injury
- **Publisher:** American Red Cross
- **URL:** redcross.org/take-a-class/resources/learn-first-aid/muscle-bone-joint-injury
- **Supports:** Article 2, claim 3 (splinting principles)
- **Tier:** **Tier 1**
- **Found via:** web search
- **Directly read this session?** No

### Source 4: WHO — Burns fact sheet
- **Publisher:** World Health Organization
- **URL:** who.int/news-room/fact-sheets/detail/burns
- **Supports:** Article 3 (Burn Assessment and Field Treatment), all
  four claims
- **Tier:** **Tier 1**
- **Found via:** web search; a search-result summary specifically
  surfaced language cautioning against "prolonged" water cooling
  (hypothermia risk) - **this needs the reviewer's close attention
  during Stage 6**, since it's a nuance, not a flat "cool for 20
  minutes" instruction, and other (non-WHO) international guidelines
  reviewed in the same search phrase this differently
- **Directly read this session?** No

### Source 5: American Red Cross — Shock
- **Publisher:** American Red Cross
- **URL:** redcross.org/take-a-class/resources/learn-first-aid/shock
- **Supports:** Article 4 (Shock Recognition and Management), all four
  claims
- **Tier:** **Tier 1**
- **Found via:** web search
- **Directly read this session?** No

### Source 6: 2024 American Heart Association / American Red Cross First Aid Guidelines
- **Publisher:** American Heart Association and American Red Cross
  (jointly), published in *Circulation*
- **URL:** ahajournals.org/doi/10.1161/CIR.0000000000001281
- **Supports:** Article 4, as a secondary clinical cross-check for
  positioning guidance specifically
- **Tier:** **Tier 1** (joint publication of two established medical/
  humanitarian authorities)
- **Found via:** web search; noted as a long clinical document - Stage
  6 review should expect to need more time on this one than a typical
  Red Cross consumer-facing page
- **Directly read this session?** No

### Source 7: CDC — First Aid for Heat Illness
- **Publisher:** U.S. Centers for Disease Control and Prevention
- **URL:** stacks.cdc.gov/view/cdc/138337/cdc_138337_DS1.pdf
- **Supports:** Article 5 (Hypothermia and Heatstroke Field Response),
  heatstroke claims (3-4)
- **Tier:** **Tier 1**
- **Found via:** web search
- **Directly read this session?** No

### Source 8: CDC/NIOSH — Heat-Related Illnesses
- **Publisher:** CDC / National Institute for Occupational Safety and
  Health
- **URL:** cdc.gov/niosh/heat-stress/about/illnesses.html
- **Supports:** Article 5, heatstroke claims (secondary/cross-check to
  Source 7)
- **Tier:** **Tier 1**
- **Found via:** web search
- **Directly read this session?** No

### Source 9: CDC/NIOSH — Cold-related Illnesses in Workers
- **Publisher:** CDC / National Institute for Occupational Safety and
  Health
- **URL:** cdc.gov/niosh/cold-stress/about/related-illness.html
- **Supports:** Article 5, hypothermia claims (1-2)
- **Tier:** **Tier 1**
- **Found via:** a targeted follow-up search specifically to close the
  gap identified in the Research Plan (the first search pass only
  surfaced a Tier 2 Mayo Clinic page for hypothermia) - confirms a
  genuine Tier 1 source exists for both halves of Article 5
- **Directly read this session?** No

## Tier 1 sources identified (summary)

All nine sources found are **Tier 1** per
`pack_production_workflow/QUALITY_STANDARD.md` §2 - official agencies
(HHS/CHEMM, WHO, CDC/NIOSH) or established international humanitarian/
medical authorities (American Red Cross, jointly with the American
Heart Association for Source 6). **No Tier 2 or Tier 3 source is
needed anywhere in this pack** - a notably stronger starting position
than `hv_official_field_comm_wayfinding`'s original six sources, none
of which were confirmed accessible on first attempt. This does not
mean verification will be easy (Stage 6 still requires directly
reading all nine), only that source *quality*, as opposed to source
*accessibility*, is not expected to be a limiting factor for this pack.

## Collection summary

| Article | Claims with a Tier 1 source identified | Claims with no source | Realistic target `verification_level` |
|---|---|---|---|
| 1. Triage Basics for Multiple Casualties | 3 of 3 | 0 | Verified Source |
| 2. Fracture and Sprain Stabilization | 3 of 3 | 0 | Verified Source |
| 3. Burn Assessment and Field Treatment | 4 of 4 | 0 | Verified Source |
| 4. Shock Recognition and Management | 4 of 4 | 0 | Verified Source |
| 5. Hypothermia and Heatstroke Field Response | 4 of 4 | 0 | Verified Source |

Every article now has a full Tier 1 source candidate for every
planned claim. This is the basis for `verification_level: Unverified`
being the correct **starting** frontmatter value once writing begins
(per `WRITING_GUIDELINES.md` - never start at Verified Source
optimistically), with a clear, realistic path to Verified Source once
Stage 6 confirms each source directly.
