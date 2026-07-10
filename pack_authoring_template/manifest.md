# Knowledge Pack Manifest Template

This file is a **template**, not a real pack manifest. Copy the
fenced block below into a new file named exactly `manifest.md`, then
replace every placeholder value with real information for your pack.

`manifest.md` must sit at the **literal root** of your Knowledge
Pack ZIP file - not inside any subfolder. The importer looks for a
file whose name is exactly `manifest.md` at the top level of the
archive; if it isn't there, the whole pack fails to import with
"This pack is missing its manifest and cannot be imported."

## Required and optional fields

The manifest parser (`PackManifest.tryParse`) recognizes exactly
four fields - nothing else is read from this file:

| Field          | Required? | Meaning                                                  |
|----------------|-----------|-----------------------------------------------------------|
| `pack_id`      | Required  | A stable, permanent identifier for this pack              |
| `pack_name`    | Required  | The display name shown to users                           |
| `pack_version` | Required  | A free-text version string (not parsed as semver)         |
| `description`  | Optional  | A short description of the pack's contents                |

If `pack_id`, `pack_name`, or `pack_version` is missing, the entire
pack fails to import with "This pack's manifest is missing required
information." - no individual articles are imported either.

### About `pack_id`

`pack_id` must be unique among every pack already installed on a
device. If it collides with an already-installed pack, import fails
with "A pack with this ID is already installed." Choose a short,
permanent, unique identifier and never reuse it for a *different*
pack later - if you release an updated version of the same pack, keep
the same `pack_id` so users understand it's the same pack, but be
aware a user must remove the old copy before installing a new one
with the same ID (the importer does not overwrite an existing pack).

## Template

Copy everything between the fence markers into your own
`manifest.md` file, then replace the placeholder values:

```
---
pack_id: your_pack_id
pack_name: Your Pack Name
pack_version: 1.0.0
description: A short, one- or two-sentence description of what this pack contains.
---
```

Notes on the template above:

- Frontmatter lines are simple `key: value` pairs - no quotes, no
  nested structure, no lists.
- `description` may be omitted entirely (delete the line) if you
  don't want one - do not leave it present with an empty value.
- Nothing else belongs in this file. Any other `key: value` line you
  add will be silently ignored (never read), so don't rely on it for
  anything the app needs to know.
