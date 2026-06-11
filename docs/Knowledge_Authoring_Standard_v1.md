# Humanity Vault Knowledge Authoring Standard v1

## 1. Purpose

This document defines the official format for all knowledge articles
stored under `knowledge/` in Humanity Vault AI. Following this
standard ensures every article:

- Loads correctly via the Markdown Loader (AssetManifest + frontmatter
  + section parser)
- Displays correctly in the Article Detail screen (metadata badges,
  Summary, Main Content, Benefits, Sources)
- Remains searchable (title, category)
- Scales to thousands of articles without code changes

The platform remains Offline First, Android First, with No Database,
No AI, and No Internet dependency. All knowledge is plain Markdown
bundled as app assets.

## 2. Article File Structure

Every article is a single `.md` file consisting of two parts, in this
order:

1. A YAML-style frontmatter block, delimited by `---` lines
2. A Markdown body made of `##` (H2) sections

```markdown
---
title: <Article Title>
category: <Category Display Name>
subcategory: <Optional Subcategory>
author: <Optional Author/Contributor>
created_date: <YYYY-MM-DD>
last_updated: <YYYY-MM-DD>
knowledge_level: <Level 1 | Level 2 | Level 3>
verification_level: <Verified Source | Community Verified | Historical Source | Unverified>
---

# <Article Title>

## Summary

<1-3 sentence overview of the article>

## Main Content

<The full body of knowledge - may be multiple paragraphs>

## Benefits

- <Bullet point>
- <Bullet point>

## Sources

- <Bullet point>
```

Notes:

- The `# <Article Title>` H1 line is for human readability only; the
  Loader does not parse it. `title` in frontmatter is authoritative.
- Frontmatter lines are simple `key: value` pairs - no nested YAML,
  no lists, no quotes required.
- Section headings (`## Summary`, `## Main Content`, etc.) are
  matched case-insensitively but must use exactly these names.

## 3. Required Metadata Fields

| Field      | Description                                                     |
|------------|------------------------------------------------------------------|
| `title`    | Full article title, matches the `# H1` heading                  |
| `category` | Display name of the category (e.g. `Survival`, `Medicine`)       |

These two fields are mandatory. If either is missing, the Loader will
skip the file entirely (it will not appear in the app).

`category` must match one of the existing `Category.name` values in
`categories_repository.dart` (Survival, Medicine, Agriculture,
Engineering, Electronics, Construction, History, Philosophy, Islam,
Local Wisdom), and the file's folder must match the corresponding
`folderName`.

## 4. Optional Metadata Fields

| Field                 | Description                                              | Display                          |
|-----------------------|-----------------------------------------------------------|-----------------------------------|
| `subcategory`         | A topic within the category (e.g. `Water`, `Daily Worship`) | Shown as an info line with a tag icon |
| `author`              | Author or contributor credit                              | Shown as "By <author>"            |
| `last_updated`        | Date the article content was last revised (`YYYY-MM-DD`)  | Shown as "Updated <date>"         |
| `knowledge_level`     | See Section 8                                              | Shown as a gold badge             |
| `verification_level`  | See Section 7                                              | Shown as a color-coded badge      |

`created_date` may also be included for authoring/maintenance
records. It is not currently displayed in the app but authors should
include it for future-proofing.

All optional fields may be omitted entirely (do not include the key
with an empty value - simply leave the line out). The app will not
render empty placeholders for missing fields.

## 5. Required Content Sections

| Section            | Purpose                                                        | Format        |
|---------------------|-----------------------------------------------------------------|----------------|
| `## Summary`        | A 1-3 sentence overview shown at the top of the article detail | Plain prose   |
| `## Main Content`   | The full explanation of the knowledge being preserved          | Plain prose, multiple paragraphs allowed |
| `## Benefits`       | Why this knowledge matters / what it enables                   | Bullet list (`- ` or `* `) |
| `## Sources`        | Where this knowledge comes from                                 | Bullet list (`- ` or `* `) |

All four sections are required for every article. If a section is
genuinely not applicable, it must still be present with at least one
bullet/sentence (e.g. `Sources: - Humanity Vault Contributors`)
rather than omitted, since the Article model treats these fields as
non-optional strings/lists.

## 6. Optional Content Sections

The Loader currently recognizes only the four sections in Section 5.
Additional `##` sections (e.g. `## Warnings`, `## Step-by-Step
Procedure`, `## Related Topics`) MAY be included for future
extensibility and human readers, but will be ignored by the current
parser and will NOT appear in the app. Authors should prefer placing
all such material inside `## Main Content` until a future loader
version adds support.

## 7. Verification Guidelines

`verification_level` must be one of the following four values
(case-insensitive), each with a distinct badge color in the app:

| Value                  | Badge Color | Meaning                                                                 |
|------------------------|-------------|---------------------------------------------------------------------------|
| `Verified Source`      | Green       | Confirmed against an authoritative reference (WHO, government guide, established textbook, primary religious text, etc.) |
| `Community Verified`   | Blue        | Reviewed and confirmed accurate by Humanity Vault contributors/community, but not tied to a single authoritative external source |
| `Historical Source`    | Brown       | Drawn from historical records, traditional practice, or older texts; accuracy is contextual to its time period |
| `Unverified`           | Gray        | Not yet reviewed; included for completeness but should be reviewed before being treated as authoritative |

Authoring rules:

- New articles SHOULD start as `Community Verified` or `Unverified`
  unless a clear authoritative source is cited in `## Sources`.
- `Verified Source` requires at least one specific, named source in
  `## Sources` (e.g. "WHO", "Indonesian Ministry of Health Guideline
  2023") - not just "Verified Source" repeated as a source.
- `Historical Source` is appropriate for traditional/local-wisdom
  knowledge where modern verification is not applicable but
  provenance is documented.
- If `verification_level` is omitted, the article displays with no
  verification badge (treated as unreviewed, but not flagged gray).

## 8. Knowledge Level Guidelines

`knowledge_level` indicates the complexity/prerequisite knowledge
needed to apply the article safely and correctly:

| Value     | Meaning                                                                |
|-----------|---------------------------------------------------------------------------|
| `Level 1` | Basic - no special tools, training, or prior knowledge required; safe for general audiences |
| `Level 2` | Intermediate - requires some tools, practice, or background knowledge (e.g. basic first aid training, hand tools) |
| `Level 3` | Advanced - requires specialized tools, training, or experience; may involve significant risk if performed incorrectly |

Authoring rules:

- Default to `Level 1` for general survival/health/daily-life
  knowledge intended for any reader.
- Use `Level 3` sparingly, and pair it with explicit warnings inside
  `## Main Content` (e.g. "Only attempt this if trained in...").
- If omitted, no knowledge level badge is shown - this should be rare
  and only for content where a level genuinely doesn't apply (e.g.
  general reference/README content).

## 9. File Naming Conventions

- File names use `snake_case`, all lowercase, `.md` extension
  (e.g. `water_purification.md`, `basic_cpr.md`,
  `daily_dua.md`)
- File names should be short, descriptive, and unique within their
  category folder - they do not need to match `title` exactly, but
  should clearly hint at the topic
- Do not use spaces, uppercase letters, or special characters other
  than underscore `_`
- `README.md` is a reserved filename: it is excluded from article
  discovery by the Loader and should only be used for category-level
  descriptions, not articles
- For articles covering the same topic at different levels (e.g. a
  basic and advanced version), suffix with the level or focus, e.g.
  `water_purification_basic.md` / `water_purification_advanced.md`

## 10. Category Folder Conventions

- Each article lives directly under `knowledge/<category_folder>/`
  - one level deep, no further subfolders
- `<category_folder>` MUST be one of the existing folder names:
  `survival`, `medicine`, `agriculture`, `engineering`, `electronics`,
  `construction`, `history`, `philosophy`, `islam`, `local_wisdom`,
  `communication`
- The folder name is the source of truth for category assignment at
  the file-system/asset level; the `category` frontmatter field must
  match the corresponding display name exactly (see table below) so
  that search and category screens stay consistent
- Use `subcategory` (Section 4) to organize topics WITHIN a category
  folder (e.g. `survival/` articles may have subcategory `Water`,
  `Fire`, `Shelter`, etc.) rather than creating nested folders
- New top-level categories require code changes (new entry in
  `CategoriesRepository` + new asset path in `pubspec.yaml`) and are
  out of scope for this authoring standard - authors should fit new
  topics into the existing 10 categories where possible and flag
  genuinely new categories for review

| folder_name    | category (frontmatter value) |
|-----------------|-------------------------------|
| survival        | Survival                       |
| medicine        | Medicine                        |
| agriculture      | Agriculture                     |
| engineering      | Engineering                     |
| electronics      | Electronics                     |
| construction     | Construction                    |
| history          | History                          |
| philosophy       | Philosophy                       |
| islam            | Islam                            |
| local_wisdom     | Local Wisdom                     |
| communication    | Communication                   |

## 11. Authoring Guidelines (General)

- Write in clear, plain language suitable for readers without
  internet access to look up unfamiliar terms
- Keep `## Summary` to 1-3 sentences - it is shown prominently at the
  top of the article and in any future list/preview views
- `## Main Content` should be self-contained: assume the reader has
  no other reference material
- `## Benefits` should be concrete and specific (avoid vague items
  like "It's useful")
- `## Sources` should name real, identifiable sources (organizations,
  publications, named individuals/traditions) - "Humanity Vault
  Contributors" is acceptable for community-authored content but
  should not be the sole source for `Verified Source` articles
- Avoid time-sensitive references (URLs, "as of 2024", app/service
  names) since the app is offline-first and content may be read years
  later
- Use `last_updated` whenever content is revised, so future
  maintainers can identify stale articles

## 12. Worked Example (Conformant Article)

```markdown
---
title: Basic CPR Overview
category: Medicine
subcategory: Emergency Response
author: Humanity Vault Contributors
created_date: 2026-06-10
last_updated: 2026-06-10
knowledge_level: Level 1
verification_level: Community Verified
---

# Basic CPR Overview

## Summary

Cardiopulmonary resuscitation (CPR) is an emergency procedure used to
manually preserve brain function until further measures restore
spontaneous blood circulation and breathing in a person who is in
cardiac arrest.

## Main Content

To perform basic CPR, place the heel of one hand on the center of the
chest, place the other hand on top, and push hard and fast at a rate
of 100 to 120 compressions per minute, allowing the chest to fully
recoil between compressions. Continue until emergency help arrives or
the person shows signs of life.

## Benefits

- Can double or triple a cardiac arrest victim's chance of survival
- Helps maintain blood flow to vital organs until help arrives
- Can be performed without specialized equipment

## Sources

- Medical Source
```

## 13. Scaling Notes

- This format requires no code changes from 10 to 1000+ articles -
  every `.md` file under a registered `knowledge/<category>/` folder
  is auto-discovered via `AssetManifest`
- Adding a new article = adding one `.md` file following this
  standard; no `pubspec.yaml` change needed as long as it's inside an
  already-declared category folder
- Consistency in `verification_level` and `knowledge_level` values is
  critical at scale - inconsistent casing/wording will fall through to
  the `Unverified` (gray) default badge color
