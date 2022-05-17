# Participate

## Proposing an extension

GTFS is a community driven data format. Anyone can propose an extension as a new canonical feature of GTFS on the google/transit Github repository. To do this, a contributor must follow the Specification Amendment Process. There are some small differences between the Specification Amendment Processes for GTFS Schedule and its Realtime counterpart, so a complete read of the Specification Amendment Processes for GTFS Schedule and GTFS Realtime is required before proposing a change. 

Both processes broadly follow these regulations:

1. Create a git branch of the google/transit Github repository and update all relevant parts of the canonical documentation with the proposed changes.
2. With the git branch containing the proposed changes, create a pull request on google/transit.
3. Announce it to the rest of the GTFS community on the relevant Google Groups mailing list.
4. The GTFS community will likely have feedback on the proposed changes. Allow at least 7 days of discussion to happen on the pull request and create timely updates to the proposal based on community consensus reached in the discussion.
5. Anytime following the initial 7-day discussion period, the advocate of the pull request (i.e., the contributor who opened the pull request with the proposed changes) can call a vote.
6. Before calling the vote in the pull request discussion, at least one GTFS data producer and one GTFS data consumer should be implementing the proposed changes.
7. The voting period lasts a minimum of 7 full calendar days. Anyone can vote in favor (+1) or not in favor (-1) of the proposed changes.
8. The vote passes if there are at least 3 unanimous votes in favor.
9. If the vote does not pass, the advocate of the pull request can choose to abandon or continue work on the proposed changes to resolve the community consensus.

<hr>

## What are the advantages of adopting an extension in the canonical specification?

Having a standardized way to represent traveler information leads to an easier expansion of the service (a mobility service or a transit option) in a new city or country
A specification that includes more services allows interoperable transit options. This means that mobility service providers can use data from more mobility services to increase rider satisfaction, and that transit providers can have their service visible in more trip planning applications (more about the advantages of interoperability on interoperablemobility.org) 
There is a wide range of free and open source community-maintained tools based on the canonical specification

<hr> 

## Developing an extension and building consensus

GTFS is an open, international data standard used by a diverse geography and set of transit systems. This consensus-driven common language to encode transit schedules and realtime information is an amazing feat. However, broad adoption and diversity of scenarios means that proposing changes to the canonical documentation in order to model new features and rider scenarios comes with some challenges. Early consensus building and community collaboration are therefore key in the success of a GTFS extension and rider information. 

<hr>

## MobilityData’s process

MobilityData-led specifications are open projects that aim to extend and improve official mobility data formats (such as GTFS and GBFS). Transit agencies, software developers, and other stakeholders in the community actively participate in specification improvements and extension development.

MobilityData oversees these projects by monitoring the relevant debates, offering expertise, and directly managing extension proposals. We facilitate the creation, adoption, and extension of mobility data formats that are important to our members and that provide meaningful traveler information. Our process is as follows:

**Spark Management**	

A need for a specification improvement or extension is expressed by the community or by our team. MobilityData records this need and gives it a priority level according to our members’ interests.

**Needs Analysis and Scoping**

When the spark becomes a priority, MobilityData conducts a needs analysis that documents real-world use cases and helps with scoping the project. Our members and the community are consulted so we can consider related use cases.

**Data Model Drafting**

Once needs and scope are defined, MobilityData drafts one or several model options that will allow transcribing these real-world use cases into data. The model options are then submitted to the members and the community for feedback so they can select their prefered option.

**Seeking Implementations**	

When consensus has been reached on a model option, MobilityData gathers data producers and data consumers together to facilitate the first implementations, and to ensure that the project is reality-proof. A vote on the project is then held according to the specification amendment process.

**Specification Support**	

Once the project is adopted, MobilityData continues to provide support by creating training content around the project and by incorporating any new specifications in open tools such as data validators, grading schemes, or dataset repositories.
