# Metadata
GTFS feeds can contain further information regarding the feed itself and its proviver. This can include publisher contact information, feed version and validity period.

## Feed Information


Feed Information communicates important information about the feed, such as its validity (start day and end date), the publishing organization, and contact information for inquiries regarding the GTFS dataset and data publishing practices.  

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[feed_info.txt](/schedule/reference/#feed_infotxt)|`feed_publisher_name`, `feed_publisher_url`, `feed_lang`, `default_lang`, `feed_start_date`, `feed_end_date`, `feed_version`, `feed_contact_email`, `feed_contact_url` |


## Attributions

Attributions makes it possible to share additional details regarding the organizations involved in the creation of the dataset (producers, operators and/or authorities, etc.).

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[attributions.txt](/schedule/reference/#attributionstxt) |`attribution_id`, `agency_id`, `route_id`, `trip_id`, `organization_name`, `is_producer`, `is_operator`, `is_authority`, `attribution_url`, `attribution_email`, `attribution_phone` |
