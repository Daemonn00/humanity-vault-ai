// Tests for registry-client.js using Node's built-in test runner
// (node:test / node:assert) - zero external dependencies, matching
// the project's low-dependency ethos. Run with: node --test test_js/

const test = require('node:test');
const assert = require('node:assert/strict');
const {
  parsePackEntry,
  parseRegistry,
  fetchRegistry,
  REGISTRY_URL,
} = require('../assets/js/registry-client.js');

function validPackJson(overrides = {}) {
  return Object.assign(
    {
      pack_id: 'hv_official_test_pack',
      pack_name: 'Test Pack',
      description: 'A test pack.',
      category_tags: ['Communication', 'Survival'],
      verification_summary: 'Verified Source',
      versions: [
        {
          version: '1.0.0',
          changelog_summary: 'Initial release.',
          download_url: 'https://example.test/pack.zip',
          sha256: 'abc123',
          size_bytes: 2048,
          article_count: 4,
        },
      ],
    },
    overrides,
  );
}

test('parsePackEntry parses every field from a well-formed entry', () => {
  const entry = parsePackEntry(validPackJson());

  assert.equal(entry.packId, 'hv_official_test_pack');
  assert.equal(entry.packName, 'Test Pack');
  assert.equal(entry.description, 'A test pack.');
  assert.deepEqual(entry.categoryTags, ['Communication', 'Survival']);
  assert.equal(entry.verificationSummary, 'Verified Source');
  assert.equal(entry.version, '1.0.0');
  assert.equal(entry.changelogSummary, 'Initial release.');
  assert.equal(entry.downloadUrl, 'https://example.test/pack.zip');
  assert.equal(entry.sha256, 'abc123');
  assert.equal(entry.sizeBytes, 2048);
  assert.equal(entry.articleCount, 4);
});

test('parsePackEntry returns null when versions is missing or empty', () => {
  const noVersions = validPackJson();
  delete noVersions.versions;
  assert.equal(parsePackEntry(noVersions), null);

  assert.equal(parsePackEntry(validPackJson({ versions: [] })), null);
});

test('parsePackEntry returns null when pack_id is missing', () => {
  const json = validPackJson();
  delete json.pack_id;
  assert.equal(parsePackEntry(json), null);
});

test('parsePackEntry returns null when download_url or sha256 is missing', () => {
  const json = validPackJson();
  json.versions[0].download_url = null;
  assert.equal(parsePackEntry(json), null);
});

test('parsePackEntry defaults an absent description and verification_summary', () => {
  const json = validPackJson();
  delete json.description;
  delete json.verification_summary;

  const entry = parsePackEntry(json);
  assert.equal(entry.description, null);
  assert.equal(entry.verificationSummary, 'Unverified');
});

test('parsePackEntry never throws on malformed input', () => {
  assert.doesNotThrow(() => parsePackEntry({ versions: 'not a list' }));
  assert.equal(parsePackEntry({ versions: 'not a list' }), null);
  assert.equal(parsePackEntry(null), null);
});

test('parseRegistry parses a full document with multiple packs', () => {
  const json = {
    generated_at: '2026-07-12T00:00:00.000Z',
    pack_count: 2,
    packs: [
      validPackJson({ pack_id: 'hv_official_a' }),
      validPackJson({ pack_id: 'hv_official_b' }),
    ],
  };

  const data = parseRegistry(json);

  assert.equal(data.generatedAt, '2026-07-12T00:00:00.000Z');
  assert.equal(data.packCount, 2);
  assert.equal(data.packs.length, 2);
  assert.deepEqual(
    data.packs.map((p) => p.packId).sort(),
    ['hv_official_a', 'hv_official_b'],
  );
});

test('parseRegistry skips a single malformed pack entry rather than failing the whole parse', () => {
  const json = {
    generated_at: '2026-07-12T00:00:00.000Z',
    packs: [validPackJson({ pack_id: 'hv_official_good' }), { pack_id: 'hv_official_bad' }],
  };

  const data = parseRegistry(json);

  assert.equal(data.packs.length, 1);
  assert.equal(data.packs[0].packId, 'hv_official_good');
});

test('parseRegistry returns null when there is no top-level packs array', () => {
  assert.equal(parseRegistry({ generated_at: 'x' }), null);
  assert.equal(parseRegistry(null), null);
  assert.equal(parseRegistry('not an object'), null);
});

test('parseRegistry an empty packs array parses to an empty, valid catalog', () => {
  const data = parseRegistry({ generated_at: 'x', packs: [] });
  assert.deepEqual(data.packs, []);
  assert.equal(data.packCount, 0);
});

test('fetchRegistry returns parsed data on a 200 response', async () => {
  const originalFetch = globalThis.fetch;
  globalThis.fetch = async () => ({
    ok: true,
    json: async () => ({ generated_at: 'x', packs: [] }),
  });
  try {
    const data = await fetchRegistry();
    assert.deepEqual(data.packs, []);
  } finally {
    globalThis.fetch = originalFetch;
  }
});

test('fetchRegistry returns null on a non-200 response', async () => {
  const originalFetch = globalThis.fetch;
  globalThis.fetch = async () => ({ ok: false });
  try {
    const data = await fetchRegistry();
    assert.equal(data, null);
  } finally {
    globalThis.fetch = originalFetch;
  }
});

test('fetchRegistry returns null (never throws) when fetch itself throws', async () => {
  const originalFetch = globalThis.fetch;
  globalThis.fetch = async () => {
    throw new Error('network down');
  };
  try {
    const data = await fetchRegistry();
    assert.equal(data, null);
  } finally {
    globalThis.fetch = originalFetch;
  }
});

test('REGISTRY_URL matches the same registry Vault Hub reads', () => {
  assert.equal(
    REGISTRY_URL,
    'https://raw.githubusercontent.com/Daemonn00/humanity-vault-ai/main/registry/registry.json',
  );
});
