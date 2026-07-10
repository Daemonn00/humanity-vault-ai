# Knowledge Pack Authoring Template

This folder contains schema-safe templates and guidance for creating
a Knowledge Pack ZIP that Humanity Vault AI can import. It contains
**no real instructional content** and **no ZIP archive** - only
documentation and blank templates.

## Files in this folder

- **`manifest.md`** - a template and explanation for the one
  `manifest.md` file every pack must contain, at the ZIP's root.
- **`example_article.md`** - an annotated schema template showing
  every frontmatter field and Markdown section the article parser
  currently understands, with placeholder text only.
- **`AUTHORING_CHECKLIST.md`** - a preflight checklist to work through
  before you package and import a real pack.
- **`README.md`** - this file.

## Minimal workflow

1. Copy `manifest.md` and `example_article.md` as starting points for
   your own pack.
2. Replace every placeholder value with real information - a real
   `pack_id`/`pack_name`/`pack_version`, and real article content for
   each `.md` file you write.
3. Work through `AUTHORING_CHECKLIST.md` end to end.
4. Create a ZIP archive containing your `manifest.md` at the archive's
   **root**, plus your article `.md` files anywhere else inside it.
5. Import the ZIP on an Android device via **About > Import Knowledge
   Pack**, then **restart the app**.
6. Test in **Browse Categories**, **Search Knowledge**, and **Ask the
   Vault**.
7. Confirm the pack appears correctly in **About > Manage Installed
   Packs**, then test removing it and restarting once more.

### About internal folder layout

How you organize `.md` article files *inside* the ZIP is entirely up
to you and purely organizational - the importer scans the whole
archive recursively regardless of folder structure. An article's
category is decided only by its own `category:` frontmatter field,
never by which folder it happens to sit in inside the ZIP. The only
file whose location is enforced is `manifest.md`, which must be at
the archive's root.

## Proposed future example (not yet created)

A separate planning pass recommended a first real test pack, themed
**"Field Communication & Wayfinding"**: a small, four-article pack
spanning the existing Communication, Survival, and Construction
categories, covering visual signaling, radio channel discipline,
improvised compass construction, and basic knots for shelter and gear.
Its purpose is to exercise category merging across multiple existing
categories, terrain tagging across all four terrain IDs, cross-linking
to both core and pack-internal articles, and - through its one
Survival-category article - a real, installed-pack test of Ask the
Vault's safety-classification behavior, using only low-risk practical
skills rather than medical or tactical content.

Neither that pack's content nor its ZIP file exists yet. Authoring it
is a separate, not-yet-started task.
