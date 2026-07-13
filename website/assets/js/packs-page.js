/*
 * Renders the Official Knowledge Packs catalog (/packs/) from the
 * published registry.json. Read-only: only ever performs a GET
 * request via fetchRegistry(); never writes anything back.
 */
(function () {
  const statusEl = document.getElementById('packs-status');
  const gridEl = document.getElementById('packs-grid');
  if (!statusEl || !gridEl) return;

  function renderCard(pack) {
    const badgeClass = verificationBadgeClass(pack.verificationSummary);
    const categoryBadges = pack.categoryTags
      .map((tag) => `<span class="badge badge--category">${escapeHtml(tag)}</span>`)
      .join(' ');

    return `
      <a class="card card--accent" href="/packs/detail.html?pack=${encodeURIComponent(pack.packId)}" style="border-left-color: var(--color-primary); text-decoration: none; color: inherit;">
        <h3 class="card__title">${escapeHtml(pack.packName)}</h3>
        <p class="card__meta">v${escapeHtml(pack.version)} &middot; ${pack.articleCount} ${pack.articleCount === 1 ? 'article' : 'articles'} &middot; ${formatPackSize(pack.sizeBytes)}</p>
        <p class="card__description">${escapeHtml(pack.description || '')}</p>
        <p><span class="badge ${badgeClass}">${escapeHtml(pack.verificationSummary)}</span> ${categoryBadges}</p>
      </a>
    `;
  }

  fetchRegistry().then((data) => {
    if (!data) {
      statusEl.textContent = '';
      gridEl.innerHTML = '';
      statusEl.outerHTML =
        '<div class="error-state" id="packs-status" role="alert">' +
        'Could not load the Knowledge Pack catalog. Check your connection and try again.' +
        '</div>';
      return;
    }

    if (data.packs.length === 0) {
      document.getElementById('packs-status').outerHTML =
        '<div class="empty-state" id="packs-status">No Official Knowledge Packs are published yet.</div>';
      return;
    }

    document.getElementById('packs-status').remove();
    gridEl.innerHTML = data.packs.map(renderCard).join('\n');
  });
})();
