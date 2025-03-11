# Roles and Responsibilities

The community is composed of two main stakeholder categories: Contributors and the Maintainer. 

<img class="center" width="1200" height="100%" src="../../../../assets/governance-roles-1.svg" alt="GTFS Governance Roles"> 

## Contributors

Anyone can become a Contributor by participating in discussions within the official GTFS repository, regardless of their technical skills or experience with GTFS.

**Responsibilities**

* Track development progress, participate in discussions, and review Issues and Pull Requests.   
* Express their views with respect and understanding, adhering to the GTFS Guiding Principles.

### Contributor Types

#### Producers

A GTFS Producer is an individual or organization responsible for generating GTFS data. This may include transit agencies, data vendors, aggregators, or planners.

* If an individual or organization assigns GTFS feed production to another party, only one of them can be recognized as the Producer.  
* To vote, Producers must reference the GTFS feed they represent to confirm their role as Producer.  
* In the case where a contributor is both a Consumer and Producer, they can only count as one, thus they must select a single role to represent during testing and voting.

#### Consumers

A GTFS Consumer is an individual or organization that ingests GTFS data, typically to provide and distribute rider-facing transit information through platforms such as software applications.

* In some cases, contributors may consume GTFS data for research, data analysis, operations, planning, etc. However, they are considered Consumers only if their work is publicly accessible or shared in a public-facing context.  
* To vote, consumers must reference the GTFS consuming application they represent to confirm their role as Consumer.  
* In the case where a contributor is both a Consumer and Producer, they can only count as one, thus they must select a single role to represent during testing and voting.

#### General Contributors

Individuals or organizations that do not qualify as either Producers or Consumers are considered as General Contributors or simply referred to as Contributors. 

## Maintainer

The Maintainer supports and facilitates the specification [Change Process](../change-process), and their role as an impartial facilitator is to guide the community toward making consensus-driven decisions. MobilityData currently serves as the Maintainer of GTFS. 

**Responsibilities**:

* Assist Advocates in facilitating discussions when needed.   
* Provide constructive feedback and recommendations to help refine proposals.  
* Check that the terminology used in specification proposals aligns with the one used in the official specification.  
* Ensure all GTFS Contributors follow the governance framework by monitoring and moderating community interactions.  
* Can act as the Advocate for proposals.  
* Assume the role of the Advocate if they become unresponsive at any point.  
* Cannot participate in any voting process. 

## Special roles

General Contributors, Producers, Consumers and the Maintainer can take on special roles to support the development of specification changes. The Advocate and First Adopter roles are particularly critical for the [Change Process](../change-process) to function effectively.


<img class="center" width="1200" height="100%" src="../../../../assets/governance-roles-2.svg" alt="GTFS Governance Special Roles"> 

### Advocate

An Advocate proposes a change to the official specification by publishing a Pull Request. Anyone can be an Advocate.

**Responsibilities**

* Follows the requirements of the [Change Process](../change-process) for the proposed change.  
* Request assistance from the Maintainer if necessary. 

### First Adopter

First Adopters are Producers and Consumers who implement and test proposed changes as agreed upon in discussions. 

**Responsibilities**:

* Communicate any modifications or challenges that arise during testing.  
* Publicly publish proof of implementation in the Pull Request.  
* A consumer acting as a first adopter must guarantee that the GTFS data is tested using a rider-facing application. 