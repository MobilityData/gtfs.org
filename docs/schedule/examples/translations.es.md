---
search:
  exclude: true
---

# Traducciones

<hr/>

## Traducir los nombres de las estaciones

Algunos proveedores de transporte ofrecen servicios en varios idiomas, uno de ellos es la Compañía Nacional de Ferrocarriles de Bélgica (conocida localmente como NMBS/SNCB, por Nationale Maatschappij der Belgische Spoorwegen en holandés o Société nationale des chemins de fer belges en francés). La empresa proporciona los nombres de las estaciones en varios idiomas y se muestran en función de la configuración del idioma y la ubicación del usuario.

La NMBS/SNCB publica los datos GTFS en francés, como se muestra en el archivo siguiente:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

Como el idioma de la agencia está configurado en francés, los nombres de las estaciones aparecen en francés archivo [stops.txt](../../reference/#stopstxt).

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

El archivo [translations.txt](../../reference/#translationstxt) se utiliza entonces para traducir los nombres de las estaciones del idioma por defecto de la agencia (francés en este caso) al holandés.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- En este ejemplo, los nombres de las estaciones de [stops.txt](../../reference/#stopstxt) se traducen y los registros de [stops.txt](../../reference/#stopstxt) se identifican con un `stop_id`. Por lo tanto
  - las`stops` aparecen en los nombres de las tablas (en referencia a [stops.txt](../../reference/#stopstxt))
  - `stop_name` aparece bajo `field_name` (ya que los nombres de las estaciones se traducirán)
  - El `stop_id` del nombre de la estación que se va a traducir del francés aparece bajo `record_id` (en este caso, el `stop_id` de Bruxelles-Ouest)
- El nombre se traduce al neerlandés (nl)
- Por último, el nombre traducido aparece en la Translation

Existe otra forma de traducir los nombres en GTFS utilizando el archivo [translations.txt](../../reference/#translationstxt), donde se utiliza el campo `field_value` en lugar de `record_id`. En este caso, el nombre de la estación se utiliza para encontrar el registro que se debe traducir desde [stops.txt](../../reference/#stopstxt).

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[Ejemplo de fuente](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
