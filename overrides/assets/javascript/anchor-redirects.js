const anchorMappings = {
    '#guiding-principles': '/community/governance/gtfs-realtime-amendment-process/#guiding-principles',
    '#revision-history': '/documentation/realtime/change-history/revision-history/',
    '#experimental-fields': '/community/governance/gtfs-realtime-amendment-process/#experimental-fields',
    '#why-use-gtfs': '/getting-started/why-use-GTFS/',
    '#what-is-high-quality-gtfs': '/getting-started/validate/',
    '#getting-started': '/getting-started/create/',
    '#training-resources': '/resources/overview/',
    '#getting-help-community': '/community/get-involved/',
    '#schedule-guiding-principles': '/community/governance/gtfs-schedule-amendment-process/#guiding-principles',
    '#schedule-revision-history': '/documentation/schedule/change-history/revision-history/',
};

const currentHash = window.location.hash;
if (anchorMappings[currentHash]) {
    window.location.href = anchorMappings[currentHash];
}