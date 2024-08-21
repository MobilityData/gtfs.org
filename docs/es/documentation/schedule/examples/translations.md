# Traducciones

## Traducir nombres de estaciones 
 
 Algunos proveedores de transporte ofrecen servicios en varios idiomas, uno de los cuales es la Compañía Nacional de Ferrocarriles de Bélgica (conocida localmente como NMBS/SNCB, por Nationale Maatschappij der Belgische Spoorwegen en holandés o Société nationale des chemins de fer belges en francés). La empresa proporciona nombres de estaciones en varios idiomas y se muestran según el idioma y la configuración de ubicación del usuario. 
 
 La NMBS/SNCB publica los datos GTFS en francés como se muestra en el siguiente archivo: 
 
 [** agency.txt**](../../reference/#agencytxt) 
 
```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr
```
 
 
 Dado que el idioma de la agencia está configurado en francés, los nombres de las estaciones aparecen en francés en [stops.txt](../../reference/#stopstxt). 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,
```
 
 
 El archivo [translations.txt](../../reference/#translationstxt) se utiliza para traducir los nombres de las estaciones del idioma predeterminado de la agencia (francés en este caso) al holandés. 
 
 [** translations.txt**](../../reference/#translationstxt) 
 
```
table_name,field_name,record_id,language,translation
stops,stop_name,S8815040,nl,Brussel-West
```
 
 - En este ejemplo, los nombres de las estaciones de [stops.txt](../../reference/#stopstxt) se traducen y los registros en [stops.txt](../../reference/#stopstxt) se identifican mediante un `stop_id`. Por lo tanto: 
    - `stops` se enumeran bajo los nombres de las tablas (en referencia a [stops.txt](../../reference/#stopstxt)) 
    - `stop_name` se enumeran bajo `field_name` (desde el los nombres de las estaciones se traducirán) 
    - El `stop_id` del nombre de la estación que se va a traducir del francés aparece en `record_id` (en este caso, el `stop_id` para Bruxelles-Ouest) 
 - El nombre se traduce al holandés (nl) 
 - Por último, el nombre traducido aparece en traducción 
 
 Hay otra forma de traducir nombres en GTFS usando el archivo [translations.txt](../../reference/#translationstxt), donde se utiliza el campo `field_value` en lugar de `record_id`. En este caso, el nombre de la estación se utiliza para encontrar el registro que se va a traducir de [stops.txt](../../reference/#stopstxt). 
 
 [** translations.txt**](../../reference/#translationstxt) 
 
```
table_name,field_name,field_value,language,translation
stops,stop_name,Bruxelles-Ouest,nl,Brussel-West
```
 
