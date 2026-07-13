/*
 * Shared mobile nav disclosure toggle, loaded on every page. The nav
 * is fully usable with this script absent or failing (the link list
 * is just always visible without the [max-width: 767px] collapse
 * behavior), so this is progressive enhancement, not a requirement.
 */
(function () {
  const toggle = document.getElementById('nav-toggle');
  const list = document.getElementById('nav-list');
  if (!toggle || !list) return;

  toggle.addEventListener('click', function () {
    const isOpen = list.classList.toggle('is-open');
    toggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
  });
})();
