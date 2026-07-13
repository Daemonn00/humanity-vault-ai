/*
 * Shared formatting helpers, used by both the catalog and detail
 * pages so the same logic isn't duplicated in two places.
 */

/** Formats a byte count as a short, human-readable size string. */
function formatPackSize(bytes) {
  if (bytes < 1024) return `${bytes} B`;
  const kb = bytes / 1024;
  if (kb < 1024) return `${kb.toFixed(kb < 10 ? 1 : 0)} KB`;
  const mb = kb / 1024;
  return `${mb.toFixed(mb < 10 ? 1 : 0)} MB`;
}

/** Maps a verification_summary string to its badge modifier class. */
function verificationBadgeClass(level) {
  switch ((level || '').toLowerCase()) {
    case 'verified source':
      return 'badge--verified';
    case 'community verified':
      return 'badge--community';
    case 'historical source':
      return 'badge--historical';
    default:
      return 'badge--unverified';
  }
}

/** Escapes text for safe insertion into innerHTML. */
function escapeHtml(value) {
  const div = document.createElement('div');
  div.textContent = value == null ? '' : String(value);
  return div.innerHTML;
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = { formatPackSize, verificationBadgeClass };
}
