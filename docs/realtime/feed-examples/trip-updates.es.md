# Actualización de viajes

El siguiente ejemplo es una representación ASCII de un conjunto completo de datos de actualización de viajes.

```python
# informaciónheader
header {
  # versión de la especificación de speed. Actualmente es "2.0". Las versiones válidas son "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # determina si el conjunto de datos es incremental o completo
  incrementality: FULL_DATASET
  # el momento en que se generó este conjunto de datos en el servidor
  timestamp: 1284457468
}

# se pueden incluir múltiples entidades en el feed
entity {
  # identificador único de la entity
  id: "simple-trip"

  # "tipo" de la entity
  trip_update {
    trip {
      # selecciona qué entity GTFS (trip) se verá afectada
      trip_id: "trip-1"
    }
    # Actualización de la información Schedule
        stop_time_update {
      # seleccionar la parada afectada
      stop_sequence: 3
      # para la time de arrival del vehicle
      arrival {
        # a retrasar con 5 segundos
        delay: 5
      }
    }
    # ...el delay de este vehicle se propaga a sus paradas siguientes.

    # Próxima actualización de la información sobre el Schedule del vehicle
    stop_time_update {
      # seleccionado por stop_sequence. Actualizará
      stop_sequence: 8
      # la time arrival original (programada) del vehicle con un
      arrival {
        # 1 segundo de delay.
        delay: 1
      }
    }
    # ...Del mismo modo, el delay se propaga a las paradas siguientes.

    # Próxima actualización de la información sobre el Schedule del vehicle
    stop_time_update {
      # seleccionado por stop_sequence. Actualizará la time arrival del vehicle
      stop_sequence: 10
      # con el delay predeterminado de 0 (a time) y propagar esta actualización
      # para el resto de paradas del vehicle.
    }
  }
}

# segunda entity que contiene información actualizada para otro trip
entity {
  id: "3"
  trip_update {
    trip {
      # Los viajes basados en la frecuencia se definen por su
      # trip_id en GTFS y
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # un delay negativo significa que el vehicle va 2 segundos por delante de lo Schedule
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
