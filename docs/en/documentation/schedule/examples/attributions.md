# Dataset attributions

## Attribute data to a data producer in an aggregated GTFS dataset

Some GTFS datasets contain data aggregated from multiple sources, such as different service providers that serve the same jurisdiction. In some cases, it is necessary to classify the agencies listed in [agency.txt](../../reference/#agencytxt) as producers, operators, or authorities. 

For example, Rejseplanen is a search engine for rail and bus services in Denmark. The company publishes a GTFS dataset that contains data from multiple agencies and providers, as shown below in [agency.txt](../../reference/#agencytxt). 

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
204,FYNBUS,https://fynbus.dk,Europe/Berlin,
206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,
```

In order to attribute Rejseplanen as a data producer, the file [attributions.txt](../../reference/#attributionstxt) is used, where an attribution ID is defined alongside the name and URL of the organization. The fields `is_producer`, `is_operator`, and `is_authority` are used to categorize Rejseplanen as shown below: 

[**attributions.txt**](../../reference/#attributionstxt)

```
attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
rp,Rejseplanen,https://www.rejseplanen.dk,1,,
```
