# Fare Products

*Main files: fare_products.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder" 

    Fare products are the type of fares (i.e. single-trip fare, monthly pass, transfer fees, etc.) offered by a transit agency to access a service. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

!!! Note

    * This section provides a general overview of fare products. Subsequent sections will define them more specifically based on their use cases.  
    * This section includes fare products representing different types of passes: an occasional travel pass and a daily pass. In later sections, only the occasional pass will be used to keep examples concise.

## Create Fare Products

Different fare products can be relevant for the same journey. Fare products are created in `fare_products.txt` as follows:

1. Fill the **fare_product_id** column with a unique ID identifying the fare product.  
2. Fill the **fare_product_name** column with the rider-facing name of the fare product (e.g., Bus Flat Fare, Bus Flat Fare Monthly).  
3. Fill the **amount** and **currency** columns with the cost of the fare and its currency ([currency codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)).  
4. Fill the **fare_media_id** column with the fare media where this fare product can be stored and used.  
   * This is a Foreign Key referencing **fare_media_id** in `fare_media.txt` ([Fare Media](../../../reference/#fare_mediatxt)).  
   * Multiple fare media can be associated with the same fare product, potentially at different prices.  
   * An empty **fare_media_id** means that the fare media is unknown.

In this example, two fare products are defined: `bus_flat_fare` and `bus_flat_fare_daily`. Both can be used for a Translink bus trip. `Bus_flat_fare` is eligible for occasional short-term journeys. `bus_flat_fare_daily` is better suited for journeys that span multiple hours in the same day.

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus_flat_fare | Bus Flat Fare | 2.60 | CAD | compass_card |
| bus_flat_fare_daily | Daily pass | 11.50 | CAD | compass_card |
| bus_flat_fare_daily | Daily pass | 11.50 | CAD | compass_ticket |
| … | … | … | … | … |
