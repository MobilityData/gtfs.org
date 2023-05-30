# Traslados

<hr/>

## Traslados en bloque

La transferencia en bloque, también denominada transferencia en asiento, está disponible cuando un conjunto de viajes cumple las siguientes condiciones:

1. Los viajes son consecutivos.
2. El mismo vehículo opera ambos viajes.
3. Los viajes se aprovisionan con el mismo valor `block_id` en el archivo [trips.txt](../../reference/#tripstxt) txt del feed de tránsito.

### Utilice `block_id` para activar las transferencias en bloque

Se pueden realizar transferencias en bloque entre viajes consecutivos en rutas diferentes o en la misma ruta si la ruta es una línea en bucle. Utilice el campo `block_id` para especificar qué viajes están en un bloque y dónde las transferencias en asiento son una opción disponible.

Por ejemplo, considere los siguientes valores de trips. [trips.txt](../../reference/#tripstxt) y [stop_times.txt](../../reference/#stoptimestxt):

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id    | block_id |
| -------- | ---------- |----------|
| RouteA    | RouteATrip1 | Block1   |
| RouteB    | RouteBTrip1 | Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id    | arrival_time | departure_time | stop_id | stop_sequence |
| ---------- | ------------ | -------------- | ------- | ------------- |
| RouteATrip1 | 12:00:00     | 12:01:00       | A       | 1             |
| RouteATrip1 | 12:05:00     | 12:06:00       | B       | 2             |
| RouteATrip1 | 12:15:00     |                | C       | 3             |
| RouteBTrip1 |              | 12:18:00       | C       | 1             |
| RouteBTrip1 | 12:22:00     | 12:23:00       | D       | 2             |
| RouteBTrip1 | 12:30:00     |                | E       | 3             |

En este ejemplo:

- A un usuario que busca una ruta desde la parada A hasta la parada E se le indica que embarque en la parada A a las 12:00 en la Ruta A y que permanezca en el vehículo cuando llegue a la parada C tras finalizar la `RouteATrip1`. Esto se debe a que el mismo vehículo presta servicio a la `RouteBTrip1` para la Ruta B.
- Los pasajeros de la `RouteATrip1` que deseen continuar hasta una parada de la `RouteBTrip1` pueden permanecer en el vehículo durante este transbordo.
- Los pasajeros de otros viajes en otros vehículos a lo largo de estas mismas rutas no tienen esta opción porque utilizan vehículos diferentes para cada viaje.

### Transbordo en bloque en una línea en bucle

En una línea de bucle, la primera parada y la última parada de un viaje son la misma y tienen el mismo `stop_id`. Siempre que los viajes consecutivos en bucle tengan el mismo `block_id`, se habilita la transferencia en bloque o en asiento, que permite a los pasajeros del primer viaje permanecer en el vehículo cuando éste continúa en el siguiente bucle.
