/*
 * Fills in the Home page's live pack count from registry.json. The
 * static fallback text already in the HTML is left in place if the
 * fetch fails, so this is purely progressive enhancement - the page
 * never shows broken or undefined text.
 */
(function () {
  const statsEl = document.getElementById('home-stats');
  if (!statsEl) return;

  fetchRegistry().then((data) => {
    if (!data) return;
    const count = data.packCount;
    statsEl.textContent =
      count === 0
        ? 'No Official Knowledge Packs are published yet.'
        : `${count} Official Knowledge Pack${count === 1 ? '' : 's'} published and verified.`;
  });
})();
