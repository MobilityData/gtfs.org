document.documentElement.classList.remove('no-js');
document.addEventListener('scroll', function(event) {
    const gradient = document.getElementsByClassName('hero-dark-gradient');
    const scrollTop = window.scrollY;
    const maxScroll = 600;
    let newOpacity = (scrollTop / maxScroll);
    newOpacity = Math.max(0.25, Math.min(newOpacity, 1));
    gradient[0].style.opacity = newOpacity;
    animateSection('.fade-in');
    animateSection('.fade-in-2');
    animateSection('.fade-in-3');
});

function animateSection(querySelectorAll) {
    const fadeInElements = document.querySelectorAll(querySelectorAll);
    const baseDelay = 0.5; // Base delay in seconds
    fadeInElements.forEach(function(element, index) {
        const position = element.getBoundingClientRect().top;
        const windowHeight = window.innerHeight;

        // Calculate delay based on index
        const delay = baseDelay * (index * 0.2);

        // Apply the delay to the transition
        element.style.transitionDelay = `${delay}s`;

        if (position < windowHeight) {
            element.classList.add('visible');
        }
    });
}