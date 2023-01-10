# Mise à jour du voyage

L'exemple suivant est une représentation ASCII d'un flux Trip Update complet.

```python
# informations sur l'header
header {
  # # version de la spécification de speed. Actuellement "2.0". Les versions valides sont "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # détermine si le jeu de données est incrémental ou complet
  incrementality: FULL_DATASET
  # le moment où cet ensemble de données a été généré sur le serveur
  timestamp: 1284457468
}

# plusieurs entités peuvent être incluses dans le flux
entity {
  # identifiant unique de l'entity
    id: "simple-trip"
    
    # le "type" de l'entity
    trip_update {
      trip {
      # sélectionne quelle entity GTFS (trip) sera affectée
        trip_id: "trip-1"
      }
      # Mise à jour des informations sur les Schedule
      stop_time_update {
      # sélection de l'arrêt concerné
      stop_sequence: 3
      # pour l'time arrival vehicle
      arrival {
        # pour être retardé de 5 secondes
      delay: 5
      }
    }
    # ...le delay de ce vehicle est propagé à ses arrêts suivants.

    # Prochaine mise à jour des informations sur l'Schedule du vehicle
    stop_time_update {
      # sélectionné par stop_sequence. Il mettra à jour
      stop_sequence: 8
      # l'time arrival initiale (prévue) du vehicle avec un numéro d'urgence.
      arrival {
        # delay 1 seconde.
        delay: 1
      }
    }
    # ...de même, le delay se propage aux arrêts suivants.

    # Prochaine mise à jour des informations sur l'Schedule du vehicle
    stop_time_update {
      # sélectionné par stop_sequence. Elle mettra à jour l'time arrival du vehicle
      stop_sequence: 10
      # avec le delay par défaut de 0 (sur le time) et propager cette mise à jour
      # pour le reste des arrêts du vehicle.
    }
  }
}

# deuxième entity contenant des informations de mise à jour pour un autre trip
entity {
  id: "3"
  trip_update {
    trip {
      # les déplacements basés sur la fréquence sont définis par leur
      # trip_id dans GTFS et
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # Un delay négatif signifie que le vehicle a 2 secondes d'avance sur le Schedule.
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
