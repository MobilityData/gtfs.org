# Fares V2

<hr/>

Fares V2 es un proyecto de extensión GTFS que pretende abordar las limitaciones de Fares V1. Este proyecto de ampliación se está adoptando por iteraciones. Los siguientes ejemplos muestran cómo modelar los conceptos básicos, incluidos los productos tarifarios y cómo los usuarios pueden utilizar su tarifa para realizar transbordos. Más información sobre el proyecto de ampliación de Tarifas [Fares V2 aquí](/extensions/fares-v2/).

Entretanto, los productores pueden aplicar Fares V2 junto con Fares V1 en el mismo conjunto de datos, ya que no existe ningún conflicto técnico entre ambas. Los consumidores podrán elegir qué implementación consumir independientemente de la otra. Con la adopción y el respaldo suficiente de Fares V2, Fares V1 puede quedar obsoleta en el futuro.

## Definir una tarifa de tránsito

Existen varias formas de pagar las tarifas para utilizar el sistema de la Administración de Tránsito de Maryland. <a href="https://www.mta.maryland.gov/regular-fares" target="_blank">Hay cuatro tipos de tarifas regulares de precio lleno:</a>

- Billete de ida que cuesta 2,00 USD
- Pase de un día que cuesta 4,60 USD
- Pase semanal que cuesta 22 USD
- Pase mensual que cuesta 77 USD

Los billetes o tarifas de transporte se denominan productos tarifarios en GTFS. Pueden describirse utilizando el archivo [fare_products.txt](../../reference/#fare_productstxt). Cada entrada corresponde a una tarifa específica.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id        | fare_product_name            | amount | currency |
| ---------------------- | ---------------------------------- |--------|----------|
| core_local_oneway_fare | One Way Full Fare                | 2.00   | USD      |
| core_local_1_day_fare  | 1-Day Pass - Core Service   | 4.60   | USD      |
| core_local_31_day_fare | 31-Day Pass - Core Service | 77.00  | USD      |
| core_local_7_day_fare  | 7-Day Pass - Core Service  | 22.00  | USD      |

<sup>[Descargar el feed GTFS GTFS autobuses locales de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Crear reglas para los trayectos de ida

En GTFS, un tramo tarifario corresponde a un viaje que un viajero realiza sin transbordar entre diferentes modos, rutas, redes o agencias. En la alimentación de la Administración de Tránsito de Maryland, una sola tarifa permite a los usuarios viajar dentro de cualquier par de paradas y estaciones de metro dentro de la red `principal` de autobuses BaltimoreLink, Light RailLink y Metro SubwayLink rutas.

Los grupos de tramos definen viajes dentro de una red desde un origen a un destino (o un conjunto de orígenes a un conjunto de destinos si los ID de área corresponden a paradas agrupadas). El siguiente archivo describe reglas para viajar a cualquier lugar dentro de la red principal de la Administración de Tránsito de Maryland. Cada regla corresponde a uno de los productos de tarifas regulares del [ejemplo Definir una tarifa de tránsito](#definir-una-tarifa-de-transito).

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id            | network_id | fare_product_id        |
| ----------------------- |------------| ---------------------- |
| core_local_one_way_trip | core       | core_local_oneway_fare |
| core_local_one_way_trip | core      | core_local_1_day_fare  |
| core_local_one_way_trip | core      | core_local_31_day_fare |
| core_local_one_way_trip | core      | core_local_7_day_fare  |

<sup>[Descargar el feed GTFS GTFS autobuses locales de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Crear reglas para los transbordos

Hay un transbordo de 90 minutos para los usuarios que compran un billete de ida para viajar en los autobuses locales BaltimoreLink, Metro SubwayLink o Light RailLink. Esto significa que pueden hacer transbordo un número ilimitado de veces entre los autobuses locales, el metro y el tren ligero dentro del plazo de 90 minutos.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id         | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
| ----------------------- | ----------------------- | -------------- | ------------------- | -------------------- | -------------- |
| core_local_one_way_trip | core_local_one_way_trip | 5400           | 1                   | 0                    | -1             |

El archivo anterior representa esto en GTFS con los siguientes campos:

- Es posible realizar una transferencia hacia y desde tramos que son un viaje de ida (`core_local_one_way_trip`)
- El `transfer_count` se establece en `-1` ya que no hay límite en el número de transferencias permitidas
- El `duration_limit` se establece en `5400` segundos, lo que equivale a 90 minutos
- El `duration_limit_type` se establece en `1`, ya que el tiempo de transferencia comienza cuando el usuario sale en cualquier ruta del tramo de tarifa `core_local_one_way_trip` y finaliza cuando sale en un tramo de tarifa diferente.
- La `fare_transfer_type` se establece en `0`, ya que los usuarios sólo pagan la primera tarifa. No hay ningún coste de transbordo ni una segunda tarifa por transbordar dentro del intervalo de 90 minutos. Por lo tanto, el coste puede modelarse como la suma de la primera tarifa y las sumas de las tasas de transbordo.
- El `transfer_count` se fija en `-1`, ya que el usuario puede hacer transbordos un número ilimitado de veces dentro de los 90 minutos de `duration_limit`.

Después de definir la tarifa, crear la `fare_leg_rule` adecuada y definir la `fare_transfer_rule`, puede ver que la `core_local_oneway_fare` de 2,00 USD aparece en los planificadores de viajes. A continuación se muestra un ejemplo de Transit:

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</div>

<sup>[Descargar el feed GTFS GTFS autobuses locales de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## Describir los lugares de servicio en la misma zona tarifaria

Algunas agencias de transporte utilizan una estructura tarifaria basada en zonas. Las zonas tarifarias son áreas geográficas divididas asociadas a diferentes precios. En el sistema BART del Área de la Bahía, las tarifas varían en función del origen y el destino [(diferencias tarifarias BART)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf), por lo que los usuarios deben conocer la tarifa correcta. Las áreas tarifarias pueden describirse utilizando el archivo [stops_areas.txt](../../reference/#stops_areastxt), que asigna las paradas de [stops.txt](../../reference/#stopstxt) a [areas.txt](../../reference/#areastxt).

En primer lugar, identifique el área en [areas.txt](../../reference/#areastxt).txt . Es aceptable dejar `area_name` en blanco si no hay nombre de área. En la tabla siguiente, hay tres `area_id`: `ASHB`, `GLEN` y `OAKL`.

[**areas.txt**](../../reference/#areastxt)

| area_id | area_name |
| ------- |-----------|
| ASHB    |           |
| GLEN    |           |
| OAKL    |           |

Después, utilizando `stop_id` del archivo [stops.txt](../../reference/#stopstxt).txt, agrupa las paradas a su respectiva área identificada (zona tarifaria).

A continuación, agrupa `stop_id` a cada `area_id`. En el ejemplo de BART, cada área contiene sólo 1 `stop_id`. Por ejemplo, sólo la parada `ASHB` (Ashby Station) está incluida en el área `ASHB`. Sin embargo, si un área incluye varias paradas, deberían enumerarse varios `stop_id`.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
| ------- | ------- |
| ASHB    | ASHB    |
| GLEN    | GLEN    |
| OAKL    | OAKL    |

En `fare_leg_rules.txt`, se pueden identificar diferentes productos tarifarios basados en diferentes áreas de salida y llegada. Por ejemplo, la primera entrada muestra

- La zona de salida es `ASHB`
- La zona de llegada es `GLEN`
- El producto tarifario para la zona de salida/llegada es `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id | to_area_id | fare_product_id     |
| ------------ | ------------ | ---------- |---------------------|
| BA           | ASHB         | GLEN       | BA:matrix:ASHB-GLEN |
| BA           | ASKB         | OAKL       | BA:matrix:ASHB-OAKL |

La tarifa se identifica en `fare_products.txt`.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name | amount | currency |
| ------------------- | ---------------------- | -- | ------ |
| BA:matrix:ASHB-GLEN | generated               | 4.75 | USD    |
| BA:matrix:ASHB-OAKL | generated              | 9.45 | USD    |

<sup><a href="https://511.org/open-data/transit" target="_blank">Consulte la alimentación regional del Área de la Bahía de San Francisco</a></sup>

<hr/>

## Describa los medios de pago aceptados

Los usuarios de Muni de San Francisco pueden utilizar varios tipos diferentes de medios de pago para abonar su viaje y validar su billete:

- Utilice una <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">tarjeta Clipper</a>, la tarjeta de transporte público del Área de la Bahía.
- Utilice la <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">aplicación Munimobile</a>
- Pague el billete en efectivo

Estos métodos de validación se denominan `fare_media` en GTFS-Fares V2 y pueden describirse mediante `fare_media.txt`.

A continuación se muestra un fragmento de ejemplo del <a href="https://511.org/open-data/transit" target="_blank">feed regional del Área de la Bahía de San Francisco</a> al que se puede acceder con la API 511 SF Bay.

`Clipper` se describe como una tarjeta de transporte física con `fare_media_type=2`. `SFMTA Munimobile` se describe como una aplicación móvil con `fare_media_type=2`. `Cash` no tiene medios de pago, ya que se entrega directamente al conductor sin billete. En consecuencia, `Cash` tiene `fare_media_type=0`.

Los productores que deseen describir un billete físico como un tipo de soporte de tarifa pueden utilizar la opción experimental `fare_media_type=1` que se encuentra en la [propuesta lleno Fares V2](https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd).

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name  | fare_media_type |
| ------------- |------------------| ------------------ |
| clipper       | Clipper          | 2                  |
| munimobile     | SFMTA MuniMobile | 4                  |
| cash    | Cash               | 0                  |

<sup><a href="https://511.org/open-data/transit" target="_blank">Consulte la alimentación regional del Área de la Bahía de San Francisco</a></sup>

## Definir las diferencias de precios en función de los medios tarifarios

El precio de la tarifa de Muni varía en función del medio de pago que utilice el usuario. Este ejemplo muestra cómo cambia el precio de la tarifa local de adulto cuando se utiliza efectivo o la tarjeta Clipper. Una tarifa local de adulto pagada en efectivo cuesta 3 USD y la misma tarifa pagada con la tarjeta Clipper cuesta 2,50, 50 céntimos menos.

Cada una de las entradas siguientes describe un medio tarifario.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
| ------------- |-----------------| ------------------ |
| clipper       | Clipper         | 2                  |
| cash   | Cash               | 0                  |

El siguiente fragmento del archivo `fare_products.txt` muestra cómo varía el importe de la `Muni single local fare` en función del medio de pago que utilice el usuario.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id   | fare_product_name  | amount | currency | fare_media_id |
| ----------------- | ----------------------- |--------|--| ------------- |
| SF:local:single | Muni single local fare | 3      | USD | cash   |
| SF:local:single | Muni single local fare | 2.5    | USD | clipper       |

En Apple Maps, los usuarios pueden ver cómo cambia el precio de su tarifa. Puede comparar los precios de las tarifas en la instrucción "Board the Muni J Church train":

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">Consulte la alimentación regional del Área de la Bahía de San Francisco</a></sup>

## Describir un título de transporte sin contacto

<a href="https://vimeo.com/539436401" target="_blank">El Clean Air Express del norte del condado de Santa Bárbara acepta el pago sin contacto</a> con tarjeta de crédito, Google Pay y Apple Pay.

En el feed Clean Air Express, existe un medio de pago `tap_to_ride` con `fare_media_type=3`, ya que se trata de una opción cEMV (Europay, Mastercard y Visa sin contacto).

| fare_media_id | fare_media_name   | fare_media_type |
| ------------- | ----------------- | ------------------ |
| tap_to_ride   | Tap to Ride | 3                  |

El producto de tarifa de viaje sencillo que se muestra a continuación tiene opciones de medios de pago `cash` y `tap-to-ride`. Cuando el viaje sencillo se paga con el medio de pago `tap-to-ride`, es un dólar USD más barato.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | fare_media_id | amount | currency |
| --------------- | ---------------------- | ------------- |--------|----------|
| single-ride  | Single Ride        | tap_to_ride   | 6      | USD      |
| single-ride | Single Ride         |               | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Descargar el feed del Clean Air Express</a></sup>
