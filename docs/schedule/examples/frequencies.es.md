---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

# Frecuencias

<hr/>

## Describir un servicio basado en la frecuencia

La Société de Transport de Montréal explota los servicios de tránsito de Montreal y gestiona un servicio basado en la frecuencia de sus líneas de metro. Por ello, en lugar de proporcionar un Schedule con las horas de arrival y departure en un conjunto de datos GTFS, se utiliza el archivo frequencies [frequencies.txt](../../reference/#frequenciestxt) txt para describir la frecuencia del servicio a lo largo de su duración.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Arriba, se utiliza como ejemplo un trip de la línea verde con `trip_id=22M-GLOBAUX-00-S_1_2`. Para ese trip, el primer registro indica que entre las 16:01:25 y las 16:19:25, los trenes circulan cada 180 segundos (o 3 minutos). Del mismo modo, el segundo registro indica que entre las 16:19:25 y las 17:03:25, los trenes circulan cada 165 segundos.

[Ejemplo de fuente](https://www.stm.info/en/about/developers)
