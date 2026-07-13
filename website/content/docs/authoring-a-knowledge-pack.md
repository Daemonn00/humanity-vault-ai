# Authoring a Knowledge Pack

A Knowledge Pack is a plain ZIP file containing Markdown text &mdash;
no proprietary format, no build tooling required to read or write one.

## Structure

A pack ZIP contains, at its root:

- `manifest.md` &mdash; frontmatter with `pack_id`, `pack_name`,
  `pack_version`, and an optional `description`.
- One or more article `.md` files, each with frontmatter (`title` and
  `category` are required; `subcategory`, `author`, `last_updated`,
  `knowledge_level`, `verification_level`, `terrain`, and
  `related_articles` are optional) followed by four sections:
  **Summary**, **Main Content**, **Benefits**, and **Sources**.

## Valid categories

Survival, Medicine, Agriculture, Engineering, Electronics,
Construction, History, Philosophy, Islam, Local Wisdom, Communication.

## Valid verification levels

`Verified Source`, `Community Verified`, `Historical Source`, or
`Unverified`. Only make a `Verified Source` claim for a source you
have personally opened and read &mdash; a search-engine summary of a
source is not the same as verifying it directly.

## Limits

Packs are capped at 20 MB compressed, 50 MB extracted, 500 files, and
200-character file paths, enforced the same way for every import path
(Vault Hub download or manual import).

## Publishing as an Official Pack

Official packs go through an editorial review process before release
and use the `hv_official_` pack ID prefix. If you're interested in
contributing one, start a discussion on
[GitHub](https://github.com/Daemonn00/humanity-vault-ai).

Community packs (anything outside the `hv_official_` namespace) can be
shared and imported manually today, but are not yet listed in the
in-app Vault Hub or on this site's catalog.
