const test = require('node:test');
const assert = require('node:assert/strict');
const { formatPackSize, verificationBadgeClass } = require('../assets/js/format.js');

test('formatPackSize formats bytes', () => {
  assert.equal(formatPackSize(512), '512 B');
});

test('formatPackSize formats kilobytes, with one decimal place under 10 KB', () => {
  assert.equal(formatPackSize(2048), '2.0 KB');
  assert.equal(formatPackSize(1536), '1.5 KB');
  assert.equal(formatPackSize(20 * 1024), '20 KB');
});

test('formatPackSize formats megabytes, with one decimal place under 10 MB', () => {
  assert.equal(formatPackSize(5 * 1024 * 1024), '5.0 MB');
  assert.equal(formatPackSize(20 * 1024 * 1024), '20 MB');
});

test('verificationBadgeClass maps every known level', () => {
  assert.equal(verificationBadgeClass('Verified Source'), 'badge--verified');
  assert.equal(verificationBadgeClass('Community Verified'), 'badge--community');
  assert.equal(verificationBadgeClass('Historical Source'), 'badge--historical');
  assert.equal(verificationBadgeClass('Unverified'), 'badge--unverified');
});

test('verificationBadgeClass is case-insensitive', () => {
  assert.equal(verificationBadgeClass('verified source'), 'badge--verified');
});

test('verificationBadgeClass falls back to unverified for anything else', () => {
  assert.equal(verificationBadgeClass('Something Else'), 'badge--unverified');
  assert.equal(verificationBadgeClass(''), 'badge--unverified');
  assert.equal(verificationBadgeClass(undefined), 'badge--unverified');
});
