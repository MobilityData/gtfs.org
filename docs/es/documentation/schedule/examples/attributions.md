# Atribuciones de conjuntos de datos

## Atribuir datos a un productor de datos en un conjunto de datos GTFS agregado 
 
 Algunos conjuntos de datos GTFS contienen datos agregados de múltiples fuentes, como diferentes proveedores de servicios que prestan servicios en la misma jurisdicción. En algunos casos, es necesario clasificar las agencias enumeradas en [agency.txt](../../reference/#agencytxt) como productores, operadores o autoridades. 
 
 Por ejemplo, Rejseplanen es un motor de búsqueda de servicios de ferrocarril y autobús en Dinamarca. La empresa publica un conjunto de datos GTFS que contiene datos de múltiples agencias y proveedores, como se muestra a continuación en [agency.txt](../../reference/#agencytxt). 
 
 [** agency.txt**](../../reference/#agencytxt) 

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
204,FYNBUS,https://fynbus.dk,Europe/Berlin,
206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,
```
 
 Para atribuir a Rejseplanen como productor de datos, el archivo [attributions.txt](../../reference/#attributionstxt), donde se define un ID de atribución junto con el nombre y la URL de la organización. Los campos `is_producer`, `is_operator` y `is_authority` se utilizan para categorizar Rejseplanen como se muestra a continuación: 
 
 [** attributions.txt**](../../reference/#attributionstxt) 
 
```
attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
rp,Rejseplanen,https://www.rejseplanen.dk,1,,
```
