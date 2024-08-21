# Traductions

## Traduire les noms des gares 
 
 Certains fournisseurs de transports en commun proposent des services dans plusieurs langues, dont la Société nationale des chemins de fer de Belgique (connue localement sous le nom de SNCB/SNCB, pour Nationale Maatschappij der Belgische Spoorwegen en néerlandais ou Société nationale des chemins de fer belges en français). La société fournit des noms de stations dans plusieurs langues et sont affichés en fonction de la langue et des paramètres de localisation de l’utilisateur. 
 
 La SNCB publie les données GTFS en français comme indiqué dans le fichier ci-dessous : 
 
 [** agency.txt**](../../reference/#agencytxt) 
 
```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr
```
 
 
 La langue de l’agence étant le français, les noms des stations sont répertoriés en français dans [stops.txt](../../reference/#stopstxt). 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,
```
 
 
 Le fichier [translations.txt](../../reference/#translationstxt) est ensuite utilisé pour traduire les noms des stations de la langue par défaut de l’agence (le français dans ce cas) vers le néerlandais. 
 
 [** translations.txt**](../../reference/#translationstxt) 
 
```
table_name,field_name,record_id,language,translation
stops,stop_name,S8815040,nl,Brussel-West
```
 
- Dans cet exemple, les noms de stations de [stops.txt](../../reference/#stopstxt) sont traduits, et les enregistrements dans [stops.txt](../../reference/#stopstxt) sont identifiés par un `stop_id`. Par conséquent :
    - les `stops` sont répertoriés sous les noms de table (en référence à [stops.txt](../../reference/#stopstxt))
    - `stop_name` est répertorié sous `field_name` (puisque le les noms des stations seront traduits) 
    - Le `stop_id` du nom de la station à traduire du français est répertorié sous `record_id` (dans ce cas, le `stop_id` pour Bruxelles-Ouest) 
 - Le nom est traduit vers le néerlandais (nl) 
 - Enfin, le nom traduit est répertorié sous traduction 
 
 Il existe une autre façon de traduire les noms en GTFS en utilisant le fichier [translations.txt](../../reference/#translationstxt), où le champ `field_value` est utilisé à la place de `record_id`. Dans ce cas, le nom de la station est utilisé pour rechercher l’enregistrement à traduire à partir de [stops.txt](../../reference/#stopstxt). 
 
 [** translations.txt**](../../reference/#translationstxt) 
 
```
table_name,field_name,field_value,language,translation
stops,stop_name,Bruxelles-Ouest,nl,Brussel-West
```
 
