---
search:
    exclude: true
---

# Text-in-Sprache

<hr/>

## Abkürzungen, ungewöhnliche Aussprachen, große Ziffern und Ordnungszahlen

Abkürzungen, ungewöhnliche Aussprache und große Ziffern sind in GTFS üblich. Im folgenden Beispiel für TriMEt sehen wir, wie das Text-to-Speech-Feld verwendet werden sollte:

- Abkürzungen werden vollständig buchstabiert: z.B. "SW" wird zu "Südwest"; "Ave" wird zu "Allee".
- Aussprachen werden so buchstabiert, dass die Software sie richtig liest: z. B. "Orenco" wird zu "orrainkoe"; "Merlo" wird zu "murlo".
- Große Ziffern werden so buchstabiert, wie man sie aussprechen würde: Aus "3300" wird "dreiunddreißighundert".

Andernfalls würde die Software "3300" als "dreitausenddreihundert" lesen.

- Ordnungszahlen wie "1", "2" und "3" sollten buchstabiert werden: z. B. wird "1" zu "erste".

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name                         | tts_stop_name                                                       |
| ------- | --------------------------------- |---------------------------------------------------------------------|
| 9163    | SW 125th &amp; Longhorn           | southwest einhundertfünfundzwanzig &amp; longhorn                   |
| 9836    | Orenco MAX Station                | orrainkoe max station                                               |
| 9828    | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station    |
| 10074   | 3300 Block NW 35th                | dreihundertdreiunddreißigster Block nordwestlich fünfunddreißigster |

## Akronyme

Bei Akronymen, auf die durch ihre Buchstaben Bezug genommen wird, sollten die Buchstaben durch Punkte oder Leerzeichen getrennt werden. Dies verdeutlicht, dass das Akronym Buchstabe für Buchstabe und nicht als Wort gelesen werden sollte.

Für Tampa enthält das Kopfzeichen "North to UATC" ein Akronym, das durch seine einzelnen Buchstaben ausgesprochen wird. Die Text-to-Speech-Disambiguierung würde lauten:

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign        | tts_trip_headsign |
| -------------------- | --------------------- |
| Von Norden nach UATC | Nord nach U.A.T.C.    |

oder

| trip_headsign        | tts_trip_headsign |
| -------------------- | --------------------- |
| Von Norden nach UATC | nord nach u a t c     |

Umgekehrt sollten einige Akronyme als Wörter gelesen werden: z. B. NATO; NASA. Das Text-to-Speech-Feld sollte dies widerspiegeln.

!!! Hinweis

    Das Feld `trips.tts_trip_headsign` ist noch nicht offiziell in der Spezifikation.

## Klärung von Abkürzungen mit mehreren Bedeutungen

Die Abkürzung "St" hat mehrere Bedeutungen: "Straße", "Heiliger", "Bahnhof" und "1st" für "erste". Das Text-to-Speech-Feld kann diese double berücksichtigen, indem es das richtige Wort buchstabiert, und zwar so, dass es für die TTS-Software lesbar ist.
