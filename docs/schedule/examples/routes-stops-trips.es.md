---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/routes-stops-trips.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Rutas, paradas y viajes

<hr/>

## Rutas

Las rutas son el núcleo de las operaciones de tránsito de ruta fija, ya que describen el alcance geográfico de una red de tránsito. En GTFS, la definición de las rutas es el primer paso para describir las operaciones de una agencia de transporte.

El primer paso es añadir la información de la agencia, tal y como se muestra en el archivo [agency.txt](../../reference/#agencytxt) de abajo. Este archivo contiene información de alto nivel sobre la agencia.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit opera LRT, BRT, servicio regular de autobús, paratránsito y tránsito a demanda en Calgary, AB. En este ejemplo, se definen dos rutas, la primera es un autobús y la segunda es un LRT. Utilizando el archivo [routes.txt](../../reference/#routestxt)txt, se asigna a cada ruta un id único y un nombre corto y otro largo para facilitar la lectura.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

El quinto campo`route_type`) se utiliza para diferenciar los tipos de rutas:

- La primera es un autobús, por lo que `route_type=3`
- El segundo es un LRT, por lo que `route_type=0`
- Una lista completa de valores para `route_type` se puede encontrar [aquí](../../reference/#routestxt)

Los campos restantes contienen información adicional, como una url específica de la ruta, así como colores específicos de la agencia para representar el servicio en un mapa.

<hr/>

## Paradas

En GTFS, las paradas y las estaciones se describen utilizando el archivo [stops.txt](../../reference/#stopstxt)txt, a continuación, una parada de autobús se define en el primer registro y una estación de LRT se define en el segundo registro.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` es un identificador único
- `stop_code` y `stop_name` suelen contener información orientada al usuario
- La ubicación exacta se proporciona mediante coordenadas`(stop_lat` y `stop_lon`)
- El sexto campo`(location_type`) se utiliza para diferenciar las paradas de las estaciones
- El primer registro corresponde a una parada de autobús, por lo que `location_type=0`
- El segundo registro corresponde a una estación, por lo que `location_type=1`
- La lista completa de valores para ` location_type  `se encuentra [aquí](../../reference/stopstxt)

<hr/>

## Viajes

Una vez descritas las rutas de la agencia, es posible describir los viajes a los que da servicio cada ruta.

En primer lugar, es necesario definir el intervalo de servicio mediante calendar [calendar.txt](../../reference/#calendartxt)txt.

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

En este caso, se describe un servicio que sólo funciona los sábados y domingos, por lo que los campos de esos días se rellenan con 1, y los del resto de días se rellenan con cero. Este servicio funciona desde el 23 de junio de 2022 hasta el 3 de septiembre de 2022, como se muestra en los campos `start_date` y `end_date`.

En este ejemplo, el archivo [trips.txt](../../reference/#tripstxt).txt describe 3 viajes de fin de semana que son servidos por la ruta MAX Naranja que fue descrita anteriormente.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- El `route_id` de [routes.txt](../../reference/#routestxt).txt que corresponde a MAX Orange está listado
- El `service_id` de calendar. [calendar.txt](../../reference/#calendartxt) que corresponde a los fines de semana está listado
- Cada registro contiene un id único para cada trip

Se proporciona el text de la señal de cabeza, que es lo que suele aparecer en las señales dentro y fuera del autobús

- El campo `direction_id` permite distinguir entre los viajes de la misma ruta que van en diferentes direcciones. Por ejemplo, distinguir entre los viajes de entrada y los de salida, o los viajes en dirección sur y los viajes en dirección norte.
  - En este caso, los viajes hacia Saddletowne tienen un `direction_id=0` y los viajes hacia Brentwood tienen un `direction_id=1`. Los valores de direction_id no tienen ningún significado inherente, sólo se utilizan para asignar un sentido de la marcha frente a otro
- El `shape_id` de shapes. [shapes.txt](../../reference/#shapestxt) que corresponde a la ruta MAX Orange hacia Saddletowne aparece en el primer registro y el de la ruta MAX Orange hacia Brentwood aparece en el segundo y tercer registro

El `shape_id=3030026` corresponde al MAX Naranja hacia Saddletowne. El archivo que se muestra a continuación incluye información sobre los puntos que delinean la ruta, así como la distancia entre esos puntos. Con esta información, es posible trazar la ruta en un mapa con fines de planificación de trip o de análisis.

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## Excepciones del servicio

Es posible definir excepciones al servicio como los días de servicio agregado (días especiales) o los días de servicio eliminados (como el no servicio en días festivos).

Por ejemplo, si no hay servicio programado el domingo 17 de julio de 2022 - entonces esa fecha se puede eliminar de `weekend_service` en [calendar.txt](../../reference/#calendartxt) txt dividiendo el servicio en dos:

| Servicio           | start      | end        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

Sin embargo, esto complica el archivo, ya que `service_id` se rompe en dos y esta ruptura se trasladará en cascada a [trips.txt](../../reference/#tripstxt).txt. En su lugar, esto se puede hacer de una manera más fácil utilizando [calendar_dates.txt](../../reference/#calendar_datestxt).txt como se muestra a continuación:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- El `service_id` `weekend_service` aparece en la lista
- La fecha del servicio eliminado o adicional aparece en la `fecha` (17 de julio de 2022)
- El campo `exception_type` se establece en 2, lo que significa que el servicio se elimina para este día

[Ejemplo de fuente](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
