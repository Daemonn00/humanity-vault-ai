# Registry Generator (v0.1)

Generates `registry/registry.json` from released Official Knowledge
Packs. This is the minimum implementation of the approved v0.1 plan -
see the project's ecosystem/registry architecture reports for the full
design this scopes down from.

## What it does

For every pack folder under `official_packs/`:

1. Reads just enough of `manifest.md` to get `pack_id` and `pack_version`.
2. Looks up a matching **published GitHub Release** (tag convention:
   `<pack_id>-v<version>`). **If no matching release exists, the pack
   is skipped silently** - it never appears in registry.json, and no
   per-pack log noise is produced for this, the ordinary case.
3. If a release exists: downloads its `.zip` asset, reads the pack's
   manifest and article files, and validates everything (categories,
   terrain IDs, verification_level values, slug uniqueness against the
   core corpus, semver, and that the manifest's pack_id matches the
   ZIP's own internal manifest.md).
4. Computes the SHA-256 checksum and byte size from the actual
   downloaded ZIP - never trusted from anywhere else.
5. Writes one entry to `registry/registry.json` per pack that is both
   released and valid.

## What it deliberately does not do

- **Never reads `REVIEW_NOTES.md`, at any point, for any pack.**
  Editorial review is considered complete the moment a release is
  published - the generator does not re-verify that judgment.
- Never reads `CHANGELOG.md` or `LICENSE` (out of v0.1's approved input
  sources - the release's own body text is used as the changelog
  summary instead).
- Never reads or modifies anything under `humanity_vault_app/`. The
  31 core-corpus slugs used for the slug-uniqueness check are a
  hardcoded snapshot in `lib/src/validation.dart`, not a live read.
- Never modifies any file under `official_packs/` - read-only.
- Handles at most one version per pack (whatever `manifest.md`
  currently declares) - no multi-version history tracking yet.

## Running it

```
dart pub get
dart run bin/generate.dart
```

Requires network access to the GitHub API to look up releases. If no
pack has a matching release yet, this correctly produces an **empty**
registry (`pack_count: 0`) - that is the expected v0.1 result today,
not a bug.

## Testing

```
dart analyze
dart test
```

Tests never make real network calls - `ReleaseSource` is an
injectable abstraction with a real `GitHubReleaseSource` (used at
runtime) and an in-memory fake (used by tests).
