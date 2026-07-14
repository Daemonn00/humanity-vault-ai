# Pack Production Checklist

The single master checklist spanning the entire pipeline for one
pack, from a blank idea to a published release. Copy this file (or
its checkboxes) into your own tracking note per pack - it does not
replace any other template in this folder or in
`editorial_review_template/`, it tracks that each one was actually
done, in order.

## Pack

- **Working title:**
- **`pack_id`:**
- **Target version:**

## Stage 1 - Topic Selection

- [ ] `TOPIC_SELECTION_TEMPLATE.md` completed
- [ ] All six acceptance criteria in `QUALITY_STANDARD.md` §1 pass
- [ ] Decision recorded: Accepted

## Stage 2 - Research

- [ ] `RESEARCH_PLAN_TEMPLATE.md` completed for every planned article
- [ ] Every planned claim has a candidate source or an explicit
      general-knowledge/drop fallback
- [ ] Safety-sensitive articles flagged

## Stage 3 - Source Collection

- [ ] `SOURCE_COLLECTION_TEMPLATE.md` completed - every source logged
      honestly, including ones only found via summary (not directly
      read)
- [ ] Every source tiered per `QUALITY_STANDARD.md` §2
- [ ] Collection Summary table filled in with a realistic
      `verification_level` per article

## Stage 4 - Writing

- [ ] Manifest written per `pack_authoring_template/manifest.md`,
      with `hv_official_` prefix and well-formed semver
      (`WRITING_GUIDELINES.md`)
- [ ] Every article written per `pack_authoring_template/
      example_article.md`'s format
- [ ] `verification_level` per article matches the Source Collection
      Summary honestly (not optimistically)
- [ ] Slugs are pack-prefixed and checked against the core corpus and
      other packs for collisions
- [ ] Safety warnings written explicitly into `## Main Content` where
      flagged in Stage 2
- [ ] No time-sensitive references (URLs, "as of [year]", product/app
      names)

## Stage 5 - Editorial Review

*(Full detail lives in `editorial_review_template/` - this is just the
handoff/tracking checkpoint.)*

- [ ] `REVIEW_NOTES.md` created in the pack's own
      `official_packs/<pack_dir>/` folder, from
      `editorial_review_template/05_PACK_REVIEW_REPORT_TEMPLATE.md`
- [ ] `01_EDITORIAL_REVIEW_CHECKLIST.md` run and results pasted in
- [ ] Every source from Stage 3 has a Source Access Log entry
      (`02_SOURCE_VERIFICATION_CHECKLIST.md`)
- [ ] Every claim has a row in the Claim-to-Source Map
      (`03_CLAIM_VERIFICATION_TEMPLATE.md`)
- [ ] At least one reviewer sign-off recorded
      (`04_REVIEWER_SIGNOFF_TEMPLATE.md`)
- [ ] Publication Decision recorded
      (`06_PUBLICATION_DECISION_TEMPLATE.md`)
- [ ] A row added to Version Review History
      (`07_VERSION_REVIEW_HISTORY_TEMPLATE.md`)
- [ ] **Publication Decision reads "Approved for Release" (or
      "Partially Approved" naming this exact version) before
      proceeding**

## Stage 6 - Release Pipeline

*(Full detail lives in `release_pipeline/RELEASE_CHECKLIST.md` - this
is just the handoff/tracking checkpoint.)*

- [ ] `dart run bin/release.dart <pack_dir> <version>` run, all 8
      checks pass
- [ ] Packaged ZIP and `release-manifest.json` reviewed
- [ ] Real GitHub Release created with the reported tag, ZIP uploaded
- [ ] The real `registry_generator` re-run for real against the
      published release
- [ ] Regenerated `registry/registry.json` committed and pushed
      (never hand-edited)

## Stage 7 - Publication

- [ ] Pack visible in Vault Hub's catalog (reads the published
      registry.json)
- [ ] Pack visible on the Official Website's Knowledge Packs page and
      Pack Detail page
- [ ] Changelog updated on the Official Website (if applicable)

## Ongoing - Maintenance / Deprecation

Not part of the initial production run, but tracked against this same
pack going forward per `QUALITY_STANDARD.md` §7-8:

- [ ] Any reported issue triaged and, if valid, taken through a new
      version bump (Stages 4-6 again)
- [ ] Deprecation decision (if any) recorded in this pack's
      `REVIEW_NOTES.md`, per `QUALITY_STANDARD.md` §8
