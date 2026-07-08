# Humanity Vault AI (App)

The Flutter application for [Humanity Vault AI](../README.md) - an
offline-first knowledge library for survival, recovery, and rebuilding.
No internet connection, database, or AI is required to use it.

## Status: Alpha 2.0 UI Freeze - verified

- 31 real knowledge articles across all 11 categories (`knowledge/`
  contains 41 Markdown files in total, but 10 are per-category
  `README.md` placeholders excluded from the app's article count)
- Verified quality: `flutter analyze` clean, `flutter test` passing
- Latest verified commit: `639363b`

## Capabilities

- Offline-first local knowledge vault
- Asset-based Markdown knowledge library
- Local category and title search
- Article detail pages
- Emergency Mode with 7 emergency topics
- Cross-referenced emergency articles
- Alpha 2.0 tactile UI system
- Narrow-phone overflow protection
- No account required
- No internet required for core knowledge access
- AI optional and not yet implemented

## Roadmap Status

- Alpha 3.0: Terrain System - planned, not implemented
- Alpha 4.0: Knowledge Packs - planned, not implemented
- Alpha 5.0: Optional Offline AI Add-on - planned, not implemented

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
