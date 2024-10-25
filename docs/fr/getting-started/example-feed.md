# Exemple de flux GTFS 
 
 Cet exemple de flux GTFS affiche des échantillons de données délimités par des virgules pour chaque fichier d’un flux de transit. Les exemples de fichiers de données présentés ici ne sont pas tous liés les uns aux autres. Vous pouvez également [télécharger un flux GTFS complet](https://github.com/google/transit/blob/master/gtfs/spec/en/examples/sample-feed-1.zip?raw=true) sous sa forme finale pour travailler également, ou parcourez les fichiers individuels de ce même flux en ligne [ici](https://github.com/google/transit/tree/master/gtfs/spec/en/examples/sample-feed-1). 
 
## agency.txt 
 
 ``` 
 agence_id,agency_name,agency_url,agency_timezone,agency_phone,agency_lang 
 FunBus,The Fun Bus,https://www.thefunbus.org,America/Los_Angeles,(310) 555-0222,en 
 ``` 
 
 ``` 
 agence_id,agency_name,agency_url,agency_timezone,agency_lang 
 agence001, Agence de transport en commun,https://www.transitcommuterbus.com/, PST,fr 
 [...] 
 ``` 
 
## stops.txt 
 
 ``` 
 stop_id,level_id,stop_name,stop_lat,stop_lon,location_type,parent_station 
 F12,,5 Av/53 St,40.760167,-73.975224,1, 
 E1,L0,5 Av/53 St SW,40.760474,-73.976099,2,F12 
 E2,L0,5 Av/53 St NE,40.76035, -73.97546,2,F12 
 E3,L0,5 Av/53 St SE,40.760212,-73.975512,2,F12 
 E4,L0,Madison/53 St NE,40.759612,-73.973731,2,F12 
 E5,L0,Madison/53 St SE,40.759491,-73.973820,2,F12 
 N1,L1,,,40.760457,-73.975912,3,F12 
 N2,L1,,40.760531,-73.976111,3,F12 
 N3,L1,,40.759746,-73.974203,3,F12 
 N4,L1,,40.759679,-73.974064,3,F12 
 F12S,,5 Av/53 St,40.760167,-73.975224,0,F12 
 B1,L2,,40.759746,-73.974203,4,F12S 
 B3,L2,,40.759828,-73.974442,4,F12S 
 F12N,,5 Av/53 St,40.760167,-73.975224,0,F12 
 B2, L3,,40.760457,-73.975912,4,F12N 
 B4,L3,,40.760375,-73.975729,4,F12N 
 ``` 
 `location_type=` 0 : plateforme ; 1 : gare ; 2 : entrée/sortie ; 3 : nœud générique ; 4 : zone d’embarquement. 
 
## routes.txt 
 
 ``` 
 route_id,route_short_name,route_long_name,route_desc,route_type 
 A,17,Mission,"L’itinéraire ""A"" part de Lower Mission jusqu’au centre-ville. ",3 
 ``` 
 
## trips.txt 
 
 ``` 
 route_id, service_id, trip_id,trip_headsign,block_id 
 A,WE, AWE1,Downtown,1 
 A, WE, AWE2,Downtown,2 
 ``` 
 
## stop_times.txt 
 
 ``` 
 trip_id,arrival_time,departure_time,stop_id, stop_sequence, pickup_type, drop_off_type 
 AWE1,0:06 :10,0:06:10,S1,1,0,0 
 AWE1,,,S2,2,1,3 
 AWE1,0:06:20,0:06:30,S3,3,0,0 
 AWE1,,,S5,4,0,0 
 AWE1,0:06:45,0:06:45,S6,5,0,0 
 AWD1,0:06:10,0 : 06:10,S1,1,0,0 
 AWD1,,,S2,2,0,0 
 AWD1,0:06:20,0:06:20,S3,3,0,0 
 AWD1,,,S4,4,0,0 
 AWD1,,,S5,5,0,0 
 AWD1,0:06:45,0:06:45,S6,6,0,0 
 `` ` 
 
## calendar.txt 
 
 ``` 
 service_id,lundi,mardi,mercredi,jeudi,vendredi,samedi,dimanche,start_date,end_date 
 WE,0,0,0,0, 0,1,1,20060701,20060731 
 WD,1,1,1,1,1,0,0,20060701,20060731 
 ``` 
 
## calendar_dates.txt 
 
 Cet exemple montre les exceptions de service pour les vacances du Jour de l’Indépendance en 2006. Le lundi 3 juillet 2006, le service régulier en semaine (`service_id=WD`) est interrompu (`exception_type=2`). Au lieu de cela, le service du week-end (`service_id=WE`) s’exécute à cette date (`exception_type=1`). Le même changement s’applique également le mardi 4 juillet. 
 
 ``` 
 service_id, date,exception_type 
 WD,20060703,2 
 WE,20060703,1 
 WD,20060704,2 
 WE,20060704,1 
 ``` 
 § §## fare_attributes.txt 
 
 ``` 
 fare_id,price,currency_type,payment_method,transfers,transfer_duration 
 1,0.00,USD,0,0,0 
 2,0.50,USD,0,0,0 
 3,1.50,USD,0,0,0 
 4,2.00,USD,0,0,0 
 5,2.50,USD,0,0,0 
 ``` 
 
## fare_rules.txt 
 
 ``` 
 fare_id, route_id,origin_id,destination_id,contains_id 
 a,TSW,1,1, 
 a,TSE,1,1, 
 a,GRT,1,1, 
 a,GRJ,1,1, 
 a,SVJ,1,1, 
 a,JSV,1,1, 
 a,GRT,2,4, 
 a,GRJ,4,2, 
 b,GRT,3,3, 
 c,GRT,,,6 
 ``` 
 
## shapes.txt 
 
 ``` 
 shape_id,shape_pt_lat,shape_pt_lon " `

 frequencies.txt 
 
 ``` 
 trip_id,start_time,end_time,headway_secs 
 AWE1,05:30:00,06:30:00,300 
 AWE1,06:30:00,20:30:00,180 
 AWE1,20:30:00,28:00:00,420 
 ``` 
 
## transfers.txt 
 
 ``` 
 from_stop_id,to_stop_id,transfer_type,min_transfer_time 
 S6,S7,2 300 
 S7,S6,3, 
 S23,S7,1, 
 ``` 
 
## pathways.txt 
 
 ``` 
 path_id,from_stop_id,to_stop_id,pathway_mode,is_bidirectionnel 
 E1N1,E1,N1,2,1 
 E2N1,E2,N1,2,1 
 E3N1,E3,N1,2,1 
 N1-N2,N1,N2,6,1 
 N2- N1,N2,N1,7,1 
 N2N3,N2,N3,2,1 
 N2-B1,N2,B1,4,0 ​​
 B1-N2,B1,N2,4,0 
 B1B2, B1,B2,2,1 
 
 B1B3,B1,B3,1,1 
 B2B4,B2,B4,1,1 
 
 E4N3,E4,N3,2,1 
 E5N3,E5, N3,2,1 
 N3-N4,N3,N4,6,1 
 N4-N3,N4,N3,7,1 
 N4B3,N4,B3,2,1 
 N4-B3,N4, B3,4,0 
 B3-N4,B3,N4,4,0 
 B3B4,B3,B4,2,1 
 ``` 
 
## levels.txt 
 
 ``` 
 level_id,level_index,level_name,elevation 
 L0,0,Street,0 
 L1,-1,Mezzanine,-6 
 L2,-2,Southbound,-18 
 L3,-3,Northbound,- 24 
 ``` 
 
## translations.txt 
 
 ``` 
 table_name,field_name,langue,translation,record_id 
 arrêts,stop_name,en,Tokyo Station,stopid000001 
 arrêts,stop_name,fr,Gare de Tokyo,stopid000001 
 arrêts,stop_name,zh,東京站,stopid000001 
 ``` 
 
## attributions.txt 
 
 ``` 
 attribution_id,is_producter,is_operator,organization_name,agency_id 
 attribution001,1,0,Transit Feed Solutions USA,agency001 
 attribution002,0,1,Transit Bus Operations USA,agency001 
 [...] 
 ```