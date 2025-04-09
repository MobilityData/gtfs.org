# Fare media

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