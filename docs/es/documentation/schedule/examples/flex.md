# Servicios que responden a la demanda 

 GTFS Flex es un proyecto de extensión GTFS que se adoptó oficialmente en la especificación GTFS en marzo de 2024 y tiene como objetivo facilitar la capacidad de descubrimiento de los servicios de transporte sobre demanda (DRT). 
 Tenga en cuenta que existen diferentes términos para los servicios que responden a la demanda según la región del mundo. Consulte el [Glosario](#glosario) para obtener más información. 
 
 El siguiente ejemplo demuestra cómo modelar diferentes casos de uso de servicios que responden a la demanda utilizando Flex. **Tenga en cuenta que los siguientes ejemplos no son necesariamente una representación precisa o completa de los servicios de las agencias.** 
 
## Servicios sobre pedido dentro de una sola zona 
 
 Los servicios que responden a la demanda pueden operar dentro de una zona específica, lo que permite a los pasajeros reservar recogidas en cualquier punto A dentro de la zona y entregas en cualquier punto B dentro de la misma zona. Un ejemplo de esto es el servicio [Heartland Express Transit](https://www.co.brown.mn.us/heartland-express-transit?view=category&amp;id=56) en Minnesota, EE. UU. 
 
 <sup>[Descargar conjunto de datos de ejemplo de Heartland Express](../../../assets/on-demand_services_within_a_single_zone.zip)</sup> 
 
### Definir viajes 
 
 El horario de servicio de Heartland Express es el siguiente: 
 
 - Días laborables: 
    - 8:00 a.m. - 5:00 p.m. 
    - 6:15 a.m. – 5:45 p.m. (solo zona Nueva Ulm) 
 - Domingo: 8:00 a.m. - mediodía (Nueva Sólo zona de Ulm) 
 
 La zona de la ciudad de New Ulm está incluida dentro de la zona del condado de Brown. Para evitar el problema de ["restricción de superposición de zona"](#restriccion-de-superposicion-de-zona), Heartland Express se puede definir con cuatro viajes: 
 
 - Servicio en la zona de New Ulm de 6:15 a.m.a 8:00 a.m.entre semana. 
 - Servicio en todo el condado de 8:00 a.m.a 5:00 p.m.de lunes a viernes. 
 - Servicio en la zona de New Ulm de 17:00 a 17:45 de lunes a viernes. 
 - Servicio en la zona de New Ulm de 8:00 a 12:00 los domingos. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
 route_id | service_id | trip_id
--|--|-- 
 74362 | c_67295_b_77497_d_31 | t_5374945_b_77497_tn_0 
 74362 | c_67295_b_77497_d_31 | t_5374946_b_77497_tn_0 
 74362 | c_67295_b_77497_d_31 | t_5374944_b_77497_tn_0 
 74362 | c_67295_b_77497_d_64 | t_5374947_b_77497_tn_0 
 
 `service_id = c_67295_b_77497_d_31` se refiere a los días laborables, `service_id = c_67295_b_77497_d_64` se refiere al domingo. 
 
### Definir zona (ubicaciones GeoJSON) 
 
 Usando [locations.geojson](../../reference/#locationsgeojson) para definir la zona operativa del servicio Heartland Express, se deben definir zonas separadas para el condado de Brown y la ciudad de New Ulm. A continuación se muestra un GeoJSON simplificado que define la zona del condado de Brown: 

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "id": "area_708",
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        # Simplificado, solo presenta 3 coordenadas aqui.
        "coordinates": [
          [
            [
              -94.7805702,
              44.4560958
            ],
            [
              -94.7805608,
              44.4559928
            ],
            [
              -94.7805218,
              44.4559649
            ]
          ]
        ]
      },
      "properties": {}
    }
  ]
```

 
### Definir reglas de reserva 
 
 Aquí están las reservas reglas que se aplican a todos los servicios de Heartland Express: 
 
 - Las solicitudes de viaje deben realizarse entre las 8 a.m.y las 3 p.m.de lunes a viernes. 
 - Los viajes deben solicitarse un día hábil antes del día del viaje. 
 - Las solicitudes de viaje se pueden realizar hasta con 14 días de anticipación. 
 
 El uso de `booking_type = 2` indica que el servicio requiere reserva hasta el día(s) anterior(es). `prior_notice_last_day = 1` y `prior_notice_start_day = 14` indican que el servicio se puede reservar con 14 días de antelación y hasta el día anterior. 
 
 [** booking_rules.txt**](../../reference/#booking_rulestxt) 
 
 booking_rule_id | booking_type | prior_notice_start_day | prior_notice_start_time | prior_notice_last_day | prior_notice_last_time | message | phone_number | info_url
--|--|--|--|--|--|--|--|-- 
 booking_route_74362 | 2 | 14 | 8:00:00 | 1 | 15:00:00 | Brown County Heartland Express ofrece transporte a pedido de puerta a puerta. Para solicitar transporte, llame al 1-507-359-2717 o al 1-800-707-2717 antes de las 3 p.m.al menos un día hábil antes de su viaje. | (507) 359-2717 | https://www.co.brown.mn.us/heartland-express-transit
 
### Definir horarios de parada 
 
 Las horas de funcionamiento se definen utilizando los campos `start_pickup_drop_off_window` y `end_pickup_drop_off_window`. Viajar dentro de la misma zona requiere dos registros en stop_times.txt con el mismo `location_id`. 
 
 - El primer registro con `pickup_type = 2` y `drop_off_type = 1` indica que la recogida de reservas está permitida en la zona. 
 - El segundo registro con `pickup_type = 1` y `drop_off_type = 2` indica que se permite la entrega de reservas en la zona. 
 
 [** stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
t_5374944_b_77497_tn_0 | area_715 | 1 | 06:15:00 | 08:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374944_b_77497_tn_0 | area_715 | 2 | 06:15:00 | 08:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 1 | 08:00:00 | 17:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374945_b_77497_tn_0 | area_708 | 2 | 08:00:00 | 17:00:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 1 | 17:00:00 | 17:45:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374946_b_77497_tn_0 | area_715 | 2 | 17:00:00 | 17:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 1 | 08:00:00 | 12:00:00 | 2 | 1 | booking_route_74362 | booking_route_74362
t_5374947_b_77497_tn_0 | area_715 | 2 | 08:00:00 | 12:45:00 | 1 | 2 | booking_route_74362 | booking_route_74362
 
 `area_715` se refiere a la zona de New Ulm City, `area_708` se refiere a la zona del condado de Brown. 
 
## Servicios a pedido en múltiples zonas 
 
 Algunos servicios que responden a la demanda operan en múltiples zonas distintas, donde los pasajeros pueden reservar recogidas en cualquier ubicación A dentro de un área y entregas en cualquier ubicación dentro de otra área. Por ejemplo, [Minnesota River Valley Transit](https://www.saintpetermn.gov/330/Dial-a-Ride) ofrece servicios a pedido entre las ciudades de Saint Peter y Kasota: 
 
 <sup>[Descargar ejemplo de River Valley Transit conjunto de datos](../../../assets/on-demand_services_between_multiple_zones(r).zip)</sup> 
 
### Definir viajes 
 
 Similar al ejemplo anterior, debido a que los horarios de servicio varían en diferentes días, es necesario definir los viajes por separado para los días laborables y los sábados. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
 route_id | service_id | trip_id
--|--|-- 
 74375 | entre semana | t_5298036_b_77503_tn_0 
 74375 | sábados | t_5298041_b_77503_tn_0 
 
 (Defina reglas y zonas de reserva usando [booking_rules.txt](../../reference/#booking_rulestxt) y [locations.geojson](../../reference/#locationsgeojson) en el mismo como en el ejemplo anterior) 
 
### Definir horarios de parada 
 
 Los siguientes datos indican que la recogida solo se permite en una zona y la entrega solo se permite en otra zona. No se permite recoger y dejar en la misma zona. 
 
 [**stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
t_5298036_b_77503_tn_0 | area_713 | 1 | 06:30:00 | 20:00:00 | 2 | 1 | booking_route_74375 | booking_route_74375
t_5298036_b_77503_tn_0 | area_714 | 2 | 06:30:00 | 20:00:00 | 1 | 2 | booking_route_74375 | booking_route_74375
t_5298041_b_77503_tn_0 | area_713 | 1 | 09:00:00 | 19:00:00 | 2 | 1 | booking_route_74375 | booking_route_74375
t_5298041_b_77503_tn_0 | area_714 | 2 | 09:00:00 | 19:00:00 | 1 | 2 | booking_route_74375 | booking_route_74375
 
## Servicios a pedido donde los pasajeros deben ser recogidos y dejados en ubicaciones específicas 
 
 En ciertos servicios que responden a la demanda, los pasajeros no pueden especificar la recogida y devolución en ningún lugar dentro de una zona. En cambio, los pasajeros solo pueden reservar para que los recojan y los dejen en paradas designadas específicas (puntos de recogida/paradas virtuales). Un ejemplo de esto es el [servicio RufBus](https://uvg-online.com/rufbus-angermuende/) en Angermünde y Gartz, Alemania: 
 
### Definir viajes 
 
 Ofertas de la ruta 476 servicios bajo demanda entre cada parada en la región de Angermünde. Operan dos servicios (uno para los días laborables y el otro para los fines de semana), y cada uno tiene un único trip_id asociado. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
route_id | service_id | trip_id 
-- | -- | -- 
476 | on_demand_weekdays | 476_weekdays 
476 | on_demand_weekends | 476_weekends 
 
### Definir grupos de ubicación 
 
 Como los pasajeros pueden reservar servicios entre cada parada, para evitar definir todas las combinaciones de parada a parada en stop_times.txt, el enfoque apropiado es definir estas paradas como una ubicación grupo usando location_groups.txt y location_group_stops.txt. 
 
 [**location_groups.txt**](../../reference/#location_groupstxt) 
 
location_group_id | location_group_name 
-- | -- 
476_stops | durch den RufBus 476 bedientes Gebiet im Raum Angermünde
 
 [**location_group_stops.txt**](../../reference/#location_group_stopstxt) 
 
location_group_id | stop_id 
-- | -- 
476_stops | de:12073:900340004::1
476_stops | de:12073:900340004::2
476_stops | de:12073:900340004::3
476_stops | de:12073:900340004::4
476_stops | de:12073:900340100::1
476_stops | de:12073:900340100::2
476_stops | ...
 
### Definir reglas de reserva 
 
 El servicio de ruta 476 requiere reservar con al menos una hora de antelación. El uso de "booking_type = 1" indica que el servicio requiere reserva hasta el mismo día con aviso previo. El `prior_notice_duration_min = 60` indica un requisito para reservar con al menos 60 minutos de antelación. 
 
 Existen ligeras diferencias entre las reservas de días laborables y de fin de semana, por lo que se pueden definir reglas de reserva independientes para servicios de días laborables y festivos. Se pueden proporcionar más detalles en el campo "`message`". Los enlaces a páginas de información y reservas se pueden proporcionar en los campos `info_url` y `booking_url`. 
 
 [**booking_rules.txt**](../../reference/#booking_rulestxt) 
 
booking_rule_id | booking_type | prior_notice_duration_min | message | phone_number | info_url | booking_url
-- | -- | -- | -- | -- | -- | --
flächenrufbus_angermünde_weekdays | 1 | 60 | Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView
flächenrufbus_angermünde_weekends | 1 | 60 | 1€ Komfortzuschlag pro Person; Anmeldung mind. 60min vorher erforderlich, per Anruf zwischen 08:00 und 24:00 möglich, oder online rund um die Uhr | +49 3332 442 755 | https://uvg-online.com/rufbus-angermuende/ | https://uvg.tdimo.net/bapp/#/astBuchungenView
 
### Definir horarios de parada 
 
La ruta 476 opera de 17:30 a 22:00 de lunes a viernes y de 8:00 A. m.a 22:00 p.m.los fines de semana. Las horas de funcionamiento se definen utilizando los campos `start_pickup_drop_off_window` y `end_pickup_drop_off_window`. Viajar dentro del mismo grupo de ubicación requiere dos registros en stop_times.txt con el mismo `location_group_id`. 
 
- el primer registro con `pickup_type = 2` y `drop_off_type = 1` indica que se permite la recogida de reservas en el grupo de ubicación. 
- El segundo registro con `pickup_type = 1` y `drop_off_type = 2` indica que se permite la entrega de reservas en el grupo de ubicación. 
 
 [** stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | --
476_weekdays | 476_stops | 1 | 17:30:00 | 22:00:00 | 2 | 1 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekdays | 476_stops | 2 | 17:30:00 | 22:00:00 | 1 | 2 | flächenrufbus_angermünde_weekdays | flächenrufbus_angermünde_weekdays
476_weekends | 476_stops | 1 | 08:00:00 | 22:00:00 | 2 | 1 | flächenrufbus-angermünde_weekdays | flächenrufbus_angermünde_weekends
476_weekends | 476_stops | 2 | 08:00:00 | 22:00:00 | 1 | 2 | flächenrufbus-angermünde_weekdays | flächenrufbus-angermünde_weekends
 
## Ruta desviada 
 
 "Desviación de ruta" se refiere a servicios en los que el vehículo sigue una ruta fija con una secuencia establecida de paradas pero tiene la flexibilidad de desviarse de esta ruta para recoger o dejar pasajeros entre paradas. Por lo general, las desviaciones se limitan para mantener la puntualidad del servicio y se requiere reserva previa para recogidas y devoluciones desviadas. 
 
 En este ejemplo, el servicio [Hermann Express](https://www.newulmmn.gov/553/Hermann-Express-City-Bus-Service) en New Ulm City permite que los usuarios sean recogidos solo en puntos fijos.paradas y ser dejado en cualquier punto dentro de un área de desviación específica entre estas paradas. 
 
 **El siguiente ejemplo se ha simplificado; descargue el [conjunto de datos de ejemplo de Hermann Express](../../../assets/deviated _drop-off _route.zip) para obtener más detalles.** 
 
### Definir viajes 
 
 Dado que este tipo de servicio todavía implica una serie de paradas fijas y un horario fijo, definir viajes es similar a los servicios normales de autobús de ruta fija. Requiere definir los viajes realizados por cada ruta a lo largo de todos los períodos de servicio relevantes. 
 
 [**trips.txt**](../../reference/#tripstxt) 
 
 route_id | service_id | trip_id | share_id
--|--|--|-- 
 74513 | c_67295_b_77497_d_31 | t_5374704_b_77497_tn_0 | p_1426044 
 74513 | c_67295_b_77497_d_31 | t_5374699_b_77497_tn_0 | p_1426044 
 74513 | c_67295_b_77497_d_31 | t_5374698_b_77497_tn_0 | p_1426044 
 74513 | c_67295_b_77497_d_31 | t_5374697_b_77497_tn_0 | p_1426044
...|...|...|...
 
### Definir zonas (GeoJSON location)
 
 Usar [locations.geojson](../../reference/#locationsgeojson) para definir zonas para ruta desviada. Normalmente, las desviaciones se limitan para mantener el servicio según lo previsto. Por lo tanto, a medida que el vehículo avanza, el área de desviación entre cada parada fija puede variar en consecuencia. El área de desviación de ruta puede parecerse a la siguiente imagen: 
 
<div class="flex-photos"> 
<img src="../../../../assets/deviated_route_zones.png" alt="zonas de ruta desviadas"> 
</div> 
 
### Definir horarios de parada 
 
 Para paradas fijas, defina campos como `arrival_time`, `departure_time` y `stop_id` de manera similar a las rutas de autobús normales. Entre paradas fijas, definir las zonas donde se permite el desvío. `pickup_type = 1` y `drop_off_type = 3` indican que no se permite la recogida desviada (limitando la recogida a paradas fijas únicamente) y que los pasajeros deben coordinar con el conductor para ser dejados en la zona de desviación. 
 
 [**stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | arrival_time | departure_time | stop_id | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id
-- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | --
t_5374696_b_77497_tn_0 | 08:00:00 | 08:00:00 | 4149546 | | 1 | | | | | 0 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149547 | 2 | 08:00:00 | 8:02:22 | 1 | 3 | | booking_route_74513 | booking_route_74513
t_5374696_b_77497_tn_0 | 08:02:22 | 08:02:22 | 4149547 | | 3 | | | | | 1221.627114 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149548 | 4 | 08:02:22 | 8:03:00 | 1 | 3 | | booking_route_74513 | booking_route_74513
t_5374696_b_77497_tn_0 | 08:03:22 | 08:03:22 | 4149548 | | 5 | | | | | 1548.216356 | | 
t_5374696_b_77497_tn_0 | | | | radius_300_s_4149546_s_4149549 | 6 | 08:03:22 | 8:05:00 | 1 | 3 | | booking_route_74513 | booking_route_74513
... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ... | ...
t_5374696_b_77497_tn_0 | 08:50:00 | 08:50:00 | 4210601 | | 35 | | | | | 23429.19558 | | 
t_5374696_b_77497_tn_0 | 08:56:00 | 08:56:00 | 4149564 | | 36 | | | | | 25320.8471 | | 

 
## Comportamiento de enrutamiento

### Ignorar registros de horarios de parada intermedios con ventanas de recogida/devolución 
 
 Al proporcionar rutas o tiempo de viaje entre el origen y el destino, los consumidores de datos deben ignorar los stop_times.txt.registros txt que tienen `start_pickup_drop_off_window` y `end_pickup_drop_off_window` definidos. Por ejemplo: 
 
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | Zone1 | 1 | 2 | 1 | 08:00:00 | 18:00:00
tripA | Zone2 | 2 | 1 | 2 | 08:00:00 | 14:00:00
tripA | Zone3 | 3 | 1 | 2 | 10:00:00 | 18:00:00
 
 Los consumidores no deben tener en cuenta la Zona2 al proporcionar rutas o tiempo de viaje para un viaje de la Zona1 a la Zona3. 
 
### Restricción de superposición de zona 
 
 Superposición simultánea de locations.geojson geometría `id`, hora de `start/end_pickup_drop_off_window` y `pickup_type` o `drop_off_type` entre dos o más registros stop_times.txt con el El mismo `trip_id` está prohibido. 
 
 Por ejemplo: 
 (Donde `northportland` se refiere a una zona dentro de `portland`) 
 
 **Prohibido** 
 
 [** stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00
 
 **Permitido** 
 
 [**stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 2 | 1 | 12:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00
 
 o 
 
 [**stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | northportland | 2 | 1 | 2 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00
 
 o 
 
 [**stop_times.txt**](../../reference/#stop_timestxt) 
 
trip_id | location_id | stop_sequence | pickup_type | drop_off_type | start_pickup_drop_off_window | end_pickup_drop_off_window
-- | -- | -- | -- | -- | -- | --
tripA | portland | 1 | 2 | 1 | 08:00:00 | 12:00:00
tripA | gresham | 2 | 2 | 1 | 10:00:00 | 14:00:00
tripA | vancouver | 3 | 1 | 2 | 10:00:00 | 14:00:00
 
## Glosario 
 
 📲 Dial-a-ride es una variación de varios términos utilizados en toda Europa. 
 
 🇨🇭 En Suiza se incluiría bajo el término Rufbus/Autobús de guardia. También está disponible el [sistema PubliCar de PostAuto](https://www.postauto.ch/en/timetable-and-network/publicar). Según esta propuesta, la aplicación y el servicio PubliCar se podrían descubrir en la aplicación de planificación de viajes preferida del usuario. 
 
 🇦🇹 En Austria, dial-a-ride también sería Rufbus y bajo el paraguas más amplio de Bedarfsverkehr (Transporte sensible a la demanda) y Mikro-ÖV (Microtransit). 
 
 - [bedarfsverkehr.at](https://www.bedarfsverkehr.at/) 
 - [Wiener Linien](https://www.wienerlinien.at/documents/843721/4770179/Anleitung_Rufbus_359531.pdf/df430b95-9dd4-0d13-ffdf-bdace15932a8?t=1614165175643) 
 - Rufbus (inglés: dial-a-bus, anteriormente Anruf-Sammel-Taxi o ASTAX call-collect-taxi) 
 - Implementación actual de GTFS [como alerta de servicio de un año de duración](https://www.google.com/maps/dir/S%C3%BC%C3%9Fenbrunner+Pl.,+1220+Wien,+Austria/2201+Gerasdorf,+Austria/@ 48.2867283,16.4429959,13z/am=t/data=!4m15!4m14!1m5!1m1!1s0x476d0393b15bc6d9:0x517f69839511fb31!2m2!1d16.4958186!2d48.2772635!1 m5!1m1!1s0x476d0488292e6f61:0xeee80d3d2bb6b1f5!2m2!1d16.4690073!2d48 .2962096!3e3!5i1?entry=ttu ) 
 
 🇩🇰 En Dinamarca, se puede hacer referencia a NT / midttrafik / sydtrafik / FYNBUS / movia (https://flextur.dk/) 
 
 - flextur (inglés: flex trip) 
 - anteriormente flextrafik (inglés: flex transit) 
 
 🇫🇷 ⚠️ En Francia los términos TDA (Transport à la Demande) y PMR (Personnes à Mobilité Réduite) para servicios de Paratransit- [Reseau Mistral](https://www.reseaumistral.com/services/service-appel-bus) 
 - Appel bus (inglés: call bus) 
 
 🇩🇪 En Alemania se refieren a él como On- Demand-Angebot, Flexible Fahrt y AST- [BVG](https://www.bvg.de/de/verbindungen/bvg-muva/flexible-fahrt) 
 - Marca: Muva- On- Demand-Angebot (inglés: servicio a pedido) 
 - Flexible Fahrt (inglés: viaje flexible) 
 - Otras áreas- Anruf-sammel-taxi o AST (inglés: llamada-cobro-cobro-taxi) 
 
 🇬🇧 En el Reino Unido existe el siguiente servicio: 
 - [go2 Sevenoaks](https://www.go-coach.co.uk/go2/) 
 - Servicio bajo demanda (On-demand service)
 
 La terminología varía según las fronteras, pero en general podemos asumir que dial-a-ride es cualquier servicio que responde a la demanda y que requiere algún tipo de contacto entre el pasajero y el operador. 
<hr> 
