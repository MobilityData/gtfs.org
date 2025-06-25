window.addEventListener('DOMContentLoaded', function () {
  if (window.search) {
    const orig = window.search.loadIndex;
    window.search.loadIndex = function (url, ...args) {
      url = url.replace('search_index.json', 'search-index.json');
      return orig.call(this, url, ...args);
    };
  }
});
