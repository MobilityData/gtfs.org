# サービスアラート

次の例は、アラートフィードのASCII表現です。

```python
# header information
header {
  # version of speed specification. Currently "2.0". Valid versions are "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # determines whether dataset is incremental or full
  incrementality: FULL_DATASET

  # the time where this dataset was generated on server
  # for determining the sequence of alert feeds
  timestamp: 1284457468
}
# multiple entities can be included in the feed
entity {
  # unique identifier for the entity
  id: "0"

  # "type" of the entity
  alert {
    # multiple periods can be defined when alert is active
    active_period {
      # start time in POSIX epoch format
      start: 1284457468
      # end time in POSIX epoch format
      end: 1284468072
    }
    # selects which GTFS entities will be affected
    informed_entity {
      # valid parameters: 
      # agency_id, route_id, route_type, stop_id, trip (see TripDescriptor)
      route_id: "219"
    }
    # multiple selectors (informed_entity) can be included in one alert entity
    informed_entity {
      stop_id: "16230"
    }
    # multiple fields can be included in one informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # This example means route 100 at stop 16299.
      # This does not apply to any other stop on route 100 and any other route at stop 16299.
    }

    # cause of the alert - see gtfs-realtime.proto for valid values
    cause: CONSTRUCTION
    # effect of the alert - see gtfs-realtime.proto for valid values
    effect: DETOUR

    # the given url provides additional information
    url {
      # multiple languages/translations supported
      translation {
        # page hosted outside of Google (at provider/agency, etc.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header for the alert will be highlighted
    header_text {
      # multiple languages/translations supported
      translation {
        text: "エルム ストリートの停留所は閉鎖されています。オーク ストリートに臨時停留所があります"
        language: "ja"
      }
    }

    # Alert description. Additional info to the header text
    description_text {
      # multiple languages/translations supported
      translation {
        text: "エルム ストリートの工事のため、停留所は閉鎖されています。臨時停留所はオーク ストリートの 300 メートル北にあります"
        language: "ja"
      }
    }
  }
}
```