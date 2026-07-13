# Installing a Knowledge Pack

Knowledge Packs are optional, source-verified additions to the app's
built-in library. There are two ways to install one.

## Option 1: Vault Hub (in the app)

1. Open the app and choose **Vault Hub** from the home screen.
2. Browse the catalog of Official Knowledge Packs.
3. Tap a pack to open its detail page, then tap **Install**.
4. The app downloads the pack's ZIP, verifies its checksum against the
   published registry, and installs it &mdash; all without leaving the
   app.

## Option 2: Manual import

1. Download a pack's ZIP file from its [Pack Detail](/packs/) page on
   this website, or from anywhere you already trust the file.
2. Open the app, go to **About**, and choose **Import Knowledge Pack**.
3. Select the downloaded ZIP.

## What happens during import

Every pack, however it arrives, goes through the same validation
before anything is written to permanent storage: file size and file
count limits are enforced, the manifest and every article are parsed
and checked, and a pack is only committed to the device if every check
passes. If anything fails, nothing is installed and no partial pack is
left behind.

## Managing installed packs

Open **About &rarr; Manage Knowledge Packs** to see everything
currently installed and remove any pack you no longer want. Removing a
pack only deletes that pack's own files &mdash; the built-in core
library is never affected.
