# Pathways and Physical accessibility

## Why Display Accessibility Information?

**Impacts a large percentage of the population:** The World Health Organization estimates that [16% of people worldwide have a disability](https://www.who.int/news-room/fact-sheets/detail/disability-and-health) and that people with disabilities “find inaccessible and unaffordable transportation 15 times more difficult than for those without disabilities”. Persons with disabilities also have [higher rates of acquiring new health conditions](https://www.who.int/publications/i/item/9789240063600), partially due to reduced access to care and services.

**It's important to them:** Riders need up-to-date and accurate information about their transit options. Many agencies already use the General Transit Feed Specification (GTFS) to represent route, schedule, and stop location information that is critical to riders in planning their trips and understanding their options. For riders with accessibility needs, knowing the accessibility of a stop or vehicle is just as important as knowing the location. These riders need to know about every part of their trip to ensure they don’t get stranded somewhere or realize too late that they won’t be able to make it to their final stop.

**It may be the law:** Depending on your location, local or national law may require that you provide equal access and opportunity to people with disabilities. The following are some sources you may want to consider:

* **United States:** The [Americans and Disabilities Act (ADA)](https://www.ada.gov/topics/intro-to-ada/#public-transit) and [Section 504](https://www.dol.gov/agencies/oasam/centers-offices/civil-rights-center/statutes/section-504-rehabilitation-act-of-1973) of the Rehabilitation Act of 1973
* **Japan:** The Japan Ministry of Land, Infrastructure, Transport and Tourism Law for Promoting Easy Mobility and Accessibility for the Aged and Disabled (“[Barrier-Free Law](https://www.mlit.go.jp/sogoseisaku/barrierfree/index.html)”)
* **European Union:** [Employment, Social Affairs & Inclusion](https://ec.europa.eu/social/main.jsp?catId=1485&langId=en)

## Accessibility Checklist

The following are the steps needed to add accessibility information to your data. The next sections provide more detailed information on  each step. 
* Step 1: Add wheelchair accessibility information to `stops.txt`
* Step 2: Add wheelchair accessibility information to `trips.txt`
* Step 3: Add audio navigation information to `stops.txt`
* Step 4: Add physical accessibility information about transit stations with GTFS Pathways

## Adding Wheelchair Accessibility in GTFS

You may already be familiar with the structure of GTFS as a series of .txt files. Wheelchair accessibility can be displayed by updating two fields: `wheelchair_boarding` in `stops.txt` and `wheelchair_accessible` in `trips.txt`.

**Wheelchair accessibility in stops.txt**   
The field `wheelchair_boarding` in `stops.txt` allows you to indicate whether wheelchair boarding is possible from the specified location.

[Reference: stops.txt](../../reference/#stopstxt)

When this field is left empty, no accessibility information is displayed. This leaves riders unsure about accessibility and not able to tell if wheelchair boarding is actually not possible or if the information is just missing. Even if wheelchair boarding is not available, it is best to fill in that information to make it clear to riders and allow them to plan their trip with accurate information.

**Wheelchair accessibility in trips.txt**   
The field `wheelchair_accessible` in `trips.txt` allows you to indicate whether the vehicle being used for a specific trip can accommodate a wheelchair.

[Reference: trips.txt](../../reference/#tripstxt)

Like `wheelchair_boarding`, when this field is left empty, no accessibility information is displayed. Even if the vehicle is not wheelchair accessible, it is still best to fill in that information to make it clear to riders and allow them to plan their trip with accurate information.

## Adding Audio Navigation Aids

Text-to-speech is another way to increase the accessibility of your GTFS. Accurate text-to-speech information ensures that riders using assistive technology to read text aloud are getting the right information. This information can be included in your GTFS by updating `tts_stop_name` in `stops.txt` to correspond to each `stop_name`. Each stop within your GTFS should have a text-to-speech disambiguation that spells out the stop phonetically so it can be pronounced correctly. 

[Examples: Text-to-Speech](../../examples/text-to-speech)

While `tts_stop_name` is currently the only text-to-speech field officially adopted within the GTFS spec, other fields have been discussed and may be added. These include `tts_agency_name`, `tts_route_short_name`, `tts_route_long_name`, `tts_trip_headsign`, `tts_trip_short_name`, and `tts_stop_headsign`.

Riders will need to use an app that supports text-to-speech functionality, in order to benefit from this information. Some apps, such as [NaviLensGo](https://www.navilens.com/en/), are designed specifically to assist riders with vision impairments to navigate stations and find the right vehicle. 
 
## Adding Physical Accessibility Information about a Station

GTFS-Pathways is a component of GTFS that represents transit station details. It allows riders to understand whether they will be able to make a required transfer at a transit station. 

GTFS-Pathways adds the files `pathways.txt` and `levels.txt` as well as adding the `location_type` field in `stops.txt` to link together the information described in `pathways.txt`. 

<img class="center" src="../../../../assets/pathways-visual.jpg">

### Describe the location of station entrances and exits

With GTFS, it is possible to accurately describe stations using information on entrances and station interiors. This example describes sections of Waterfront Station in downtown Vancouver. The station is part of the city’s Skytrain network and is served by the Canada Line, the Expo Line, the SeaBus, and the West Coast Express. Three street level entrances allow riders to enter and exit the station. The rest of the station is underground, with a concourse level for fare validation and a lower level with platforms. 

First, the location of the station and its entrances are defined in [stops.txt](../../reference/#stopstxt):

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
12034,Waterfront Station,49.285687,-123.111773,1,,
90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2
```

In the file above, the first record pertains to the station location, hence, the `location_type` is set to `1`. The other five pertain to the three station entrances (five records are needed since the Granville entrance actually has three separate entrances, a stairway, an escalator, and an elevator). These five records are defined as entrances since the `location_type` is set to `2`.

Additionally, the `stop_id` for Waterfront Station is listed under `parent_station` for the entrances to associate them with the station. The accessible entrances have `wheelchair_boarding` set to `1` and the non-accessible ones are set to `2`. 

### Describe stairs and escalators

The entrance to Waterfront Station at Granville street has an elevator, an escalator, and stairs, the entrances are defined as nodes above in [stops.txt](../../reference/#stopstxt). To connect the entrances to inner sections of the station, additional nodes have to be created in [stops.txt](../../reference/#stopstxt) under the `parent_station` of Waterfront Station. In the [stops.txt](../../reference/#stopstxt) file below, generic nodes (`location_type 3`) that correspond to the bottom of the staircase and escalator are defined.

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
...
95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,
```

<img class="center" src="../../../../assets/pathways.png" width=700px>

Next, the file [pathways.txt](../../reference/#pathwaystxt) is used to link nodes to create pathways, where the first record links the nodes pertaining to the top and bottom of the stairs. The `pathway_mode` is set to `2` to indicate stairs, and the last field describes that passengers can go both ways (up and down) on the stairs. 

Similarly, the second record describes the escalator (`pathway_mode` set to `4`). Since escalators can only move in one direction, the field `is_bidirectional` is set to `0`, hence the escalator moves one way, from node `96` to `91` (upwards).

[**pathways.txt**](../../reference/#pathwaystxt)

```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
stairsA,90,95,2,1
escalatorA,96,91,4,0
```

### Describe elevators and pathways

The elevator at Granville street brings passengers to a pathway at the concourse level where the escalator and the stairs end. The elevator at the surface level is already defined as a station entrance above (`stop_id` `92`). Hence, the elevator door at the concourse level also needs to be defined. 

Additionally, as shown in the figure below, there is an underground walkway that connects the bottom of the stairs, escalator, and elevator at Granville street to the main station building. Therefore, two additional nodes are created to define the walkway sections.

<img class="center" src="../../../../assets/pathways-2.png" width=500px>

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
…
97,Underground walkway turn,49.286253,-123.112660,3,12034,
98,Underground walkway end,49.286106,-123.112428,3,12034,
99,Elevator_concourse,49.285257,-123.114163,3,12034,
```

<img class="center" src="../../../../assets/pathways-3.png" width=500px>

Lastly, the nodes are connected together to define the underground pathway as shown in the file [pathways.txt](../../reference/#pathwaystxt) below:

[**pathways.txt**](../../reference/#pathwaystxt)

```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
underground_walkway1,99,96,1,1
underground_walkway2,96,95,1,1
underground_walkway3,95,97,1,1
underground_walkway4,97,98,1,1
```

## Future Additions to GTFS-Pathways

While the core specification of GTFS-Pathways has been completely integrated into GTFS, there is recognition that additional accessibility information could be modeled and would be useful to riders. This includes information such as text-to-speech instructions, wheelchair assistance information, equipment-failure reporting, planned or scheduled entrance or exit closures, and elevator and escalator outages. You can find more about the remaining parts of it [in this document](http://bit.ly/gtfs-pathways).