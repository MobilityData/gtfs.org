(function () {
  const CSV_URL = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSu9_3lyF9caXrDdlGCtO1Bg17Uhkh_L9l-REYkYVUINvrEEaVwrx1mSZ--_iKAGcJ2x8bFBzYHVU74/pub?output=csv';
  const FIELDS_URL = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSu9_3lyF9caXrDdlGCtO1Bg17Uhkh_L9l-REYkYVUINvrEEaVwrx1mSZ--_iKAGcJ2x8bFBzYHVU74/pub?gid=1583091937&single=true&output=csv';

  const CONSUMERS = [
    { id: 'google', label: 'Google' },
    { id: 'transitapp', label: 'Transit' },
    { id: 'motis', label: 'MOTIS' },
    { id: 'OpenTripPlanner', label: 'OTP' },
    { id: 'aubin', label: 'Aubin' },
  ];

  let knownFields = [];

  const ICONS = {
    check: `<svg class="gft-icon icon-success" viewBox="0 0 24 24"><path d="M21,7L9,19L3.5,13.5L4.91,12.09L9,16.17L19.59,5.59L21,7Z"/></svg>`,
    x: `<svg class="gft-icon icon-danger" viewBox="0 0 24 24"><path d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z"/></svg>`,
    clock: `<svg class="gft-icon icon-warning" viewBox="0 0 24 24"><path d="M12,20A8,8 0 0,0 20,12A8,8 0 0,0 12,4A8,8 0 0,0 12,20M12,2A10,10 0 0,1 22,12A10,10 0 0,1 12,22C6.47,22 2,17.53 2,12A10,10 0 0,1 12,2M12.5,7V12.25L17,14.92L16.25,16.15L11,13V7H12.5Z"/></svg>`,
    partial: `<svg class="gft-icon" viewBox="0 0 24 24" fill="#FFE296"><path d="M12,2A10,10 0 0,0 12,22A10,10 0 0,0 12,2M12,4V20A8,8 0 0,1 12,4Z"/></svg>`,
    planned: `<svg class="gft-icon icon-info" viewBox="0 0 24 24"><path d="M4,15V9H12V4.16L19.84,12L12,19.84V15H4Z"/></svg>`,
    na: `<svg class="gft-icon" viewBox="0 0 24 24" fill="#9aa0a6"><path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm0 18c-4.41 0-8-3.59-8-8 0-1.86.64-3.57 1.71-4.93L16.93 18.29C15.57 19.36 13.86 20 12 20zm6.29-4.71L7.71 5.71C9.07 4.64 10.78 4 12 4c4.41 0 8 3.59 8 8 0 1.86-.64 3.57-1.71 4.93z"/></svg>`
  };

  function getStatusMeta(raw) {
    const n = (raw || '').toLowerCase().trim();
    if (n.startsWith('yes - for every feed')) return { label: 'Every feed', icon: ICONS.check, cls: 'icon-success' };
    if (n.startsWith('yes')) return { label: 'Yes', icon: ICONS.check, cls: 'icon-success' };
    if (n.startsWith('yes - for some feeds')) return { label: 'Some feeds', icon: ICONS.clock, cls: 'icon-warning' };
    if (n.includes('some fields are ignored')) return { label: 'Partial', icon: ICONS.partial, cls: 'icon-warning' };
    if (n.includes('partial') || n.includes('ignored')) return { label: 'Partial', icon: ICONS.partial, cls: 'icon-neutral' };
    if (n === 'test in progress') return { label: 'In progress', icon: ICONS.clock, cls: 'icon-warning' };
    if (n === 'integration planned') return { label: 'Planned', icon: ICONS.planned, cls: 'icon-info' };
    if (n.startsWith('no')) return { label: 'No', icon: ICONS.x, cls: 'icon-danger' };
    if (n === 'n/a' || n === 'unknown') return { label: 'N/A', icon: ICONS.na, cls: 'icon-neutral' };
    return { label: '—', icon: ICONS.na, cls: 'icon-neutral' };
  }

  function parseCSV(text) {
    const rows = []; let row = [], field = '', inQ = false;
    for (let i = 0; i < text.length; i++) {
      const ch = text[i];
      if (inQ) { if (ch === '"' && text[i + 1] === '"') { field += '"'; i++; } else if (ch === '"') inQ = false; else field += ch; }
      else { if (ch === '"') inQ = true; else if (ch === ',') { row.push(field); field = ''; } else if (ch === '\n') { row.push(field); rows.push(row); row = []; field = ''; } else if (ch !== '\r') field += ch; }
    }
    if (field || row.length) { row.push(field); rows.push(row); }
    return rows;
  }

  function formatContent(text) {
    if (!text) return '';
    let html = text;
    html = html.replace(/\[(.*?)\]\((.*?)\)/g, '<a href="$2" target="_blank">$1</a>');
    knownFields.forEach(field => {
      if (!field) return;
      const regex = new RegExp(`\\b${field}\\b`, 'g');
      html = html.replace(regex, `<code class="gft-field-badge">${field}</code>`);
    });
    return html.replace(/\n/g, '<br>');
  }

  window.showGftDetails = (title, content) => {
    const m = document.getElementById('gft-modal');
    const t = document.getElementById('gft-modal-title');
    const b = document.getElementById('gft-modal-body');
    if (m && t && b) {
      t.innerText = title;
      b.innerHTML = formatContent(content);
      m.style.display = 'flex';
    }
  };

  function renderTracker(el, features) {
    const cat = el.dataset.category;
    const catRows = features.filter(f => f.category === cat);
    if (!catRows.length) return;

    const tableRows = catRows.map(f => {
      const cells = CONSUMERS.map(c => {
        const s = f.support[c.id];
        const m = getStatusMeta(s.rawStatus);
        const hasDet = s.details && s.details.trim().length > 0;
        return `<td class="gft-cell">
          <div class="gft-badge ${m.cls}">
            <span class="gft-icon-anchor">${m.icon}</span>
            <span class="gft-label">${m.label}</span>
            ${hasDet ? `<i class="gft-info-btn" onclick="showGftDetails('${f.name.replace(/'/g, "\\'")} • ${c.label}', \`${s.details.replace(/`/g, '\\`').replace(/\\/g, '\\\\')}\`)">i</i>` : ''}
          </div>
        </td>`;
      }).join('');
      return `<tr class="gft-row"><td class="gft-feature-name" title="${f.name}">${f.name}</td>${cells}</tr>`;
    }).join('');

    el.innerHTML = `
      <div class="gft-header-container"><h3 class="gft-main-title">Features Adoption Tracker</h3><a href="https://community.mobilitydata.org/gtfs-features" target="_blank" class="gft-btn-source">Full Features Tracker</a></div>
      <div class="gft-wrapper"><div class="gft-table-wrap"><table class="gft-table"><thead><tr><th>Feature</th>${CONSUMERS.map(c => `<th><div class="gft-consumer-header"><img src="/assets/${c.id}.png" alt="" class="gft-consumer-logo" onerror="this.style.display='none'"><span>${c.label}</span></div></th>`).join('')}</tr></thead><tbody>${tableRows}</tbody></table></div></div>`;
  }

  function boot() {
    if (!document.getElementById('gft-modal')) {
      document.body.insertAdjacentHTML('beforeend', `
        <div id="gft-modal" class="gft-modal">
          <div class="gft-modal-content">
            <span class="gft-modal-close" onclick="this.parentElement.parentElement.style.display='none'">&times;</span>
            <span id="gft-modal-title" class="gft-modal-title"></span>
            <div id="gft-modal-body" class="gft-modal-body"></div>
          </div>
        </div>`);
    }

    Promise.all([
      fetch(FIELDS_URL).then(r => r.text()),
      fetch(CSV_URL).then(r => r.text())
    ]).then(([fieldsText, dataText]) => {
      const fieldRows = parseCSV(fieldsText);
      knownFields = fieldRows.slice(1).map(r => r[0]).filter(name => name && name.length > 2);

      const rows = parseCSV(dataText);
      const headers = rows[0];
      const data = rows.slice(1).filter(r => r[0]).map(r => {
        const support = {};
        CONSUMERS.forEach(c => {
          const useIdx = headers.indexOf(c.id + '_use');
          const detIdx = headers.indexOf(c.id + '_details');
          support[c.id] = { rawStatus: r[useIdx] || '', details: r[detIdx] || '' };
        });
        return { name: r[0], category: r[1], support };
      });

      document.querySelectorAll('.gtfs-feature-tracker').forEach(el => renderTracker(el, data));
    }).catch(err => console.error("GFT Error:", err));
  }

  if (typeof document$ !== 'undefined') document$.subscribe(boot); else document.addEventListener('DOMContentLoaded', boot);
})();