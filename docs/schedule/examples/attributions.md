<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/attributions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Dataset attributions

<hr>

## Attribute data to a data producer in an aggregated GTFS dataset

Some GTFS datasets contain data aggregated from multiple sources such as different service providers that serve the same jurisdiction. In some cases, it is necessary to classify the agencies listed in [agency.txt](../../reference/#agencytxt) as producers, operators, or authorities. 

For example, Rejseplanen is a search engine for rail and bus services in Denmark. The company publishes a GTFS dataset that contains data from multiple agencies and providers as shown below in [agency.txt](../../reference/#agencytxt). 

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

<sup>[Example source](http://www.rejseplanen.info/labs/GTFS.zip)</sup>