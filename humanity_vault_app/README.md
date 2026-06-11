# Humanity Vault AI (App)

The Flutter application for [Humanity Vault AI](../README.md) - an
offline-first knowledge library for survival, recovery, and rebuilding.
No internet connection, database, or AI is required to use it.

## Status: Alpha 1.0

- 31 articles across all 11 categories (Top 10 + Top 25 complete)
- Browse Categories, Search, Article Detail, Related Knowledge, and
  Emergency Mode are implemented and integrated

## Design Constraints

- **No database** - articles are bundled Markdown files under
  `knowledge/`, parsed into memory at startup
- **No AI** - no chat, generation, or network-based features
- **No internet required** - the app works fully offline; nothing
  leaves the device

## Getting Started

```bash
flutter pub get
flutter run
```

## Running Checks

```bash
flutter analyze
flutter test
```

## Project Structure

- `lib/features/library/` - knowledge library (categories, articles,
  search, related knowledge)
- `lib/features/emergency/` - Emergency Mode topics and their linked
  articles
- `lib/core/theme/` - shared design tokens (colors, spacing,
  typography)
- `lib/shared/widgets/` - reusable UI components
- `knowledge/` - the article corpus (Markdown with frontmatter), one
  folder per category
- `test/` - widget and repository tests

## Adding Knowledge Articles

New articles follow the format and process described in
[`../docs/Knowledge_Authoring_Standard_v1.md`](../docs/Knowledge_Authoring_Standard_v1.md)
and
[`../docs/Content_Creation_Workflow_v1.md`](../docs/Content_Creation_Workflow_v1.md).
