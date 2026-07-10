# Knowledge Pack Authoring Checklist

Read this before you package a Knowledge Pack ZIP for import.

**Important: most of the rules below fail silently.** The current
importer and loader do not report *which* article or field was wrong -
at most they report a count of skipped files, or they simply drop a
tag without any message at all. The only reliable way to know your
pack is correct is to work through this checklist by hand, then
actually import it on a device and check the reported counts (Section
H) before treating your pack as finished.

## A. ZIP structure

- [ ] `manifest.md` is at the **literal root** of the ZIP archive -
      not inside any subfolder.
- [ ] Article `.md` files may be anywhere else in the archive - at the
      root or in any subfolder layout you like. The loader scans the
      whole archive recursively; an article's folder location is
      never used to decide its category - only its own `category:`
      frontmatter field is.
- [ ] Only `manifest.md` and other `.md` files should be included.
      Anything else (images, other file types) is silently ignored
      and never written to the device - don't rely on it being there.
- [ ] The file is a standard ZIP archive.

## B. Manifest validity

- [ ] `manifest.md` includes non-empty `pack_id`, `pack_name`, and
      `pack_version` - if any is missing, the entire pack fails with
      *"This pack's manifest is missing required information."*
- [ ] `pack_id` is unique and permanent - not already used by another
      installed pack, and not one you intend to reuse for a
      genuinely different pack later. A collision fails with
      *"A pack with this ID is already installed."*
- [ ] `description` is either present with real text, or the line is
      removed entirely (don't leave it empty).

## C. Article frontmatter

- [ ] Every article has non-empty `title` and `category` - missing
      either one silently skips that one article file (it counts
      toward the reported "skipped" total with no further detail).
- [ ] Optional fields you use (`subcategory`, `author`,
      `last_updated`, `knowledge_level`, `verification_level`) are
      spelled the way you intend - they are stored as free text, not
      validated against any list.
- [ ] You have not relied on `created_date` or any other custom
      frontmatter key to affect app behavior - the loader only reads
      the fields listed above (plus `terrain` and `related_articles`,
      see below); everything else is silently ignored.

## D. Article Markdown sections

- [ ] Each article has `## Summary`, `## Main Content`, `## Benefits`,
      and `## Sources` headings, spelled exactly (matching is
      case-insensitive, but the wording must be exact).
- [ ] `## Summary` is non-empty. An empty summary does not fail
      import, but that article will **never** appear in Ask the
      Vault, which only shows articles with a non-empty summary.
- [ ] `## Benefits` and `## Sources` use `- ` or `* ` bullet lines -
      any other line format in those sections is not read.
- [ ] You have not relied on any other `##` heading (e.g. a separate
      "Warnings" section) - the parser does not recognize any heading
      beyond the four above; other headings and their content will
      never appear anywhere in the app. Put that material inside
      `## Main Content` instead.

## E. Slug and related_articles validation

- [ ] Every article's filename (its slug) is unique across the whole
      Vault - the 31 core articles and every other pack a user might
      already have installed. A collision is never reported as an
      error; the first copy found (in sorted path order) silently
      wins and every later duplicate is skipped.
- [ ] You have namespaced your filenames (e.g. a short pack-specific
      prefix) to make accidental collisions unlikely.
- [ ] Every slug listed in `related_articles` (yours or a core Vault
      slug) is spelled exactly right. This is never validated by the
      app - a typo or nonexistent slug simply produces no visible
      link, with no warning anywhere.

## F. Category and terrain validation

- [ ] Every article's `category` value exactly matches one of these
      11 display names (case-sensitive) - a pack cannot introduce a
      new category:

  Survival, Medicine, Agriculture, Engineering, Electronics,
  Construction, History, Philosophy, Islam, Local Wisdom,
  Communication

- [ ] Every value in a `terrain:` line exactly matches one of these 4
      IDs - any other value is silently dropped from that article
      (the article still imports; it just loses that one tag):

  tropical_rainforest, desert, coastal, urban

## G. Size/security constraints

These are hard limits enforced by the importer. A plain-text pack of
a handful of articles will be nowhere near any of them, but they are
worth knowing:

- [ ] The ZIP file itself is under **20 MB** compressed (checked
      before the archive is even opened; larger fails with *"This
      pack file is too large to import."*).
- [ ] Total extracted content is under **50 MB** (checked while
      extracting; larger fails with *"This pack is too large to
      import."*).
- [ ] The archive contains **500 or fewer files** total (more fails
      with *"This pack contains too many files to import."*).
- [ ] Every entry's path is **200 characters or fewer**.
- [ ] No entry uses an absolute path, a `..` segment, or a Windows
      drive letter (e.g. `C:`) - any of these fails with *"This pack
      contains an unsafe or invalid file path."*
- [ ] At least one article is valid and accepted - a pack with zero
      valid articles fails with *"This pack has no valid articles and
      cannot be imported."*

## H. Android import and restart test

Do this on a real device (or emulator) before considering the pack
finished - it's the only way to catch anything the checklist above
might have missed silently:

- [ ] Import the ZIP via **About > Import Knowledge Pack**. Read the
      reported imported/skipped counts - skipped should be 0, or you
      should know exactly which articles you expect to be skipped
      and why.
- [ ] **Fully restart the app.** Packs are only merged into the Vault
      at startup - nothing from a freshly imported pack is visible
      until after a restart.
- [ ] **Browse Categories**: confirm every article appears under the
      correct category, with the category's article count updated.
- [ ] **Search Knowledge**: confirm each article is findable by
      title/category keyword.
- [ ] **Ask the Vault**: confirm a query matching each article
      surfaces it; confirm any Survival/Medicine (or otherwise
      safety-classified) article always shows only its summary, never
      a "Best-matching passage" excerpt.
- [ ] **About > Manage Installed Packs**: confirm the pack is listed
      with the correct name, version, and article count.
- [ ] **Remove the pack**, then **fully restart the app again.**
      Removal also only takes effect after a restart - confirm the
      pack's articles are gone from Browse, Search, and Ask the Vault,
      and that the 31 core articles are completely unaffected
      throughout.
