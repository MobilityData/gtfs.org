# Frequency-based services

Frequency-based services can be used to model services that operate on a regular frequency, such as buses running every 10 minutes or subway services operating 2 minutes within specified time intervals.
When modeling a Frequency-based service, `stop_times.txt` contains the relative times between stops in order to determine the times to be displayed to riders. 

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[frequencies.txt](/documentation/schedule/reference/#frequenciestxt)|`trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` |

??? note "Sample Data"

    <p style="font-size:16px">
    The following sample shows two distinct trips: trip `AWE1` that runs every 30 min (`headway_secs=1800`), and trip `AWE2` that runs every 15min (`headway_secs=900`).  
    <p style="font-size:16px">
    The 'exact times' field indicates whether the schedule follows the precise start time entered in the 'start_time' field: Trip `AWE1` departs every 30min from 6:10am to 12:00pm, trip `AW2` departs at 6:00am, 6:15am, 6:30am, and so on.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#frequenciestxt"><b>frequencies.txt</b></a> <br>
        </p>

        | trip_id | start_time | end_time | headway_secs | exact_times |
        ---------|------------|----------|--------------|-------------|
         AWE1    |    6:10:00 | 12:00:00 |         1800 |           0 |
         AWE2    |    6:00:00 | 19:50:00 |          900 |           1 |