# Frequencies

<hr>

## Describe a frequency-based service

The Société de Transport de Montréal operates transit services in Montréal and runs a frequency-based service for its métro lines. Hence, instead of providing a schedule with arrival and departure times in a GTFS dataset, the file [frequencies.txt](../../reference/#frequenciestxt) is used to describe the service frequency throughout the span of the service. 

[**frequencies.txt**](../../reference/#frequenciestxt)

```
trip_id,start_time,end_time,headway_secs
22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165
```

Above, a trip on the Green line with a `trip_id=22M-GLOBAUX-00-S_1_2` is used as an example. For that trip, the first record indicates that between 4:01:25 PM and 4:19:25 PM, trains run every 180 seconds (or 3 minutes). Similarly, the second record indicates that between 4:19:25 PM and 5:03:25 PM, trains run every 165 seconds.



<sup>[Example source](https://www.stm.info/en/about/developers)</sup>