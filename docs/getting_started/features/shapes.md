# Shapes
Shapes can be defined and associated with trips, enabling trip planning applications to display trips on a map and inform riders of the distance they need to travel in a transit vehicle. The `shape_dist_traveled` fields are used to programmatically determine how much of a shape to draw when showing a map to riders.
When defining shapes, there is a balance between their level of detail (e.g. following the exact curvature of roads) and conveying only the necessary information efficiently.

|Files included                             |Fields included            |
|----------------------------------|-------------------|
|[shapes.txt](/schedule/reference/#shapestxt)                        |`shape_id`, `shape_pt_lat`, `shape_pt_lon`, `shape_pt_sequence`, `shape_dist_traveled`           |
|[trips.txt](/schedule/reference/#tripstxt)                         |`shape_id`           |
|[stop_times.txt](/schedule/reference/#stop_timestxt)                    |`shape_dist_traveled`|


??? note "Sample data"

    <p style="font-size:16px">
    The following table shows a portion of a shape from the TriMet GTFS feed (download it <a     href="https://developer.trimet.org/GTFS.shtml">here</a>). <br><br>
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="https://staging.gtfs.org/documentation/schedule/reference/#shapestxt">shapes.txt</a> <br>
        </p>
    
        | shape_id | shape_pt_lat | shape_pt_lon | shape_pt_sequence | shape_dist_traveled |
        | --------- | ------------- | ------------- | ------------------ | ------------------- |
        | 558674     | 45.47623       | -122.721885    | 1                   | 0.0                  |
        | 558674     | 45.476235      | -122.72236     | 2                   | 121.9                |
        | 558674     | 45.476237      | -122.722523    | 3                   | 163.7                |
        | 558674     | 45.476242      | -122.723024    | 4                   | 292.2                |
        | 558674     | 45.476244      | -122.72316     | 5                    | 327.1               |

    !!! note ""
        <p style="font-size:16px">
        <a href="https://staging.gtfs.org/documentation/schedule/reference/#tripstxt">trips.txt</a> <br>
        </p>
        
        |trip_id |shape_id|
        |--------|--------|
        |13302375|558674  |

    !!! note ""
        <p style="font-size:16px">
        <a href="https://staging.gtfs.org/documentation/schedule/reference/#stop_timestxt">stop_times.txt</a> <br>
        </p>
        
        |trip_id |stop_sequence|shape_dist_traveled|
        |--------|-------------|-------------------|
        |13302375|1            |0                  |
        |13302375|2            |461.7              |
        |13302375|3            |1245               |
