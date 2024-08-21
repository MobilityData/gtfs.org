# Frecuencias

## Describa un servicio basado en frecuencia 
 
 La Société de Transport de Montréal opera servicios de tránsito en Montreal y administra un servicio basado en frecuencia para sus líneas de metro. Por lo tanto, en lugar de proporcionar un cronograma con horas de llegada y salida en un conjunto de datos GTFS, el archivo [frequencies.txt](../../reference/#frequenciestxt) se utiliza para describir la frecuencia del servicio durante toda la duración del servicio. Repetir un viaje solo funciona en los casos en que el tiempo entre paradas sigue siendo el mismo para todas las paradas. Al modelar un servicio basado en frecuencia, [stop_times.txt](../../reference/#stop_timestxt) contiene los tiempos relativos entre paradas para determinar los tiempos que se mostrarán a los pasajeros. 
 
 [** frequencies.txt**](../../reference/#frequenciestxt) 
 
```
trip_id,start_time,end_time,headway_secs
22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165
```
 
 Arriba, un viaje en la Línea Verde con un `trip_id=22M-GLOBAUX-00-S_1_2` se utiliza como ejemplo. Para ese viaje, el primer registro indica que entre las 4:01:25 p.m.y las 4:19:25 p.m., los trenes pasan cada 180 segundos (o 3 minutos). Del mismo modo, el segundo registro indica que entre las 16:19:25 y las 17:03:25 los trenes circulan cada 165 segundos. 
 
 
 
 <sup>[Fuente de ejemplo](https://www.stm.info/en/about/developers)</sup>