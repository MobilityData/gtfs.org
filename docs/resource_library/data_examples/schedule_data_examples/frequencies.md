<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Frequencies

<hr>

## Describe a frequency-based service

The Société de Transport de Montréal operates transit services in Montréal and runs a frequency-based service for its métro lines. Hence, instead of providing a schedule with arrival and departure times in a GTFS dataset, the file [frequencies.txt](../../reference/#frequenciestxt) is used to describe the service frequency throughout the span of the service. Having a trip repeat only works in the case where the timing between stops remains consistent for all stops. When modeling a Frequency-based service, stop_times.txt (@TODO link) contains the relative times between stops in order to determine the times to be displayed to riders. 

[**frequencies.txt**](../../reference/#frequenciestxt)

```
trip_id,start_time,end_time,headway_secs
22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165
```

Above, a trip on the Green line with a `trip_id=22M-GLOBAUX-00-S_1_2` is used as an example. For that trip, the first record indicates that between 4:01:25 PM and 4:19:25 PM, trains run every 180 seconds (or 3 minutes). Similarly, the second record indicates that between 4:19:25 PM and 5:03:25 PM, trains run every 165 seconds.



<sup>[Example source](https://www.stm.info/en/about/developers)</sup>