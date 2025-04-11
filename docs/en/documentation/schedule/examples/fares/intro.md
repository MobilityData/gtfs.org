# Introduction

Fares (also known as Fares v2) is a [GTFS Schedule feature](../../../../../getting-started/features/overview) that standardizes rider-facing fare information, allowing users to discover ticketing and pricing options based on the fare structures and conditions of each transit system and its connections.

Key Fares (v2) features include Fare Products, Fare Media, Route-based fares, Zone-based fares, Time-based fares, and Transfer rules.

GTFS Fares (v2) continues to evolve as a community-driven project, developed under the working name [GTFS-Fares v2](../../../../../community/extensions/fares-v2). For guidance on modeling experimental features, refer to [the full proposal document](https://share.mobilitydata.org/gtfs-fares-v2). While GTFS maintains backward compatibility, adopting Fares v2 over Legacy Fares (v1) is recommended to ensure future scalability and alignment with ongoing specification developments.

This guide will demonstrate how to model common fare structures using Fares (v2). We begin by introducing the fare features supported in Fares (v2) and the corresponding files used for each. Then, we present real-world examples that will be modeled in later sections.

## Fares features and their files

GTFS Fares (v2) can model various fare features found in common fare structures.

| Feature | Description | Associated Files |
| :---- | :---- | :---- |
| [**Fare Media**](http://../../../../../getting-started/features/fares/#fare-media)<br>(see [example](../fare-media))| The supported media that can be used to hold and/or validate a fare product (eg: cash, contactless, physical card, etc.). | `fare_media.txt`, `fare_products.txt` |
| [**Fare Products**](../../../../../getting-started/features/fares/#fare-products)<br>(see [example](../fare-products)) | The type of fares (i.e. single-trip fare, monthly pass, transfer fees, etc.) offered by a transit agency to access a service. | `fare_products.txt` |
| [**Rider Categories**](../../../../../getting-started/features/fares/#rider-categories)<br>(see [example](../rider-categories)) | Represents the different groups of riders, such as seniors, students, children, and adults, eligible for specific fare rates based on their age, status, or needs. Trip planning applications can use this information to display the available categories and show the default fare set by the agency providing the feed. | `rider_categories.txt`, `fare_products.txt` |
| [**Route-based Fares**](../../../../../getting-started/features/fares/#route-based-fares)<br>(see [example](../route-based-fares)) | Assigns different fares for specific groups of routes, also known as route networks. Flat rate route-based fares are the most basic fares. | `fare_products.txt`, `fare_leg_rules.txt`, `networks.txt`, `route_networks.txt` |
| [**Zone-based Fares**](../../../../../getting-started/features/fares/#zone-based-fares)<br>(see [example](../zone-based-fares)) | Represents zone-based systems where a specific fare applies when traveling from one particular zone to another. A zone can be defined as a set of stops. | `fare_products.txt`, `fare_leg_rules.txt`, `areas.txt`, `stop_areas.txt` |
| [**Time-based Fares**](../../../../../getting-started/features/fares/#time-based-fares)<br>(see [example](../time-based-fares)) | Assigns fares for specific time-of-day or day-of-week, such as peak and off-peak fares and/or weekend fares. | `fare_products.txt`, `fare_leg_rules.txt`, `timeframes.txt` |
| [**Fare Transfers**](../../../../../getting-started/features/fares/#fare-transfers)<br>(see [example](../fare-transfers)) | Rules applicable when transferring between legs (or individual travel segments). They allow the calculation of a total journey cost that includes free or discounted transfers. | `fare_products.txt`, `fare_leg_rules.txt`, `fare_transfer_rules.txt` |


For more detailed information on these features and the files included for each feature, check out the [Fares features page](../../../../../getting-started/features/fares).

### Relations between files

The Entity-Relationship Diagram (ERD) diagram below describes how Fares (v2) files work together.

<iframe width="768" height="432" src="https://miro.com/app/embed/uXjVIHu_Wws=/?pres=1&frameId=3458764623400726374&embedId=111450801270" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

## Presenting the examples

To illustrate Fares (v2) modeling, we will use real-world transit agencies as examples. To keep the guide concise, we will focus on specific aspects of each agency's fare structure. Examples will be provided for one-way fare products, but the same process applies to daily and monthly passes.

This guide contains examples from the following transit systems:

* TransLink (Vancouver)  

### Translink (Vancouver)

Translink is a public transit agency in Vancouver. As of November 2024, Vancouver uses a zone-based fare system (more information can be found [here](https://www.translink.ca/transit-fares/pricing-and-fare-zones)), some of its elements used in this guide are summarized in the following table:  

| Category | Details |
| ----- | ----- |
| **Fare Media** | - **Cash** <br>- **Compass Ticket** (Paper ticket) <br>- **Compass Card** (Physical transit card) <br>- **Contactless payment cards** and **mobile wallets** |
| **Bus Fare** | Flat fare of **CAD 3.20**. |
| **Daily pass** | - Costs **CAD 11.50** for buses and all zones. <br>- Valid **only on Compass Card or Compass Ticket**. |
| **SkyTrain and SeaBus Fares** | **Zone-based fare** depending on the number of zones crossed. <br>- **Zone 1**: Vancouver. <br>- **Zone 2**: Burnaby, Richmond, North Vancouver. <br>- **Zone 3**: Surrey, Coquitlam. |
| **[Airport AddFare](https://www.translink.ca/transit-fares/transferring-and-addfare)** | - An additional  **CAD 5.00** for SkyTrain trips originating from **Sea Island**. <br>- Travel between the three Sea Island stations is **free**. |
| **Weekend and Evening Fares** | - All fares are **Zone 1** (bus flat rate of **CAD 3.20**) from 6:30 PM to 3:00 AM and on weekends. <br>- The fares for journeys starting from Sea Island still have an additional fare. So from 6:30 PM to 3:00 AM and on weekends, their fare becomes 5.00 + 3.20 = CAD 8.20. |
| **[Transfers](https://www.translink.ca/transit-fares/transferring-and-addfare)** | - **90 minute transfers** are only available for **non-cash fare media**  <br>- **Free between buses** during this period. <br>- **Free within the same fare zone** supported by the fare. <br>- **Additional fare** (called AddFare) applies when **transferring to higher fare zones**  <br>- The difference between the new higher fare and the previous lower fare is charged from the rider. Basically, the difference between both fares is ADDED to the initial price. |
| **Rider Categories** | **Adult** and **Concession** categories. <br>- Adult is the default category. <br>- Disabled, senior, & youth riders are represented by the concession category. |

The West Coast Express is also zone-based (another set of zones). For simplicity, it will not be included. Nevertheless, its Zone-based Fares can be modeled in a similar manner to SkyTrain.

This guide mentions only the Adult category in TransLink sections, except in the [Rider Categories](../rider-categories) section, which also includes the Concession category.

## Glossary

The tables below present the concepts of commonly used terms in this guide and in Fares related discussions.

| Concept | Description |
| :---- | :---- |
| Leg | A single continuous segment of a journey taken on a specific service or route, typically between two stops, with no transfer. |
| Sub-journey | Two or more legs that comprise a subset of a journey.  |
| Journey | Overall travel from origin to destination, including all legs and transfers in between.  |

<img class="center" width="1200" height="100%" src="../../../../../../assets/glossary-journey-abcd.svg"> 

| Concept | Description |
| :---- | :---- |
| Leg Group | A set of one or more legs that share specific common attributes or fare conditions as defined in the context of the `fare_leg_rules.txt` file. |
| Fare leg rule | Fare eligibility criteria to complete travel on a single leg or effective fare leg, following filter conditions. |
| Network | A group of routes that have similar fare structure for the purpose of matching fare leg. A network of routes can be: All the routes of an agency. Routes of the same mode (e.g. subways, buses). Routes of a similar purpose (e.g. Rural, urban). |
| Fare zones | Areas used to determine pricing based on travel between or within zones. Fare zones can be defined in GTFS as areas (sets of stops). |
| Timeframe | A defined period during which a specific fare applies (e.g., weekdays from 6am to 9am, rush hour, weekends). |
| Timeframe group | A collection of timeframes that are treated similarly for fare rules or pricing (e.g., all off-peak hours). |
| Fare transfer rule | Transfer eligibility for a transfer cost between legs, following filter conditions. |
| Effective Fare Leg | A sub-journey of two or more legs that should be treated as a single leg for the purposes of matching against rules in `fare_leg_rules.txt` for the purposes of fare calculation. |
| Filter conditions | Constraints or variables of travel that determine an available cost of a fare leg rule, fare product, or fare transfer rule. |