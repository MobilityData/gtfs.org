# Frequency-based services

Frequency-based services can be used to model services that operate on a regular frequency, such as buses running every 10 minutes or subway services operating 2 minutes within specified time intervals.
When modeling a Frequency-based service, `stop_times.txt` contains the relative times between stops in order to determine the times to be displayed to riders. 

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[frequencies.txt](/schedule/reference/#frequenciestxt)|`trip_id`, `start_time`, `end_time`, `headway_secs`, `exact_times` |
