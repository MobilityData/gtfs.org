<a class="pencil-link" href="https://github.com/google/transit/edit/master/gtfs-realtime/spec/en/examples/trip-updates-full.asciipb" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>
  
# Trip Update

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
