# Synthèse vocale

## Abréviations, prononciations inhabituelles, gros chiffres et ordinaux 
 
 Les abréviations, la prononciation inhabituelle et les grands chiffres sont communs aux champs de texte GTFS. Dans l’exemple ci-dessous pour TriMEt, nous pouvons voir comment le champ de synthèse vocale doit être utilisé : 
 
 - Les abréviations sont entièrement écrites : par exemple « SW » devient « sud-ouest » ; « Ave » devient « avenue ». 
 - Les prononciations sont orthographiées de manière à ce que le logiciel les lise correctement : par exemple « Orenco » devient « orrainkoe ​​» ; « Merlo » devient « murlo ». 
 - Les grands chiffres s’écrivent comme on dirait : « 3300 » devient « trente-trois cents ». 
 Sinon, le logiciel lirait « 3300 » comme « trois mille trois cents ». 
 - Les ordinaux, tels que 1er, 2e et 3e, doivent être épelés : par exemple, « 1er » devient « premier ». 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
| stop_id | stop_name | tts_stop_name |
| ---- | ---- | ---- |
| 9163 | SW 125th & Longhorn | southwest one hundred twenty fifth & longhorn |
| 9836 | Orenco MAX Station | orrainkoe max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | thirty-three-hundred block northwest thirty fifth |
 
## Acronymes 
 
 Pour les acronymes désignés par leurs lettres, les lettres doivent être suivies de points ou séparées par des espaces. Cela précise que l’acronyme doit être lu lettre par lettre et non comme un mot. 
 
 Pour Tampa, le signe « North to UATC » contient un acronyme qui se prononce par ses lettres individuelles. La désambiguïsation de la synthèse vocale serait : 
 
 [** trips.txt**](../../reference/#tripstxt) 
 
| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u.a.t.c. |
 
 ou 
 
| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u a t c |
 
 A l’inverse, certains acronymes doivent être lus comme des mots : par exemple OTAN ; NASA. Le champ de synthèse vocale devrait refléter cela. 
 
!!! Note
 
    Le champ `trips.tts_trip_headsign` n’est pas encore officiel dans la spécification. 
 
## Clarifier les abréviations à sens multiples 
 
 L’abréviation « St » a de multiples significations : « rue », « saint », « gare » et « 1ère » pour signifier « premier ». Le champ de synthèse vocale peut résoudre ces doubles sens en épelant le mot correct et en le faisant d’une manière lisible par le logiciel TTS.