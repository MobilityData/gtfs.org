
Fares (also known as Fares v2) is a [GTFS Schedule feature](https://gtfs.org/getting-started/features/overview/) that standardizes rider-facing fare information, allowing users to discover ticketing and pricing options based on the fare structures and conditions of each transit system and its connections.

Key Fares (v2) features include Fare Products, Fare Media, Route-based fares, Zone-based fares, Time-based fares, and Transfer rules.

GTFS Fares (v2) continues to evolve as a community-driven project, developed under the working name [GTFS-Fares v2](https://gtfs.org/community/extensions/fares-v2). For guidance on modeling experimental features, refer to [the full proposal document](https://share.mobilitydata.org/gtfs-fares-v2).  
Because GTFS maintains backward compatibility, Legacy Fares (v1) features can coexist with Fares (v2) without technical conflicts. However, implementing Fares (v2) is recommended to ensure future scalability and alignment with ongoing specification developments.

This guide will demonstrate how to model common fare structures using Fares (v2). We begin by introducing the fare features supported in Fares (v2) and the corresponding files used for each. Then, we present real-world examples that will be modeled in later sections.

## Fares features and their files

GTFS Fares (v2) can model various fare features found in common fare structures, including:

* Fare Products: is the type of fares (i.e. single-trip fare, monthly pass, transfer fees, etc.) offered by a transit agency to access a service.  
* Fare Media: defines the supported media that can be used to hold and/or validate a fare product (eg: cash, contactless, physical card, etc.).  
* Route-based Fares: is used to assign different fares for specific groups of routes, also known as route networks. Flat rate route-based fares are the most basic fares.  
* Zone-based Fares: is used to represent zone-based systems where a specific fare applies when traveling from one particular zone to another. A zone can be defined as a set of stops.  
* Time-based Fares: is used to assign fares for specific time-of-day or day-of-week, such as peak and off-peak fares and/or weekend fares.  
* Fare Transfers: are rules applicable when transferring between legs (or individual travel segments), they allow the calculation of a total journey cost that includes free or discounted transfers.  
* Rider Categories: is used to represent the different groups of riders, such as seniors, students, children, and adults,  eligible for specific fare rates based on their age, status, or needs. Trip planning applications can use this information to display the available categories and show the default fare set by the agency providing the feed.

For more detailed information on these features and the files included for each feature, check out the [Fares features page](https://gtfs.org/getting-started/features/fares/).

## Presenting the examples

To illustrate Fares (v2) modeling, we will use real-world transit agencies as examples. To keep the guide concise, we will focus on specific aspects of each agency's fare structure. Examples will be provided for one-way fare products, but the same process applies to daily and monthly passes.

Most examples will feature TransLink (Vancouver), as it incorporates most fare features modeled in Fares (v2). Additional examples include SEPTA (Philadelphia), Metro Transit (Minneapolis), and King County Metro.

Additional examples of agencies and the Fares (v2) files they use are shown in this UML diagram. 

<iframe width="768" height="432" src="https://miro.com/app/live-embed/uXjVLJOOnvI=/?moveToViewport=-6583,-1830,10145,4614\&embedId=162170563642" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen\></iframe>

### Translink (Vancouver):

Translink is the transit agency in Vancouver. As of November 2024, a slightly simplified of version their fares (found [here](https://www.translink.ca/transit-fares/pricing-and-fare-zones)) include:  

 

| Category | Details |
| ----- | ----- |
| **Fare Media** | \- **Cash**: Available for buses only; allows transfers between buses only. \- **Stored Value**: Compass Card, Compass Ticket. \- **Other**: Contactless payment cards, mobile wallets. |
| **Bus Fare** | Flat fare of **$3.20**. |
| **SkyTrain and SeaBus Fares** | **Zone-based fare** depending on the number of zones crossed. \- **Zone 1**: Vancouver. \- **Zone 2**: Burnaby, Richmond, North Vancouver. \- **Zone 3**: Surrey, Coquitlam. |
| **[Airport AddFare](https://www.translink.ca/transit-fares/transferring-and-addfare)** | \- An additional **$5** for SkyTrain trips originating from **Sea Island**. \- Travel between the three Sea Island stations is **free**. |
| **Weekend and Evening Fares** | \- All fares are **Zone 1** (bus flat rate of **$3.20**) from 6:30 PM to 3 AM and on weekends. \- AddFare remains.- The fares for journeys starting from Sea Island still have an additional fare. So from 6:30 PM to 3 AM and on weekends, their fare becomes 5 \+ 3.20 \= $8.20. |
| **[Transfers](https://www.translink.ca/transit-fares/transferring-and-addfare) (90 minutes)** | \- Transfer are only available for non-cash fare media \- Free between buses during this period. \- Free within the same fare zone supported by the fare. \- Additional fare (called AddFare) applies when transferring to higher fare zones \- The difference between the new higher fare and the previous lower fare is charged from the rider. Basically, the difference between both fares is ADDED to the initial price. |
| **Rider Categories** | Two rider categories: Adult: default category Concession (disabled, senior, youth). |

The West Coast Express is also zone-based (another set of zones). For simplicity, it will not be included. Nevertheless, its Zone-based Fares can be modeled in a similar manner to SkyTrain.

To keep the Translink examples brief, only the adult rider category will be modeled. The “concession” category will be mentioned in the section. [Rider Categories](?tab=t.0#heading=h.t649oe9dl7u6).

### SEPTA (Southern Pennsylvania \- Philadelphia)

SEPTA offers four [fare media](https://wwww.septa.org/fares/).

| Fare media | Properties |
| :---- | :---- |
| SEPTA Key | Covers up to two free transfers. |
| Key Tix | Covers one free transfer at most. |
| Contactless payments (cEMV) | Covers up to two free transfers. |
| Cash | No free transfers covered. |

The rider needs to use the same fare media to guarantee a number of free transfers.

SEPTA also allows a free interchange at three stations:

- 15th St/City Hall   
- 13th St   
- Drexel Station at 30th St. 

At those stations, a rider can transfer from two metro rides without paying an additional fare.

### Metro Transit (Minneapolis)

| Category | Details |
| ----- | ----- |
| [Fare discounts](https://www.metrotransit.org/fares)  | Trips that take place within downtown Minneapolis cost 0.50$ per trip, cheaper than the regular fare. |

### King County Metro \- Sound Transit \- Community Transit (Puget Sound \- Seattle)

| Category | Details |
| ----- | ----- |
| **Fare Media** | \- **ORCA Card** (allows transfers in most systems) \- GO Ticket \- Cash |
| **ORCA Fare** | The ORCA adult fare for a [King County Metro](https://kingcounty.gov/en/dept/metro/fares-and-payment/prices) (KCM) bus ride is 2.75$. The ORCA adult fare for the [1Line and 2Line light rail](https://www.soundtransit.org/ride-with-us/how-to-pay/fares) (Sound Transit) is 3$. The ORCA adult fare for a [Community Transit](https://www.communitytransit.org/fares-and-passes) bus ride is 2.5$ |
| **[Transfers](https://www.translink.ca/transit-fares/transferring-and-addfare) (90 minutes)** | ORCA allows for [seamless transfers for 2 hours](https://www.soundtransit.org/ride-with-us/know-before-you-go/transferring#:~:text=As%20long%20as%20you%20transfer,toward%20your%20ride%20on%20Link.) between multiple agencies operating in Puget Sound, including KCM, Community Transit and Sound Transit. A traveller using ORCA only pays the maximum leg fare of all legs considered in the whole journey. |
