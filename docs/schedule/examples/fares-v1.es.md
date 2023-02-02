---
search:
  exclude: true
---

# Fares V1

<hr/>

Compuesto por [fare_attributes.txt](../../reference/#fare_attributestxt) y [fare_rules.txt](../../reference/#fare_rulestxt), Fares V1 ha sido históricamente el método oficial para describir la información de las tarifas en GTFS. Sin embargo, los dos archivos están limitados en cuanto a la amplitud de los factores que pueden describir eficazmente, y son ambiguos de implementar. [Fares V2](../../examples/fares-v2/) es un proyecto de extensión que se está desarrollando de forma activa y que pretende solucionar las limitaciones de Fares V1.

## Definir las reglas tarifarias de una agencia

Un trip en la red de metro de Toronto Transit Commission cuesta 3,20 dólares canadienses si los usuarios pagan con la tarjeta PRESTO. Los usuarios también pueden hacer transbordo a otras rutas de metro, tranvía o autobús operadas por la TTC en un plazo de dos horas.

Este servicio puede representarse mediante los archivos [fare_attributes.txt](../../reference/#fare_attributestxt), [fare_rules.txt](../../reference/#fare_rulestxt) y [transfers.txt](../../reference/#transferstxt). El primer archivo, [fare_attributes.txt](../../reference/#fare_attributestxt).txt describe las tarifas de la agencia, a continuación se muestra un ejemplo para la tarifa presto:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- El precio del billete se indica en precio y `currency_type`
- Los usuarios tienen que pagar su tarifa en las puertas de la estación antes de subir al metro. Esto se representa con `payment_method=1`
- El campo transferencias se deja en blanco para representar las transferencias ilimitadas
- El campo `transfer_duration` corresponde a la ventana de transferencia de 2 horas (en segundos)

El segundo archivo, [fare_rules.txt](../../reference/#fare_rulestxt) asigna las tarifas a los trayectos mediante la vinculación de una tarifa a una ruta así como a un origen/destino en esa ruta.

Para ello, se definen dos líneas de metro en [routes.txt](../../reference/#routestxt):

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

En este ejemplo, se modelan los transbordos en la estación Bloor-Yonge. Para ello, esta estación se modela como dos paradas separadas, la primera es la estación Bloor, a la que da servicio la línea 1, y la segunda es la estación Yonge, a la que da servicio la línea 2. Ambas tienen `zone_id=ttc_subway_stations` para agrupar todas las estaciones de metro en una única zona tarifaria.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

En [fare_rules.txt](../../reference/#fare_rulestxt), la tarifa PRESTO se asocia tanto a las líneas de metro como a las estaciones mediante las siguientes relaciones:

- Para `fare_id=presto_fare`, los usuarios pueden viajar entre dos estaciones cualesquiera de la línea 1 (`route_id=line1`) y `origin_id=ttc_subway_stations` y `destination_id=ttc_subway_stations`.

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

El tercer archivo, [transfers.txt](../../reference/#transferstxt) define los puntos de transbordo entre las diferentes rutas. Para modelar los transbordos en la estación Bloor-Yonge, son obligatorias dos entradas:

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- El primero modela las transferencias de la Línea 1 a la Línea 2 utilizando `from_route_id` y `to_route_id` desde la estación Bloor a la estación Yonge
- El segundo modela las transferencias de la Línea 2 a la Línea 1 utilizando `from_route_id` y `to_route_id` de la estación Yonge a la estación Bloor
- El valor de `transfer_type` es `0` ya que no hay requisitos o consideraciones específicas para los transbordos

[Ejemplo de fuente](https://www.ttc.ca/Fares-and-passes)
