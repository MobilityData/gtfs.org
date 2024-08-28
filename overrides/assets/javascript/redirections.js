window.addEventListener('DOMContentLoaded', function() {
    const redirects = {
        '#why-use-gtfs': '/getting_started/why_use_GTFS/',
        '#what-is-high-quality-gtfs': '/getting_started/validate/',
    };

    const hash = window.location.hash;
    if (redirects[hash]) {
        window.location.href = redirects[hash];
    }
});