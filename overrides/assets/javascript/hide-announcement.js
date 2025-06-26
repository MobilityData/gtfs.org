document$.subscribe(() => {
  const path = window.location.pathname;

  // List of paths to SHOW the announcement on (adjust as needed)
  const allowed = [
    'blog/'
  ];

  const bar = document.querySelector('md-announcement');
  if (!bar) return;

  if (allowed.some(p => path.startsWith(p))) {
    bar.style.display = '';
  } else {
    bar.style.display = 'none';
  }
});
