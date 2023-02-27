<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/translations.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Translations

<hr>

## Translate station names

Some transit providers offer services in multiple languages - one of which is the National Railway Company of Belgium (locally known as NMBS/SNCB, for Nationale Maatschappij der Belgische Spoorwegen in Dutch or Société nationale des chemins de fer belges in French). The company provides station names in multiple languages and are displayed depending on the user’s language and location settings.

The NMBS/SNCB publishes GTFS data in French as shown in the file below:

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr
```


Since the agency language is set to French, the station names are listed in French in [stops.txt](../../reference/#stopstxt).

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,
```


The file [translations.txt](../../reference/#translationstxt) is then used to translate the station names from the default agency language (French in this case) to Dutch.

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,record_id,language,translation
stops,stop_name,S8815040,nl,Brussel-West
```

- In this example, the station names from [stops.txt](../../reference/#stopstxt) are translated, and records in [stops.txt](../../reference/#stopstxt) are identified by a `stop_id`. Therefore:
    - `stops` are listed under table names (in reference to [stops.txt](../../reference/#stopstxt))
    - `stop_name` is listed under `field_name` (since the names of stations will be translated)
    - The `stop_id` for the station name to be translated from French is listed under `record_id` (in this case, the `stop_id` for Bruxelles-Ouest)
- The name is translated to Dutch (nl)
- Lastly, the translated name is listed under translation

There is another way to translate names in GTFS using the file [translations.txt](../../reference/#translationstxt), where the field `field_value` is used instead of `record_id`. In this case, the station name is used to find the record to be translated from [stops.txt](../../reference/#stopstxt).

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,field_value,language,translation`
stops,stop_name,Bruxelles-Ouest,nl,Brussel-West
```

<sup>[Example source](http://gtfs.irail.be/mivb/mivb-gtfs.zip)</sup>
