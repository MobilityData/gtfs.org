<a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">GTFS.org/edit/main/docs/schedule/examples/attributions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"/></svg>
  </a>

# Datensatz Attributionen

<hr/>

## Attributdaten zu einem Datenproduzenten in einem aggregierten GTFS

Einige GTFS enthalten aggregierte Daten aus mehreren Quellen, z. B. von verschiedenen Dienstleistern, die denselben Zuständigkeitsbereich bedienen. In einigen Fällen ist es notwendig, die in [agency.txt](../../reference/#agencytxt) aufgeführten Stellen als Produzenten, Betreiber oder Behörden zu klassifizieren.

Rejseplanen zum Beispiel ist eine Suchmaschine für Bahn- und Busdienste in Dänemark. Das Unternehmen veröffentlicht einen GTFS, der Daten von mehreren Agenturen und Anbietern enthält, wie unten in [agency.txt](../../reference/#agencytxt) dargestellt.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Um Rejseplanen als Datenproduzent zu kennzeichnen, wird die Datei [attributions.txt](../../reference/#attributionstxt) verwendet, in der neben dem Namen und der url der Organisation eine id definiert ist. Die Felder `is_producer`, `is_operator` und `is_authority` werden verwendet, um Rejseplanen wie unten gezeigt zu kategorisieren:

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[Beispiel Quelle](http://www.rejseplanen.info/labs/GTFS.zip)
