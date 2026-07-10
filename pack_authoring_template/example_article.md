# Example Article Template

This file is an **annotated schema template** for one Knowledge Pack
article - it is not real survival, medical, or communication
instruction content, and it must not be shipped inside a real pack
as-is. It demonstrates every frontmatter field and Markdown section
the current article parser understands, with placeholder prose in
`[square brackets]`.

To use it: copy the template section below into a new file, rename
the file to describe your topic (see "About the filename" below),
and replace every bracketed placeholder with real information.

## About the filename

**The filename you save this as becomes the article's slug**
(the part before `.md`, used internally as its stable identifier).
For example, saving this file as `improvised_compass_construction.md`
gives it the slug `improvised_compass_construction`.

- Use lowercase letters, numbers, and underscores only - no spaces,
  no uppercase, no special characters.
- The slug must be unique across the *entire* Vault - the 31 core
  articles and every other installed pack. A duplicate slug is never
  reported as an error; the article is simply skipped silently (the
  first one found, in sorted order, wins). Prefix your filenames with
  a short, pack-specific tag to avoid accidental collisions.
- The filename does not need to match `title` exactly, but should
  clearly hint at the topic.

## About `category`

`category` must **exactly match** one of the 11 existing category
*display names* (case-sensitive) - not a folder name, the display
name, spelled and capitalized exactly as shown:

Survival, Medicine, Agriculture, Engineering, Electronics,
Construction, History, Philosophy, Islam, Local Wisdom, Communication

A pack cannot introduce a new category. If `category` doesn't match
one of these exactly, the article is silently skipped - no error is
shown, it simply won't appear anywhere in the app.

## About `terrain` and `related_articles`

Both are written as a single comma-separated line:

- `terrain` - zero or more of exactly these four IDs: `tropical_rainforest`,
  `desert`, `coastal`, `urban`. Any other value is silently dropped
  from the article (the article still imports; it just loses that
  one tag).
- `related_articles` - zero or more article slugs (yours or from the
  core Vault) that should show as related reading. These are never
  checked for existence - a misspelled or nonexistent slug simply
  produces no visible link, with no warning anywhere. Double-check
  every slug you reference by hand.

## Required vs. optional frontmatter fields

| Field                 | Required? | Notes                                                          |
|------------------------|-----------|------------------------------------------------------------------|
| `title`                | Required  | If missing, the article is silently skipped entirely            |
| `category`             | Required  | See above - if missing, the article is silently skipped entirely |
| `subcategory`          | Optional  | A topic within the category, e.g. `Water`, `Radio`               |
| `author`               | Optional  | Author or contributor credit                                     |
| `last_updated`         | Optional  | `YYYY-MM-DD`, the date the content was last revised              |
| `knowledge_level`      | Optional  | Free text; the core Vault's own convention uses `Level 1`-`Level 3` |
| `verification_level`   | Optional  | Free text; the core Vault's own convention uses `Verified Source`, `Community Verified`, `Historical Source`, or `Unverified` |
| `terrain`              | Optional  | See above                                                         |
| `related_articles`     | Optional  | See above                                                         |

`knowledge_level` and `verification_level` are read and stored as
plain free text by the pack loader - they are not restricted to a
fixed list of values by the importer itself. The values above are
the core Vault's own established authoring convention (see
`docs/Knowledge_Authoring_Standard_v1.md`), included here so a pack
stays consistent with it, not because the importer enforces them.

You may also include `created_date` (`YYYY-MM-DD`) for your own
authoring records - it is a project convention only; the pack loader
never reads it, so it has no effect on the app either way. Any other
frontmatter key you add is likewise silently ignored.

## Required Markdown sections

Exactly four `##` section headings are recognized, matched
case-insensitively - use exactly these names:

| Section          | Format                    | Notes                                                             |
|-------------------|---------------------------|----------------------------------------------------------------------|
| `## Summary`      | Plain prose               | 1-3 sentences. If left empty, the article still imports, but it will **never** appear in Ask the Vault, which only shows articles with a non-empty summary. |
| `## Main Content` | Plain prose, multiple paragraphs allowed | Separate paragraphs with a blank line between them. |
| `## Benefits`     | Bullet list (`- ` or `* `) | Lines not starting with `- ` or `* ` are not read.                  |
| `## Sources`      | Bullet list (`- ` or `* `) | Lines not starting with `- ` or `* ` are not read.                  |

Any other `##` heading (for example `## Warnings`) is not recognized
by the parser at all and will never appear anywhere in the app - keep
that kind of material inside `## Main Content` instead.

## Template

```
---
title: [Article Title Here]
category: [One of the 11 valid category display names]
subcategory: [Optional - a topic within the category]
author: [Optional - author or contributor credit]
last_updated: [Optional - YYYY-MM-DD]
knowledge_level: [Optional - e.g. Level 1]
verification_level: [Optional - e.g. Verified Source]
terrain: [Optional - comma-separated terrain IDs, e.g. desert, coastal]
related_articles: [Optional - comma-separated slugs]
---

# [Article Title Here]

## Summary

[Write a concise, 1-3 sentence overview here.]

## Main Content

[Write the full explanation here. This may be several paragraphs -
separate each paragraph with a blank line.]

## Benefits

- [First benefit or takeaway]
- [Second benefit or takeaway]

## Sources

- [Name a real, identifiable source]
```
