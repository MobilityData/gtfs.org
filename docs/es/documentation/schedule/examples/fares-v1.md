# Tarifas v1 

 Compuesto por [fare_attributes.txt](../../reference/#fare_attributestxt) y [fare_rules.txt](../../reference/#fare_rulestxt), Tarifas v1 históricamente ha sido el método oficial para describir la información de tarifas en GTFS. Sin embargo, los dos archivos están limitados en la variedad de factores que pueden describir de manera eficiente y su implementación es ambigua. 
 [Tarifas v2](../../examples/fares-v2/) es un proyecto de extensión en desarrollo activo y tiene como objetivo abordar las limitaciones de Tarifas v1. 
 
## Definir las reglas de tarifas de una agencia 
 
 Un viaje en la red de metro de la Comisión de Tránsito de Toronto cuesta $3,20 CAD si los pasajeros pagan con la tarjeta PRESTO. Los pasajeros también pueden trasladarse a otras rutas de metro, tranvía o autobús operadas por la TTC en un plazo de dos horas. 
 
 Este servicio se puede representar utilizando los archivos [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) y [transfers.txt](../../reference/#transferstxt). El primer archivo, [fare_attributes.txt](../../reference/#fare_attributestxt) describe las tarifas de la agencia, a continuación se muestra un ejemplo de la tarifa presto: 
 
 [** fare_attributes.txt**](../../reference/#fare_attributestxt) 
 
```
fare_id,price,currency_type,payment_method,transfers,transfer_duration
presto_fare,3.2,CAD,1,,7200
```

 - El precio de la tarifa aparece en precio y `currency_type` 
 - Los pasajeros deben pagar su tarifa en las puertas de la estación antes de abordar el metro. Esto está representado por `paid_method=1` 
 - El campo transferencias se deja en blanco para representar transferencias ilimitadas
 - El campo `transfer_duration` corresponde a la ventana de transferencia de 2 horas (en segundos) 
 
 El segundo archivo, [fare_rules.txt](../../reference/#fare_rulestxt) asigna tarifas a los viajes vinculando una tarifa a una ruta, así como un origen/destino en esa ruta. 
 
 Para ello, a continuación se definen dos líneas de metro en [routes.txt](../../reference/#routestxt): 
 
 [** routes.txt**](../../reference/#routestxt) 
 
```
agency_id,route_id,route_type
TTC,Line1,1
TTC,Line2,1
```
 
 En este ejemplo, las transferencias en La estación Bloor-Yonge está modelada. Para eso, esta estación se modela como dos paradas separadas, la primera es la estación Bloor, a la que llega la Línea 1, y la segunda es la Estación Yonge, a la que llega la Línea 2. Ambas tienen `zone_id=ttc_subway_stations` para agrupar todas estaciones de metro en zona de tarifa única. 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,zone_id
Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations
```
 
 En [fare_rules.txt](../../reference/#fare_rulestxt), el La tarifa PRESTO está asociada tanto con líneas como con estaciones de metro mediante las siguientes relaciones: 
 
 - Para `fare_id=presto_fare`, los pasajeros pueden viajar entre dos estaciones cualesquiera en la Línea 1 (`route_id=line1`) y `origin_id=ttc_subway_stations` y `destination_id=ttc_subway_stations`. 
 
 [** fare_rules.txt**](../../reference/#fare_rulestxt) 
 
```
fare_id,route_id,origin_id,destination_id
presto_fare,line1,ttc_subway_stations,ttc_subway_stations
presto_fare,line2,ttc_subway_stations,ttc_subway_stations
```
 
 El tercer archivo, [transfers.txt](../../reference/#transferstxt) define los puntos de transferencia entre diferentes rutas. Para modelar transferencias en la estación Bloor-Yonge, se requieren dos entradas: 
 
 [** transfers.txt**](../../reference/#transferstxt) 
 
```
from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
Bloor,Yonge,line1,line2,0
Yonge,Bloor,line2,line1,0
```
 
 - Los primeros modelos se transfieren de la Línea 1 a la Línea 2 usando `from_route_id` y `to_route_id` de la estación Bloor a la estación Yonge
 - El segundo modelo se transfiere de la Línea 2 a la Línea 1 usando `from_route_id` y `to_route_id` de la estación Yonge a la estación Bloor
 - El valor de `transfer_type` es `0` ya que no existen requisitos ni consideraciones específicas para los traslados 
 
 <sup>[Fuente de ejemplo](https://www.ttc.ca/Fares-and-passes)</sup> 
