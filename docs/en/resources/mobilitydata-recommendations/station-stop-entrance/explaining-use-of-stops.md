# Explaining the use of `stops.txt` 

In its simplest form, the `stops.txt` file in GTFS defines the physical locations where passengers can board or alight a transit vehicle. A common example is a standard bus stop located on the side of a street. At a minimum, each stop entry must include a `stop_id`, a `stop_name`, and geographic coordinates (`stop_lat` and `stop_lon`). These fields are enough to describe a basic stop in GTFS.

However, transit infrastructure is usually more complex than a single stop on the side of the road. Many systems include large terminals with multiple platforms, subway stations with several entrances, or multimodal hubs that connect buses, trains, and other services. 

To represent this complexity, a `stops.txt` file in GTFS includes two important fields: `location_type` and `parent_station`. These two fields work together to establish a hierarchy, allowing smaller elements of transit infrastructure to be represented inside of a larger, parent station.

<figure>
  <img 
    src="../../../../assets/fig-01-station-modelling.png" 
    alt="Flowchart showing Station at the top, branching into Stop/Platform, Entrance/Exit, and Generic Node. Stop/Platform branches down to Boarding Area." 
    width="500"
  >
  <figcaption>Figure 1: Simple hierarchy diagram of GTFS Station Modelling.</figcaption>
</figure>

These fields provide structure to the data and allow agencies to describe transit infrastructure in a way that matches how passengers experience it. 

## Understanding the `location_type` field

The `location_type` field categorizes stops based on their function. For example, a simple stop on the side of the road with a sign is expressed as `location_type = 0` or an empty field. Similarly, a single platform for a train or subway is also expressed as `location_type = 0` or an empty field. Although the two may appear physically different, they perform the same function: a place where passengers board or exit vehicles.

A stop or platform may have marked boarding areas for certain cars, or specific zones where passengers with accessibility needs should alight or exit a vehicle. These boarding areas are expressed as `location_type = 4`.

Transit hubs containing multiple stops or modes of transportation can be defined using `location_type = 1`, which designates it as a **"station." As explained below, stations are required to establish a hierarchy allowing stops, platforms, entrances/exits, generic nodes, and boarding areas to be grouped within the station.** For more details on the conceptual grouping of stops, refer to the [Conceptual station information](implementation-considerations.md#conceptual-station-information) subsection. 

The current values that can be used to classify entries in `stops.txt` are the following:

| `location_type` value | Description |
| :---: | ----- |
| **0** (or empty) | **Stop or platform**. A place where passengers board or exit vehicles, such as a bus stop or a subway platform. |
| **1** | **Station**. A container for multiple stops or platforms. It usually represents a larger facility like a train or metro station. |
| **2** | **Entrance or exit**. An access point to a station. It is **not** a boarding location, but rather it models how passengers can enter or leave the station. |
| **3** | **Generic node**. An internal point within a station signaling a specific part of the infrastructure, such as the end of a corridor or the upper part of a stairway.<br> These are typically used in conjunction with the `pathways.txt` file to define navigational pathways through a station. |
| **4** | **Boarding area**. This is a more specific area within a platform, such as a particular zone where passengers board a certain car. |

#### What is a generic node? 

In GTFS, a generic node refers to a point within a station such as the end of a corridor, the upper part of a stairway, or another general point that would help a rider navigate a station. Generic nodes are needed only if Pathways data is provided, for more information please refer to the [Pathways](../../../getting-started/features/pathways.md) guidance.

## Understanding the `parent_station` field

Once you have your `location_type` values defined, you then need to link them together. The `parent_station` field allows you to establish the relationship between a stop, an entrance, or a boarding area and the station or stop in which it belongs. 

Unlike `location_type`, which uses enumerated values to model different elements, the `parent_station` field uses the unique `stop_id` of the station. Through this modelling, it is apparent which elements are contained within which station. 

However, there’s a small consideration when `location_type = 4`, or a boarding area. In the hierarchy of station modelling, a boarding area exists **within a stop, not a station**. For these situations, enter the unique `stop_id` of the stop where the boarding areas are located (`location_type = 0`) into the `parent_station` field. 

The image below shows the relationship between `location_type` and `parent_station` and the rules associated with each field and location type.

<figure>
  <img 
    src="../../../../assets/fig-02-relational-diagram.png" 
    alt="Hierarchy diagram of GTFS location_type values (0 to 4) and their parent_station requirements across Station, Stop/Platform, Entrance/Exit, Generic Node, and Boarding area."
    width="700"
  >
  <figcaption>Figure 2: Detailed relational diagram of station modelling in GTFS.</figcaption>
</figure>

## Key rules of station modelling

* An empty entry in `location_type` assumes a stop or platform (`location_type = 0`).  
* All stations use `location_type = 1`.  
* If `location_type = 1`, you **must not have** a `parent_station` (leave the field empty).  
* A stop or platform uses `location_type = 0`.  
* If a stop or platform is located within a station, use the unique `stop_id` of the station in the `parent_station` field;  
* Otherwise, the `parent_station` field is **optional** for standalone stops.  
* A boarding area is a specific zone within a stop expressed with `location_type = 4`.  
* If `location_type = 4`, you **must include** a `parent_station` with a `location_type = 0`.  
* An entrance or exit to a station is modelled with `location_type = 2`.  
* Every entrance or exit **must have** a `parent_station` with a `location_type = 1`.  
* A generic node is expressed with `location_type = 3`.  
* Each generic node **must have** a `parent_station` with a `location_type = 1`. 

### Common errors related to `parent_station`

Although station modelling is fairly straightforward, there is still room for error. The most common errors in station modelling usually relate to the `parent_station` field. When you validate your feed using the [Canonical GTFS Schedule Validator](https://gtfs-validator.mobilitydata.org/), you may receive one of the following error codes:

| Error code | What it means | How to fix it |
| :---- | :---- | :---- |
| [`station_with_parent_station`](https://gtfs-validator.mobilitydata.org/rules.html#station_with_parent_station-rule) | An entry in `stops.txt` with a `location_type = 1` has a `stop_id` or other value in the `parent_station` field. | Remove the `stop_id` or any value from the `parent_station` field. When `location_type = 1`, any value in `parent_station` is forbidden. |
| [`location_without_parent_station`](https://gtfs-validator.mobilitydata.org/rules.html#location_without_parent_station-rule) | An entry in `stops.txt` that should have a parent station `location_type = 2, 3 or 4` does not have a parent station listed. | Add the missing `stop_id` of the station or stop into the `parent_station` field, or change the `location_type`. |
| [`wrong_parent_location_type`](https://gtfs-validator.mobilitydata.org/rules.html#wrong_parent_location_type-rule) | The `parent_station` listed for an entry has the wrong `location_type`.  | Review the data. If an entry’s `location type = 4`, then the `parent_station` must have a `location_type = 0` or empty. If an entry’s `location_type = 0, 2, or 3`, then the `parent_station` must have a `location_type = 1`.  |
