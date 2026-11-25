# GTFS station modelling in practice

**The following examples illustrate a range of physical station configurations. It is recommended to model stations in your system using approaches consistent with these examples, in order to provide a reliable and intuitive passenger experience.**

## Use case 1: A bus terminal with multiple platforms and bays

### Terminus Longueuil (Longueuil, Canada)

Terminus Longueuil is one of the most active multimodal transit hubs in the Greater Montreal area. It acts as a critical interchange between the Montreal Metro network operated by the Société de transport de Montréal (STM) and several local and regional bus services operated by the Réseau de transport de Longueuil (RTL). 

<figure>
  <img 
    src="../../../../assets/fig-11_terminus-longueuil.jpeg" 
    alt="Google Earth aerial view of Terminus Longueuil showing multiple parallel bus platforms connected by covered walkways."
    width="750"
  >
  <figcaption>Figure 11: Aerial image of Terminus Longueuil (Source: Google Earth).</figcaption>
</figure>

#### Physical infrastructure

Terminus Longueuil is a multimodal terminal with two key infrastructure layers:

* Underground (Montreal Metro)  
    * A station with two side platforms serving the Yellow Line (not modelled in this example)  
* Ground level (Bus terminal)  
    * A central indoor waiting area (ticket counters, seating, information displays)  
    * Seven outdoor platforms (canonically labelled A through G)  
    * Over 30 designated boarding gates for local, suburban, and intermunicipal buses

All access to the platforms is strictly controlled through predefined entrances. Passengers cannot access bus platforms directly from the street.

#### Services and operators

Terminus Longueuil connects multiple services:

* 52 local routes from RTL  
* 25 suburban routes from Exo  
* Four intermunicipal routes from the Société de transport collectif (STC) de Pierre-De Saurel  
* Metro service from STM\*

\**In this example feed, the STM metro service is not included as the expectation is that the STM provides their information in a separate feed. See [Stations serving multiple providers/agencies](implementation-considerations.md#stations-serving-multiple-providersagencies) subsection for details.*

In total, over 80 bus routes use the terminal infrastructure daily as a stop on their journey.

<figure>
  <img 
    src="../../../../assets/fig-12_terminus-longueuil.jpeg" 
    alt="STM neighborhood map showing Terminus Longueuil, the Longueuil–Université-de-Sherbrooke metro station, and a 5-minute walking radius."
    width="750"
  >
  <figcaption>Figure 12: Official map of Terminus Longueuil (Source: STM).</figcaption>
</figure>

### GTFS modelling overview

This modelling focuses on the bus terminal infrastructure only, based on the GTFS feeds published by RTL and Exo. The STM metro service data is excluded. 

#### Defining the parent station

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | The parent station should preferably be located at the center of the building or area that encompasses the main facilities that users recognize as the station.  In this case, the parent station (`stop_id = 454-01`) coordinates correspond with the center of the bus terminal building where waiting areas and ticket counters are located.  This entry in `stops.txt` is assigned `location_type = 1`. |

<figure>
  <img 
    src="../../../../assets/fig-13_terminus-longueuil.jpeg" 
    alt="Satellite view of Terminus Longueuil bus platforms and adjacent buildings, with a callout box marking the parent station."
    width="750"
  >
  <figcaption>Figure 13: Aerial overview of Terminus Longueuil, with the parent station labelled (Source: Google Earth).</figcaption>
</figure>

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 454-01 | Terminus Longueuil | 45.52489 | \-73.522098 | 1 |  |  |  |

#### Defining the stops/platforms

| Subject | Recommended approach |
| :---- | :---- |
| **Stop location** | Seven entries in `stops.txt` represent bus platforms A to G (`location_type = 0`), all with Terminus Longueuil (`454-01`) as their `parent_station`. |
| **`stop_access` value** | Terminus Longueuil has dedicated access points; platforms and boarding areas are **not** directly accessible from the street network.  To model this, all platforms (`location_type = 0`) must have a value of `0` in the `stop_access` field. No other entries require a value in the `stop_access` field. |

<figure>
  <img 
    src="../../../../assets/fig-14_terminus-longueuil.jpeg" 
    alt="Satellite view of Terminus Longueuil with callout boxes marking the parent station and Platforms A through G."
    width="750"
  >
  <figcaption>Figure 14: Aerial overview of Terminus Longueuil, with the platforms labelled (Source: Google Earth).</figcaption>
</figure>

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 454-00-01 | Terminus Longueuil | 45.524527 | \-73.522007 | 0 | 454-01 | 0 | A |
| 454-00-02 | Terminus Longueuil | 45.524076 | \-73.521745 | 0 | 454-01 | 0 | B |
| 454-00-03 | Terminus Longueuil | 45.523641 | \-73.521893 | 0 | 454-01 | 0 | C |
| 454-00-04 | Terminus Longueuil | 45.523607 | \-73.520852 | 0 | 454-01 | 0 | D |
| 454-00-05 | Terminus Longueuil | 45.524027 | \-73.520821 | 0 | 454-01 | 0 | E |
| 454-00-06 | Terminus Longueuil | 45.524525 | \-73.520531 | 0 | 454-01 | 0 | F |
| 454-00-07 | Terminus Longueuil | 45.524046 | \-73.522624 | 0 | 454-01 | 0 | G |

#### Defining the entrance/exit points

In the official documentation for Terminus Longueuil, entrance and exit points are called “access points,” not to be confused with `stop_access`. Leave the `stop_access` field empty for these access points.

| Subject | Recommended approach |
| :---- | :---- |
| **Entrance/exit data** | Five entries are included in `stops.txt` to represent the terminal’s entrances and exits. These entries have `location_type = 2` and use the `stop_id` of  Terminus Longueuil (`454-01`) as the `parent_station`. |

<figure>
  <img 
    src="../../../../assets/fig-15_terminus-longueuil.jpeg" 
    alt="Satellite view of Terminus Longueuil with callout boxes marking the parent station and Access Points 1 through 5."
    width="750"
  >
  <figcaption>Figure 15: Aerial overview of Terminus Longueuil, with the access points labelled (Source: Google Earth).</figcaption>
</figure>

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 454-02-01 | Access 1  | 45.525191 | \-73.521961 | 2 | 454-01 |  |  |
| 454-02-02 | Access 2  | 45.524631 | \-73.521989 | 2 | 454-01 |  |  |
| 454-02-03 | Access 3  | 45.524711 | \-73.522632 | 2 | 454-01 |  |  |
| 454-02-04 | Access 4  | 45.523496 | \-73.521336 | 2 | 454-01 |  |  |
| 454-02-05 | Access 5  | 45.523657 | \-73.522801 | 2 | 454-01 |  |  |

#### Defining the boarding platforms

In the official documentation for Terminus Longueuil, the boarding platforms are referred to as “gates.” 

| Subject | Recommended approach |
| :---- | :---- |
| **Boarding location** | An additional 36 entries represent the individual boarding areas or gates (`location_type = 4`) on these platforms. Each boarding area has the corresponding platform's `stop_id` as its `parent_station`. |

<figure>
  <img 
    src="../../../../assets/fig-16_terminus-longueuil.jpeg" 
    alt="Satellite view of Terminus Longueuil with callout boxes marking Platform B and Gates 10 through 17."
    width="750"
  >
  <figcaption>Figure 16: Aerial overview of Platform B - Terminus Longueuil, with the boarding platforms (gates) labelled (Source: Google Earth).</figcaption>
</figure>

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 454-04-10 | Gate 10 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-11 | Gate 11 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-12 | Gate 12 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-13 | Gate 13 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-14 | Gate 14 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-15 | Gate 15 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-16 | Gate 16 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-17 | Gate 17 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |

### Complete sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 454-01 | Terminus Longueuil | 45.52489 | \-73.522098 | 1 |  |  |  |
| 454-00-01 | Terminus Longueuil | 45.524527 | \-73.522007 | 0 | 454-01 | 0 | A |
| 454-00-02 | Terminus Longueuil | 45.524076 | \-73.521745 | 0 | 454-01 | 0 | B |
| 454-00-03 | Terminus Longueuil | 45.523641 | \-73.521893 | 0 | 454-01 | 0 | C |
| 454-00-04 | Terminus Longueuil | 45.523607 | \-73.520852 | 0 | 454-01 | 0 | D |
| 454-00-05 | Terminus Longueuil | 45.524027 | \-73.520821 | 0 | 454-01 | 0 | E |
| 454-00-06 | Terminus Longueuil | 45.524525 | \-73.520531 | 0 | 454-01 | 0 | F |
| 454-00-07 | Terminus Longueuil | 45.524046 | \-73.522624 | 0 | 454-01 | 0 | G |
| 454-02-01 | Access 1  | 45.525191 | \-73.521961 | 2 | 454-01 |  |  |
| 454-02-02 | Access 2  | 45.524631 | \-73.521989 | 2 | 454-01 |  |  |
| 454-02-03 | Access 3  | 45.524711 | \-73.522632 | 2 | 454-01 |  |  |
| 454-02-04 | Access 4  | 45.523496 | \-73.521336 | 2 | 454-01 |  |  |
| 454-02-05 | Access 5  | 45.523657 | \-73.522801 | 2 | 454-01 |  |  |
| 454-04-01 | Gate 1 \- Terminus Longueuil |  |  | 4 | 454-00-07 |  |  |
| 454-04-02 | Gate 2 \- Terminus Longueuil |  |  | 4 | 454-00-07 |  |  |
| 454-04-03 | Gate 3 \- Terminus Longueuil |  |  | 4 | 454-00-07 |  |  |
| 454-04-04 | Gate 4 \- Terminus Longueuil |  |  | 4 | 454-00-07 |  |  |
| 454-04-05 | Gate 5 \- Terminus Longueuil |  |  | 4 | 454-00-07 |  |  |
| 454-04-06 | Gate 6 \- Terminus Longueuil |  |  | 4 | 454-00-01 |  |  |
| 454-04-07 | Gate 7 \- Terminus Longueuil |  |  | 4 | 454-00-01 |  |  |
| 454-04-08 | Gate 8 \- Terminus Longueuil |  |  | 4 | 454-00-01 |  |  |
| 454-04-09 | Gate 9 \- Terminus Longueuil |  |  | 4 | 454-00-01 |  |  |
| 454-04-10 | Gate 10 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-11 | Gate 11 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-12 | Gate 12 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-13 | Gate 13 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-14 | Gate 14 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-15 | Gate 15 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-16 | Gate 16 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-17 | Gate 17 \- Terminus Longueuil |  |  | 4 | 454-00-02 |  |  |
| 454-04-18 | Gate 18 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-19 | Gate 19 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-20 | Gate 20 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-21 | Gate 21 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-23 | Gate 23 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-24 | Gate 24 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-25 | Gate 25 \- Terminus Longueuil |  |  | 4 | 454-00-03 |  |  |
| 454-04-26 | Gate 26 \- Terminus Longueuil |  |  | 4 | 454-00-04 |  |  |
| 454-04-27 | Gate 27 \- Terminus Longueuil |  |  | 4 | 454-00-04 |  |  |
| 454-04-29 | Gate 29 \- Terminus Longueuil |  |  | 4 | 454-00-04 |  |  |
| 454-04-30 | Gate 30 \- Terminus Longueuil |  |  | 4 | 454-00-04 |  |  |
| 454-04-31 | Gate 31 \- Terminus Longueuil |  |  | 4 | 454-00-04 |  |  |
| 454-04-32 | Gate 32 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-33 | Gate 33 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-34 | Gate 34 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-35 | Gate 35 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-36 | Gate 36 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-37 | Gate 37 \- Terminus Longueuil |  |  | 4 | 454-00-05 |  |  |
| 454-04-39 | Gate 39 \- Terminus Longueuil |  |  | 4 | 454-00-06 |  |  |

## Use case 2: A multimodal elevated railway station with bus platforms on street level

### Malden Center station (Malden, United States)

Malden Center is a well-connected multimodal station in the Greater Boston region. It provides access to the Orange Line (subway), the Haverhill Line (Commuter Rail), and several local bus routes. All services are consolidated under the Massachusetts Bay Transportation Authority (MBTA).

<figure>
  <img 
    src="../../../../assets/fig-17_malden-center.jpeg" 
    alt="Satellite view of Malden Center station showing the elevated rail tracks, busway, parking lots, and surrounding urban neighborhood."
    width="750"
  >
  <figcaption>Figure 17: Aerial image of Malden Center station (Source: Google Earth).</figcaption>
</figure>

#### Physical infrastructure

Malden Center is a multimodal station with a combination of elevated and ground-level infrastructure:

* Elevated: Shared platform area for the MBTA Orange Line and Haverhill Commuter Rail line.  
    * West side: Two Orange Line tracks with a single island platform.  
    * East side: One Haverhill Line track with a single side platform.  
* Ground level:	  
    * Station building with ticket machines, elevators, escalators, and stairs.  
    * Street-level bus loop with multiple curbside stops on the east side.	  
    * On-street bus stop on the west side.

Access to the train platform is controlled via fare gates located inside the station building. Bus services, however, are accessed directly from the street without gated entry.

#### Services and operators

Malden Center connects multiple transit services, all operated by the MBTA:

* Subway service on the Orange Line  
* Commuter rail service on the Haverhill Line  
* 12 local bus routes

In total, over ten transit routes serve Malden Center daily, making it a key node in the MBTA network for both local and regional travel.

### GTFS modelling overview

This modelling includes the station infrastructure serving both the subway and commuter rail on elevated platforms, as well as adjacent bus platforms at street level. All services are managed by MBTA and represented within a single GTFS feed.

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | The parent station should preferably be located at the center of the building or area that encompasses the main facilities that users recognize as the station. In this case, the parent station (`stop_id = 10700`) coordinates correspond to the center of the station building below the platform area. |
| **Stop location** | Three entries in `stops.txt` (`stop_id = 10700a01` to `10700a03`) represent the bus platforms at street level, two on the east side of the station and one on the west side. Three additional entries are included to represent the train platforms on the elevated section of the station, two corresponding to the Orange Line platforms (`stop_id = 10700b01` and `10700b02`) and another one for the single Commuter Rail platform (`stop_id = 10700c01`). All of these have `location_type = 0` and `parent_station = 10700`. |
| **Entrance/exit data** | Three entries are included in `stops.txt` (`stop_id = 10700z01` to `10700z03`) to represent the station’s entrances and exits. These entries have `location_type = 2` and share the same `parent_station` (`10700`) as the platforms. |
| **`stop_access` value** | The station has designated access points; rail platforms are located inside the station and thus, are not directly accessible from the street network. The recommended modelling approach is to assign a `stop_access` value of `0` to the rail platforms in the station. For the bus platforms accessible from the street, assign a `stop_access` value of `1`. |
| **Pathways data** | It is recommended to include Pathways information for internal station areas, especially to connect rail platforms in elevated sections to all station entrances and exits. This can be done using `pathways.txt` entries to enhance navigation within the station. Bus platforms with direct street access can generally be connected via the street network and may not require corresponding Pathways entries. |
| **Separate GTFS feeds** | Not applicable. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-18_malden-center.jpeg" 
    alt="Aerial map of Malden Center station, with GTFS callouts marking the central parent station, six stops across the metro, commuter rail, and bus platforms, and three entrances."
    width="750"
  >
  <figcaption>Figure 18: Aerial overview of Malden Center, with the parent station, platforms, entrances and exits labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 10700 | Malden Center | 42.426632 | \-71.07411 | 1 |  |  |
| 10700a01 | West Bus Platform \- Malden Center | 42.426729 | \-71.074659 | 0 | 10700 | 1 |
| 10700a02 | East Bus Platform 2 \- Malden Center | 42.426507 | \-71.073919 | 0 | 10700 | 1 |
| 10700a03 | East Bus Platform 1 \- Malden Center | 42.426565 | \-71.074107 | 0 | 10700 | 1 |
| 10700b01 | Forest Hills Platform \- Orange Line \- Malden Center | 42.426677 | \-71.074381 | 0 | 10700 | 0 |
| 10700b02 | Oak Grove Platform \- Orange Line \- Malden Center | 42.426662 | \-71.074314 | 0 | 10700 | 0 |
| 10700c01 | Track 1 (All Trains) \- Commuter Rail \- Malden Center | 42.426632 | \-71.07411 | 0 | 10700 | 0 |
| 10700z01 | Commercial St access 1 \- Malden Center | 42.426814 | \-71.073983 | 2 | 10700 |  |
| 10700z02 | Commercial St access 2 (ramp) \- Malden Center | 42.42689 | \-71.073987 | 2 | 10700 |  |
| 10700z03 | Pleasant St access \- Malden Center | 42.42688 | \-71.074355 | 2 | 10700 |  |

## Use case 3: Multiple outdoor bus stops with the same name at a road intersection

### Shijo Kawaramachi (Kyoto, Japan)

This bus station in Kyoto consists of eight boarding and alighting locations (stops) that share the same stop name.

#### Physical infrastructure

* The stops are distributed around the intersection of two roads.   
* Each stop is assigned a distinct bus bay identifier (A–H).   
* Conceptually, all stops belong to a single bus station. All stops are outdoor and located at ground level.

#### Services and operators

* Multiple bus routes operated by the Kyoto Municipal Transportation Bureau serve different bus bays.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Locate the parent station at the center of the bus stop group. |
| **Stop location** | Locate individual stops at the location of each bus stop pole. |
| **Entrance/exit data** | Not applicable. |
| **`stop_access` value** | All stops are accessible via the street network. Therefore, assign `stop_access = 1` for all stops. |
| **Pathways data** | Not applicable. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-19_shijo-kawaramachi.jpeg" 
    alt="Satellite view of the Shijo Kawaramachi intersection with callout boxes marking the parent station and eight street-level bus stops (Platforms A through H) along the surrounding avenues."
    width="750"
  >
  <figcaption>Figure 19: Aerial overview of Shijo Kawaramachi, with the parent station and stops labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 005-01 | Shijo Kawaramachi | … | … | 1 |  |  |  |
| 005-01-01 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | A |
| 005-01-02 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | B |
| 005-01-03 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | C |
| 005-01-04 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | D |
| 005-01-05 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | E |
| 005-01-06 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | F |
| 005-01-07 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | G |
| 005-01-08 | Shijo Kawaramachi | … | … | 0 | 005-01 | 1 | H |

## Use case 4: An underground railway station with the main building on the ground level

### Glen Park station (San Francisco, United States)

#### Physical infrastructure

* Platforms and rail operations are located underground.  
* A clearly identifiable main station building is present at ground level.  
* An outdoor area surrounding the building is enclosed by walls or fencing, and is clearly part of the station premises.

#### Services and operators

* The station serves three Bay Area Rapid Transit (BART) subway lines.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Because the station has a clearly defined, single above-ground station building, it is recommended to locate the parent station at the center of this building. |
| **Stop location** | Locate stops based on the center of each underground platform, projected vertically to ground level. |
| **Entrance/exit data** | Since the station area is clearly delineated by fences or walls, it is recommended to model entrances at the points where riders enter the station premises. |
| **`stop_access` value** | All platforms are only accessible via station entrances. Therefore, `stop_access = 0`. |
| **Pathways data** | As the station is operated by a single agency, it is recommended to model pathways connecting entrances to platforms. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-20_glen-park.jpeg" 
    alt="Aerial map of Glen Park station with GTFS callouts marking the central parent station, two platforms to the north, and three entrances along the west and south sides."
    width="750"
  >
  <figcaption>Figure 20: Aerial overview of Glen Park station, with the parent station, platforms, entrances and exits labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 400-01 | Glen Park | … | … | 1 |  |  |  |
| 400-00-01 | Glen Park | … | … | 0 | 400-01 | 0 | 1 |
| 400-00-02 | Glen Park | … | … | 0 | 400-01 | 0 | 2 |
| 400-02-01 | Entrance | … | … | 2 | 400-01 |  |  |
| 400-02-02 | Entrance | … | … | 2 | 400-01 |  |  |
| 400-02-03 | Entrance | … | … | 2 | 400-01 |  |  |

## Use case 5: A railway station with a main building and a direct platform access entrance

### Gouda station (Gouda, Netherlands)

#### Physical infrastructure

* The main station building is located on the south side, and platforms can be accessed via entrances of this building.  
* An outdoor entrance on the north side also provides direct access to the platforms.  
* All entrances are connected to the platforms via an underground passage. The station contains a total of five platforms.

<figure>
  <img 
    src="../../../../assets/fig-21_gouda.jpeg" 
    alt="Schematic layout map of Gouda station showing tracks, platforms, underground pedestrian passage, entrances, and surrounding bus, bike, and taxi facilities."
    width="750"
  >
  <figcaption>Figure 21: Layout map of Gouda station, showing platforms (tracks 3, 5, 8, 10, and 11), the underground passage, and station entrances (Source: Nederlandse Spoorwegen).</figcaption>
</figure>

#### Services and operators

* The railway station serves multiple rail lines operated by Nederlandse Spoorwegen.  
* Adjacent to the main station building are outdoor bus bays providing bus services operated by Qbuzz and U-OV.  
* For this use case, it is assumed that the railway station and the bus station are modelled in separate GTFS feeds. 

### GTFS modelling overview

The modelling scope here focuses only on the railway station. Bus bays near the railway station are not included.

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Because the station has a clearly defined above-ground station building, it is recommended to locate the parent station at the center of this building. |
| **Stop location** | Locate stops on the center of each platform. |
| **Entrance/exit data** | The station premises are clearly separated from the street network by the main building and fare gates; it is recommended to model entrances at the points where riders enter the station premises. |
| **`stop_access` value** | All platforms are only accessible via station entrances. Therefore, `stop_access = 0`. |
| **Pathways data** | As the station is operated by a single agency, it is recommended to model pathways connecting entrances to platforms. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-22_gouda.jpeg" 
    alt="Aerial map of Gouda station, with GTFS callouts marking one parent station, five platforms, and two entrances."
    width="750"
  >
  <figcaption>Figure 22: Aerial overview of Gouda station, with the parent station, platforms, and entrances labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 500-01 | Gouda | … | … | 1 |  |  |  |
| 500-00-03 | Gouda | … | … | 0 | 500-01 | 0 | 3 |
| 500-00-05 | Gouda | … | … | 0 | 500-01 | 0 | 5 |
| 500-00-08 | Gouda | … | … | 0 | 500-01 | 0 | 8 |
| 500-00-10 | Gouda | … | … | 0 | 500-01 | 0 | 10 |
| 500-00-11 | Gouda | … | … | 0 | 500-01 | 0 | 11 |
| 500-02-01 | Entrance | … | … | 2 | 500-01 |  |  |
| 500-02-02 | Entrance | … | … | 2 | 500-01 |  |  |

## Use case 6: An underground subway station

### Uruguai / Tijuca station (Rio de Janeiro, Brazil)

#### Physical infrastructure

* The primary station structure is located underground.  
* Surface-level elements consist only of entrance-related structures.  
* There are five defined entrances, each identified by an entrance label and name. These defined entrances correspond to multiple physical access points (e.g., staircase, escalator, elevator).  
* Entrances D and E have separate, one-way access points for entry and exit.

#### Services and operators

* The station serves Lines 1 and 4 operated by the Rio de Janeiro Metro.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Locate the parent station at the center of all stops. |
| **Stop location** | Locate stops based on the center of each underground platform, projected vertically to ground level. |
| **Entrance/exit data** | Although there are five defined entrances based on entrance labels, it is recommended to model each physical access point as a separate entrance (i.e., stairs and elevators should be represented individually). |
| **`stop_access` value** | All platforms are only accessible via station entrances. Therefore, `stop_access = 0`. |
| **Pathways data** | Since the station is operated by a single agency, it is recommended to model pathways connecting entrances to platforms. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-23_uruguai-tijuca.jpeg" 
    alt="Aerial map of Uruguai / Tijuca station, with GTFS callouts marking one parent station, two platforms, and eleven street-level entrances."
    width="750"
  >
  <figcaption>Figure 23: Aerial overview of Uruguai / Tijuca station, with the parent station, platforms, entrances and exits labelled (Source: Google Earth).</figcaption>
</figure>

<figure>
  <img 
    src="../../../../assets/fig-24_uruguai-tijuca.jpeg" 
    alt="Zoomed-in aerial view of Entrance D along the sidewalk, showing covered entry stairs, a central elevator shaft, and a covered exit escalator arranged in a row."
    width="750"
  >
  <figcaption>Figure 24: Close-up aerial view of Entrance D (Acesso D) at Uruguai / Tijuca station, showing its separate street-level access points—stairs for entry, elevator, and escalator for exit (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 600-01 | Uruguai / Tijuca | … | … | 1 |  |  |  |
| 600-00-01 | Uruguai / Tijuca | … | … | 0 | 600-01 | 0 | 1 |
| 600-00-02 | Uruguai / Tijuca | … | … | 0 | 600-01 | 0 | 2 |
| 600-02-01 | ACESSO A – ITACURUÇÁ | … | … | 2 | 600-01 |  |  |
| 600-02-02 | ACESSO A – ITACURUÇÁ | … | … | 2 | 600-01 |  |  |
| 600-02-03 | ACESSO B – URUGUAI | … | … | 2 | 600-01 |  |  |
| 600-02-04 | ACESSO C – DONA DELFINA | … | … | 2 | 600-01 |  |  |
| 600-02-05 | ACESSO C – DONA DELFINA | … | … | 2 | 600-01 |  |  |
| 600-02-06 | ACESSO D – JOSÉ HIGINO | … | … | 2 | 600-01 |  |  |
| 600-02-07 | ACESSO D – JOSÉ HIGINO | … | … | 2 | 600-01 |  |  |
| 600-02-08 | ACESSO D – JOSÉ HIGINO | … | … | 2 | 600-01 |  |  |
| 600-02-09 | ACESSO E – CONDE DE BONFIM | … | … | 2 | 600-01 |  |  |
| 600-02-10 | ACESSO E – CONDE DE BONFIM | … | … | 2 | 600-01 |  |  |
| 600-02-11 | ACESSO E – CONDE DE BONFIM | … | … | 2 | 600-01 |  |  |

### Additional notes

In cases like Entrance D, where multiple physical access points share the same entrance label, it is recommended to model each access point separately. Pathways data can then be used to represent directionality (e.g., entry-only or exit-only stairs/escalators) as well as elevator accessibility, enabling more precise routing for passengers.

## Use case 7: A railway station located in the median of a roadway

### Guelatao station (Mexico City, Mexico)

#### Physical infrastructure

* The railway platforms are located in the median of a major roadway. Passengers can only access the platforms via pedestrian bridges from either side of the road.  
* These pedestrian bridges provide access exclusively to the station platforms, and their entrances are marked with clear metro signage.  
* An island platform serves trains in both directions.

#### Services and operators

* This metro station serves Line A operated by Metro de la Ciudad de México.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Place the parent station at the center of the island platform. |
| **Stop location** | Position stops (platforms) at the center point of each platform for the two directions on the island platform structure. |
| **Entrance/exit data** | The pedestrian bridge entrances are clearly marked as station access points and provide access exclusively to the station structure. Place entrances at the bridge access points. |
| **`stop_access` value** | All platforms are only accessible via station entrances. Therefore, `stop_access = 0`. |
| **Pathways data** | As platforms are only accessible via entrances, and the station is operated by a single agency, it is recommended to model pathways connecting entrances to platforms. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-25_guelatao.jpeg" 
    alt="Aerial map of Guelatao station, with GTFS callouts marking the central parent station and two platforms inside a median, connected via an overpass to two entrances on opposite sides."
    width="750"
  >
  <figcaption>Figure 25: Aerial overview of Guelatao station, with the parent station, platforms, and entrances labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 700-01 | Guelatao | … | … | 1 |  |  |  |
| 700-00-01 | Guelatao | … | … | 0 | 700-01 | 0 |  |
| 700-00-02 | Guelatao | … | … | 0 | 700-01 | 0 |  |
| 700-02-01 | Entrance | … | … | 2 | 700-01 |  |  |
| 700-02-02 | Entrance | … | … | 2 | 700-01 |  |  |

### Additional notes

Although the station uses an island platform and does not assign separate platform codes for each direction, it is still recommended to model stops for each direction separately.

## Use case 8: Bidirectional tram and bus stops in a shared roadway lane

### Schaufelbergerstrasse (Zürich, Switzerland)

#### Physical infrastructure

* The station is located along a roadway where light rail and bus services share lanes in both directions.  
* Boarding locations (poles) for light rail and bus services are physically separate, but all stops are located within the same area and share a common name, forming a single conceptual station.  
* All boarding locations are directly accessible from the street network.

#### Services and operators

* The station is served by light rail and bus routes operated by members of the Zürcher Verkehrsverbund (ZVV) network.  
* Light rail and bus routes may be operated by different operators within the network.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Place the parent station at the center of all stops. |
| **Stop location** | Place stops at the boarding locations (poles) for each light rail and bus service in both directions. |
| **Entrance/exit data** | Not applicable. |
| **`stop_access` value** | All stops are directly accessible from the street network. Therefore, `stop_access = 1`. |
| **Pathways data** | Not applicable. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-26-schaufelbergerstrasse.jpeg" 
    alt="Aerial map of Schaufelbergerstrasse, with GTFS callouts marking one central parent station and six street-level stops across the intersection."
    width="750"
  >
  <figcaption>Figure 26: Aerial overview of Schaufelbergerstrasse, with the parent station and stops labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 800-01 | Schaufelbergerstrasse | … | … | 1 |  |  |  |
| 800-00-01 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |
| 800-00-02 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |
| 800-00-03 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |
| 800-00-04 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |
| 800-00-05 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |
| 800-00-06 | Schaufelbergerstrasse | … | … | 0 | 800-01 | 1 |  |

### Additional notes

The sample data above assumes a GTFS feed integrating multiple operators (i.e., one provided by ZVV). If feeds are provided separately by individual operators, each feed should only model the stops relevant to its own services. For example, a light rail operator would not need to model bus stops. All other modelling approaches remain the same.

## Use case 9: Ground level bus stops only accessible from underground paths 

### Yokohama Station West Gate (Yokohama, Japan)

#### Physical infrastructure

* A bus terminal featuring 15 bus bays, situated on the west side of Yokohama Station.  
* All bus bays are located at ground level; however, riders cannot directly access these stops from the street network. Instead, access is strictly routed through underground pedestrian passages.  
* These underground passages can be reached from multiple street-level entrances. The underground pedestrian structure is highly extensive.

#### Services and operators

* The 15 bus bays are shared by Yokohama Municipal Bus and several other bus operators, serving a wide variety of routes.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Place the parent station (`location_type = 1`) at the center of all bus bays. |
| **Stop location** | Locate individual stops (`location_type = 0`) at the exact location of each physical bus stop pole. If a specific transit operator (the data producer) only operates out of a subset of the 15 bus bays rather than the entire terminal, they should only include those specific bays in their feed. |
| **Entrance/exit data** | Because all stops are inaccessible from the street network, entrances (`location_type = 2`) should be modeled at the pedestrian access points around the bus terminal that lead down into the underground passages. While the underground pedestrian network is highly extensive, extending all the way to the east side of Yokohama Station, it is recommended for this use case to only model the entrances immediately surrounding the bus terminal area. |
| **`stop_access` value** | All stops are only accessible via the station's underground entrances. Therefore, assign `stop_access = 0` for all stops. |
| **Pathways data** | It is recommended **not** to model underground pathways data at this time. Because the bus terminal is shared by multiple transit operators, each independently modelling pathways would likely cause data consumer confusion. Furthermore, individual operators may lack the administrative authority to model or verify these shared underground spaces. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-27_yokohama.jpeg" 
    alt="Aerial map of Yokohama Station West Gate, with GTFS callouts marking one central parent station, fifteen bus bay stops across the plaza, and nine entrances around the surrounding streets."
    width="750"
  >
  <figcaption>Figure 27: Aerial overview of Yokohama Station West Gate, with the parent station, bus bays, and entrances labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 900-01 | Yokohama Station West Gate | … | … | 1 |  |  |  |
| 900-00-01 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 1 |
| 900-00-02 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 2 |
| 900-00-03 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 3 |
| 900-00-04 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 4 |
| 900-00-05 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 5 |
| … | … | … | … | … | … | … | … |
| 900-00-11 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 11 |
| … | … | … | … | … | … | … | … |
| 900-00-15 | Yokohama Station West Gate | … | … | 0 | 900-01 | 0 | 15 |
| 900-02-01 | Entrance | … | … | 2 | 900-01 |  |  |
| 900-02-02 | Entrance | … | … | 2 | 900-01 |  |  |
| 900-02-03 | Entrance | … | … | 2 | 900-01 |  |  |
| 900-02-04 | Entrance | … | … | 2 | 900-01 |  |  |
| 900-02-05 | Entrance | … | … | 2 | 900-01 |  |  |
| 900-02-06 | Entrance | … | … | 2 | 900-01 |  |  |
| … | … | … | … | … | … |  |  |
| 900-02-09 | Entrance | … | … | 2 | 900-01 |  |  |

## Use case 10: A transit hub with ferry, commuter rail, metro, and bus service 

### Waterfront Station (Vancouver, Canada)

#### Physical infrastructure

* Waterfront Station is an integrated transit complex containing the following boarding and alighting locations:  
    * One ground-level platform serving the West Coast Express (commuter rail).  
    * Two platforms serving the Expo Line (metro), designated as Platforms 1 and 2\.  
    * Two platforms serving the Canada Line (metro), designated as Platforms 3 and 4\.  
    * Three curbside bus bays located on the adjacent street network, designated as Bays 1 to 3\.  
    * One SeaBus (passenger ferry) waiting hall.  
* Except for the three on-street bus bays, which are directly reachable from the street network, all other platforms and boarding locations require riders to pass through the station building to access them. These transit modes are interconnected by indoor corridors specifically for rider transfers.  
* All of these boarding locations are prominently named "Waterfront Station" in the real world, and riders perceive them as a single, unified station.

#### Services and operators

* All services at Waterfront Station are overseen and branded under TransLink, the regional transit authority, functioning as a single cohesive multimodal hub.

### GTFS modelling overview

| Subject | Recommended approach |
| :---- | :---- |
| **Parent station location** | Locate the parent station (`location_type = 1`) at the center of the station's above-ground building structure. |
| **Stop location** | Position individual stops and platforms (`location_type = 0`) as follows: <ul><li>**Expo & Canada Lines:** Place a stop at the center of the platform for each direction on both lines (Platforms 1 and 2 for the Expo Line, and Platforms 3 and 4 for the Canada Line).</li> <li>**West Coast Express:** Place the stop at the center of the train platform.</li> <li>**SeaBus:** Place the stop at the passenger boarding and alighting area of the ferry terminal dock.</li> <li>**Bus:** Place individual stops at the exact location of each physical bus stop pole on the street.</li></ul> |
| **Entrance/exit data** | Model entrances (`location_type = 2`) at the physical access points of the station’s above-ground building. This includes the main entrance on the south side (near the bus bays and metro lines) and the north entrance (close to the SeaBus ferry terminal). |
| **`stop_access` value** | Because all rail and ferry platforms lie inside the station structure and are only reachable through station entrances, assign `stop_access = 0` to these platforms.  For the three outdoor on-street bus bays, which can be accessed directly from the open street network, assign `stop_access = 1`. |
| **Pathways data** | Because the entire station complex is consolidated and branded under TransLink, it is recommended to model pathways connecting the entrances and platforms to support seamless in-station navigation. |

### Station layout

<figure>
  <img 
    src="../../../../assets/fig-28_waterfront.jpeg" 
    alt="Aerial map of Waterfront station, with GTFS callouts marking the central parent station, nine stops across the metro, rail, ferry, and street-level bus platforms, and four entrances."
    width="750"
  >
  <figcaption>Figure 28: Aerial overview of Waterfront Station, with the parent station, platforms, bus bays, and entrances labelled (Source: Google Earth).</figcaption>
</figure>

### Sample GTFS data

| stop\_id | stop\_name | stop\_lat | stop\_lon | location\_type | parent\_station | stop\_access | platform\_code |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| 1000-01 | Waterfront Station | … | … | 1 |  |  |  |
| 1000-00-01 | Waterfront Station | … | … | 0 | 1000-01 | 0 | 1 |
| 1000-00-02 | Waterfront Station | … | … | 0 | 1000-01 | 0 | 2 |
| 1000-00-03 | Waterfront Station | … | … | 0 | 1000-01 | 0 | 3 |
| 1000-00-04 | Waterfront Station | … | … | 0 | 1000-01 | 0 | 4 |
| 1000-00-05 | Waterfront Station | … | … | 0 | 1000-01 | 0 |  |
| 1000-00-06 | Waterfront Station | … | … | 0 | 1000-01 | 1 |  |
| 1000-00-07 | Waterfront Station | … | … | 0 | 1000-01 | 1 |  |
| 1000-00-08 | Waterfront Station | … | … | 0 | 1000-01 | 1 |  |
| 1000-00-09 | Waterfront Station | … | … | 0 | 1000-01 | 0 |  |
| 1000-02-01 | Entrance | … | … | 2 | 1000-01 |  |  |
| 1000-02-02 | Entrance | … | … | 2 | 1000-01 |  |  |
| 1000-02-03 | Entrance | … | … | 2 | 1000-01 |  |  |
| 1000-02-04 | Entrance | … | … | 2 | 1000-01 |  |  |