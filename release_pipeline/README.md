# Release Pipeline (v1)

The official Knowledge Pack release workflow: the step that runs
*before* a pack becomes publicly available through a GitHub Release,
the Registry Generator, the Official Website, and Vault Hub. See
`RELEASE_CHECKLIST.md` for the full process, including the manual
steps this tool deliberately doesn't perform.

## What it does

Given a reviewed pack directory and an intended release version,
`bin/release.dart` runs an ordered checklist, **stopping immediately**
at the first check that fails:

1. Manifest is readable (`pack_id`, `pack_name`, `pack_version`).
2. Version consistency: intended version is well-formed semver,
   matches the manifest exactly, and `pack_id` uses the
   `hv_official_` prefix.
3. Structural validation - reuses `registry_generator`'s own
   `PackValidation.validate` directly (categories, verification
   levels, terrain IDs, slug collisions).
4. Packaging - builds a reproducible release ZIP (only `manifest.md`
   and other `.md` files).
5. ZIP filename matches the `<pack_id>-v<version>.zip` convention.
6. SHA-256 checksum computed over the packaged bytes.
7. Registry generation dry run - runs the real, unmodified
   `RegistryGenerator` against an in-memory stand-in release seeded
   with exactly this packaged ZIP.
8. Generated registry validity - the dry run's entry is checked
   field-by-field against the packaged artifact.

On success, it writes the packaged ZIP and a `release-manifest.json`
to `dist/` (gitignored - regenerate, don't hand-edit) and prints the
expected GitHub Release tag.

## What it deliberately does not do

- **Never creates a real GitHub Release or calls the GitHub API.**
  Publishing is a real, public action outside this tool's authority -
  it prepares everything a human needs to do that manually.
- **Never touches `registry/registry.json`.** The real
  `registry_generator` remains the only thing that ever writes that
  file, and only from a real published release - never from this
  tool's dry run.
- **Never modifies `official_packs/`, `humanity_vault_app/`,
  `registry_generator/`, or the website.** This package only depends
  on `registry_generator` as a library (via a `path:` dependency) -
  it does not change a single line of it.
- **Never reads `REVIEW_NOTES.md`, `CHANGELOG.md`, or `LICENSE`** -
  same input-source boundary `registry_generator` already enforces,
  inherited here by reusing its `PackReader` directly.

## Running it

```
dart pub get
dart run bin/release.dart <pack_dir> <version> [--out <dir>]
```

Example:

```
dart run bin/release.dart ../official_packs/field_communication_wayfinding 1.0.0
```

## Reproducibility

Packaging strips real file timestamps and uses a fixed archive
timestamp instead, so packaging the same pack directory twice - on any
machine, at any time - produces a byte-identical ZIP and checksum.

## Testing

```
dart analyze
dart test
```

`dart test` includes a real end-to-end run of `bin/release.dart` as a
subprocess against a temp fixture pack, in addition to unit tests for
each checklist step (including deliberately-broken fixtures that must
fail at a specific step, never further).
