# Fare Media

*Main files: fare_media.txt, fare_products.txt*

*Example: Translink (Vancouver)*

**Recall ([Fares v2 Features](?tab=t.0#heading=h.o1dhl0gqp9z8)):** The fare products will be stored inside different fare media which are used to validate them when boarding public transit.

To specify which fare media are available for a transit agency, they have to be created in the table fare\_media.txt, this is done as follows:

1. Fill the fare\_media\_id column with a unique ID identifying the fare media.   
   1. This is the Primary Key used to associate it with fare\_products.txt.   
2. Fill the fare\_media\_name column with the rider-facing name of the fare media.  
3. Fill the fare\_media\_type column with the appropriate enum (0 \= None, 1 \= Physical Paper Ticket, 2 \= Physical Transit Card, 3 \= cEMV, 4 \= Mobile App).

[Consult the reference documentation](https://gtfs.org/documentation/schedule/reference/#fare_mediatxt) for more information on the enums used in fare\_media\_type.

`fare_media.txt`

| fare\_media\_id | fare\_media\_name | fare\_media\_type |
| :---- | :---- | :---- |
| cash | Cash | 0 |
| contactless | Contactless | 3 |
| compass\_card | Compass Card | 2 |
| compass\_ticket | Compass Ticket | 2 |
| wallet | Mobile Wallet | 3 |