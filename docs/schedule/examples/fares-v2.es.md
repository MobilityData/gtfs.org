---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v2.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>


# Fares V2

<hr/>

FaresFares V2 es un proyecto de extensión de GTFS que pretende solucionar las limitaciones de Fares V1. Este proyecto de extensión se está adoptando en iteraciones, y los ejemplos que aparecen a continuación muestran lo que se puede modelar utilizando la parte de Fares Fares V2 que se ha adoptado en la especificación oficial. Consulte más información sobre el proyecto de extensión de Fares Fares V2 en la sección de [Extensiones](../../../extensions).

Entretanto, los productores pueden aplicar Fares V2 junto con Fares V1 en el mismo conjunto de datos, ya que no existe ningún conflicto técnico entre ambas. Los consumidores podrán elegir qué implementación consumir independientemente de la otra. Con la adopción y el respaldo suficiente de Fares Fares V2, Fares V1 puede quedar obsoleta en el futuro.

## Definir una tarifa de tránsito

Hay varias formas de pagar los billetes para utilizar el sistema de transporte de la TTC en Toronto. La TTC ofrece dos opciones de precios de las tarifas en función del método de pago. El precio de un billete de adulto es de 3,20 CAD si se utiliza una tarjeta PRESTO, mientras que la misma tarifa es de 3 ,25 CAD si se paga en efectivo.

Los billetes de transporte o las tarifas pueden describirse mediante el archivo [fare_products.txt](../../reference/#fare_productstxt). Cada entrada corresponde a una tarifa específica.

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[Ejemplo de fuente](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Describir los lugares de servicio en la misma zona tarifaria

Algunas agencias de transporte utilizan una estructura tarifaria basada en zonas. Las zonas tarifarias son áreas geográficas divididas asociadas a diferentes precios de tarifas. Tanto si viajan dentro de una misma zona como si lo hacen de una zona a otra, los usuarios deberán conocer la tarifa correcta. En el sistema TTC de Toronto, sólo hay una zona tarifaria. Los usuarios del transporte público simplemente tienen que pagar la misma tarifa de billete único para cualquier distancia de trip dentro de los límites de la ciudad de Toronto, independientemente de la forma de transporte que utilicen.

Las zonas tarifarias pueden describirse mediante el archivo [stops_areas](../../reference/#stops_areastxt).txt, que asigna las paradas de [stops.txt](../../reference/#stopstxt) a [areas.txt](../../reference/#areastxt).

En primer lugar, identifique la zona (zona tarifaria).

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

Después, utilizando `stop_id` del archivo [stops.txt](../../reference/#stopstxt).txt, agrupa las paradas a su respectiva área identificada (zona tarifaria).

[**stops_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[Ejemplo de fuente](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## Crear reglas para los trayectos de ida

En GTFS, un tramo de tarifa corresponde a un trip que un usuario realiza sin transbordar entre diferentes modos, rutas, redes o agencias.Una tarifa única permite a los usuarios viajar dentro de cualquier par de paradas de autobús, estaciones de metro y paradas de tranvía dentro de la red de TTC.

Los grupos de tramos definen los viajes dentro de una red desde un origen a un destino (o un conjunto de orígenes a un conjunto de destinos si los ID de área corresponden a paradas agrupadas). En el siguiente archivo se describen dos reglas para viajar a cualquier lugar dentro de la red del TTC. La primera regla corresponde a viajar con una tarifa PRESTO y la segunda corresponde a viajar con una tarifa en efectivo.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[Ejemplo de fuente](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Crear reglas para los transbordos

Los usuarios que utilizan su tarjeta PRESTO para viajar en el TTC disponen de una ventana de transbordo sin restricciones de 2 horas. Esto significa que pueden hacer un número ilimitado de transbordos entre los autobuses, el metro y los tranvías de la agencia dentro del plazo de 2 horas.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

El archivo anterior representa esto en GTFS con los siguientes campos:

- Es posible realizar una transferencia desde y hacia tramos pagados con una tarjeta PRESTO`(ttc_trip_presto`)
- El `transfer_count` se establece en `-1` ya que no hay límite en el número de transferencias permitidas
- El `duration_limit` se establece en `7200` segundos, lo que equivale a 2 horas
- El `duration_limit_type` se establece en `3`, ya que los usuarios tienen que tocar su tarjeta PRESTO en cuanto entran en la zona de pago o en cuanto suben a un autobús o tranvía. Esto corresponde a la validación de la tarifa de arrival del tramo actual y a la validación de la tarifa de arrival del tramo siguiente.
- El `fare_transfer_type` se establece en `0`, ya que los usuarios sólo pagan la primera tarifa. No hay ninguna tarifa de transferencia o una segunda tarifa para el traslado dentro de la ventana de 2 horas. Por lo tanto, el coste se puede modelar como la suma de la primera tarifa y las sumas de las tasas de transferencia.
- La tarifa de transbordo se fija en cero, ya que son gratuitas dentro del sistema TTC. Esto se indica con `fare_product_id=free_transfer`.

[Ejemplo de fuente](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
