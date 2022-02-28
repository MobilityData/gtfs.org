# Feed Examples

The following examples show a textual representation of feeds. During development it is more convenient to produce ASCII protocol buffer output for easier debugging. You can compare your text output with these examples to check for the validity of data.

## Service alert
The following example is an ASCII representation of an Alert feed.

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
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert description. Additional info to the header text
    description_text {
      # multiple languages/translations supported
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```

## Trip Update
The following example is an ASCII representation of an full-dataset Trip Update feed.

```python
# header information
header {
  # version of speed specification. Currently "2.0". Valid versions are "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # determines whether dataset is incremental or full
  incrementality: FULL_DATASET
  # the moment where this dataset was generated on server
  timestamp: 1284457468
}

# multiple entities can be included in the feed
entity {
  # unique identifier for the entity
  id: "simple-trip"

  # "type" of the entity
  trip_update {
    trip {
      # selects which GTFS entity (trip) will be affected
      trip_id: "trip-1"
    }
    # schedule information update
    stop_time_update {
      # selecting which stop is affected
      stop_sequence: 3
      # for the vehicle's arrival time
      arrival {
        # to be delayed with 5 seconds
        delay: 5
      }
    }
    # ...this vehicle's delay is propagated to its subsequent stops.

    # Next information update on the vehicle's schedule
    stop_time_update {
      # selected by stop_sequence. It will update
      stop_sequence: 8
      # the vehicle's original (scheduled) arrival time with a
      arrival {
        # 1 second delay.
        delay: 1
      }
    }
    # ...likewise the delay is propagated to subsequent stops.

    # Next information update on the vehicle's schedule
    stop_time_update {
      # selected by stop_sequence. It will update the vehicle's arrival time
      stop_sequence: 10
      # with the default delay of 0 (on time) and propagate this update
      # for the rest of the vehicle's stops.
    }
  }
}

# second entity containing update information for another trip
entity {
  id: "3"
  trip_update {
    trip {
      # frequency based trips are defined by their
      # trip_id in GTFS and
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # negative delay means vehicle is 2 seconds ahead of schedule
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```


