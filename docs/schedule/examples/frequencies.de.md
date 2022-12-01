---
search:
  exclude: true
---

# Frequenzen

<hr/>

## Beschreiben Sie einen frequenzbasierten Dienst

Die Société de Transport de Montréal betreibt den Nahverkehr in Montréal und bietet für ihre Métro-Linien einen frequenzbasierten Dienst an. Anstelle eines Fahrplans mit arrival und departure in einem GTFS wird daher die Datei [frequencies.txt](../../reference/#frequenciestxt) verwendet, um die Bedienungshäufigkeit während der gesamten Dauer der Verbindung zu beschreiben.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Oben wird eine trip auf der Linie Grün mit einer `trip_id=22M-GLOBAUX-00-S_1_2` als Beispiel verwendet. Für diese trip gibt der erste Datensatz an, dass die Züge zwischen 16:01:25 Uhr und 16:19:25 Uhr alle 180 Sekunden (oder 3 Minuten) fahren. Der zweite Datensatz zeigt, dass die Züge zwischen 16:19:25 Uhr und 17:03:25 Uhr alle 165 Sekunden fahren.

[Beispiel Quelle](https://www.stm.info/en/about/developers)
