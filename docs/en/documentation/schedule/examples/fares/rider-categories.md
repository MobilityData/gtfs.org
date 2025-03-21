# Rider Categories

## Main files: rider\_categories.txt, fare\_products.txt Example: Translink (Vancouver)

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** is used to represent the different types of public transportation riders eligible for specific fare rates, such as Elderly, Student, and Adult.

Defining rider categories allows trip planners (GTFS consumers) to show different fares based on the situation of the rider, showing fare concessions to the categories that benefit from them.

Rider categories are defined in two steps:

#### Specify rider categories

Each category is created in rider\_categories.txt

* rider\_category\_id: the unique id of the rider category  
* rider\_category\_name: The rider-facing name of the category (Adult, Student, etc)  
* is\_default\_fare\_cateory: If the category is the default one, set this field to 1, otherwise set to 0 or keep empty.  
* eligibility\_url: If the agency has a web page that contains information about the conditions for the rider category, it can be included in this field. Otherwise, the entire column is optional.  
* Consult the documentation\[link\*\] for more information regarding rider categories.

Rider categories for Translink in `rider_categories.txt`  
`rider_categories.txt`

| rider\_category\_id | rider\_category\_name | is\_default\_fare\_category | eligibility\_url |
| :---- | :---- | :---- | :---- |
| adult | Adult | 1 |  |
| concession | Concession |  | https://www.translink.ca/transit-fares/pricing-and-fare-zones\#:\~:text=Fare%20Pricing-,Concession%20Fares,-Passengers%20who%20are |

#### Associate with fare products

* In fare\_products.txt, fill the fare products like the previous sections (section. [Route-Based Fares](?tab=t.0#heading=h.47j0ltwx34j3)), then add a column rider\_category\_id which references the rider\_category\_id from rider\_categories.txt

The example below shows two different bus fare products for flat bus fare for adults and for concession categories. Follow the same approach for all other products by duplicating the fare product and changing the amount and the rider\_category\_id.

`fare_products.txt`

| fare\_product\_id | fare\_product\_name | amount | currency | fare\_media\_id | rider\_category\_id |
| :---- | :---- | :---- | :---- | :---- | :---- |
| bus\_flat\_fare | Bus Flat Fare | 3.20 | CAD | contactless | adult |
| bus\_flat\_fare | Bus Flat Fare | 2.15 | CAD | contactless | concession |