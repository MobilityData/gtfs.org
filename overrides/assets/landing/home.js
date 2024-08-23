document.documentElement.classList.remove('no-js');
document.addEventListener('scroll', function(event) {
    const gradient = document.getElementsByClassName('hero-dark-gradient');
    const scrollTop = window.scrollY;
    const maxScroll = 600;
    let newOpacity = (scrollTop / maxScroll);
    newOpacity = Math.max(0.25, Math.min(newOpacity, 1));
    gradient[0].style.opacity = newOpacity;
    animateSection('.fade-in', 0.1); // Why use GTFS?
    animateSection('.fade-in-2', 0.1); // Two Formats in One Standard
    animateSection('.fade-in-3'); // Help develop the future of GTFS
});

function animateSection(querySelectorAll, delayIncrement = 0.2) {
    const fadeInElements = document.querySelectorAll(querySelectorAll);
    const baseDelay = 0.5; // Base delay in seconds
    fadeInElements.forEach(function(element, index) {
        const position = element.getBoundingClientRect().top;
        const windowHeight = window.innerHeight;

        // Calculate delay based on index
        const delay = baseDelay * (index * delayIncrement);

        // Apply the delay to the transition
        element.style.transitionDelay = `${delay}s`;

        if (position < windowHeight) {
            element.classList.add('visible');
        }
    });
}