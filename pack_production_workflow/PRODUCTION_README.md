# Official Knowledge Pack Production Workflow (v1)

This folder is the entry point for continuously producing new
**Official** Knowledge Packs, from a blank idea through to a
published, installable pack. It contains **no real pack content** -
only documentation and reusable templates, exactly like
`pack_authoring_template/` and `editorial_review_template/`.

## The full pipeline

```
Topic Selection        Research              Source Collection       Writing
(this folder)          (this folder)         (this folder)           (pack_authoring_template/)
     |                      |                      |                      |
     v                      v                      v                      v
TOPIC_SELECTION_    RESEARCH_PLAN_        SOURCE_COLLECTION_    manifest.md +
TEMPLATE.md         TEMPLATE.md           TEMPLATE.md           articles, per
confirms the pack   identifies what       logs every source     WRITING_GUIDELINES.md
is worth making     needs verifying,      actually found,       (this folder)
                     per article           tiered by quality


        Editorial Review              Release Pipeline           Publication
        (editorial_review_             (release_pipeline/)        (GitHub Release +
         template/)                                                Registry Generator +
             |                              |                      Vault Hub + Website)
             v                              v                            v
     REVIEW_NOTES.md is             A human runs                 registry_generator is
     opened; every claim            bin/release.dart             re-run for real;
     from Source Collection         only after the                registry.json is
     is checked against its         Publication Decision           regenerated and
     actual source, not a           says Approved                 published; the pack
     summary                                                       becomes visible
```

Everything in this folder is a **process document**: no database, no
web UI, no Flutter code, no website code, and no change to the
Registry Schema or Registry Generator. It sits entirely upstream of
`editorial_review_template/` and `release_pipeline/`, both of which
remain exactly as they already are.

## The seven documents in this folder

| File | Stage | Purpose |
|---|---|---|
| `TOPIC_SELECTION_TEMPLATE.md` | Topic Selection | Worksheet + acceptance criteria for choosing what pack to make next. |
| `RESEARCH_PLAN_TEMPLATE.md` | Research | Plans what needs verifying, per article, before writing begins. |
| `SOURCE_COLLECTION_TEMPLATE.md` | Source Collection | Logs every source actually found, tiered by the source quality hierarchy. |
| `WRITING_GUIDELINES.md` | Writing | Pack-specific writing standard, extending `docs/Knowledge_Authoring_Standard_v1.md`. |
| `QUALITY_STANDARD.md` | All stages | The canonical policy: acceptance criteria, source hierarchy, safety rules, citation policy, update policy, maintenance, deprecation. |
| `PACK_PRODUCTION_CHECKLIST.md` | All stages | The master end-to-end checklist tying every stage together for one pack. |
| `PRODUCTION_README.md` | - | This file. |

## How this connects to what already exists, without changing it

- **`pack_authoring_template/`** already defines the Writing stage's
  exact file format (`manifest.md`, article frontmatter/sections).
  `WRITING_GUIDELINES.md` here adds pack-specific writing standards
  and policy on top of that format - it does not redefine the format
  itself.
- **`editorial_review_template/`** already defines Editorial Review's
  templates (source verification, claim-to-source mapping, reviewer
  sign-off, publication decision, version history). This folder's
  `SOURCE_COLLECTION_TEMPLATE.md` output becomes the raw material for
  that stage's Source Access Log and Claim-to-Source Map - it is a
  precursor to those templates, not a replacement for them.
- **`release_pipeline/`** already defines the Release stage
  (packaging, checksum, version consistency, a registry-generation
  dry run). Nothing in this folder changes when, how, or whether that
  tool runs - a pack only ever reaches `release_pipeline/` after
  Editorial Review's Publication Decision says so.
- **`registry_generator/`** and the Registry Schema are untouched.
  Deprecation and update policy (see `QUALITY_STANDARD.md`) describe
  the *human decision process* around a pack's lifecycle; they do not
  add or change any field the Registry Generator emits.

## Starting a new pack

1. Copy `TOPIC_SELECTION_TEMPLATE.md`, fill it in, and confirm the
   topic meets every acceptance criterion in `QUALITY_STANDARD.md`.
2. Copy `RESEARCH_PLAN_TEMPLATE.md` and plan what each planned
   article needs to verify before writing starts.
3. Do the research; copy `SOURCE_COLLECTION_TEMPLATE.md` and log every
   source actually found, tiered per `QUALITY_STANDARD.md`'s source
   quality hierarchy.
4. Write the pack following `pack_authoring_template/` for file
   format and `WRITING_GUIDELINES.md` for pack-specific standards.
5. Hand off to Editorial Review: create the pack's
   `REVIEW_NOTES.md` from `editorial_review_template/`, seeding its
   Source Access Log directly from this pack's completed
   `SOURCE_COLLECTION_TEMPLATE.md`.
6. Once Editorial Review's Publication Decision reads **Approved for
   Release**, a human runs `release_pipeline/bin/release.dart`.
7. Use `PACK_PRODUCTION_CHECKLIST.md` throughout as the single
   tracking document spanning all of the above, so nothing is skipped
   silently.
