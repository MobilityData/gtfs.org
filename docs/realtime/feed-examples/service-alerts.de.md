# Dienst-Alarm

Das folgende Beispiel ist eine ASCII-Darstellung eines Alert Feeds.

```python
# header
header {
  # Version der speed. Derzeit "2.0". Gültige Versionen sind "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # bestimmt, ob der Datensatz inkrementell oder full ist
  incrementality: FULL_DATASET

  # die time, zu der dieser Datensatz auf dem Server erzeugt wurde
  # zur Bestimmung der Reihenfolge der Alert Feeds
  timestamp: 1284457468
}
# mehrere Entitäten können in den Feed aufgenommen werden
entity {
  # eindeutiger Bezeichner für die entity
  id: "0"

  # "Typ" der entity
  alert {
    # Es können mehrere Zeiträume definiert werden, in denen der Alert aktiv ist.
      active_period {
      # time im POSIX-Epochenformat
      start: 1284457468
      # time im POSIX-Epochenformat
      end: 1284468072
    }
    # wählt aus, welche GTFS betroffen sein werden
    informed_entity {
      # gültige Parameter: 
      # agency_id, route_id, route_type, stop_id, trip (siehe TripDescriptor)
      route_id: "219"
    }
    # mehrere Selektoreninformed_entity) können in einer entity enthalten sein
    informed_entity {
      stop_id: "16230"
    }
    # mehrere Felder können in eine informed_entity aufgenommen werden
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # In diesem Beispiel ist das die Linie 100 an der Haltestelle 16299.
      # Dies gilt nicht für alle anderen Haltestellen der Linie 100 und alle anderen Linien an der Haltestelle 16299.
    }

    # Cause des Alert - siehe gtfs-realtime.proto für gültige Werte
        cause: CONSTRUCTION
    # Effect des Alert - siehe gtfs-realtime.proto für gültige Werte
    effect: DETOUR

    # die angegebene url liefert zusätzliche Informationen
    url {
      # Unterstützung mehrerer Sprachen/Übersetzungen
      translation {
        # außerhalb von Google gehostete Seite (bei Anbieter/Agentur usw.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # Dieheader der Alert wird hervorgehoben.
    header_text {
      # Unterstützung mehrerer Sprachen/Übersetzungen
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Beschreibung desAlert. Zusätzliche info zum text

description_text {
      # Unterstützung mehrerer Sprachen/Übersetzungen
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}

```
