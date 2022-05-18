### Term Definitions

This section defines terms that are used throughout this document.

* **Dataset** - A complete set of files defined by this specification reference. Altering the dataset creates a new version of the dataset. Datasets should be published at a public, permanent URL, including the zip file name. (e.g., https://www.agency.org/gtfs/gtfs.zip).
* **Record** - A basic data structure comprised of a number of different field values describing a single entity (e.g. transit agency, stop, route, etc.). Represented, in a table, as a row.
* **Field** - A property of an object or entity. Represented, in a table, as a column.
* **Field value** - An individual entry in a field. Represented, in a table, as a single cell.
* **Service day** - A service day is a time period used to indicate route scheduling. The exact definition of service day varies from agency to agency but service days often do not correspond with calendar days. A service day may exceed 24:00:00 if service begins on one day and ends on a following day. For example, service that runs from 08:00:00 on Friday to 02:00:00 on Saturday, could be denoted as running from 08:00:00 to 26:00:00 on a single service day.
* **Text-to-speech field** - The field should contain the same information than its parent field (on which it falls back if it is empty). It is aimed to be read as text-to-speech, therefore, abbreviation should be either removed ("St" should be either read as "Street" or "Saint"; "Elizabeth I" should be "Elizabeth the first") or kept to be read as it ("JFK Airport" is said abbreviated).
* **Leg** - Travel in which a rider boards and alights between a pair of subsequent locations along a trip.
* **Journey** - Overall travel from origin to destination, including all legs and transfers in-between.
* **Sub-journey** - Two or more legs that comprise a subset of a journey.
* **Fare product** - Purchassable fare products that can be used to pay for or validate travel.

