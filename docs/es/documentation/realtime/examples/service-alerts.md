# Alerta de servicio (Service Alerts)

 El siguiente ejemplo es una representación ASCII de una fuente de alerta. 
 
```python
#información del encabezado 
header {
    # versión de la especificación de velocidad. Actualmente "2.0". Las versiones válidas son "2.0", "1.0". 
    gtfs_realtime_version: "2.0"

    # determina si el conjunto de datos es incremental o completo 
    incrementality: FULL_DATASET
    #la hora en que se generó este conjunto de datos en el servidor#para determinar la secuencia de fuentes de alerta 
    timestamp: 1284457468 
} 
# se pueden incluir varias entidades en el feed 
entity {
    # identificador único para la entidad 
    id: "0" 
 
    # "tipo" de la entidad 
    alert { 
        # se pueden definir múltiples períodos cuando la alerta está activa 
        active_period { 
         # hora de inicio en formato de época POSIX 
         start: 1284457468
         #hora de finalización en formato de época POSIX 
         end: 1284468072
        } 
        # selecciona qué entidades GTFS se verán afectadas 
         informed_entity {
            # parámetros válidos: 
            # id_agencia, route_id, tipo_ruta, id_parada, viaje (ver TripDescriptor) 
            route_id: "219" 
        } 
        # selectores múltiples ( entidad_informada) se puede incluir en una entidad de alerta 
         informed_entity {
            stop_id: "16230" 
        } 
        # se pueden incluir varios campos en una entidad_informada 
         informed_entity {
            stop_id: "16299" 
            route_id: " 100" 
            # Este ejemplo significa la ruta 100 en la parada 16299. 
            # Esto no se aplica a ninguna otra parada en la ruta 100 ni a ninguna otra ruta en la parada 16299. 
        } 
        
        # causa de la alerta- consulte gtfs-realtime.proto para valores válidos 
        cause: CONSTRUCTION
        #efecto de la alerta- consulte gtfs-realtime.proto para valores válidos 
        effect: DETOUR
        
        #la URL proporcionada proporciona información adicional 
            url { 
            # múltiples idiomas/traducciones admitidas 
            translation {
                # página alojada fuera de Google (en el proveedor/agencia, etc.) 
                text: "http://www.sometransitagency/alerts" 
                language: "en " 
            } 
        } 
        
        # se resaltará el encabezado de la alerta 
        header_text { 
            # múltiples idiomas/traducciones admitidas 
            translation {
                text: "Stop at Elm street is closed, temporary stop at Oak street"
                language: "en"
            } 
        } 
        
        # Descripción de la alerta. Información adicional al texto del encabezado 
        description_text { 
            # múltiples idiomas/traducciones admitidas 
            translation { 
                text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
                language: "en"
            } 
        } 
    } 
 } 
``` 
 
 
