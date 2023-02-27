---
search:
  exclude: true
---

# Übersetzungen

<hr/>

## Übersetzen von Haltestellennamen

Einige Verkehrsanbieter bieten ihre Dienste in mehreren Sprachen an - einer davon ist die Nationale Eisenbahngesellschaft Belgiens (lokal bekannt als NMBS/SNCB, für Nationale Maatschappij der Belgische Spoorwegen auf Niederländisch oder Société nationale des chemins de fer belges auf Französisch). Das Unternehmen bietet Bahnhofsnamen in mehreren Sprachen an, die je nach den Sprach- und Standorteinstellungen des Benutzers angezeigt werden.

Die NMBS/SNCB veröffentlicht GTFS in französischer Sprache, wie in der folgenden Datei dargestellt:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

Da die Sprache der Agentur auf Französisch eingestellt ist, werden die Stationsnamen in der Datei [stops.txt](../../reference/#stopstxt) auf Französisch aufgeführt.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

Die Datei [translations.txt](../../reference/#translationstxt) wird dann verwendet, um die Stationsnamen von der Standardsprache der Agentur (in diesem Fall Französisch) ins Niederländische zu übersetzen.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- In diesem Beispiel werden die Haltestellennamen aus [stops.txt](../../reference/#stopstxt) übersetzt, und die Datensätze in [stops.txt](../../reference/#stopstxt) werden durch eine `stop_id` identifiziert. Daher werden
  - `stops` werden unter Tabellennamen aufgeführt (mit Bezug auf [stops.txt](../../reference/#stopstxt))
  - `stop_name` wird unter `field_name` aufgeführt (da die Namen der Haltestellen übersetzt werden)
  - Die `stop_id` für den aus dem Französischen zu übersetzenden Haltestellennamen wird unter `record_id` aufgeführt (in diesem Fall die `stop_id` für Bruxelles-Ouest)
- Der Name wird ins Niederländische (nl) übersetzt.
- Schließlich wird der übersetzte Name unter Translation aufgeführt

Es gibt noch eine andere Möglichkeit, Namen in GTFS mit Hilfe der Datei [translations.txt](../../reference/#translationstxt) zu übersetzen, wobei das Feld `field_value` anstelle von `record_id` verwendet wird. In diesem Fall wird der Name der Haltestelle verwendet, um den zu übersetzenden Datensatz aus [stops.txt](../../reference/#stopstxt) zu finden.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[Beispiel Quelle](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
