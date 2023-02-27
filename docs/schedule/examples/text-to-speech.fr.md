---
search:
    exclude: true
---

# Synthèse vocale

<hr/>

## Abréviations, prononciations inhabituelles, grands chiffres et ordinaux

Les abréviations, les prononciations inhabituelles et les grands chiffres sont courants dans les champs texte GTFS. Dans l'exemple ci-dessous pour TriMEt, nous pouvons voir comment le champ de synthèse vocale devrait être utilisé :

- Les abréviations sont épelées en entier : par exemple, "SW" devient "southwest" ; "Ave" devient "avenue".
- Les prononciations sont épelées de manière à ce que le logiciel les lise correctement : par exemple, "Orenco" devient "orrainkoe" ; "Merlo" devient "murlo".
- Les grands chiffres sont épelés comme ils seraient prononcés : "3300" devient "trente-trois cents".

Sinon, le logiciel lirait "3300" comme "trois mille trois cents".

- Les ordinaux, comme 1st, 2nd et 3rd, doivent être épelés : par exemple, "1st" devient "first".

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name                         | tts_stop_name                                                    |
| ------- |-----------------------------------| ---------------------------------------------------------------- |
| 9163    | SW 125th &amp; Longhorn           | southwest one hundred twenty fifth &amp; longhorn                |
| 9836    | Station Orenco MAX                | orrainkoe max station                                            |
| 9828    | Station MAX Merlo Rd/SW 158th Ave | murlo road southwest one hundred fifty eighth avenue max station |
| 10074   | 3300 Block NW 35th                | thirty-three-hundred block northwest thirty fifth                |

## Acronymes

Pour les acronymes qui sont désignés par leurs lettres, celles-ci devraient être suivies de points ou séparées par des espaces. Cela permet de préciser que l'acronyme devrait être lu lettre par lettre, et non comme un mot.

Dans le cas de Tampa, l'indicatif "North to UATC" contient un acronyme qui se prononce par ses lettres individuelles. La désambiguïsation texte-parole serait :

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign  | tts_trip_headsign  |
| -------------- | ------------------ |
| Nord vers UATC | nord vers u.a.t.c. |

ou

| trip_headsign  | tts_trip_headsign |
| -------------- | ----------------- |
| Nord vers UATC | nord vers u a t c |

A l'inverse, certains acronymes devraient être lus comme des mots : par exemple, OTAN ; NASA. Le champ de synthèse vocale devrait en tenir compte.

!!! Note

    Le champ `trips.tts_trip_headsign` n'est pas encore officiel dans la spécification.

## Clarification des abréviations à sens multiples

L'abréviation "St" a plusieurs significations : "rue", "saint", "station" et "1st" pour signifier "premier". Le champ de synthèse vocale peut traiter ces double sens en épelant le mot correct, et en le faisant de manière à ce qu'il soit lisible par le logiciel TTS.
