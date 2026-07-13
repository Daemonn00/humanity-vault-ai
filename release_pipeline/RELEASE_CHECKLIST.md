# Official Knowledge Pack Release Checklist

This is the full official release process, start to finish. Steps
marked **(tool)** are performed automatically by this package's
`bin/release.dart`, which fails immediately at the first check that
doesn't pass. Steps marked **(manual)** are deliberately outside this
tool's scope - they either require human editorial judgment or a
credential/action this tool never performs on its own.

1. **(manual) Editorial review is complete.** The pack's
   `REVIEW_NOTES.md` documents its source-access log and verification
   status, and a human has decided the pack is ready to publish. This
   tool never reads `REVIEW_NOTES.md` and never makes this judgment -
   see `registry_generator/README.md` for why.

2. **(tool) Manifest is readable.** `manifest.md` exists and has
   `pack_id`, `pack_name`, and `pack_version`.

3. **(tool) Version consistency.** The intended release version is
   well-formed semver (`X.Y.Z`), matches `manifest.md`'s
   `pack_version` exactly, and `pack_id` uses the `hv_official_`
   prefix. The expected release tag (`<pack_id>-v<version>`) is
   derived and reported here.

4. **(tool) Structural validation.** Every article's category,
   verification_level, and terrain IDs are valid; no article slug
   collides with the core corpus or with another article in the same
   pack - the exact same rules `registry_generator`'s
   `PackValidation.validate` already enforces, reused directly, not
   re-implemented.

5. **(tool) Packaging.** A release ZIP is built from the pack
   directory (only `manifest.md` and other `.md` files - never
   `REVIEW_NOTES.md`, `CHANGELOG.md`, or `LICENSE`), byte-for-byte
   reproducible on any machine.

6. **(tool) ZIP filename convention.** The packaged file is named
   `<pack_id>-v<version>.zip`, matching the tag convention the
   Registry Generator expects.

7. **(tool) Checksum.** SHA-256 is computed over the packaged ZIP
   bytes.

8. **(tool) Registry generation dry run.** The existing, unmodified
   `RegistryGenerator` is run against an in-memory stand-in for a
   published release, seeded with exactly this packaged ZIP - proving
   it would be accepted before any real release exists.

9. **(tool) Generated registry validity.** The dry run's resulting
   registry entry is checked field-by-field against the packaged
   artifact (version, checksum, size, article count).

10. **(tool) Artifacts written.** On success, the tool writes the
    packaged ZIP and a `release-manifest.json` (checksum, size,
    article count, expected tag, and next steps) to `dist/`.

11. **(manual) Create the real GitHub Release.** Using the ZIP and
    tag name from step 10, create a GitHub Release with tag
    `<pack_id>-v<version>` and upload the ZIP as its asset. This tool
    never calls the GitHub API to do this - creating a public release
    is a real publish action outside this tool's authority.

12. **(manual) Re-run the real Registry Generator.** Run
    `registry_generator/bin/generate.dart` for real, against the
    now-published release. It will independently re-download the
    asset and re-validate it - this is the same tool, unmodified, that
    step 8 dry-ran; nothing about it changes because this pipeline
    exists.

13. **(manual) Commit and push the regenerated `registry.json`.**
    **Never hand-edit `registry.json`.** It must always be the direct,
    unmodified output of a real Registry Generator run. If a mistake
    is found, fix the pack and its release, then regenerate - never
    patch the file by hand.

Steps 2-9 are what "the workflow must fail immediately if any
verification fails" means in practice: the tool stops at the first
failing step and performs none of the later ones, including packaging
and the registry dry run.
