# Fare Media

*Main files: fare_media.txt, fare_products.txt*  
*Example: [Translink (Vancouver)](../intro/#translink-vancouver)*

!!! info "Reminder" 

    The fare products will be stored inside different fare media which are used to validate them when boarding public transit. For more information revisit the [Features section](../intro/#fares-features-and-their-files) in the Introduction page.

## Create fare media

Fare media entries are created in `fare_media.txt` as follows:

1. Fill the **fare_media_id** column with a unique ID identifying the fare media.  
    * This is the Primary Key used to associate it with `fare_products.txt`.  
2. Fill the **fare_media_name** column with the rider-facing name of the fare media.  
3. Fill the **fare_media_type** column with the appropriate enum (0= None, 1= Physical Paper Ticket, 2= Physical Transit Card, 3= cEMV, 4=Mobile App).

[Consult the documentation](https://gtfs.org/documentation/schedule/reference) for more details on fare products.

For this example, five different fare media are created, each assigned an ID, a name, and a type of media. For instance, since the Compass Card is a physical transit card, `fare_media_type=2` is assigned.

[**fare_media.txt**](../../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
| :---- | :---- | :---- |
| cash | Cash | 0 |
| contactless | Contactless | 3 |
| compass_card | Compass Card | 2 |
| compass_ticket | Compass Ticket | 1 |
| wallet | Mobile Wallet | 3 |

## (Alternative) Specify cEMV support

For GTFS producers who do not have the capacity to produce GTFS Fares (v2), it is possible to specify cEMV support without having Fares (v2). This allows consumers to show whether the agency (or certain routes) supports payment using contactless EMV without having to implement Fares (v2).

!!! tip "Tip" 

    It is recommended to implement Fares (v2) to allow for showing comprehensive fare information, not just cEMV support.

1. Choose either `agency.txt` or `routes.txt` to specify cEMV information.  
    * If the entire agency has the same cEMV support across all of its trips, use `agency.txt`.  
    * If cEMV support varies from route to route, use \routes.txt`.  
2. Fill in the **cemv_support** field in `agency.txt` or `routes.txt` with the appropriate enum with the appropriate enum.
    * 0: No cEMV information.
    * 1: Riders may use cEMVs as fare media on all trips associated with the agency (or route).
    * 2: cEMVs are not supported as fare media on all trips associated with the agency (or route).

[Consult the documentation](./../../reference/) for more information on cEMV support.

For [Translink](../intro/#translink-vancouver), cEMV is supported on all routes. Therefore, **cemv_support** can be defined in `agency.txt`.

[**agency.txt**](../../../reference/#agencytxt)

| agency_id | agency_name | cemv_support | … |
| :---- | :---- | :---- | :---- |
| TL | TransLink | 1 | … |
