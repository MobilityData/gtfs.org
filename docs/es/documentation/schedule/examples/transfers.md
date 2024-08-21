# Transferencias

## Transferencias en bloque 
 
 La transferencia en bloque, también llamada transferencia en el asiento, está disponible cuando un conjunto de viajes cumple con las siguientes condiciones: 
 
 1. Los viajes son consecutivos. 
 2. El mismo vehículo realiza ambos viajes. 
 3. Los viajes se aprovisionan con el mismo valor `block_id` en el archivo [trips.txt](../../reference/#tripstxt) en el feed de tránsito. 
 
### Utilice `block_id` para habilitar transferencias en bloque 
 
 Las transferencias en bloque se pueden realizar entre viajes consecutivos en diferentes rutas o en la misma ruta si la ruta es una línea circular. Utilice el campo `block_id` para especificar qué viajes se realizan en un bloque y dónde los traslados en el asiento son una opción disponible. 
 
 Por ejemplo, considere los siguientes valores [trips.txt](../../reference/#tripstxt) y [stop_times.txt](../../reference/#stop_timestxt): 

[** trips.txt**](../../reference/#tripstxt) 
 
| route_id | trip_id     | block_id  |
|----------|-------------|---|
| RouteA   | RouteATrip1 |  Block1 |
| RouteB   | RouteBTrip1 |  Block1 |
 
 [** stop_times.txt**](../../reference/#stop_timestxt) 
 
| trip_id | arrival_time     | departure_time | stop_id | stop_sequence |
|----------|-------------|---|----|-----|
| RouteATrip1  | 12:00:00|  12:01:00 | A | 1 |
| RouteATrip1  | 12:05:00|  12:06:00 | B | 2 | 
| RouteATrip1 | 12:15:00 | | C | 3|
| RouteBTrip1 | | 12:18:00 | C | 1 |
| RouteBTrip1 |12:22:00 | 12:23:00 | D | 2 |
| RouteBTrip1 |12:30:00 |  | E | 3 | 
 
 En este ejemplo: 
 
 - Un usuario que busca una ruta desde la parada A hasta la parada E debe embarcarse en la parada A a las 12:00 en la Ruta A y permanecer en el vehículo cuando llegue a la parada. C después del final de `RouteATrip1`. Esto se debe a que el mismo vehículo da servicio a `RouteBTrip1` para la Ruta B. 
 - Los pasajeros de `RouteATrip1` que deseen continuar hasta una parada en `RouteBTrip1` pueden permanecer en el vehículo para esta transferencia. 
 - Los pasajeros de otros viajes en otros vehículos por estas mismas rutas no tienen esta opción porque utilizan vehículos diferentes para cada viaje. 
 
### Transferencia en bloque en una línea circular 
 
 En una línea circular, la primera parada y la última parada de un viaje son las mismas y tienen el mismo `stop_id`. Siempre que los viajes en bucle consecutivos tengan el mismo "`block_id`", se habilita la transferencia en bloque o en el asiento, lo que permite a los pasajeros del primer viaje permanecer en el vehículo cuando este continúa en el siguiente bucle.