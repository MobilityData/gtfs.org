# Metadata
GTFS feeds can contain further information regarding the feed itself and its proviver. This can include publisher contact information, feed version and validity period.

## Feed Information


Feed Information communicates important information about the feed, such as its validity (start day and end date), the publishing organization, and contact information for inquiries regarding the GTFS dataset and data publishing practices.  

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[feed_info.txt](/documentation/schedule/reference/#feed_infotxt)|`feed_publisher_name`, `feed_publisher_url`, `feed_lang`, `default_lang`, `feed_start_date`, `feed_end_date`, `feed_version`, `feed_contact_email`, `feed_contact_url` |

??? note "Sample Data"

    <p style="font-size:16px">
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#feed_infotxt"><b>feed_info.txt</b></a> <br>
        </p>

        | feed_publisher_name	      | feed_publisher_url   | feed_lang | default_lang | feed_start_date | feed_end_date | feed_version | feed_contact_email | feed_contact_url             |
        |--------------------------|----------------------|-----------|--------------|-----------------|---------------|--------------|--------------------|------------------------------|
        | Greater Region Transport | https://www.gra1.org | en        | en           |        20240101 |      20241231 |          3.1 | support@gra1.org   | https://www.gra1.org/support |

## Attributions

Attributions makes it possible to share additional details regarding the organizations involved in the creation of the dataset (producers, operators and/or authorities, etc.).

**Pre-requirement**: 

- [Base features](/getting_started/features/base)

| Files included                   | Fields included   |
|----------------------------------|-------------------|
|[attributions.txt](/documentation/schedule/reference/#attributionstxt) |`attribution_id`, `agency_id`, `route_id`, `trip_id`, `organization_name`, `is_producer`, `is_operator`, `is_authority`, `attribution_url`, `attribution_email`, `attribution_phone` |

??? note "Sample Data"

    <p style="font-size:16px"> 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="/documentation/schedule/reference/#attributionstxt"><b>attributions.txt</b></a> <br>
        </p>

        | attribution_id | agency_id | route_id | trip_id | organization_name        | is_producer | is_operator | is_authority | attribution_url                  | attribution_email       | attribution_phone |
        |----------------|-----------|----------|---------|--------------------------|-------------|-------------|--------------|----------------------------------|-------------------------|      -------------------|
        | op01           | tb        |          |         | Transit Bus              |             |           1 |              | https://www.transitbus.org/fares | contact@transitbus.org  | (777)        555-7777    |
        | au01           | gra       |          |         | Greater Region Transport |           1 |             |            1 | https://www.gra1.org             | contact@gra1.org        | (555)        555-5555    |
        | op02           |           | rtd023   |         | Bus company A            |             |           1 |              | https://www.buscompanya.com      | contact@buscompanya.com | (333)        333-3333    |
        | op03           |           | rtd025   |         | Bus company B            |             |           1 |              | https://www.buscompanyb.com      | contact@buscompanyb.com | (888)        888-8888    |
