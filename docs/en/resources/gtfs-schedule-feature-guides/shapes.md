# Shapes

## Shapes Data Guidance

The data contained in shapes.txt file plays a critical role in the representation of transit services. Properly constructed shapes improve the accuracy of trip visualizations in trip planning applications, ensuring a seamless experience for riders. The following recommended practices provide guidance on creating high-quality shape data that accurately represents vehicle movements and aligns with physical travel paths.

1. When the travel path between stops is not a straight line, avoid defining the shape with only two points. Ensure the shape accurately reflects the vehicle's travel path.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-1.png">


2. Ensure that shapes start from the origin station and end at the destination station. Avoid shapes that are too short or too long.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2a.png">

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2b.png">

3. Within a shape defined by a single shape_id, avoid illogical backtracking or unnecessary point reversals.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-3.png">

4. Ensure that shapes align with the path that vehicles travel along in the WGS84 coordinate system, avoid offsets caused by differing coordinate systems.

    - For roadway services (e.g., bus), alignments should follow the centerline of the roadway the vehicle travels on. This may be either the centerline of the street if there are no designated lanes or the centerline of the travel direction side if lanes are specified.

        <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4a.png">

    - For rail services (e.g., subway, train, light rail), shapes should follow the tracks that the train travels on. If a trip does not always travel on a specific track in certain areas and multiple tracks exist, ensure the shape stays within the range of tracks on which the train may operate.

        <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4b.png">

5. When the vehicle travels along curves, shape points should be dense enough to allow for a visually smooth presentation for riders.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-5.png">

6. Alignments should not “jag” to a curb stop, platform, or boarding location.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-6.png">