# Other Resources

On-line courses, blog posts, and reports related to open transit data.

## On-line courses

- [World Bank - "Intro. to GTFS" online course](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping) - A free, online, self-paced course for learning about GTFS and GTFS-realtime.
- [Open Transit Data Toolkit](http://transitdatatoolkit.com/) - A series of lessons to help people utilize open transit data.
- [MBTA GTFS Onboarding](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) - An interactive tutorial created by MBTA for GTFS static. A [stand-alone Docker image](https://github.com/mbta/gtfs_onboarding) is available on GitHub as well as a [hosted/no-install version](https://mybinder.org/v2/gh/mbta/gtfs_onboarding/main?urlpath=lab/tree/GTFS_Onboarding.ipynb) of the Jupyter notebook.
- [Planetizen "Building a Transit Map Web App" course](https://courses.planetizen.com/course/building-transit-map-app) - A video tutorial on setting up your own web-based mapping application, with no coding experience required. 
- [GTFS-books](https://github.com/MobilityData/GTFS-books) - Comprehensive guides to GTFS and GTFS Realtime. These books were written by [Quentin Zervaas](https://github.com/HendX), and have been donated to [MobilityData](https://mobilitydata.org/) and made open access.


## Blog posts

- [When(ish) is my bus? Data and code](https://github.com/mjskay/when-ish-is-my-bus) - The data and code (R) behind Whenish is my bus? Data includes three days of historical vehicle positions and the survey results.
- ["Legacy AVL system? It's okay, join the club." by Kurt Raschke](https://kurtraschke.com/2015/01/legacy-avl-export) - Discussion of options for transforming legacy AVL system data into the GTFS-realtime format.
- ["GTFS Best Practices now available!" by Sean Barbeau](https://medium.com/@sjbarbeau/gtfs-best-practices-now-available-88ac67194233) - Discusses some of the challenges of an open data format like GTFS and the GTFS Best Practices that were launched in early 2017 to help address data quality.
- ["What's new in GTFS-realtime v2.0" by Sean Barbeau](https://medium.com/@sjbarbeau/whats-new-in-gtfs-realtime-v2-0-cd45e6a861e9) - Discuss the shortfalls in GTFS-realtime v1.0 and the improvements in v2.0.
- ["AVL, CAD, and Real-Time Passenger Info for Beginners" by Tony Laidig](http://transitdata.net/avl-cad-and-real-time-passenger-info-for-beginners/) - Provides a general introduction to technology used to track vehicles.
- ["Visualizing Better Transportation: Data & Tools" by Steve Pepple](https://medium.com/@stevepepple/visualizing-better-transportation-data-tools-e48b8317a21c) - A collection of transportation-related data and tools for the San Francisco Bay Area and other cities in North America, originally collected and discussed at a 2018 Transit Week Event at ARUP in San Francisco.
- ["How to use GTFS data to track transit vehicles in realtime" by Tom Camp](https://www.ably.io/blog/gtfs-data-track-transit-vehicles-realtime) - Using GTFS and GTFS Realtime to provide continuous realtime updates.

## Academic papers

- [Tang et al. - "Ridership effects of real-time bus information system: A case study in the City of Chicago"](https://www.sciencedirect.com/science/article/pii/S0968090X12000022) - Experiment in Chicago, IL showed modest increase in ridership when riders had access to real-time info via text message or email.
- [Kay et al. - "When(ish) is my bus? User-centered Visualizations of Uncertainty in Everyday, Mobile Predictive Systems"](http://faculty.washington.edu/jhullman/busUncertaintyVis.pdf) - Paper attempts to answr the question of "how do we communicate uncertainty in transit predictions?" Explains the problem, existing solutions and designs a [better interface for letting users know when to arrive at the bus stop](https://github.com/mjskay/when-ish-is-my-bus/blob/master/quantile-dotplots.md#quantile-dotplots).
- [Watkins et al. - "Where Is My Bus? Impact of mobile real-time information on the perceived and actual wait time of transit riders"](https://www.sciencedirect.com/science/article/pii/S0965856411001030) - Experiments in Seattl,e WA showed that riders perceived shorter bus wait times when they had access to real-time info via mobile apps.
- [Brakewood et al. - “An experiment evaluating the impacts of real-time transit information on bus riders in Tampa, Florida”](https://www.sciencedirect.com/science/article/pii/S0965856414002146) - Controlled experiment in Tampa, FL showed that riders with access to real-time info via mobile apps perceived nearly 2 minute reduction in wait times compared to riders without real-time info.  Riders with real-time info also had decreases in anxiety and frustration and better reception of agency.
- [Brakewood et al. - "The impact of real-time information on bus ridership in New York City"](https://www.sciencedirect.com/science/article/pii/S0968090X15000297) - Experiment in NYC showed that ridership increased on long routes when real-time info was made available to riders.
- [Brakewood and Watkins - "A literature review of the passenger benefits of real-time transit information"](https://www.tandfonline.com/doi/full/10.1080/01441647.2018.1472147?scroll=top&needAccess=true) (2018) - An overview of many different research studies looking at the benefits of real-time transit information.
- [Gramacki et al. - "gtfs2vec - Learning GTFS Embeddings for comparing Public Transport Offer in Microregions"](2021) - Methology using Uber's H3 spatial index and machine learning to identify areas of "similar" public transit service quality in cities. Source code available [on GitHub](https://github.com/pwr-inf/gtfs2vec).
- [Higgins et al. - "Calculating place-based transit accessibility: Methods, tools and algorithmic dependence" (2022)](https://doi.org/10.5198/jtlu.2022.2012) - Compares software tools for calculating accessibility by walking and public transit including ArcGIS Pro, Emme, R5R, and OpenTripPlanner.
- [Aemmer et al. - "Measurement and classification of transit delays using GTFS-RT data"](https://link.springer.com/article/10.1007/s12469-022-00291-7) - Presents a method for extracting transit performance metrics from a General Transit Feed Specification’s Real-Time (GTFS-RT) component and aggregating them to roadway segments. Used with [Transit Vis](https://github.com/zackAemmer/transit_vis), viewable [here](https://www.transitvis.com/).

## Government reports
- [APTA Policy Development and Research - Public Transportation Embracing Open Data](http://www.apta.com/resources/reportsandpublications/Documents/APTA-Embracing-Open-Data.pdf) - APTA's discussion of the benefits and challenges of open transit data (a short summary of the below TCRP report).
- [TCRP Synthesis 115 - Open Data: Challenges and Opportunities for Transit Agencies](http://onlinepubs.trb.org/Onlinepubs/tcrp/tcrp_syn_115.pdf) (2015) - A comprehensive report looking at the benefits and challenges of open transit data.
- [TCRP Research Report 213: Data Sharing Guidance for Public Transit Agencies – Now and in the Future](http://www.trb.org/Main/Blurbs/180188.aspx) (2020) - A report designed to help agencies make decisions about sharing their data, including how to evaluate benefits, costs, and risks.
- [TCRP G-16 Development of Transactional Data Specifications for Demand-Responsive Transportation (In progress)](http://apps.trb.org/cmsfeed/TRBNetProjectDisplay.asp?ProjectID=4120) - The objective of this research is to develop technical specifications for transactional data for entities involved in the provision of demand-responsive transportation.  Expected completion date is late 2018.

## Community-maintained lists
- [Vendors Providing GTFS Creation/Maintenance services](https://docs.google.com/spreadsheets/u/1/d/1Gc9mu4BIYC8ORpv2IbbVnT3q8VQ3xkeY7Hz068vT_GQ/pubhtml) - Add new vendors [here](http://goo.gl/forms/YDbPSPmufS).
- [Entities Providing Transportation Software Development Consulting Services](https://docs.google.com/spreadsheets/u/1/d/1n44CNMCK1vt1nyrsdYz-KD_hYxUMNIm6Me69M6ROBIg/pubhtml) - Add new entities [here](http://goo.gl/forms/cc6kcVERuP).

