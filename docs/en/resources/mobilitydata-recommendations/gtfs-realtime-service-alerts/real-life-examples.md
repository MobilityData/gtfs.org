# Real-life examples and how to fix them

In this example, we present examples of Service Alerts that were created for real-world agencies. We explore the issues with these alerts and suggest improvements to them.

## 1\) Toronto Transit Commission

Published on 28-03-2025

* The header is badly formatted. It seems to continue into the description.   
* The header should be modified to “Line 1 Yonge-University: No service between St George and St Andrew”.  
* The description should be finished: “Service will resume…”  
* The effect should be modified to `MODIFIED_SERVICE`.  
  * Do not set `NO_SERVICE` as this effect is currently generally concerned with stop and platform closures. In this case, it seems like the trip is effectively split in the middle into two separate trips.  
* The cause should be modified to `MAINTENANCE`.  
* Too many `route_ids` included as informed entities. The only route that should be mentioned is the Yonge-University Line (`route_id=1`). And all station stop_ids between St George and St Andrew should be mentioned.  
* No time period is associated with the alert.

```  
{  
  "id": "1",  
  "alert": {  
    "informedEntity": [  
      {  
        "agencyId": "1",  
        "routeId": "508"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "13"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "503"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "504"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "505"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "501"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "94"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "97"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "304"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "19"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "26"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "300"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "301"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "303"  
      },  
      {  
        "agencyId": "1",  
        "routeId": "305"  
      }  
    `],  
    "cause": "UNKNOWN_CAUSE",  
    "effect": "UNKNOWN_EFFECT",  
    "headerText": {  
      "translation": [  
        {  
          "text": "Line 1 Yonge-University: There i",  
          "language": "en"  
        }  
      ]  
    },  
    "descriptionText": {  
      "translation": [  
        {  
          "text": "There is no subway service on Line 1 Yonge-University between St George and St Andrew stations due to planned track work. Shuttle buses will not operate. Follow the station signs or speak to a TTC employee for help. Service will resume",  
          "language": "en"  
        }  
      ]  
    }  
  }  
}  
```

**Improved alert**

```  
{  
     "id": "1",  
     "alert": {  
       "informedEntity": [  
{  
 "agencyId": "1",  
 "routeId": "1",  
 "stopId": "14445", // St George Station - southbound platform`  
},  
{  
 "agencyId": "1",  
 "routeId": "1",  
 "stopId": "14446", // Museum Station - southbound platform`  
},  
`…`

{  
 "agencyId": "1",  
 "routeId": "1",  
 "stopId": "14421", // St Andrew Station - southbound platform`  
},  
{  
 "agencyId": "1",  
 "routeId": "1",  
 "stopId": "14422", // Osgoode Station - southbound platform`  
},  
`...`  
       `],  
       "cause": "MAINTENANCE",  
       "effect": "NO_SERVICE",  
       "activePeriod": [  
 {  
   "start": ...`  
   "end": ...`  
 }  
`],

       "headerText": {  
         "translation": [  
           {  
             "text": "Line 1 Yonge-University: No service between St George and St Andrew",  
             "language": "en"  
           }  
         ]  
       },  
       "descriptionText": {  
         "translation": [  
           {  
             "text": "There is no subway service on Line 1 Yonge-University between St George and St Andrew stations due to planned track work. Shuttle buses will not operate. Follow the station signs or speak to a TTC employee for help. Service will resume at 3AM.",  
             "language": "en"  
           }  
         ]  
       }  
     }  
   }  
```

## 2\) BC Transit

Published on 28-03-2025

* The header should be expanded: “No service in the Cowichan Valley due to Labour action.”   
* The cause should be modified to `STRIKE`.  
* The effect should be modified to `NO_SERVICE`.  
* The URL mentioned in the description should be included in the `url` field.

```  
{  
 "id": "ft-TX1173397",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1739001600"  
     }  
   `],  
   "informedEntity": [  
     {  
       "routeId": "2-COW"  
     },  
     {  
       "routeId": "3-COW"  
     },  
	`...`

   `],  
   "cause": "UNKNOWN_CAUSE",  
   "effect": "OTHER_EFFECT",  
   "headerText": {  
     "translation": [  
       {  
         "text": "No Service"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Please be advised that all services in the Cowichan Valley are suspended due to labour action.\r\n\r\nWe apologize for any inconvenience this may cause. \r\n\r\nFor updates please sign up for alerts, please visit\u202fhttps://www.bctransit.com/cowichan-valley  "  
       }  
     ]  
   }  
 }  
}  
```

**Improved alert**

```  
{  
 "id": "ft-TX1173397",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1739001600"  
     }  
   `],  
   "informedEntity": [  
     {  
       "routeId": "2-COW"  
     },  
     {  
       "routeId": "3-COW"  
     },  
	`...`

   `],  
   "cause": "STRIKE",  
   "effect": "NO_SERVICE",  
   "headerText": {  
     "translation": [  
       {  
         "text": "No service in the Cowichan Valley due to Labour action"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Please be advised that all services in the Cowichan Valley are suspended due to labour action.\r\n\r\nWe apologize for any inconvenience this may cause. \r\n\r\nFor updates please sign up for alerts, please visit\u202fhttps://www.bctransit.com/cowichan-valley"  
       }  
     ]  
   },  
	`“url”: “https://www.bctransit.com/cowichan-valley”,  
 }  
}  
```

## 3\) MBTA

Published on 02-04-2025

* Really good `informed_entity`, including the exact trip and direction.  
* The header contains information that can be transferred to the description.  
* The alert could use a `SIGNIFICANT_DELAYS` effect.

```  
{  
 "id": "634445",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1743086220",  
       "end": "1743091200"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "1",  
       "routeId": "CR-Haverhill",  
       "routeType": 2,  
       "trip": {  
         "tripId": "SPRING2025V2-728425-1231-HaverhillBradfordVan",  
         "routeId": "CR-Haverhill",  
         "directionId": 0`  
       }  
     }  
   `],  
   "cause": "UNKNOWN_CAUSE",  
   "effect": "OTHER_EFFECT",  
   "headerText": {  
     "translation": [  
       {  
         "text": "Haverhill Line Train 1231 (10:25 am from North Station) is operating 10-20 minutes behind schedule between North Station and Reading due to a signal issue.",  
         "language": "en"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Affected direction: Outbound",  
         "language": "en"  
       }  
     ]  
   },  
   "severityLevel": "WARNING"  
 }  
}  
```

**Improved alert**

```  
{  
 "id": "634445",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1743086220",  
       "end": "1743091200"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "1",  
       "routeId": "CR-Haverhill",  
       "routeType": 2,  
       "trip": {  
         "tripId": "SPRING2025V2-728425-1231-HaverhillBradfordVan",  
         "routeId": "CR-Haverhill",  
         "directionId": 0`  
       }  
     }  
   `],  
   "cause": "UNKNOWN_CAUSE",  
   "effect": "SIGNIFICANT_DELAYS",  
   "headerText": {  
     "translation": [  
       {  
         "text": "Haverhill Line Train 1231 running behind schedule.",  
         "language": "en"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Haverhill Line Train 1231 (10:25 am from North Station) is operating 10-20 minutes behind schedule between North Station and Reading due to a signal issue. Affected direction: Outbound",  
         "language": "en"  
       }  
     ]  
   },  
   "severityLevel": "WARNING"  
 }  
}  
```

## 4\) AMB-Mobilitat

Published on 28-03-2025

* The affected stops (if known) should be added to both the description and to informed entities.  
* Characters like \&nbsp; and \\n should be replaced by plain text counterparts.

```  
{  
 "id": "24950",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1743724800",  
       "end": "1743811140"  
     }  
   `],  
   "informedEntity": [  
     {  
       "routeId": "302"  
     },  
     {  
       "routeId": "303"  
     },  
     {  
       "stopId": "107046"  
     }  
   `],  
   "cause": "MAINTENANCE",  
   "effect": "DETOUR",  
   "url": {  
     "translation": [  
       {  
         "text": "http://www.ambmobilitat.cat/Principales/Noticia.aspx?incidencia=24950&idioma=1",  
         "language": "ca"  
       },  
       {  
         "text": "http://www.ambmobilitat.cat/Principales/Noticia.aspx?incidencia=24950&idioma=2",  
         "language": "es"  
       }  
     ]  
   },  
   "headerText": {  
     "translation": [  
       {  
         "text": "Desviament provisional al carrer Prat de la Riba afectant parades",  
         "language": "ca"  
       },  
       {  
         "text": "Desv\u00edo provisional en la calle Prat de la Riba afectando paradas",  
         "language": "es"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Divendres&nbsp;4&nbsp;d&rsquo;abril de 2025 durant tot el servei,&nbsp;es modifica el recorregut habitual al carrer Prat de la Riba de&nbsp;Santa Coloma de Gramenet amb l&rsquo;anul&middot;laci&oacute; provisional de les parades afectades.\n\nLes l&iacute;nies seran desviades tal i com s&rsquo;indica al pl&agrave;nol seg&uuml;ent:\n\n\n",  
         "language": "ca"  
       },  
       {  
         "text": "Viernes 4&nbsp;de abril de 2025 durante todo&nbsp;el servicio, se&nbsp;modifica el recorrido&nbsp;habitual en la calle&nbsp;Prat de la Riba de&nbsp;Santa Coloma de Gramenet con la anulaci&oacute;n&nbsp;provisional de las paradas afectadas.\n\nLas lineas&nbsp;ser&aacute;n desviadas tal y como se indica en el siguiente plano:\n\n:\n",  
         "language": "es"  
       }  
     ]  
   }  
 }  
}  
```

## 5\) King County Metro

Published on 28-03-2025

* The cause should be modified to `OTHER_CAUSE`.  
* A description should be added.

```  
{  
 "id": "18180",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1657226640"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "1",  
       "routeId": "102698",  
       "routeType": 3`  
     }  
   `],  
   "cause": "UNKNOWN_CAUSE",  
   "effect": "NO_SERVICE",  
   "url": {  
     "translation": [  
       {  
         "text": "https://svtbus.org/duvall-monroe-shuttle/",  
         "language": "en"  
       }  
     ]  
   },  
   "headerText": {  
     "translation": [  
       {  
         "text": "Duvall-Monroe Shuttle service is suspended until further notice due to driver shortage.\n\n",  
         "language": "en"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "",  
         "language": "en"  
       }  
     ]  
   },  
   "severityLevel": "SEVERE"  
 }  
}  
```

## 6\) Ruter \- OSLO

Published on 02-04-2025

* No cause or effect are mentioned. At least a `MODIFIED_SERVICE` effect should be added.  
  * Do not set `NO_SERVICE` as this effect is currently generally concerned with stop and platform closures. In this case, it seems like the trip is effectively split in the middle into two separate trips.  
* The `route_id` for the metro should be included in `informed_entity`, along with the unserved segment of stations.  
* If the replacement bus service does not exist in the GTFS Schedule, it should be added to the GTFS Schedule. If the replacement bus service corresponds to a route in the GTFS and you cannot define the additional trips in the GTFS Schedule, then create it in `tripUpdates` with the `TripDescriptor \= NEW`.  
* The language codes need to be provided with the header and description text.

```  
{  
 "id": "RUT:SituationNumber:732042",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1743130800",  
       "end": "1762218000"  
     }  
   `],  
   "url": {},  
   "headerText": {  
     "translation": [  
       {  
         "text": "Buss for T-bane mellom Borgen og Majorstuen"  
       },  
       {  
         "text": "Bus replacement service between Borgen and Majorstuen "  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Buss erstatter T-banen mellom Borgen og Majorstuen. T-banen kj\u00f8rer Kols\u00e5s\u2013Borgen og Stortinget\u2013Mortensrud."  
       },  
       {  
         "text": "Bus replaces the Metro between Borgen and Majorstuen. The Metro runs between Kols\u00e5s and Borgen, and between Stortinget and Mortensrud."  
       }  
     ]  
   }  
 }  
}  
```

## 7\) Calgary Transit

Published on 02-04-2025

* The field `agency_id` does not exist in the GTFS Schedule. So the agency_id in informed entities points to the agency_name. Since there is only one agency in the GTFS Schedule feed (Calgary Transit), it is better to only keep the `route_id` in `informed_entity`.  
* A header should be added.  
* The description text should become plain text.   
* The description seems to include the cause and effect of the alert.  
  * The cause should be added as `WEATHER`.  
  * The effect mentioned is `SIGNIFICANT_DELAYS`. However, the description alludes to closed stops or potentially a detour. Therefore, the description should be clarified along with the effect.  
  * If possible, split the alert into multiple alerts; one for the stop closure or detour, the other for any significant delays that might arise from it.

```  
{  
 "id": "143607",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1743605700",  
       "end": "1743832740"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "Calgary Transit",  
       "routeId": "123"  
     }  
   `],  
   "headerText": {  
     "translation": [  
       {  
         "text": "",  
         "language": "en"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "<div data-headertext=\"Major service delay\" data-cause=\"WEATHER\" data-effect=\"SIGNIFICANT_DELAYS\"></div><p>Due to current weather conditions, we are unable to serve Hidden Creek Drive N.W.</b>\n<p><b>Stops temporarily closed:</b>\n<p>Northbound: #9340, #9341, #9342 and #9705\n<p><b>Buses running to North Point will travel:</b>\n<ul>\n<li>From Hidden Valley Link N.W.\n<li>South on Beddington Trail N.W.\n<li>East on Country Hills Boulevard N.W.\n<li>North on Panorma Hills Boulevard N.W.\n<li>West on Panamount Boulevard N.W.\n<li>East on Pantella Boulevard N.W. to regular route\n</ul>\n<p>For more information on snow detours, please visit calgarytransit.com/snowdetours",  
         "language": "en"  
       }  
     ]  
   }  
 }  
}  
```

## 8\) MTA New York City Transit

Published on 02-04-2025

* The header is much longer than the description. The second part of the header “ \- use the stops on Lexington Ave at E 53rd St or E 41st St instead” can be transferred to the description.  
* The `stop_id` for Lexington Ave at E 46th St should be added to each entity in informed entities, to specify that the alert is only applied to the affected routes at the “Lexington Ave at E 46th St “ stop only. If the affected routes are the only routes that use that stop, then the `route_ids` are not necessary to include.  
* The cause should be added as `CONSTRUCTION`.  
* The effect should be added as `NO_SERVICE`.  
* HTML entities like “\</b\>” should be replaced with plain text alternatives.  
* The “en-html” translation should be removed.

```  
{  
 "id": "lmm:planned_work:21840",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1733288400",  
       "end": "1759104000"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "MTA NYCT",  
       "routeId": "SIM11"  
     },  
     {  
       "agencyId": "MTA NYCT",  
       "routeId": "SIM6"  
     }  
   `],  
   "headerText": {  
     "translation": [  
       {  
         "text": "Southbound SIM6 and SIM11 buses are skipping the stop on Lexington Ave at E 46th St - use the stops on Lexington Ave at E 53rd St or E 41st St instead",  
         "language": "en"  
       },  
       {  
         "text": "<p>Southbound <b>SIM6</b> and <b>SIM11</b> buses are skipping the stop on Lexington Ave at E 46th St - use the stops on Lexington Ave at E 53rd St or E 41st St instead</p>",  
         "language": "en-html"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "See a map of the bypass.\n\nWhat's happening?\nWater main construction",  
         "language": "en"  
       },  
       {  
         "text": "<p><a title=\"\" href=\"https://files.mta.info/s3fs-public/2024-12/Southbound%20%E2%80%8CSIM6%E2%80%8C%20and%20%E2%80%8CSIM11%E2%80%8C%20stop%20on%20Lexington%20Ave%20at%20E%2046th%20St%20is%20being%20skipped.png\" rel=\"noopener noreferrer nofollow\" data-link-auto=\"\" target=\"_blank\">See a map</a> of the bypass.</p><p></p><p><strong>What's happening?</strong></p><p>Water main construction</p>",  
         "language": "en-html"  
       }  
     ]  
   }  
 }  
}  
```

## 9\) MTA Bus Company

Published on 02-04-2025

* The effect should be modified to `ACCESSIBILITY_ISSUE`.  
* The cause should be modified to `MAINTENANCE` or `CONSTRUCTION`.  
* In `informed_entity`, the `stop_id` for the \[7\] platform should be mentioned, the station as well.  
* “accessibility icon” should be removed, and HTML entities like “\&nbsp;” should be replaced with plain text alternatives.  
* The “en-html” translation should be removed.

```  
{  
 "id": "lmm:planned_work:22052",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1734411600",  
       "end": "1758672000"  
     }  
   `],  
   "informedEntity": [  
     {  
       "agencyId": "MTABC",  
       "routeId": "Q70+"

     }  
   `],  
   "headerText": {  
     "translation": [  
       {  
         "text": "74 St-Broadway/Jackson Hts-Roosevelt Av [E][F][M][R][7] Station elevators from the street level to mezzanine and to/from the [7] platform are closed",  
         "language": "en"  
       },  
       {  
         "text": "<p><b>74 St-Broadway</b>/<b>Jackson Hts-Roosevelt Av</b> [E][F][M][R][7] Station elevators from the street level to mezzanine and to/from the [7] platform are closed</p>",  
         "language": "en-html"  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "accessibility icon The nearest accessible subway station connecting with the Q70-SBS is 61 St-Woodside accessibility icon [7]. \n\nFor additional travel alternatives, plan your trip at mta.info, use the MTA app (download the app for iOS or Android), or check our Elevator & Escalator Status page.\n\nWhat's happening?We're replacing the elevators",  
         "language": "en"  
       },  
       {  
         "text": "<p>[accessibility icon] The nearest accessible subway station connecting with the <b>Q70-SBS</b> is <b>61 St-Woodside</b> [accessibility icon] [7]. </p><p style=\"min-height:10px\"></p><p>For additional travel alternatives, plan your trip at <a title=\"\" href=\"https://new.mta.info/\" rel=\"noopener noreferrer nofollow\" data-link-auto=\"\" target=\"_blank\">mta.info</a>, use the MTA app (download the app for <a title=\"\" href=\"https://apps.apple.com/us/app/mymta/id1297605670\" rel=\"noopener noreferrer nofollow\" target=\"_blank\">iOS</a> or <a title=\"\" href=\"https://play.google.com/store/apps/details?id=info.mta.mymta&amp;hl=en_US&amp;gl=US\" rel=\"noopener noreferrer nofollow\" target=\"_blank\">Android</a>), or check our Elevator &amp; Escalator Status page.</p><p style=\"min-height:10px\"></p><p><strong>What's happening?</strong><br><a title=\"\" href=\"https://new.mta.info/project/station-accessibility-upgrades/elevator-replacements\" rel=\"noopener noreferrer nofollow\" data-link-auto=\"\" target=\"_blank\">We're replacing the elevators</a></p>",  
         "language": "en-html"  
       }  
     ]  
   }  
 }  
}  
```

## 10\) BigBlueBus

Published on 02-04-2025

* The alert includes the effect, cause, `informed_entity` and an open-ended `active_period`.  
* The description is concise and shares the necessary information.  
* The alert could also include route 7 in the header. It could also include route 7 in informed entities if the stop is skipped only by route 7\.  
* The alternate stops should be listed in the alert description.  
* The URL seems to be a link to the agency’s general alerts page, rather than specific information related to this alert. The URL needs to direct the rider to a page that details the alert or contains information directly related to it.

```  
{  
 "id": "3f0a0d8a-f751-4d79-843a-98227f597a7d",  
 "alert": {  
   "activePeriod": [  
     {  
       "start": "1736185080"  
     }  
   `],  
   "informedEntity": [  
     {  
       "stopId": "1717"  
     }  
   `],  
   "cause": "MAINTENANCE",  
   "effect": "NO_SERVICE",  
   "url": {  
     "translation": [  
       {  
         "text": "https://www.bigbluebus.com/Newsroom/Content.aspx?type=Alerts"  
       }  
     ]  
   },  
   "headerText": {  
     "translation": [  
       {  
         "text": "Stop Closure on Pico Blvd. & Stanley Ave."  
       }  
     ]  
   },  
   "descriptionText": {  
     "translation": [  
       {  
         "text": "Route 7 bus stop located on WB Pico Blvd. at Stanley Ave. will be closed until further notice. For alternate stops, visit: bigbluebus.com/servicealerts."  
       }  
     ]  
   }  
 }  
}  
```
