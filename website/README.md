# Humanity Vault Website (v0.1)

The official Humanity Vault website: a static, read-only site that
introduces the project, lists Official Knowledge Packs, and links to
the Android download once one is published. This is the minimum
implementation of the approved Website Architecture v0.1 and Website
Design System v1 - see those reports for the full design this scopes
down from.

## What it does

- **Home** (`/`) - mission, live pack count, links into Docs/GitHub.
- **Official Knowledge Packs** (`/packs/`) - a catalog rendered
  client-side from the same published `registry.json` the app's own
  Vault Hub reads.
- **Pack Detail** (`/packs/detail.html?pack=<pack_id>`) - one pack's
  metadata and a direct download link, sourced entirely from the
  registry entry.
- **Android Download** (`/download/`) - a static placeholder page
  until an official release exists.
- **Documentation** (`/docs/`) - static Markdown under `content/docs/`,
  rendered to HTML at build time. The index page is generated
  automatically from whatever files exist there.
- **Changelog** (`/changelog/`) - static Markdown, build-time rendered.

## What it deliberately does not do

- **Never modifies `registry.json`.** Every registry read is a plain
  `GET` request (`assets/js/registry-client.js`); there is no write
  path anywhere in this site.
- **No backend, no CMS, no database, no authentication.** Every page
  is either fully static HTML or a static shell populated client-side
  from a public JSON file.
- **No framework, no bundler, no npm dependencies.** Plain HTML/CSS/
  vanilla JS, plus one small standalone Dart build tool (this
  package) for build-time templating and Markdown rendering.
- **Never reads or modifies anything under `humanity_vault_app/`,
  `registry_generator/`, or `official_packs/`.**

## Structure

```
templates/layout.html     Shared page shell (nav, footer, <head>)
content/pages/*.html       Home / Packs / Pack Detail / Download fragments
content/docs/*.md          Documentation source
content/changelog.md       Changelog source
assets/css/                Design tokens + shared components (one design system)
assets/js/                 registry-client.js (shared fetch/parse) + per-page scripts
lib/src/                   Pure, testable Dart rendering functions
bin/build.dart              Orchestrates the build into dist/
```

`registry-client.js` is a **temporary** browser-side mirror of the
Registry Generator's schema, the same category of tracked debt already
flagged for Vault Hub's own app-side mirror - replace all of them with
a single shared schema package if one is ever introduced.

## Building

```
dart pub get
dart run bin/build.dart
```

Writes the complete static site to `dist/` (gitignored - regenerate,
don't hand-edit). Serve `dist/` with any static file server, e.g.:

```
python -m http.server 8083 --directory dist
```

Registry hosting URL (`RegistryClient.defaultRegistryUrl` in Vault
Hub, `REGISTRY_URL` in `assets/js/registry-client.js`) is the raw
GitHub URL for this repo's own `registry/registry.json`. Until that
file is actually published (pushed) to GitHub, the Packs and Pack
Detail pages correctly show their offline/error state rather than a
catalog - that is expected v0.1 behavior, not a bug.

## Testing

```
dart analyze
dart test
node --test test_js/*.test.js
```

`dart test` includes a real end-to-end run of `bin/build.dart` against
the actual `templates/`/`content/`/`assets/`, in addition to unit
tests for the pure rendering functions. `node --test` covers the
browser-side registry parsing and formatting logic with Node's
built-in test runner - no external test framework dependency.
