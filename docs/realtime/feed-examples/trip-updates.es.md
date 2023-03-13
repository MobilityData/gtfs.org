# Actualización de viajes

El siguiente ejemplo es una representación ASCII de un conjunto completo de datos de actualización de viajes.

```python
# informaciónheader
header {
  # versión de la especificación de velocidad. Actualmente es "2.0". Las versiones válidas son "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # determina si el conjunto de datos es incremental o completo
  incrementality: FULL_DATASET
  # el momento en que se generó este conjunto de datos en el servidor
  timestamp: 1284457468
}

# se pueden incluir múltiples entidades en el alimentación
entity {
  # identificador único de la entity
  id: "simple-trip"

  # "tipo" de la entity
  trip_update {
    trip {
      # selecciona qué entity GTFS (trip) se verá afectada
      trip_id: "trip-1"
    }
    # Actualización de la información cronograma
        stop_time_update {
      # seleccionar la parada afectada
      stop_sequence: 3
      # para la tiempo de llegada del vehículo
      arrival {
        # a retrasar con 5 segundos
        delay: 5
      }
    }
    # ...el delay de este vehículo se propaga a sus paradas siguientes.

    # Próxima actualización de la información sobre el cronograma del vehículo
    stop_time_update {
      # seleccionado por stop_sequence. Actualizará
      stop_sequence: 8
      # la tiempo llegada original (programada) del vehículo con un
      arrival {
        # 1 segundo de delay.
        delay: 1
      }
    }
    # ...Del mismo modo, el delay se propaga a las paradas siguientes.

    # Próxima actualización de la información sobre el cronograma del vehículo
    stop_time_update {
      # seleccionado por stop_sequence. Actualizará la tiempo llegada del vehículo
      stop_sequence: 10
      # con el delay predeterminado de 0 (a tiempo) y propagar esta actualización
      # para el resto de paradas del vehículo.
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
        # un delay negativo significa que el vehículo va 2 segundos por delante de lo cronograma
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
