# Service d'alerte

L'exemple suivant est une représentation ASCII d'un flux d'alerte.

```python
# informations sur l'header
header {
  # version de la spécification de speed. Actuellement "2.0". Les versions valides sont "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # détermine si le jeu de données est incrémental ou full
  incrementality: FULL_DATASET

  # l'time à laquelle cet ensemble de données a été généré sur le serveur
  # pour déterminer la séquence des flux d'Alert
  timestamp: 1284457468
}
# plusieurs entités peuvent être incluses dans le flux
entity {
  # identifiant unique de l'entity
  id: "0"

  # le "type" de l'entity
  alert {
    # plusieurs périodes peuvent être définies lorsque l'Alert est active
    active_period {
      # timestart au format POSIX epoch
      start: 1284457468
      # timeend au format POSIX epoch
      end: 1284468072
    }
    # sélectionne les entités GTFS qui seront affectées
    informed_entity {
      # paramètres valides :
      # agency_id, route_id, route_type, stop_id, trip (voir TripDescriptor)
      route_id: "219"
    }
    # plusieurs sélecteurs informed_entity) peuvent être inclus dans une entity Alert
    informed_entity {
      stop_id: "16230"
    }
    # plusieurs champs peuvent être inclus dans une informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # Dans cet exemple, il s'agit de la route 100 à l'arrêt 16299.
      # Ceci ne s'applique pas à tout autre arrêt sur la route 100 et à tout autre itinéraire à l'arrêt 16299.
    }

    # Cause de l'Alert - voir gtfs-realtime.proto pour les valeurs valides
    cause: CONSTRUCTION
    # Effect de l'Alert - voir GTFS.proto pour les valeurs valides
    effect: DETOUR

    # l'url donnée fournit des informations supplémentaires
    url {
      # Prise en charge de plusieurs langues/traductions
      translation {
        # page hébergée en dehors de Google (chez le fournisseur/agence, etc.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # L'header l'Alert sera mis en évidence
    header_text {
      # Prise en charge de plusieurs langues/traductions
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # description de l'Alert. Info supplémentaire au text header
    description_text {
      # Prise en charge de plusieurs langues/traductions
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
