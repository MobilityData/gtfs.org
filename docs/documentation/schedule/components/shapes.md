# Shapes

<div class="grid" markdown>

Shapes can be defined and associated with trips, enabling trip planning applications to display trips on a map and inform riders of the distance they need to travel in a transit vehicle. The `shape_dist_traveled` fields are used to programmatically determine how much of a shape to draw when showing a map to riders.
When defining shapes, there is a balance between their level of detail (e.g. following the exact curvature of roads) and conveying only the necessary information efficiently.

| Files associated      | [shapes.txt](/schedule/reference/#shapestxt)                                         | [trips.txt](/schedule/reference/#tripstxt) | [stop_times.txt](/schedule/reference/#stop_timestxt) |
|-----------------------|--------------------------------------------------------------------------------------|-----------|---------------------|
| **Fields associated** | shape_id<br>shape_pt_lat<br>shape_pt_lon<br>shape_pt_sequence<br>shape_dist_traveled | shape_id  | shape_dist_traveled |

</div>
