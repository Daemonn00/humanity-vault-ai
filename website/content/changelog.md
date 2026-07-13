# Changelog

Notable, user-relevant milestones across the project. For the full
commit history, see [GitHub](https://github.com/Daemonn00/humanity-vault-ai).

## Vault Hub & Registry

- Added Vault Hub, an in-app catalog for browsing and installing
  Official Knowledge Packs, with offline-first loading and checksum
  verification before install.
- Added the Registry Generator, a standalone tool that publishes
  `registry.json` from released Official Knowledge Packs. This
  website and Vault Hub both read that same published registry.

## Ask the Vault

- Added Ask the Vault, a retrieval tool that finds exact passages in
  your installed articles and Knowledge Packs answering a question
  &mdash; extractive only, never generated.

## Knowledge Packs

- Added Knowledge Packs: local storage and loading, ZIP import with
  full validation, and an in-app screen to manage and remove installed
  packs.

## Terrain & Emergency Mode

- Added a dedicated Terrain system so Emergency Mode topics reorder by
  the situation you're actually in.

## Core library

- Reached the initial Top 25/Top 10 knowledge-expansion milestones
  across Survival, Medicine, Agriculture, Communication, Construction,
  Philosophy, Engineering, History, Islam, and Local Wisdom.
- Added offline full-text search across the entire library.

## App foundation

- Shipped the initial Flutter app: home screen, category browsing,
  article detail, search, and the Humanity Vault visual identity
  (green/gold/cream theme).
