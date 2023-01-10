<a class="pencil-link" href="https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Trip Update

Das folgende Beispiel ist eine ASCII-Darstellung eines vollständigen Datensatzes für eine Reiseaktualisierung.

```python
# header
header {
  # Version der speed. Derzeit "2.0". Gültige Versionen sind "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # bestimmt, ob der Datensatz inkrementell oder voll ist
  incrementality: FULL_DATASET
  # der Zeitpunkt, zu dem dieser Datensatz auf dem Server erzeugt wurde
  timestamp: 1284457468
}

# mehrere Entitäten können in den Feed aufgenommen werden
entity {
  # eindeutiger Bezeichner für die entity
  id: "simple-trip"

  # "Typ" der entity
  trip_update {
    trip {
      # wählt aus, welche entity (trip) betroffen sein wird
      trip_id: "trip-1"
    }
    # Aktualisierung der Zeitplaninformationen
    stop_time_update {
      # Auswahl der betroffenen Haltestelle
      stop_sequence: 3
      # für die time des vehicle
      arrival {
        # um 5 Sekunden verzögert werden
        delay: 5
      }
    }
    # ...Die delay dieses vehicle wird auf die nachfolgenden Haltestellen übertragen.

    # Nächste Informationsaktualisierung zum Fahrplan des vehicle
    stop_time_update {
      # ausgewählt durch stop_sequence. Es wird aktualisiert
      stop_sequence: 8
      # die ursprüngliche (geplante) time des vehicle mit einem
      arrival {
        # 1 Sekunde delay.
        delay: 1
      }
    }
    # ...Ebenso wird die delay auf die nachfolgenden Haltestellen übertragen.

    # Nächste Informationsaktualisierung zum Fahrplan des vehicle
    stop_time_update {
      # ausgewählt durch stop_sequence. Sie aktualisiert die time des vehicle
      stop_sequence: 10
      # mit der delay von 0 (on time) und diese Aktualisierung weitergeben
      # für die restlichen Haltestellen des vehicle.
    }
  }
}

# eine zweite entity mit aktualisierten Informationen für eine andere trip
entity {
  id: "3"
  trip_update {
    trip {
      # frequenzbasierte Fahrten werden durch ihre
      # trip_id in GTFS und
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # Negative delay bedeutet, dass das vehicle dem Zeitplan um 2 Sekunden voraus ist.
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
