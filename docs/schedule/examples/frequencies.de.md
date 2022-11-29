---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

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
