# Writing Guidelines (Official Knowledge Packs)

These guidelines cover **how to write** an Official Knowledge Pack's
articles and manifest, once `SOURCE_COLLECTION_TEMPLATE.md` is
complete. They extend, and do not replace, the two existing format
specifications every pack author should already have open:

- `pack_authoring_template/manifest.md` and `example_article.md` -
  the exact file format the app's importer parses.
- `docs/Knowledge_Authoring_Standard_v1.md` - the core Vault's own
  established conventions for `verification_level`, `knowledge_level`,
  tone, and section content, which official packs should stay
  consistent with even though it was written for the core corpus.

## Manifest-specific rules for *official* packs

- `pack_id` **must** use the `hv_official_` prefix (a rule the generic
  pack template doesn't enforce, but `release_pipeline` and
  `registry_generator` both require for any pack going through the
  official Release Pipeline).
- `pack_version` **must** be well-formed semver (`X.Y.Z`) - the app's
  own importer accepts any free-text string here, but
  `release_pipeline`'s version-consistency check will fail otherwise,
  so start with semver from the first draft rather than discovering
  this at release time.
- `description` should be one or two plain sentences - it is shown
  as-is in Vault Hub and on the Official Website's Pack Detail page.

## Article writing rules

- Follow `pack_authoring_template/example_article.md`'s frontmatter
  and section format exactly - do not invent new frontmatter fields or
  `##` sections; they will be silently ignored by the app.
- **`verification_level` must reflect `SOURCE_COLLECTION_TEMPLATE.md`'s
  Collection Summary honestly** - never start a draft at `Verified
  Source` "optimistically" expecting Editorial Review to confirm it
  later. Start at the realistic level from Source Collection;
  Editorial Review can only raise it with direct verification, never
  assumes it.
- **Slug discipline:** prefix every article's filename with a short,
  pack-specific tag (e.g. `fieldcomm_` for a "Field Communication"
  pack) to avoid an accidental collision with the core corpus or
  another pack - a collision is never reported as an error by the
  importer, so this is a "get it right the first time" concern, not
  something that surfaces as a bug later.
- **Terrain tagging:** only tag `terrain` values that are genuinely
  relevant to the content - don't tag all four IDs by default just to
  maximize visibility; an inaccurate terrain tag misleads a reader
  using Emergency Mode's terrain-aware ordering.
- **`related_articles`:** double-check every referenced slug by hand
  (against the core corpus's 31 slugs or this pack's own other
  articles) - a typo produces no visible link and no warning anywhere.
- **Safety warnings:** for any step flagged safety-sensitive in
  `RESEARCH_PLAN_TEMPLATE.md`, write the warning explicitly into
  `## Main Content` at the point of the risky step, not as a separate
  unsupported `## Warnings` section (the parser doesn't recognize one)
  and not only in the Summary.
- **Tone:** plain, calm, field-manual register, consistent with the
  rest of the Vault - avoid marketing language, alarmism, or academic
  hedging. Assume a reader with no internet access and no way to look
  up an unfamiliar term.
- **No time-sensitive references:** no URLs, no "as of [year]", no
  named apps/services/products - the same rule the core corpus already
  follows, for the same reason (this content may be read years later,
  offline).
- **Citation honesty in `## Sources`:** list only sources actually
  collected in `SOURCE_COLLECTION_TEMPLATE.md` - never a source that
  was only considered as a candidate in the Research Plan but not
  actually found or opened.

## Cross-article consistency within a pack

- Keep tone and technical depth consistent across a pack's articles -
  a reader installing one pack shouldn't feel like they're reading
  work from unrelated authors.
- Cross-link related articles within the same pack via
  `related_articles` where genuinely relevant, in addition to linking
  out to the core corpus.
- A pack's `description` (in `manifest.md`) should describe the whole
  pack's theme, not just its first article.
