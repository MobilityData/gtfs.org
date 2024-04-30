# Metadata Component
The Metadata Component contains features that allow to provide further information regarding the producer of the GTFS feed and the feed itself, this includes the names of the organizations as well as contact information.

## Feed Information

<div class="grid" markdown>

This feature allows to communicate important information regarding the feed itself, such as the validity of the feed (i.e. start day and end date), the organization responsible for publishing the dataset, and contact information for communication regarding the GTFS dataset and data publishing practices.  

| Files associated      | [feed_info.txt](/schedule/reference/#feed_infotxt)                                                                                                                   |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | feed_publisher_name<br>feed_publisher_url<br>feed_lang<br>default_lang<br>feed_start_date<br>feed_end_date<br>feed_version<br>feed_contact_email<br>feed_contact_url |

</div>

## Attributions

<div class="grid" markdown>

This feature makes it possible to share additional details regarding the organizations (producers, operators and/or authorities ) involved in the creation of the dataset, including their names and contact information.

| Files associated      | [attributions.txt](/schedule/reference/#attributionstxt)                                                                                                  |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Fields associated** | attribution_id<br>agency_id<br>route_id<br>trip_id<br>organization_name<br>is_producer<br>is_operator<br>is_authority<br>attribution_url<br>attribution_email<br>attribution_phone |

</div>

