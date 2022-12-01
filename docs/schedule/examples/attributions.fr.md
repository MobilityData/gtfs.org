---
search:
  exclude: true
---

# Attributions de jeux de données

<hr/>

## Attribuer des données à un producteur de données dans un ensemble de données GTFS agrégées.

Certains ensembles de données GTFS contiennent des données agrégées à partir de sources multiples telles que différents fournisseurs de services qui desservent la même juridiction. Dans certains cas, il est nécessaire de classer les organismes listés dans [agency.txt](../../reference/#agencytxt) en tant que producteurs, opérateurs ou autorités.

Par exemple, Rejseplanen est un moteur de recherche pour les services de train et de bus au Danemark. L'entreprise publie un jeu de données GTFS qui contient des données provenant de plusieurs agences et fournisseurs, comme indiqué ci-dessous dans [agency.txt](../../reference/#agencytxt).

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Afin d'attribuer Rejseplanen en tant que producteur de données, le fichier [attributions.txt](../../reference/#attributionstxt) est utilisé, où un id attribution est défini avec le nom et l'url de l'organisation. Les champs `is_producer`, `is_operator`, et `is_authority` sont utilisés pour catégoriser Rejseplanen comme indiqué ci-dessous :

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[Exemple de source](http://www.rejseplanen.info/labs/GTFS.zip)
