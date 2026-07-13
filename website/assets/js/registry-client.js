/*
 * TEMPORARY: a hand-maintained, browser-side mirror of the fields the
 * website needs from the Registry Generator's schema
 * (registry_generator/lib/src/models.dart RegistryPackEntry.toJson()).
 * This is tracked debt, the same category already flagged for Vault
 * Hub's own app-side mirror - replace all of them with a single
 * shared schema package if one is ever introduced.
 *
 * Read-only: this file only ever performs a GET request against
 * registry.json and never writes to it.
 */

const REGISTRY_URL =
  'https://raw.githubusercontent.com/Daemonn00/humanity-vault-ai/main/registry/registry.json';

/**
 * Parses one entry of the registry's `packs` array, reading only the
 * first (and, in v0.1, only) entry of its `versions` array. Returns
 * null if any field the site actually needs is missing, empty, or
 * malformed - a single bad entry is skipped rather than breaking the
 * whole catalog.
 */
function parsePackEntry(json) {
  try {
    const versions = json.versions;
    if (!Array.isArray(versions) || versions.length === 0) return null;
    const latest = versions[0];
    if (typeof latest !== 'object' || latest === null) return null;

    const packId = json.pack_id;
    const packName = json.pack_name;
    const downloadUrl = latest.download_url;
    const sha256 = latest.sha256;
    const version = latest.version;

    if (
      typeof packId !== 'string' || !packId ||
      typeof packName !== 'string' || !packName ||
      typeof downloadUrl !== 'string' || !downloadUrl ||
      typeof sha256 !== 'string' || !sha256 ||
      typeof version !== 'string' || !version
    ) {
      return null;
    }

    return {
      packId: packId,
      packName: packName,
      description: typeof json.description === 'string' ? json.description : null,
      categoryTags: Array.isArray(json.category_tags)
        ? json.category_tags.map(String)
        : [],
      verificationSummary:
        typeof json.verification_summary === 'string'
          ? json.verification_summary
          : 'Unverified',
      version: version,
      changelogSummary:
        typeof latest.changelog_summary === 'string' ? latest.changelog_summary : '',
      downloadUrl: downloadUrl,
      sha256: sha256,
      sizeBytes: typeof latest.size_bytes === 'number' ? latest.size_bytes : 0,
      articleCount: typeof latest.article_count === 'number' ? latest.article_count : 0,
    };
  } catch (_) {
    return null;
  }
}

/**
 * Parses a full registry.json document. Returns null if [json] has no
 * top-level `packs` array - never throws. Individual malformed pack
 * entries are skipped rather than failing the whole parse.
 */
function parseRegistry(json) {
  try {
    if (typeof json !== 'object' || json === null) return null;
    const packsJson = json.packs;
    if (!Array.isArray(packsJson)) return null;

    const packs = packsJson.map(parsePackEntry).filter((p) => p !== null);

    return {
      generatedAt: typeof json.generated_at === 'string' ? json.generated_at : '',
      packCount: typeof json.pack_count === 'number' ? json.pack_count : packs.length,
      packs: packs,
    };
  } catch (_) {
    return null;
  }
}

/**
 * Fetches and parses the registry from [url] (defaults to
 * REGISTRY_URL). Returns null on any network, HTTP, or parse failure
 * - callers treat that as "the catalog could not be loaded right
 * now", never as a thrown exception.
 */
async function fetchRegistry(url) {
  try {
    const response = await fetch(url || REGISTRY_URL, { cache: 'no-store' });
    if (!response.ok) return null;
    const json = await response.json();
    return parseRegistry(json);
  } catch (_) {
    return null;
  }
}

// Exposed for Node's built-in test runner via CommonJS export; this
// branch never runs in the browser, where `module` is undefined.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { parsePackEntry, parseRegistry, fetchRegistry, REGISTRY_URL };
}
