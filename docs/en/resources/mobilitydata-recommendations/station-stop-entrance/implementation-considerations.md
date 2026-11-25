# Implementation considerations

When modelling a station from real-life data, there are a few considerations to keep in mind that can complicate matters.

## Conceptual station information

The station (`location_type = 1`) and stop hierarchy can be used to model what **riders** perceive as a conceptual station. A conceptual station typically exhibits the following characteristics:

* Stops share identical or highly similar names (regardless of mode).  
* Stops share a common platform or bay numbering scheme (e.g., 1–4 or A–D, regardless of mode), rather than separate sequences.  
* When some or all stops are located within transit-controlled areas, pedestrian movement between those stops—and between stops and entrances—primarily occurs within these controlled spaces, rather than via the general street network.  
* Transfers between stops can be completed within a reasonable walking time.

Consistently and appropriately modelling such conceptual stations using a station-stop hierarchy provides several benefits:

* Service alerts can be applied at the station level when appropriate, rather than needing to target each stop individually.  
* A cleaner and more intuitive user experience in map visualization and station search.

In addition, by correctly modelling `stop_access` values (in combination with Pathways data), it remains possible to support accurate pedestrian routing within the station.

However, the station-stop hierarchy should **not** be used to group stops that do not meet the characteristics listed above, as they represent separate stations from the rider's perspective.

### Examples of stations that should not be grouped:

#### **1\. Hamburg Hauptbahnhof, Hauptbahnhof Nord, Hauptbahnhof Süd, Hauptbahnhof/ZOB, ZOB Hamburg \[DE\]**

As shown in the figure below, there are multiple stations in the vicinity of Hamburg Central Station that contain "Hauptbahnhof" in their names, including:

* Hamburg Hauptbahnhof: The main railway station operated by Deutsche Bahn (DB).  
* Hauptbahnhof Nord: The northern U-Bahn station, which is connected to Hamburg Hauptbahnhof via underground pedestrian passages.  
* Hauptbahnhof Süd: The southern U-Bahn station, also connected to Hamburg Hauptbahnhof via underground pedestrian passages.  
* ZOB Hamburg (Zentraler Omnibusbahnhof / Central Bus Station): A bus terminal with a distinct, independent building structure. Transfers between ZOB and Hamburg Hauptbahnhof must be made via the outdoor street network.  
* Hauptbahnhof/ZOB: On-street bus stops located near the ZOB terminal, consisting of multiple boarding and alighting locations (stops).

<figure>
  <img 
    src="../../../../assets/fig-03_hamburg.jpeg" 
    alt="Aerial map marking five locations in red circles: Hamburg Hauptbahnhof at center, Nord to the top left, Süd below, and Hauptbahnhof/ZOB and ZOB Hamburg to the bottom right."
    width="700"
  >
  <figcaption>Figure 3: Overview of Hamburg Hauptbahnhof and its surrounding transit hubs (Source: Google Earth).</figcaption>
</figure>

Although Hamburg Hauptbahnhof, Hauptbahnhof Nord, and Hauptbahnhof Süd are physically connected by underground pedestrian passages, they are perceived by riders as separate stations due to their distinct names (Nord and Süd). Furthermore, they do not share a common platform or entrance/exit numbering schemes. Therefore, these three stations should not be modelled under a single station-stop hierarchy.

Similarly, ZOB Hamburg does not share a common station structure with Hamburg Hauptbahnhof and requires transfers via the public street network; it should be modelled as an independent station.

The on-street bus stops at Hauptbahnhof/ZOB also use a different name from the ZOB terminal, and these stops are not included in the platform or bay numbering scheme of the ZOB.

In summary, grouping these various stations under a single parent station is inappropriate. However, because each of these facilities contains multiple platforms or individual boarding locations, defining a separate station-stop hierarchy for each of them is the recommended approach.

#### **2\. Okayama Station, Okayama Station East Gate, Okayama Station West Gate, Okayama Station Front \[JP\]**

As shown in the figure below, there are multiple stations in the vicinity of Okayama Station that contain "Okayama Station" in their names, including:

* Okayama Station: The JR railway station serving conventional lines and the Shinkansen.  
* Okayama Station Nishiguchi (West Gate): A bus station on the west side of Okayama Station, containing multiple boarding and alighting locations (stops).  
* Okayama Station Higashiguchi (East Gate): A bus station on the east side of Okayama Station, containing multiple boarding and alighting locations (stops).  
* Okayama Station Ekimae (Front): On-street tram stops and bus stops located adjacent to Okayama Station.

<figure>
  <img 
    src="../../../../assets/fig-04_okayama.jpeg" 
    alt="Aerial map marking four locations in red circles: Okayama Station at center-left, West Gate above it, East Gate below it, and Okayama Station Front to the bottom right."
    width="700"
  >
  <figcaption>Figure 4: Overview of Okayama Station and its surrounding bus and tram stops (Source: Google Earth).</figcaption>
</figure>

Similar to the previous examples of Hamburg's Nord and Süd stations, although all these facilities contain "Okayama Station" in their names, the name suffixes are fundamentally designed to help riders distinguish between these separate transit locations. Furthermore, they do not share a common platform or bay numbering scheme, and transfers between these facilities require riders to exit the stations and traverse the general street network.

Therefore, it is appropriate to model each of these stations with its own independent station-stop hierarchy, rather than grouping them all under a single parent station.

#### **3\. Larkspur (train station), Larkspur (ferry terminal) \[US\]**

<figure>
  <img 
    src="../../../../assets/fig-05_larkspur.jpeg" 
    alt="Aerial map marking four transit points: Larkspur train station, 600 Larkspur Landing Circle bus stop, E Sir Francis Drake Blvd & Larkspur Landing bus stop, and Larkspur ferry terminal."
    width="700"
  >
  <figcaption>Figure 5: Overview of Larkspur Landing and its surrounding train, bus, and ferry connections (Source: Google Earth).</figcaption>
</figure>

As shown in the figure above, both the Larkspur train station and Larkspur ferry terminal reside in this area, sharing the identical name "Larkspur." However, they are separated by a physical distance and require transfers via the general street network. From the rider's perspective, they are perceived as separate, distinct stations.

Therefore, they should not be all grouped under a single station-stop hierarchy (parent station). Similarly, adjacent bus stops containing "Larkspur" in their names should also be modelled separately.

!!! note 
    Not all ferry terminals sharing a name with other transit modes must be modelled separately; see [Use case 10: Waterfront Station](station-modelling-in-practice.md#use-case-10-a-transit-hub-with-ferry-commuter-rail-metro-and-bus-service) for a contrasting case of an integrated multimodal station.

#### **4\. Hongo-sanchome \[JP\]**

There are two subway stations in this area named "Hongo-sanchome," operated by Tokyo Metro and Toei Subway. These two stations share the identical name and share an entrance numbering sequence.

<figure>
  <img 
    src="../../../../assets/fig-06_hongo-sanchome.jpeg" 
    alt="Diagram of Hongo-sanchome Station detailing floor levels, exits, and the ground-level transfer between the Marunouchi and Toei Oedo lines."
    width="700"
  >
  <figcaption>Figure 6: Overview of Hongo-sanchome Station (Source: Tokyo Metro).</figcaption>
</figure>

However, their physical station structures are completely independent, with no underground pedestrian connection. Transferring passengers must "exit" one station, walk via the general street network, and then "enter" the other station. Furthermore, their platform numbering sequences are also independent.

Because of their independent station structures, even though they are located in close proximity and share the same name, riders still perceive them as two separate stations. Therefore, they should be modelled separately with their own independent station-stop hierarchies.

!!! note
    If the two stations were connected by an underground passage, and modelled within an integrated feed containing both transit agencies, it would be appropriate to group them under a single parent station since riders would perceive the facility as a single station.

## Routing behavior and entrances

In the case of a standalone stop (`location_type = 0`), trip planners typically rely on the street network to guide passengers to the stop. Because a stop is defined as “a location where passengers board or disembark from a transit vehicle,” trip planners generally navigate users to the nearest accessible point on the street network. In most situations, this results in a path that aligns with user expectations.

However, in environments with physical constraints, such as buildings, walls, elevated structures or underground structures, this behaviour can lead to suboptimal or even incorrect routing. In the example shown below, a bus stop’s coordinates are closest to a street segment on the northwest side of a building, so the trip planner directs passengers to that location. In reality, the building structure blocks access from that street, and the suggested approach also routes pedestrians onto a highway onramp where they are not allowed, making it impossible to reach the stop using the suggested approach.

<figure>
  <img 
    src="../../../../assets/fig-07_ikebukuro.jpeg" 
    alt="Google Maps screenshot illustrating incorrect routing, where a dotted pedestrian route erroneously follows a highway ramp beside a building to reach a bus stop."
    width="700"
  >
  <figcaption>Figure 7: Incorrect routing in Google Maps when explicit access point data is unavailable.</figcaption>
</figure>

<figure>
  <img 
    src="../../../../assets/fig-08_ikebukuro.jpeg" 
    alt="Google Street View image showing an enclosed highway onramp with no-pedestrian signs."
    width="700"
  >
  <figcaption>Figure 8: Street-level view showing that physical barriers and a restricted highway onramp prevent pedestrian access to the bus stop from the suggested street (Source: Google Maps).</figcaption>
</figure>

By modelling entrances, trip planners can instead guide passengers to an appropriate access point before routing them to the stop. When Pathways data is available, it can further support navigation from the entrance to the stop. In this approach, passengers are first directed to the building entrance, and then guided to the stop (the boarding location).

<figure>
  <img 
    src="../../../../assets/fig-09_ikebukuro.jpeg" 
    alt="Google Maps screenshot illustrating improved routing, where passengers are first directed to the building entrance to reach the bus stop."
    width="700"
  >
  <figcaption>Figure 9: Improved pedestrian routing in Google Maps when explicit access point data is available.</figcaption>
</figure>

It is important to note that the current specification defines an entrance as “a location where passengers can enter or exit a station from the street.” Accordingly, trip planners will typically route passengers to the nearest street-accessible point associated with the entrance. **Therefore, locations that are not reachable from the street network in practice, such as an “entrance” within a shared indoor or underground facility, should not be modelled as entrances in GTFS. This situation commonly arises in large complexes shared by multiple agencies.**

## Entrance location

Given the definition of an entrance, a natural follow-up question is where the boundary lies between the street network and GTFS Pathways data. In other words, where entrances should be placed. This boundary is closely related to the extent and coverage of the underlying street network.

In practice, different public transit trip planners rely on different sources of street network data. Even when using the same data source, coverage may vary across regions of the world. These realities make it difficult to establish a single, precise, and universally applicable definition of this boundary.

That said, the methods used to collect and produce street network data are not arbitrary. They are typically based on approaches such as crowd-sourcing, aerial or satellite imagery, or vehicle-/pedestrian-based data collection. Based on these characteristics, the following considerations are recommended when determining entrance locations:

* **Aerial visibility of the area**  
  If an area is not visible from above (e.g., within enclosed building structures), it is less likely to be represented in street network data (e.g., OpenStreetMap or commercial maps). Such areas should generally be treated as part of the “internal station space” modeled using GTFS Pathways, with entrances placed at the interface to the street network.  
* **Pedestrian network completeness in open-air spaces**  
  Conversely, even if an area is aerially visible, such as an outdoor plaza or transit courtyard, street network data may lack detailed or functional pedestrian routing paths traversing the space. If the public street network does not provide seamless routing up to the physical station doors, or if the plaza serves as a dedicated access zone to the transit facility, it is recommended to treat this open-air space as internal to the station. In such cases, entrances should be placed at the outer perimeter where the plaza meets the public street network, with GTFS Pathways used to model pedestrian navigation across the plaza to the station structure.  
* **Clear inclusion within station premises**  
  If an area is clearly part of the station—such as an outdoor space enclosed by walls or fences, especially with visible transit signage—it is recommended to treat this area as internal to the station. Entrances should be placed at the point where passengers enter this defined station boundary. Similarly, areas that require payment (e.g., fare-controlled areas) should also be considered part of the internal station space. Whenever possible, Pathways information—or at least entrances and exits—should be defined in such cases.  
* **Exclusivity of use by transit passengers**  
  Consider whether the area is primarily or exclusively used by transit passengers. For example, an entrance to a pedestrian bridge that only leads to a bus island platform may be treated differently from a bridge that provides general access to multiple non-transit destinations.

## Entrance granularity

For stations with designated entrance numbering or labelling schemes, a single identifier typically corresponds to a specific station "access point." In these cases, it is recommended to model each numbered entrance as a distinct entrance entity (`location_type = 2`) in GTFS, regardless of the physical distance between them.

At some stations, multiple physical access points may be grouped under the same entrance label or number, as seen in [Use case 6: Uruguai / Tijuca](station-modelling-in-practice.md#use-case-6-an-underground-subway-station). In such scenarios, it is still recommended to model these distinct access points as separate, individual entrances in `stops.txt`.

However, if physical access points are co-located but connected to different transit infrastructure via parallel pathway modes (e.g., a parallel staircase and escalator at the same location), or if these identically labelled access points are in very close physical proximity (i.e., within a 10-meter diameter), it is recommended to consolidate and model them as a single entrance (`location_type = 2`), connecting it to the individual access points using detailed Pathways data (as shown in the image below). When the physical distance between access points exceeds 10 meters, modelling them as separate entrances remains the recommended approach.

<figure>
  <img 
    src="../../../../assets/fig-10_seattle.jpeg" 
    alt="3D station diagram showing a single entrance node labeled 'International District Station Entrance B southwest' with lines branching out to connect the surrounding access points."
    width="700"
  >
  <figcaption>Figure 10: Example of consolidating co-located physical access points into a single entrance node (International District Station Entrance B southwest) (Source: Sound Transit).</figcaption>
</figure>

## Role of `stop_access` in station modelling

You may have noticed another field called `stop_access`. This is a new field adopted into GTFS as of September 2025\. 

The field models how a rider can access a stop in simple binary terms: 

* 0 \- The stop or platform cannot be accessed from the street network; a rider can only reach the stop or platform through a station.  
* 1 \- The stop or platform can be accessed from the street network independent of any station.

Since the access only applies to a stop, this field **must** be left empty if `location_type = 1, 2, 3 or 4`.

## Stop name and platform code

The `stop_name` field is a key element in helping passengers identify transit locations. To support a consistent and intuitive travel experience, `stop_name` in GTFS data should be consistent with the name that passengers encounter in the real world (e.g., on station signage, building facades, or bus stop poles), as well as names published through agency websites and other official sources.

However, a stop may also include a bay or platform identifier. In this case, it is advised to use the `platform_code` field:

* **Recommended Practice**  
  In the `stop_name` field, include only the station or stop name. Provide the bay or platform identifier in the `platform_code` field. This approach improves readability and enables trip planners to present and translate information more effectively.  
  > **Example**: `stop_name = Central Station` / `platform_code = A`  
* **Acceptable Practice**  
  In the `stop_name` field, include both the station name and the bay or platform identifier, leaving `platform_code` empty.  
  > **Example**: `stop_name = Central Station Platform A` / `platform_code = empty`  
* **Bad Practice**  
  In the `stop_name` field, the stop name and platform name are both present, and `platform_code` is filled. This practice provides redundant information, which can be confusing to downstream applications and reduce readability for riders.  
  > **Example**: `stop_name = Central Station Platform A` / `platform_code = A`

## Stations serving multiple providers/agencies

Stations may sometimes serve multiple agencies or service providers. Terminus Longueuil in Quebec, Canada is one such example, which we describe in more detail in [Use case 1](station-modelling-in-practice.md#use-case-1-a-bus-terminal-with-multiple-platforms-and-bays). In this scenario, the Société de transport de Montréal (STM) operates the metro service leading to and from the station. Above ground, the Réseau de transport de Longueuil (RTL) operates the bus services: two different service providers, one station. 

Since GTFS does not currently support cross-feed referencing, stations serving multiple providers can be modelled using one of two approaches: an integrated single-feed model or separate agency feeds. The selection depends on the institutional and technical coordination between the involved agencies.

If multiple agencies are represented within a single consolidated feed, the entire facility should be modeled as a single entity. If the station meets the criteria for station-stop hierarchy modelling (see [Conceptual station information](#conceptual-station-information)), all platforms, entrances, and pathways should be linked to a single `parent_station` to provide a seamless navigation experience for the user.

When agencies maintain independent feeds, proactive coordination is important. It is recommended that service providers align their modelling practices to ensure data compatibility. Note that the consuming application is responsible for consolidating the composite information into its user-facing interface.

Terminus Longueuil is our first use case in the next section, where the RTL and STM maintain separate GTFS feeds. Since the bus network utilizes the station as a primary hub, the RTL would take responsibility for modelling the bus terminal infrastructure, while the STM remains responsible for the modelling of the Yellow Line.

This division of labour allows both agencies to maintain independent feeds that, when combined by a consuming application, can provide a seamless experience for commuters transferring between the bus and metro networks.

**These considerations are not absolute rules, but they can help guide consistent and practical decisions about station modelling in most scenarios.**