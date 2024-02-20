# Frequency-based services

<div class="grid" markdown>

Frequency-based services can be used to model services that operate on a regular frequency, such as buses running every 10 minutes or subway services operating 2 minutes within specified time intervals.
When modeling a Frequency-based service, `stop_times.txt` is still defined and contains the relative times between stops in order to determine the times to be displayed to riders. This modeling only works in the case where the relative times between stops remains consistent for all stops.


| Files associated      | frequencies.txt                                                  |
|-----------------------|------------------------------------------------------------------|
| **Fields associated** | trip_id<br>start_time<br>end_time<br>headway_secs<br>exact_times |


</div>