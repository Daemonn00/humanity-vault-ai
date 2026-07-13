/*
 * Renders a single pack's detail (/packs/detail.html?pack=<pack_id>)
 * from the published registry.json. Read-only, same as packs-page.js.
 */
(function () {
  const containerEl = document.getElementById('pack-detail');
  if (!containerEl) return;

  const params = new URLSearchParams(window.location.search);
  const packId = params.get('pack');

  function renderDetail(pack) {
    const badgeClass = verificationBadgeClass(pack.verificationSummary);
    const categoryBadges = pack.categoryTags
      .map((tag) => `<span class="badge badge--category">${escapeHtml(tag)}</span>`)
      .join(' ');

    document.title = `${pack.packName} · Humanity Vault`;

    containerEl.innerHTML = `
      <div class="hero">
        <h1>${escapeHtml(pack.packName)}</h1>
        <p>v${escapeHtml(pack.version)} &middot; ${pack.articleCount} ${pack.articleCount === 1 ? 'article' : 'articles'} &middot; ${formatPackSize(pack.sizeBytes)}</p>
        <p><span class="badge ${badgeClass}">${escapeHtml(pack.verificationSummary)}</span> ${categoryBadges}</p>
      </div>
      <div class="section content-measure">
        ${pack.description ? `<div class="card"><h2>About this pack</h2><p>${escapeHtml(pack.description)}</p></div>` : ''}
        ${pack.changelogSummary ? `<div class="card" style="margin-top: var(--space-md);"><h2>What's in this version</h2><p>${escapeHtml(pack.changelogSummary)}</p></div>` : ''}
        <div class="card" style="margin-top: var(--space-md);">
          <a class="btn btn-primary" href="${encodeURI(pack.downloadUrl)}">Download ZIP</a>
          <p class="card__meta" style="margin-top: var(--space-sm);">Verify this download: SHA-256 <code>${escapeHtml(pack.sha256)}</code></p>
        </div>
      </div>
    `;
  }

  function renderNotFound() {
    containerEl.innerHTML =
      '<div class="empty-state">This pack could not be found. It may no longer be published.' +
      '<br><a href="/packs/">Back to Knowledge Packs</a></div>';
  }

  function renderError() {
    containerEl.innerHTML =
      '<div class="error-state" role="alert">Could not load this pack. Check your connection and try again.</div>';
  }

  if (!packId) {
    renderNotFound();
    return;
  }

  fetchRegistry().then((data) => {
    if (!data) {
      renderError();
      return;
    }
    const pack = data.packs.find((p) => p.packId === packId);
    if (!pack) {
      renderNotFound();
      return;
    }
    renderDetail(pack);
  });
})();
