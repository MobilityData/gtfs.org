---
search:
  exclude: true
---

# Frecuencias

<hr/>

## Describir un servicio basado en la frecuencia

La Société de Transport de Montréal explota los servicios de tránsito de Montreal y gestiona un servicio basado en la frecuencia de sus líneas de metro. Por ello, en lugar de proporcionar un Schedule con las horas de arrival y departure en un conjunto de datos GTFS, se utiliza el archivo frequencies [frequencies.txt](../../reference/#frequenciestxt) para describir la frecuencia del servicio a lo largo de su duración.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Arriba, se utiliza como ejemplo un trip de la línea verde con `trip_id=22M-GLOBAUX-00-S_1_2`. Para ese trip, el primer registro indica que entre las 16:01:25 y las 16:19:25, los trenes circulan cada 180 segundos (o 3 minutos). Del mismo modo, el segundo registro indica que entre las 16:19:25 y las 17:03:25, los trenes circulan cada 165 segundos.

[Ejemplo de fuente](https://www.stm.info/en/about/developers)
