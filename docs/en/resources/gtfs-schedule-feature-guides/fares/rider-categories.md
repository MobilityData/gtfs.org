# Rider Categories

*Main files: rider_categories.txt, fare_products.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder"

    Rider Categories represent the different groups of riders, such as seniors, students, children, and adults, eligible for specific fare rates based on their age, status, or needs. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

Defining rider categories allows trip planners (GTFS consumers) to display different fares based on the rider's status—such as age, accessibility needs, or social circumstances—ensuring appropriate fares are shown for each group.

## Specify rider categories

Each rider category is created in `rider_categories.txt` as follows:

1. Fill **rider_category_id** with the unique id of the rider category  
2. Fill **rider_category_name** with the rider-facing name of the category (Adult, Student, etc)  
3. Fill **is_default_fare_cateory;** if the category is the default one, set this field to 1, otherwise set to 0 or keep it empty.  
4. If available, fill **eligibility_url** with a web page that contains information about the conditions for the rider category. Otherwise, the entire column is optional.

[Consult the documentation](../../../reference/#rider_categoriestxt) for more information regarding Rider Categories.

For this example, two categories are specified for [Translink](../intro/#translink-vancouver), adult and concession. adult is the default category. An **eligibility_url** is also added for the concession category, explaining which riders are included in the category.

[**rider_categories.txt**](../../../reference/#rider_categoriestxt)

| rider_category_id | rider_category_name | is_default_fare_category | eligibility_url |
| :---- | :---- | :---- | :---- |
| adult | Adult | 1 |  |
| concession | Concession |  | https://www.translink.ca/transit-fares/pricing-and-fare-zones#fare-pricing |

## Associate with fare products

Each fare product can be eligible for one or multiple rider categories. To showcase this eligibility, rider categories are associated with fare products in `fare_products.txt` as follows:

1. For each fare product, fill **rider_category_id** with the ID of the rider category that determines the cost of the leg.  
   * This is a Foreign Key referencing **rider_category_id** in `rider_categories.txt`.  
   * An empty **rider_category_id** in `fare_products.txt` means that the fare product is eligible for any rider category.

For this example, two different bus fare products are specified for flat bus fare for adults and for concession categories. When `bus_flat_fare` is associated with the adult rider category, the amount is CAD 3.20. When `bus_flat_fare` is associated with the concession rider category, the amount is CAD 2.15.

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id | rider_category_id |
| :---- | :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless | adult |
| bus_flat_fare | Bus Flat Fare | 2.15 | CAD | contactless | concession |