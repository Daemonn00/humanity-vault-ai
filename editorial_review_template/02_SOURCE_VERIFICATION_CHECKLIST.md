# Source Verification Checklist

Work through this once per **source** a pack cites (not once per
claim - a single source may support several claims; see
`03_CLAIM_VERIFICATION_TEMPLATE.md` for the per-claim record). The
purpose of this checklist is to force an honest answer to one
question: *did a named verifier - a human reviewer, or an AI agent
meeting `QUALITY_STANDARD.md` §9's conditions - actually open and read
this source's real content*, or was it only found and described
secondhand?

A search-engine summary, an AI-generated overview, a source's own
"about" or landing page, or a citation in another document are **not**
the same as reading the source. Record the difference plainly - this
project has previously had to walk back a pack's verification claims
after discovering exactly this gap (see
`official_packs/field_communication_wayfinding/REVIEW_NOTES.md` for
the real, worked example this template formalizes).

Copy one copy of this block per source into `REVIEW_NOTES.md`'s
"Source Access Log" section.

## Source record

- **Source name/title:**
- **Source URL or citation:**
- **Is this a credible, appropriate source for this claim?** (Prefer
  official agencies, standards bodies, technical manuals, or
  well-established reference works. Avoid blogs, forums, and
  unsourced secondary summaries as a claim's *sole* support.)
  - [ ] Yes, appropriate
  - [ ] No / uncertain - explain:

## Access attempt log

Record every attempt, successful or not - this is not just for
successes. If the first attempt failed, record what was tried next,
exactly as the existing precedent does.

| Attempt | Method | Result |
|---|---|---|
| 1 | e.g. direct URL fetch | e.g. HTTP 403 |
| 2 | e.g. Wayback Machine | e.g. unavailable |
| 3 | e.g. direct human review by [reviewer name], [date] | e.g. full text read |

## Verification outcome

- [ ] **Directly verified** - a named verifier (a human reviewer, or
      an AI agent meeting `QUALITY_STANDARD.md` §9's conditions - see
      below) personally opened and read this source's actual content.
- [ ] **Not directly verified** - every attempt above failed, or only
      secondhand descriptions of the source were available.

If directly verified:
- **Verified by:**
- **Date:**
- **What was actually read** (page range, section, figure numbers,
  etc. - be specific; "the document" is not enough):

If not directly verified:
- **What is this source still allowed to support?** Per this
  project's standard: nothing may be marked `Verified Source` on the
  strength of this source until it is directly read. Content may
  still reference this source as a *topical* pointer, written as
  general, non-source-specific practical knowledge - never restated
  as if a specific detail came from a source no one has actually read.
