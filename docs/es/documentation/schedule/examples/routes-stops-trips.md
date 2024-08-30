# Rutas, paradas y viajes

## Rutas 
 
 Las Rutas son el núcleo de las operaciones de tránsito de ruta fija, ya que describen el alcance geográfico de una red de tránsito. En GTFS, definir rutas es el primer paso para describir las operaciones de una agencia de tránsito. 
 
 El primer paso es agregar la información de la agencia como se muestra en el archivo [agency.txt](../../reference/#agencytxt) a continuación. Este archivo contiene información de alto nivel sobre la agencia. 
 
 [**agency.txt**](../../reference/#agencytxt) 
 
```
agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000
```
 
 Calgary Transit opera LRT, BRT, servicio regular de autobús, paratránsito y tránsito a pedido en Calgary, AB. En este ejemplo se definen dos rutas, la primera es un autobús y la segunda es un LRT. Usando el archivo [routes.txt](../../reference/#routestxt), a cada ruta se le asigna una identificación única y un nombre corto y uno largo para facilitar la lectura humana. 
 
 [**routes.txt**](../../reference/#routestxt) 
 
```
agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff
```
 
 El quinto campo (`route_type`) se utiliza para diferenciar los tipos de rutas: 
 
 - El primero es un autobús, por lo tanto `route_type=3` 
 - El segundo es un LRT, por lo tanto `route_type=0` 
 - Puede encontrar una lista completa de valores para `route_type` [aquí](../../reference/#routestxt) 
 
 Los campos restantes contienen información adicional, como como una URL específica de la ruta, así como colores específicos de la agencia para representar el servicio en un mapa. 
 
<hr> 
 
## Paradas 
 
 En GTFS, las paradas y estaciones se describen usando el archivo [stops.txt](../../reference/#stopstxt), a continuación, se define una parada de autobús en el primer registro y una estación LRT se define en el segundo registro. 
 
 [**stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1
```
 
 - `stop_id` es un identificador único- `stop_code` y `stop_name` normalmente contienen información orientada al conductor
 - La ubicación exacta se proporciona mediante coordenadas (`stop_lat` y `stop_lon`) 
 - El sexto campo (`location_type`) se utiliza para diferenciar las paradas de estaciones
 - El primer registro corresponde a una parada de autobús, por lo tanto `location_type=0` 
 - El segundo registro corresponde a una estación, por lo tanto `location_type=1` 
 - Se puede obtener una lista completa de valores para `location_type ` encontrado [aquí](../../reference/#stopstxt). 
 
<hr> 
 
## Viajes 
 
 Después de describir las rutas de la agencia, ahora es posible describir los viajes que realiza cada ruta. 
 
 Primero, la duración del servicio debe definirse usando [calendar.txt](../../reference/#calendartxt). 
 
 [**calendar.txt**](../../reference/#calendartxt) 
 
```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
weekend_service,0,0,0,0,0,1,1,20220623,20220903
```
 
 Aquí se describe un servicio que se ejecuta solo los sábados y domingos, por lo que el los campos para esos días se completan con 1 y los campos para los días restantes se completan con cero. Este servicio se ejecuta desde el 23 de junio de 2022 hasta el 3 de septiembre de 2022, como se muestra en los campos "`start_date`" y "`end_date`". 
 
 En este ejemplo, el archivo [trips.txt](../../reference/#tripstxt) describe 3 viajes de fin de semana atendidos por la ruta MAX Orange descrita anteriormente. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
```
route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027
```
 
- El `route_id` de [routes.txt](../../reference/#routestxt) que corresponde a MAX Orange aparece en la lista
- El `service_id` de [calendar.txt](../../reference/#calendartxt) que corresponde a los fines de semana se enumera
- Cada registro contiene una identificación única para cada viaje. 
 Se proporciona el texto de la señal, que es lo que normalmente se muestra en las señales dentro y fuera del autobús. 
- El campo `direction_id` permite distinguir entre viajes de la misma ruta que van en diferentes direcciones. Por ejemplo, distinga entre viajes de entrada y viajes de salida, o viajes en dirección sur y viajes en dirección norte. 
    - En este caso, los viajes hacia Saddletowne tienen una `dirección_id=0` y los viajes hacia Brentwood tienen una `dirección_id=1`. Los valores en direction_id no tienen un significado inherente, solo se usan para asignar una dirección de viaje versus otra
- El `shape_id` de [shapes.txt](../../reference/#shapestxt) que corresponde al La ruta MAX Naranja hacia Saddletowne aparece para el primer registro y la de la ruta MAX Naranja hacia Brentwood aparece para el segundo y tercer registros 
 
 
El `shape_id=3030026` corresponde al MAX Naranja hacia Saddletowne. El siguiente archivo incluye información sobre los puntos que delimitan el viaje, así como la distancia entre cada punto y el inicio del viaje. Con esta información, es posible trazar la ruta en un mapa con fines de planificación de viaje. 
 
 [**shapes.txt**](../../reference/#shapestxt) 
 
```
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
```
 
<hr> 
 
## Excepciones de servicio 
 
 Es posible definir excepciones al servicio como días de servicio agregados (días especiales) o días de servicio eliminados (como no servicio en días festivos). 
 
 Por ejemplo, si no hay servicio programado el domingo 17 de julio de 2022, entonces esa date se puede eliminar de `weekend_service` en [calendar.txt](../../reference/#calendartxt) dividiendo el servicio en dos: 
 
| Service | Start | End |
| ----- | ----- | ----- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |
 
 Sin embargo, esto complica el archivo ya que `service_id` se divide en dos y esta división se aplicará en cascada a [trips.txt](../../reference/#tripstxt). En su lugar, esto se puede hacer de una manera más sencilla usando [calendar_dates.txt](../../reference/#calendar_datestxt) como se muestra a continuación: 
 
 [**calendar_dates.txt**](../../reference/#calendar_datestxt) 
 
```
service_id,date,exception_type
weekend_service,20220717,2
```
 
 - El `service_id` `weekend_service` aparece en la lista
 - La date del servicio eliminado o agregado aparece en `date` (17 de julio de 2022) 
 - El campo `exception_type` está establecido en 2, lo que significa que el servicio se elimina para este día 
 
 <sup>[Fuente de ejemplo](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)</sup>