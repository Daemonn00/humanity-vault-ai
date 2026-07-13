# Official Knowledge Pack Editorial Workflow (v1)

This folder contains the reusable templates for the editorial review
and source-verification workflow every **Official** Knowledge Pack
goes through before it may enter the Release Pipeline. It contains
**no real pack content** - only documentation and blank templates,
mirroring how `pack_authoring_template/` contains no real pack content
either.

## Where this sits in the pipeline

```
Author                Editorial Review          Verification              Release Pipeline
(pack_authoring_      (this folder's            (this folder's            (release_pipeline/)
 template/)            templates 01, 04, 05)     templates 02, 03, 06, 07)
   |                        |                          |                         |
   v                        v                          v                         v
manifest.md +      REVIEW_NOTES.md is        Every claim is checked     A human runs
articles are        opened/created for        against its source,       release_pipeline
written, per        this pack; structural      not a search summary.     only after the
AUTHORING_           checklist run; one or      Reviewer sign-offs        Publication
CHECKLIST.md         more reviewers begin       recorded.                 Decision (06)
                     working through it.                                  says "Approved".
```

This workflow is a **process**, not software: there is no database, no
web UI, and nothing here is ever parsed or enforced by code. It is
entirely Markdown, read and filled in by hand by whoever is doing the
review.

## The seven templates

| File | Purpose |
|---|---|
| `01_EDITORIAL_REVIEW_CHECKLIST.md` | Structural/policy checklist - run once, early, before claim-by-claim work begins. |
| `02_SOURCE_VERIFICATION_CHECKLIST.md` | Per-source checklist: was it actually opened and read, or only found via a search summary? |
| `03_CLAIM_VERIFICATION_TEMPLATE.md` | The claim-to-source map: one row per factual claim, its source, verification status, reviewer, and date. |
| `04_REVIEWER_SIGNOFF_TEMPLATE.md` | A repeatable sign-off block - supports any number of reviewers, each scoped to what they actually reviewed. |
| `05_PACK_REVIEW_REPORT_TEMPLATE.md` | The master report skeleton that assembles 01-04 (plus 06, 07) into one pack's `REVIEW_NOTES.md`. |
| `06_PUBLICATION_DECISION_TEMPLATE.md` | The final go/no-go: what may (or may not) proceed to the Release Pipeline, and on what conditions. |
| `07_VERSION_REVIEW_HISTORY_TEMPLATE.md` | A running log of review outcomes across a pack's versions over time. |

## How to use these templates for a real pack

1. Copy `05_PACK_REVIEW_REPORT_TEMPLATE.md` into the pack's own
   directory under `official_packs/<pack_dir>/`, **named exactly
   `REVIEW_NOTES.md`** (see "Why the filename matters" below).
2. Work through `01_EDITORIAL_REVIEW_CHECKLIST.md` first; paste its
   filled-in results into `REVIEW_NOTES.md`'s matching section.
3. For every factual claim, use `02_SOURCE_VERIFICATION_CHECKLIST.md`
   to decide whether a source has actually been verified, and record
   each claim as a row using `03_CLAIM_VERIFICATION_TEMPLATE.md`'s
   table shape.
4. Each reviewer who works on the pack adds their own block from
   `04_REVIEWER_SIGNOFF_TEMPLATE.md` - there is no limit on how many
   reviewers a pack can have, and partial review (e.g. one reviewer
   confirms one article, a second reviewer confirms the rest) is
   normal and expected.
5. When (and only when) every claim that needs to be `Verified Source`
   has been directly confirmed, fill in
   `06_PUBLICATION_DECISION_TEMPLATE.md`'s decision block. A pack can
   be partially approved (e.g. one article approved, others still
   gated) - this mirrors the real, already-existing precedent in
   `official_packs/field_communication_wayfinding/REVIEW_NOTES.md`.
6. Every time the pack is revised and re-reviewed - including a later
   version bump - append a new row to
   `07_VERSION_REVIEW_HISTORY_TEMPLATE.md`'s table rather than
   overwriting the previous entry.
7. Only once the Publication Decision says **Approved for Release**
   for the version being published does a human run
   `release_pipeline/bin/release.dart` against the pack. The Release
   Pipeline has no awareness of any of this - see below.

## Why the filename matters: `REVIEW_NOTES.md`, not a new file

Every pack's assembled editorial record must be named exactly
`REVIEW_NOTES.md`, at the pack's own directory root
(`official_packs/<pack_dir>/REVIEW_NOTES.md`) - the same filename and
location already used by the one existing pack in this repo. This is
a hard requirement, not a style preference:

- `release_pipeline`'s `Packager` already excludes a file named
  `review_notes.md` (case-insensitively) from every release ZIP it
  builds - by filename, not by content inspection. A differently-named
  editorial file would not be excluded, and would be accidentally
  packaged into a public release ZIP.
- `registry_generator`'s `PackReader` already documents that it "never
  reads REVIEW_NOTES.md, CHANGELOG.md, or LICENSE" - a boundary
  enforced by filename.

Reusing this exact, already-safe filename is what lets this entire
workflow "integrate naturally... without modifying" `official_packs/`,
`release_pipeline/`, or `registry_generator/`: nothing about how those
tools work needs to change, because nothing here introduces a new
per-pack filename for them to worry about. If a pack's review record
grows large, keep it as sections within the one `REVIEW_NOTES.md` file
(as shown in `05_PACK_REVIEW_REPORT_TEMPLATE.md`) rather than splitting
it into several files.

## What this workflow deliberately does not do

- **No automated enforcement.** Nothing here is parsed by
  `release_pipeline` or `registry_generator`, and nothing ever will be
  - `REVIEW_NOTES.md` staying human-only, editorial-only content is a
  deliberate, already-established architectural boundary (see
  `registry_generator/README.md`), not an oversight.
- **No reviewer accounts or identity system.** A reviewer is just a
  name or handle written in plain text, consistent with the project's
  no-account philosophy everywhere else.
- **No retroactive change to the existing pack.** This v1 workflow is
  for packs going through review from here forward.
  `official_packs/field_communication_wayfinding/REVIEW_NOTES.md` is
  left exactly as it already is - it is itself a real, working example
  of everything these templates formalize (a claim-to-source map, a
  hard-boundary checklist, per-article verification levels, and a
  release gate), just written ad hoc before this template existed.
- **Does not decide when a pack is ready.** These are structural
  templates for recording a human decision, not a substitute for the
  judgment that decision requires.
