# Research Plan — Mass Casualty & Trauma First Aid

Produced per `pack_production_workflow/RESEARCH_PLAN_TEMPLATE.md`, for
Production Sprint #003 (Launch Batch 1, pack 2 of 4). **No article
content has been written yet** - this is the planning artifact that
precedes Stage 4 (Writing) in the established production cycle.

**File placement note:** kept as a sibling of `official_packs/`
(not inside a pack subdirectory), matching the precedent already
established for `field_communication_wayfinding_HUMAN_VERIFICATION_
WORKBOOK.md` - no `official_packs/hv_official_mass_casualty_first_aid/`
directory exists yet (no `manifest.md`), so there is nothing for
`release_pipeline` or `registry_generator` to see either way, but
keeping this pattern consistent avoids ever creating that risk later.

## Pack

- **`pack_id`:** `hv_official_mass_casualty_first_aid`
- **Working title:** Mass Casualty & Trauma First Aid
- **Mission (from the approved 25-pack roadmap):** Triage and treat
  injuries beyond single-victim CPR/wound care.
- **Category:** Medicine (all five articles)
- **Roadmap tier:** Tier 1 - Essential Survival (Launch Batch 1)

## Duplication check against the core corpus

`knowledge/medicine/` already contains `basic_cpr`,
`wound_care_and_bleeding_control`, and
`recognizing_and_treating_dehydration`. The five articles below were
deliberately chosen to sit **beyond** what those three already cover -
multi-casualty triage, fractures, burns, shock, and temperature-
related emergencies - not to restate them. No proposed article
duplicates an existing core corpus or official pack topic.

## Proposed complete article list

1. Triage Basics for Multiple Casualties
2. Fracture and Sprain Stabilization
3. Burn Assessment and Field Treatment
4. Shock Recognition and Management
5. Hypothermia and Heatstroke Field Response

(5 articles, matching the roadmap's own article-count estimate for
this pack.)

---

## Article 1: Triage Basics for Multiple Casualties

**Outline (structure only, no prose yet):**
- Summary: what triage is and why it matters when there are more
  injured people than immediate helpers.
- Main Content: assessing responsiveness/breathing quickly; sorting
  into priority groups (immediate/urgent care vs. can wait vs.
  walking/minor); why triage decisions are about doing the most good
  for the most people, not treating whoever is closest first.
- Benefits: bullet points on faster overall outcomes, clearer
  decision-making under pressure, reduced panic.
- Sources: see below.

**Key claims this article will need to make:**
1. A simple triage system exists specifically for when there are more
   injured people than can be treated one at a time.
2. Triage sorts people into a small number of priority categories
   based on how urgently and how likely treatment will help them.
3. A quick first check (can they walk / are they breathing / can they
   follow simple instructions) is enough to make an initial sorting
   decision without formal medical training.

**Candidate sources for each claim:**
- Claims 1-3 → CHEMM (Chemical Hazards Emergency Medical Management),
  U.S. Department of Health & Human Services, "Triage Guidelines"
  (chemm.hhs.gov/triage.htm)

**Target `verification_level` if research succeeds:** Verified Source
(CHEMM is a maintained official HHS technical resource - Tier 1).

**Fallback if the source cannot be found or directly read:** Describe
only the general, widely-taught concept of sorting by urgency (the
core idea behind every named triage system, e.g. START/SALT) without
naming a specific system's exact category labels or decision
thresholds, which vary between named systems and must not be
presented as one universal standard unless the source is confirmed to
support that framing.

**Safety sensitivity:** **Yes - high.** This is the highest-stakes
article in the pack: a triage decision directly affects who gets
helped first. Flagged for careful, explicit safety-warning drafting -
the article must be clear this is a last-resort framework for
genuinely overwhelming situations, not a replacement for calling
emergency services or for professional judgment when either is
available.

---

## Article 2: Fracture and Sprain Stabilization

**Outline:**
- Summary: how to recognize a possible fracture/sprain and stabilize
  it until real medical care is available.
- Main Content: signs of a possible fracture vs. sprain (and why
  telling them apart in the field is often not possible/necessary);
  when NOT to move someone (suspected head/neck/back/pelvis injury);
  basic splinting principles.
- Benefits: reduces further injury, reduces pain, improves outcome
  until real care is available.
- Sources: see below.

**Key claims:**
1. It's often not possible to reliably tell a fracture from a sprain
   or dislocation in the field - treat suspected injuries the same
   way when in doubt.
2. Suspected head, neck, back, or pelvis injuries should not be moved
   unless there's a more urgent safety reason.
3. Basic splinting principles: immobilize the joint above and below
   the injury; improvised materials (padded rigid material, cloth
   ties) can substitute for commercial splints.

**Candidate sources:**
- All three claims → American Red Cross, "Fractures" and "Muscle,
  Bone and Joint Injury" (redcross.org/take-a-class/resources/
  learn-first-aid/fractures and /muscle-bone-joint-injury)

**Target `verification_level`:** Verified Source (American Red Cross
is the same Tier 1 organization already directly-verifiable elsewhere
in this project's own established source hierarchy).

**Fallback:** If splinting specifics can't be confirmed against the
Red Cross pages directly, narrow the article to recognition and
"don't move, stabilize, seek care" guidance only, omitting specific
splinting technique detail.

**Safety sensitivity:** **Yes - high.** Incorrect handling of a
suspected spinal injury can cause serious harm. Flagged for explicit,
prominent warning language, not buried in a caveat.

---

## Article 3: Burn Assessment and Field Treatment

**Outline:**
- Summary: how to recognize burn severity and what to do (and not do)
  in the field.
- Main Content: cooling technique and duration; what never to apply to
  a burn; when a burn needs professional care; brief note on
  electrical/chemical burns needing different handling.
- Benefits: reduces tissue damage, reduces infection risk, improves
  healing outcomes.
- Sources: see below.

**Key claims:**
1. Cooling a burn with clean running water (not ice) reduces tissue
   damage.
2. Certain home remedies (oils, pastes, ice, butter) should never be
   applied to a burn.
3. Blisters should not be deliberately opened in the field.
4. Electrical and chemical burns need different handling than thermal
   burns (electrical: check the person for cardiac effects; chemical:
   dilute/flush rather than just cool).

**Candidate sources:**
- All four claims → World Health Organization, "Burns" fact sheet
  (who.int/news-room/fact-sheets/detail/burns)

**Target `verification_level`:** Verified Source (WHO is the
project's own benchmark Tier 1 international agency source).

**⚠ Noted tension to resolve during actual verification (not
resolved here):** initial research surfaced a possible nuance between
"cool with running water" as a general international first-aid norm
and WHO's own fact sheet specifically cautioning against **prolonged**
cooling (risk of hypothermia). The article must reflect exactly what
WHO's source says about duration/technique, not a generic "cool it"
claim - this is flagged explicitly so Stage 6 verification reads the
cooling-duration guidance especially carefully, word for word.

**Fallback:** If the WHO source's exact cooling guidance can't be
pinned down precisely, narrow the article to the "what never to do"
claims (which were unambiguous in research) and describe cooling only
in the WHO source's own terms once directly read, not from memory of
a general "20 minutes" figure seen in secondary sources.

**Safety sensitivity:** **Yes - high**, specifically because of the
cooling-duration nuance above - this is exactly the kind of detail
that must not be approximated.

---

## Article 4: Shock Recognition and Management

**Outline:**
- Summary: recognizing shock as a life-threatening emergency distinct
  from the injury that caused it.
- Main Content: recognition signs (skin color/temperature, pulse,
  breathing, mental state); positioning; what to avoid (giving food/
  drink); urgency of professional care.
- Benefits: earlier recognition improves survival odds; complements
  the pack's other injury-specific articles.
- Sources: see below.

**Key claims:**
1. Shock can develop after any serious injury or illness, not just
   visible blood loss.
2. Recognizable signs include cool/clammy/pale skin, rapid weak pulse,
   rapid shallow breathing, confusion or anxiety.
3. Field positioning (lying down, legs elevated if no trauma
   contraindication) can help until professional care arrives.
4. Do not give food or drink to someone showing signs of shock.

**Candidate sources:**
- All four claims → American Red Cross, "Shock"
  (redcross.org/take-a-class/resources/learn-first-aid/shock); the
  2024 AHA/Red Cross joint first aid guidelines
  (ahajournals.org/doi/10.1161/CIR.0000000000001281) as a secondary,
  more clinically detailed cross-check.

**Target `verification_level`:** Verified Source.

**Fallback:** If the leg-elevation positioning guidance turns out to
be conditional/contested when the source is actually read (positioning
recommendations have shifted in recent guideline updates per initial
research), state the caution/exception explicitly rather than a flat
recommendation, or omit the specific positioning detail and keep the
recognition-and-call-for-help guidance only.

**Safety sensitivity:** **Yes - high.** Shock is explicitly
life-threatening; incorrect positioning guidance for a trauma patient
could cause harm.

---

## Article 5: Hypothermia and Heatstroke Field Response

**Outline:**
- Summary: recognizing and responding to both cold- and heat-related
  emergencies in the field.
- Main Content: hypothermia warning signs and rewarming steps (gradual,
  center-of-body-first, no rapid rewarming); heatstroke warning signs
  and cooling steps (rapid cooling, no fluids if the person is
  confused/unconscious); when each requires emergency care.
- Benefits: complements existing core corpus dehydration content;
  covers both temperature extremes in one place.
- Sources: see below.

**Key claims:**
1. Hypothermia warning signs progress from shivering to confusion/
   clumsiness to unconsciousness.
2. Hypothermia field response: move out of cold, insulate, gently
   remove wet clothing, gradual center-of-body rewarming, no rapid
   rewarming (e.g. hot bath).
3. Heatstroke warning signs include very high body temperature,
   confusion/altered mental status, hot skin, rapid pulse.
4. Heatstroke field response: move to cooler environment, rapid
   cooling (cold water immersion or cool cloths/fanning), do NOT give
   fluids if the person is confused or losing consciousness.

**Candidate sources:**
- Claims 3-4 → U.S. Centers for Disease Control and Prevention (CDC),
  "First Aid for Heat Illness" (stacks.cdc.gov/view/cdc/138337/
  cdc_138337_DS1.pdf) and CDC/NIOSH "Heat-Related Illnesses"
  (cdc.gov/niosh/heat-stress/about/illnesses.html)
- Claims 1-2 → CDC/NIOSH, "Cold-related Illnesses in Workers"
  (cdc.gov/niosh/cold-stress/about/related-illness.html) - **Tier 1**,
  found during a follow-up search; closes the gap flagged in the
  original draft of this plan, where only a Tier 2 (Mayo Clinic)
  candidate had been found.

**Target `verification_level`:** Verified Source for both halves -
Tier 1 CDC sources now identified for heat and cold.

**Fallback:** If either CDC source's specific claims can't be
confirmed exactly as drafted above once directly read, narrow to
whichever claims the source does support, rather than keeping an
unconfirmed detail.

**Safety sensitivity:** **Yes - high**, on both halves - hypothermia
rewarming and heatstroke rehydration both have "the opposite of what
seems intuitive can be dangerous" failure modes (rapid rewarming,
giving fluids to a confused person) that must be stated as explicit,
prominent warnings, not soft suggestions.

---

## Ready to write? (per template checklist)

- [x] Every planned article has at least one Tier 1 candidate source
      identified (all five articles, including Article 5's cold-
      illness half after the follow-up search above).
- [x] No planned claim requires a source known in advance to be
      inaccessible.
- [x] Safety-sensitive articles flagged for explicit warning drafting
      - all five articles in this pack are flagged.

This plan is ready to proceed to Source Collection
(`mass_casualty_first_aid_SOURCE_COLLECTION.md`). **Writing (Stage 4)
has deliberately not started** - per this sprint's explicit scope.
