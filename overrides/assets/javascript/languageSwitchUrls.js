document.addEventListener("DOMContentLoaded", function () {
    const currentPath = window.location.pathname;
    const switcherLinks = document.querySelectorAll(".md-header__option .md-select__item a");

    switcherLinks.forEach(link => {
        const langCode = link.getAttribute("hreflang") === "en" ? "" : "/" + link.getAttribute("hreflang");

        // Detect the current language from the URL
        const langPrefixes = ["en", "fr", "es", "ja", "de", "pt", "ru", "ko", "id", "zh", "zh-TW"];
        const pathParts = currentPath.split("/").filter(Boolean);
        let currentLang = langPrefixes.includes(pathParts[0]) ? pathParts[0] : "en"; // Default to "en"

        let newPath;
        if (currentLang !== "en") {
            newPath = currentPath.replace(`/${currentLang}/`, `${langCode}/`);
        } else {
            newPath = `${langCode}${currentPath}`;
        }

        link.href = newPath;
        
        /**
         * Hack:
         * When switching languages it forcefully goes to the root languauge page ex: /fr/ or /es/
         * regardless of the a tag href attribute.
         * 
         * Current behavior: es/get-started -> fr/get-started -> /fr/ [bad behavior]
         * 
         * With the setTimeout it calls the /fr/ then the correct href
         * 
         * After fix: es/get-started -> fr -> fr/get-started [good behavior]
         */
        link.addEventListener("click", function () {
            setTimeout(() => window.location.href = newPath);
        });
    });
});