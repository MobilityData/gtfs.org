# :material-transit-detour: Servicios Flexibles 

 Los servicios flexibles, también llamados servicios de demanda-responsable, son servicios que no siguen el comportamiento común del servicio programado y/o fijo. 
 
## Paradas Continuas 
 
 Paradas Continuas se utiliza cuando se puede recoger y/o dejar a los pasajeros entre paradas programadas. 
 Esto se puede especificar en `routes.txt`, que indica que los pasajeros pueden ser recogidos o dejados en cualquier punto a lo largo de la ruta del vehículo para cada viaje de la ruta, o en `stop_times.txt` para una sección específica de una ruta. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `continuous_pickup`, `continuous_drop_off` | 
 |[routes.txt](../../../documentation/schedule/reference/#routestxt)| `continuous_pickup`, `continuous_drop_off` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra dos formas de representar la parada continua.
    </p>
    
    <p style="font-size:16px">
    El primer ejemplo muestra que se permiten recogidas y devoluciones en cualquier punto a lo largo de la ruta "RA".
     </p>

    <p style="font-size:16px">
    El segundo ejemplo muestra que se permiten recogidas y devoluciones entre la tercera y quinta parada del viaje ` AWE1`, lo que se logra asignando valores `continuous_pickup` y `continuous_drop_off` a `stop_sequence=3` y `stop_sequence=4`.
    </p>

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#routestxt"><b>routes.txt</b></a> <br>
        </p>

        | route_id | route_short_name | route_type | continuous_pickup | continuous_drop_off |
        |----------|------------------|------------|-------------------|---------------------|
        | RA       |               17 |          3 |                 0 |                   0 |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id | arrival_time | departure_time | stop_id | stop_sequence | continuous_pickup | continuous_drop_off |
        |---------|--------------|----------------|---------|---------------|-------------------|---------------------|
        | AWE1    |      6:10:00 |        6:10:00 | TAS001  |             1 |                   |                     |
        | AWE1    |      6:14:00 |        6:14:00 | TAS002  |             2 |                   |                     |
        | AWE1    |      6:20:00 |        6:20:00 | TAS003  |             3 |                 0 |                   0 |
        | AWE1    |      6:23:00 |        6:23:00 | TAS004  |             4 |                 0 |                   0 |
        | AWE1    |      6:25:00 |        6:25:00 | TAS005  |             5 |                   |                     |
 
## Reglas de reserva 
 
 Las reglas de reserva se pueden utilizar para permitir a los usuarios reservar un viaje en un servicio que responda a la demanda. Estas reglas describen los requisitos previos necesarios para realizar reservas exitosas y brindan información de contacto donde los usuarios pueden hacer reservas de viajes. Esta función debe usarse junto con [Rutas predefinidas con desviación](#rutas-predefinidas-con-desviacion), [Servicios de respuesta a la demanda basados ​​en zonas](#servicios-de-respuesta-a-la-demanda-basados-en-zonas) y [Servicios Bajo Demanda con Paradas Fijas](#servicios-bajo-demanda-con-paradas-fijas), si dichos servicios requieren reserva. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[booking_rules.txt](../../../documentation/schedule/reference/#booking_rulestxt)|`booking_rule_id`, `booking_type`, `prior_notice_duration_min`, `prior_notice_duration_max`, `prior_notice_last_day`, `prior_notice_last_time`, `prior_notice_start_day`, `prior_notice_start_time`, `prior_notice_service_id`, `message`, `pickup_message`, `drop_off_message`, `phone_number`, `info_url`, `booking_url` | 
 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra dos conjuntos diferentes de reglas de reserva, el primero para viajes que deben reservarse con al menos un día de anticipación (antes de las 13:00 horas) y no más de 14 días antes, y un segundo para viajes que se pueden reservar.al menos 45 minutos antes del viaje y no más de 5 horas antes.

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#booking_rulestxt"><b>booking_rules.txt</b></a> <br>
        </p>

        | booking_rule_id | booking_type | prior_notice_duration_min | prior_notice_duration_max | prior_notice_last_day | prior_notice_last_time | prior_notice_start_day | prior_notice_start_time | prior_notice_service_id | message                                                                                                                                            | pickup_message | drop_off_message | phone_number   | info_url             | booking_url             |
        |-----------------|--------------|---------------------------|---------------------------|-----------------------|------------------------|------------------------|-------------------------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|----------------|------------------|----------------|----------------------|-------------------------|
        | route_br_1818   |            2 |                           |                           |                     1 |                  13:00 |                     14 |                    9:00 |                         | To request a ride, call 123-111-2233 before 1pm at least one business day ahead of your trip. You can book trips up to 14 business days in advace. |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |
        | route_br_4545   |            1 |                        45 |                       300 |                       |                        |                        |                         |                         | To request a ride, use the official booking system in our website, trips must be booked at least 45 min in advance                                 |                |                  | (123)-111-2233 | flexservice.org/info | flexservice.org/booking |

 
## Rutas predefinidas con desviación 
 
 Las Rutas predefinidas con desviación se pueden utilizar para modelar servicios flexibles en los que los vehículos pueden desviarse brevemente de una ruta específica para recoger a los usuarios que reservaron un viaje dentro de un área específica a lo largo de la ruta.ruta. Esto utiliza una combinación de paradas tradicionales (como un servicio regular programado) y zonas que usan `locations.geojson`. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
 |[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Reglas de reserva](#reglas-de-reserva) si el servicio requiere reserva 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra un viaje con tres paradas fijas que también puede dejar pasajeros en cualquier lugar dentro de áreas específicas definidas entre las paradas fijas.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | arrival_time | departure_time | stop_id | location_id           | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | shape_dist_traveled | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|--------------|----------------|---------|-----------------------|---------------|------------------------------|----------------------------|-------------|---------------|---------------------|------------------------|--------------------------|
        | 4545_001 |     10:00:00 |       10:00:00 | S50122  |                       |             1 |                              |                            |             |               |                   0 |                        |                          |
        | 4545_001 |              |                |         | zone_S50122_to_S50123 |             2 |                     10:00:00 |                   10:06:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:06:00 |       10:06:00 | S50123  |                       |             3 |                              |                            |             |               |                 983 |                        |                          |
        | 4545_001 |              |                |         | zone_S50123_to_S50124 |             4 |                     10:06:00 |                   10:15:00 |           1 |             3 |                     | br_1234                | br_1234                  |
        | 4545_001 |     10:15:00 |       10:15:00 | S50124  |                       |             5 |                              |                            |             |               |                2109 |                        |                          |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "zone_S50122_to_S50123",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplificado, aquí solo presenta 3 coordenadas.
                "coordinates": [
                  [
                    [
                      -73.575952,
                      45.514974
                    ],
                    [
                      -73.577314,
                      45.513433
                    ],
                    [
                      -73.569794,
                      45.5098370
                    ]
                  ]
                ]
              },
              "properties": {}
            },
        {
              "id": "zone_S50123_to_S50124",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplificado, aquí solo presenta 3 coordenadas.
                "coordinates": [
                  [
                    [
                      -73.561332,
                      45.5085599
                    ],
                    [
                     -73.5701298,
                      45.5124057
                    ],
                    [
                      -73.571302,
                      45.5105563
                    ]
                  ]
                ]
              },
              "properties": {}
            }
           ]
        } 
        ~~~
 
## Servicios de respuesta a la demanda basados ​​en zonas 
 
 Servicios de respuesta a la demanda basados ​​en zonas se utiliza para modelar servicios que permiten recoger y/o dejar en cualquier ubicación dentro de un área específica para los usuarios que reservan un viaje. Estas áreas se definen usando `locations.geojson`, por lo que no requiere el uso de `stops.txt`, ni `stop_times.arrival_time` y `stop_times.departure_time`. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------|
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)|`location_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`|
 |[locations.geojson](../../../documentation/schedule/reference/#locationsgeojson)|`Type`, `Features`, `Features:Type`, `Features:Id`, `Features:Properties`, `Features:Properties:Stop_name`, `Features:Properties:Stop_description`, `Features:Geometry`, `Features:Geometry:Type`, `Features:Geometry:Coordinates` |
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Reglas de reserva](#reglas-de-reserva) si el servicio requiere reserva 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra un servicio que puede recoger y dejar pasajeros con reserva previa en cualquier lugar entre un área específica entre las 9 a.m.y las 6 p.m.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2708_001 | area_001    |             1 |                      9:00:00 |                   18:00:00 |           2 |             1 | br_3289                | br_3289                  |
        | 2708_001 | area_001    |             2 |                      9:00:00 |                   18:00:00 |           1 |             2 | br_3289                | br_3289                  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#locationsgeojson"><b>locations.geojson</b></a> <br>
        </p>

        ~~~
        {
          "type": "FeatureCollection",
          "features": [
            {
              "id": "area_001",
              "type": "Feature",
              "geometry": {
                "type": "Polygon",
                # Simplificado, aquí solo presenta 3 coordenadas.
                "coordinates": [
                  [
                    [
                      -73.644437,
                      45.5023960
                    ],
                    [
                      -73.641593,
                      45.5054392
                    ],
                    [
                      -73.636580,
                      45.5081683
                    ]
                  ]
                ]
              },
              "properties": {}
            }
          ]
        }
        ~~~
 
## Servicios Bajo Demanda con Paradas Fijas 
 Los Servicios Bajo Demanda con Paradas Fijas se utilizan para modelar servicios que permiten recoger y/o dejar en cualquier ubicación dentro de un grupo de paradas predefinidas para los usuarios que reservan un viaje. Estos grupos de paradas se definen utilizando `location_groups.txt y `location_group_stops.txt. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[stop_times.txt](../../../documentation/schedule/reference/#stop_timestxt)| `location_group_id`, `start_pickup_drop_off_window`, `end_pickup_drop_off_window`, `pickup_booking_rule_id`, `drop_off_booking_rule_id`| 
 |[location_groups.txt](../../../documentation/schedule/reference/#location_groupstxt)| `location_group_id`, `location_group_name`| 
 |[location_group_stops.txt](../../../documentation/schedule/reference/#location_group_stopstxt)| `location_group_id`, `stop_id` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Reglas de reserva](#reglas-de-reserva) si el servicio requiere reserva 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra un servicio que puede recoger y dejar pasajeros con reserva previa en 4 paradas diferentes entre las 7 a.m.y las 10 a.m.

    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_groupstxt"><b>location_groups.txt</b></a> <br>
        </p>

        | location_group_id | location_group_name           |
        |-------------------|-------------------------------|
        | r27_stops         | Yellow Borough Route 27 stops |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#location_group_stopstxt"><b>location_group_stops.txt</b></a> <br>
        </p>

        | location_group_id | stop_id |
        |-------------------|---------|
        | r27_stops         | syb029  |
        | r27_stops         | syb030  |
        | r27_stops         | syb031  |
        | r27_stops         | syb032  |

    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stop_timestxt"><b>stop_times.txt</b></a> <br>
        </p>

        | trip_id  | location_group_id | stop_sequence | start_pickup_drop_off_window | end_pickup_drop_off_window | pickup_type | drop_off_type | pickup_booking_rule_id | drop_off_booking_rule_id |
        |----------|-------------------|---------------|------------------------------|----------------------------|-------------|---------------|------------------------|--------------------------|
        | 2714_002 | r27_stops         |             1 |                      7:00:00 |                   10:00:00 |           2 |             1 | br_5478                | br_5478                  |
        | 2714_002 | r27_stops         |             2 |                      7:00:00 |                   10:00:00 |           1 |             2 | br_5478                | br_5478                  |
