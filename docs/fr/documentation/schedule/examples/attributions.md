# Attributions des jeux de données

## Attribuer des données à un producteur de données dans un ensemble de données GTFS agrégé 
 
 Certains ensembles de données GTFS contiennent des données agrégées provenant de plusieurs sources, telles que différents fournisseurs de services qui desservent la même juridiction. Dans certains cas, il est nécessaire de classer les agences répertoriées dans [agency.txt](../../reference/#agencytxt) en producteurs, opérateurs ou autorités. 
 
 Par exemple, Rejseplanen est un moteur de recherche de services ferroviaires et de bus au Danemark. La société publie un ensemble de données GTFS contenant des données provenant de plusieurs agences et fournisseurs, comme indiqué ci-dessous dans [agency.txt](../../reference/#agencytxt). 
 
 [** agency.txt**](../../reference/#agencytxt) 
 
```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
204,FYNBUS,https://fynbus.dk,Europe/Berlin,
206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,
```
 
 Afin d’attribuer Rejseplanen en tant que producteur de données, le fichier [attributions.txt](../../reference/#attributionstxt) est utilisé, où un ID d’attribution est défini à côté du nom et de l’URL de l’organisation. Les champs `is_producer`, `is_operator` et `is_authority` sont utilisés pour catégoriser Rejseplanen comme indiqué ci-dessous : 
 
 [** attributions.txt**](../../reference/#attributionstxt) 
 
```
attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
rp,Rejseplanen,https://www.rejseplanen.dk,1,,
```
