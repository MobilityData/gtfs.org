# Frequency-based services

Frequency-based services can be used to model services that operate on a regular frequency, such as buses running every 10 minutes or subway services operating 2 minutes within specified time intervals.
When modeling a Frequency-based service, `stop_times.txt` contains the relative times between stops in order to determine the times to be displayed to riders. 

**Pre-requirements**: Implement Base features.

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[frequencies.txt](/documentation/schedule/reference/#frequenciestxt)|`trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` |

??? note "Sample Data"
    <p style="font-size:16px">
    The following table shows two different trips operating at different frequencies, one with departures every 30 min not following a fixed schedule, and one with exact arrival and departure times at every stop every 15 minutes.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#frequenciestxt"><b>frequencies.txt</b></a> <br>
        </p>

        | trip_id | start_time | end_time | headway_secs | exact_times |
        ---------|------------|----------|--------------|-------------|
         AWE1    |    6:10:00 | 12:00:00 |         1800 |           0 |
         AWE2    |    6:00:00 | 19:50:00 |          900 |           1 |