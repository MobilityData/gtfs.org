# Alerta de servicio

El siguiente ejemplo es una representación ASCII de una alerta de servicio.

```python
# informaciónheader
header {
  # versión de la especificación de speed. Actualmente es "2.0". Las versiones válidas son "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # determina si el conjunto de datos es incremental o full
  incrementality: FULL_DATASET

  # la time a la que se generó este conjunto de datos en el servidor
  # para determinar la secuencia de los Alert
  timestamp: 1284457468
}
# se pueden incluir múltiples entidades en el feed
entity {
  # identificador único de la entity
  id: "0"

  # "tipo" de la entity
  alert {
    # se pueden definir varios periodos en los que Alert está activa
    active_period {
      # timestart en formato POSIX epoch
      start: 1284457468
      # timeend en formato POSIX epoch
      end: 1284468072
    }
    # selecciona las entidades GTFS que se verán afectadas
    informed_entity {
      # parámetros válidos:
      # agency_id, route_id, route_type, stop_id, trip (véase TripDescriptor)
      route_id: "219"
    }
    # se pueden incluir varios selectoresinformed_entity) en una entity Alert
    informed_entity {
      stop_id: "16230"
    }
    # se pueden incluir varios campos en una informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # Este ejemplo significa la ruta 100 en la parada 16299.
      # Esto no se aplica a cualquier otra parada en la ruta 100 y cualquier otra ruta en la parada 16299.
    }

    # Cause de la Alert - véase gtfs-realtime.proto para los valores válidos
    cause: CONSTRUCTION
    # Effect de la Alert - véase gtfs-realtime.proto para los valores válidos
    effect: DETOUR

    # la url dada proporciona información adicional
    url {
      # compatibilidad con varios idiomas/traducciones
      translation {
        # página alojada fuera de Google (en proveedor/agencia, etc.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # se resaltará laheader de la Alert
    header_text {
      # compatibilidad con varios idiomas/traducciones
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # descripción de laAlert. INFO adicional al text header
    description_text {
      # compatibilidad con varios idiomas/traducciones
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
