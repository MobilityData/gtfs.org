# :material-escalator: Recorridos 

 Las funciones de las Recorridos pueden modelar grandes estaciones de tránsito, guiando a los pasajeros desde las entradas de las estaciones y hasta el lugar donde abordan o desembarcan de un vehículo de tránsito. Algunas de estas funciones hacen posible comunicar las características físicas de una ruta y el tiempo de navegación estimado, y los sistemas de orientación del mundo real empleados en las estaciones. 
 
## Conexiones de Recorridos 
 
 En su nivel fundamental, Recorridos ofrece funcionalidad básica para conectar áreas clave definidas en Tipos de Ubicación dentro de una estación. Estas conexiones forman caminos que permiten a los usuarios obtener direcciones precisas (por ejemplo, desde una entrada al área de embarque), lo cual es particularmente útil para navegar por estaciones de tránsito grandes y complejas. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `pathway_id`, `from_stop_id`, `to_stop_id`, `pathway_mode`, `is_bidirectional` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Tipos de Ubicación](../base_add-ons/#tipos-de-ubicacion) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo define múltiples conexiones (también denominadas vías) entre ubicaciones preestablecidas (definidas como paradas): pasarelas (`pathway_mode=1`), escaleras (`pathway_mode=2`) y puerta de entrada (`pathway_mode=6`’). También se especifica la bidireccionalidad.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | from_stop_id | to_stop_id | pathway_mode | is_bidirectional |
        |------------|--------------|------------|--------------|------------------|
        | MainSt-001 | A102_E01     | A102_S01   |            1 |                1 |
        | MainSt-002 | A102_S01     | A102_S02   |            2 |                1 |
        | MainSt-003 | A102_S02     | A102_F02   |            1 |                1 |
        | MainSt-004 | A102_F02     | A102_F01   |            6 |                1 |
        | MainSt-005 | A102_F01     | A102_S03   |            1 |                1 |
        | MainSt-006 | A102_S03     | A102_S04   |            2 |                1 |
        | MainSt-007 | A102_F01     | A102_S05   |            1 |                1 |
        | MainSt-008 | A102_S05     | A102_S06   |            2 |                1 |
        | MainSt-009 | A102_S04     | A102_B01   |            1 |                1 |
        | MainSt-010 | A102_S06     | A102_B02   |            1 |                1 |
 
 
## Detalles de Recorridos 
 
 Se pueden agregar más detalles sobre las características físicas de los caminos de una estación, incluyendo longitud, ancho y pendiente (para rampas) o el número de escaleras (para escaleras). Esto ayuda a los pasajeros a anticipar las condiciones y la accesibilidad del camino que necesitan recorrer. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `max_slope`, `min_width`, `length`, `stair_count` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Conexiones de Recorridos](#conexiones-de-recorridos) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo define detalles adicionales a los caminos preestablecidos, incluido el ancho mínimo, el número de escalones para las escaleras y la longitud y pendiente máxima para los pasillos.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | max_slope | min_width | length | stair_count |
        |------------|-----------|-----------|--------|-------------|
        | MainSt-001 |         0 |       4.3 |    3.6 |             |
        | MainSt-002 |           |       2.2 |        |          15 |
        | MainSt-003 |      0.06 |         4 |    3.1 |             |
        | MainSt-004 |           |       0.9 |    2.9 |             |
        | MainSt-005 |         0 |       3.5 |      5 |             |
        | MainSt-006 |           |       2.2 |        |          18 |
        | MainSt-007 |         0 |       3.5 |      5 |             |
        | MainSt-008 |           |       2.2 |        |          18 |
        | MainSt-009 |         0 |         6 |      2 |             |
        | MainSt-010 |         0 |         6 |      2 |             |
 
 
## Niveles 
 
 Los Niveles se pueden utilizar para enumerar todos los diferentes niveles dentro de una estación, proporcionando a los usuarios una capa adicional de información sobre las estaciones. Esta característica también permite el uso de ascensores junto con la función de conexiones Recorridos. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[levels.txt](../../../documentation/schedule/reference/#levelstxt)| `level_id`, `level_index`, `level_name`| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `level_id` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Tipos de Ubicación](../base_add-ons/#tipos-de-ubicacion) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra los diferentes niveles en una estación. Luego, las ubicaciones (definidas como paradas) se asignan a su nivel correspondiente.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | level_id          | level_index | level_name |
        |-------------------|-------------|------------|
        | level_0_street    |           0 | On street  |
        | level_-1_lobby    |          -1 | Lobby      |
        | level_-2_platform |          -2 | Platform   |


    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | stop_id      | level_id |
        |--------------|----------|
        | Station_A102 |          |
        | A102_B01     |       -2 |
        | A102_B02     |       -2 |
        | A102_E01     |        0 |
        | A102_S01     |        0 |
        | A102_S02     |       -1 |
        | A102_S03     |       -1 |
        | A102_S04     |       -2 |
        | A102_S05     |       -1 |
        | A102_S06     |       -2 |
        | A102_F01     |       -1 |
        | A102_F02     |       -1 |
 
 
## Tiempo de recorrido en la estación 
 
 El tiempo de recorrido en la estación proporciona un nivel adicional de detalle a las direcciones dentro de la estación, brindando a los usuarios un tiempo estimado requerido para navegar por las estaciones, lo que resulta en mejores direcciones de viaje y tiempos de viaje. 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `traversal_time` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Conexiones de Recorridos](#conexiones-de-recorridos) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo muestra el tiempo de viaje estimado (en segundos) necesario para recorrer cada camino.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | traversal_time |
        |------------|----------------|
        | MainSt-001 |              3 |
        | MainSt-002 |             20 |
        | MainSt-003 |              2 |
        | MainSt-004 |              2 |
        | MainSt-005 |              4 |
        | MainSt-006 |             25 |
        | MainSt-007 |              4 |
        | MainSt-008 |             25 |
        | MainSt-009 |              2 |
        | MainSt-010 |              2 |
 
 
## Señalamientos de Sendas 
 
 Las Señalamientos de Sendas pueden unir la información que se muestra en los planificadores de viajes con señales del mundo real. Si esto se representa en un feed, los planificadores de viajes pueden proporcionar instrucciones como "siga las señales hacia". 

 | Archivos incluidos | Campos incluidos | 
 |----------------------------------|-------------------| 
 |[pathways.txt](../../../documentation/schedule/reference/#pathwaystxt)| `signposted_as`, `reversed_signposted_as` | 
 
 **Requisitos previos**: 
 
 - [Funciones Base](../base) 
 - [Conexiones de Recorridos](#conexiones-de-recorridos) 
 
??? note "Datos de muestra"

    <p style="font-size:16px">
    El siguiente ejemplo especifica la información de navegación asociada a rutas preestablecidas, reflejando el texto mostrado en las señales físicas de la estación. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#pathwaystxt"><b>pathways.txt</b></a> <br>
        </p>

        | pathway_id | signposted_as    | reversed_signposted_as |
        |------------|------------------|------------------------|
        | MainSt-001 | to lobby         | Exit                   |
        | MainSt-002 |                  |                        |
        | MainSt-003 | To platforms     | Exit                   |
        | MainSt-004 |                  |                        |
        | MainSt-005 | Westbound trains | Exit                   |
        | MainSt-006 |                  |                        |
        | MainSt-007 | Eastbound trains | Exit                   |
        | MainSt-008 |                  |                        |
        | MainSt-009 | Westbound trains | To Lobby               |
        | MainSt-010 | Eastbound trains | To Lobby               |
