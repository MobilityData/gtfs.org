function showEmailAndHomepage(emailId, homepageId, errorCode, errorMessage, websiteURL, domain, user) {
  const email = `${user}@${domain}`;
  const homepageURL = `https://${websiteURL}/`;
  const subject = encodeURIComponent(`Error ${errorCode}: ${errorMessage} - ${websiteURL}`);

  const emailLink = `<a href="mailto:${email}?subject=${subject}">${email}</a>`;
  const emailEl = document.getElementById(emailId);
  if (emailEl) emailEl.innerHTML = emailLink;

  const homepageLink = `<a href="${homepageURL}" target="_blank" rel="noopener">go to the homepage</a>`;
  const homepageEl = document.getElementById(homepageId);
  if (homepageEl) homepageEl.innerHTML = homepageLink;
}