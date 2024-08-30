# Actualización de viaje (Trip Updates)

 El siguiente ejemplo es una representación ASCII de un feed de actualización de viaje de conjunto de datos completo. 
 
```python
#información del encabezado 
header {
    # versión de la especificación de velocidad. Actualmente "2.0". Las versiones válidas son "2.0", "1.0". 
     gtfs_realtime_version: "2.0" 
    # determina si el conjunto de datos es incremental o completo 
     incrementality: FULL_DATASET
     #el momento en que se generó este conjunto de datos en el servidor 
     timestamp: 1284457468
} 
 
# múltiples entidades pueden ser incluido en el feed 
entity { 
    # identificador único para la entidad 
     id: "simple-trip" 
    
    # "tipo" de la entidad 
     trip_update { 
         trip {
            # selecciona cuál La entidad GTFS (viaje) se verá afectada 
             trip_id: "trip-1" 
         } 
        # actualización de información de programación 
        stop_time_update { 
            # seleccionar qué parada se ve afectada 
            stop_sequence: 3
            #para la llegada del vehículo hora 
            arrival {
                # que se retrasará con 5 segundos 
                delay: 5 
            } 
        } 
        #...el retraso de este vehículo se propaga a sus paradas posteriores. 
        
        # Próxima actualización de información sobre el cronograma del vehículo 
        stop_time_update { 
            # seleccionado por stop_sequence. Actualizará 
            stop_sequence: 8
            #la hora de llegada original (programada) del vehículo con un 
            arrival { 
                # 1 segundo de retraso. 
                delay: 1 
            } 
        } 
        #...así mismo el retraso se propaga a paradas posteriores. 
        
        # Próxima actualización de información sobre el cronograma del vehículo 
        stop_time_update { 
            # seleccionado por stop_sequence. Actualizará la hora de llegada del vehículo 
            stop_sequence: 10
            #con el retraso predeterminado de 0 (a tiempo) y propagará esta actualización
            #para el resto de paradas del vehículo. 
        } 
    } 
} 
 
# segunda entidad que contiene información actualizada para otro viaje 
entidad { 
    id: "3" 
    trip_update { 
        trip { 
            # los viajes basados ​​en frecuencia están definidos por su
            #trip_id en GTFS y 
            trip_id: "frequency-expanded-trip" 
            # start_time 
            start_time: "11:15:35" 
        } 
        stop_time_update { 
            stop_sequence: 1 
            arrival { 
                # retraso negativo significa que el vehículo está 2 segundos antes de lo previsto 
                    delay: -2 
                } 
        } 
        stop_time_update { 
            stop_sequence: 9 
        } 
    } 
} 
``` 
 
 
