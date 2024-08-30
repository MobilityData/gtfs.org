# GTFS-Fares v2 

 Tarifas v2 es un proyecto de extensión del GTFS Schedule que tiene como objetivo abordar las limitaciones de [Tarifas v1](../../../documentation/schedule/examples/fares-v1/). 
 
 Los principales conceptos que Tarifas v2 planea representar son:

 - Productos tarifarios (p.ej., boletos y pases) 
 - Categorías de pasajeros (p.ej., personas mayores y niños) 
 - Medios tarifarios (p.ej., pases de tránsito, boletos impresos, tarjetas bancarias sin contacto) 
 - Limitación de tarifas 
 
 Estos conceptos permitirán a los productores de datos modelar tarifas basadas en zonas, dependientes del tiempo y entre agencias. Este proyecto de extensión se está adoptando en iteraciones. 
 
 Puedes ver [ejemplos aquí](../../../documentation/schedule/examples/fares-v2) que muestran lo que se puede modelar usando lo que se ha adoptado oficialmente en GTFS. 
 
 Los productores pueden implementar Tarifas v2 en el mismo conjunto de datos con Tarifas v1, ya que no existe ningún conflicto técnico entre los dos. Los consumidores pueden elegir qué versión utilizar independientemente de la otra. Con la adopción y el respaldo suficiente de Tarifas v2, Tarifas v1 puede quedar obsoleto en el futuro. 
 
 [Ver la propuesta completa](https://share.mobilitydata.org/gtfs-fares-v2){ .md-button .md-button--primary } 
 
## Participa en la conversación 
 Puede mantenerse date y unirse a las discusiones sobre Tarifas v2 uniéndose a nuestro Slack Chanel y a las reuniones recurrentes del grupo de trabajo. 
 
 [Únase a#gtfs-fares en Slack](https://share.mobilitydata.org/slack){ .md-button .md-button--primary} [Ver el calendario de reuniones](https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057){ .md-button .md-button--primary } [Ver notas de la reunión](https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit){ .md-button .md-button--primary } 
 
## Primeros usuarios 
 
 🎉 ¡Un saludo a los primeros usuarios de Tarifas v2! Al menos 1 productor de datos y 1 consumidor deben comprometerse a implementar una característica experimental antes de que se abra una votación pública para agregarla a la especificación oficial. Estas organizaciones invierten una gran cantidad de tiempo y energía en cambios experimentales para garantizar que GTFS siga evolucionando. 
 
 - Productores: <a href="https://www.interline.io/" target="_blank">Interline</a>, <a href="https://www.mta.maryland.gov/developer-resources" target="_blank">Departamento de Transporte de Maryland</a>, <a href="https://dot.ca.gov/cal-itp/cal-itp-gtfs" target="_blank">Cal-ITP</a>, <a href="https://trilliumtransit.com/" target="_blank">Trillium Solutions</a>, <a href="https://www.itoworld.com/" target="_blank">ITO World</a>, <a href="https://www.mbta.com/" target="_blank">MBTA</a>, <a href="http://www.pvta.com/" target="_blank">PVTA</a> 
 - Consumidores: <a href="https://transitapp.com/" target="_blank">Transit</a>, <a href="https://www.apple.com/">Apple Maps</a> 
 
## Rastreador de adopción

### Actual 
 
 <iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid#ccc;"></iframe> 
 
 [Solicitar un cambio](https://airtable.com/shr8aT0K9bpncmy0V){ .md-button .md-button--primary } [Agregue su organización (consumidores)](https://airtable.com/shr5B6Pl1r9KH9qMX){ .md-button .md-button--primary } [Agregue su organización (productores)](https://airtable.com/shrn0Afa3TPNkOAEh){ .md-button .md-button--primary } 

### Futuro 
 <iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid#ccc;"></iframe> 
 
 [Agregue sus planes futuros](https://airtable.com/shrvnI40zuFXmDsQI){ .md-button .md-button--primary } 
 
## Funciones de Tarifas v2 en discusión 
 
 <iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px;"></iframe> 
 
## Historia

- **2017**: Investigación de la industria y modelado de datos
- **Octubre 2021**: <a href="https://github.com/google/transit/pull/286#issue-1026848880" target="_blank">Implementación Base redactada y compartida</a> 
- **Diciembre 2021**: <a href="https://github.com/google/transit/pull/286#issuecomment-990258396" target="_blank">Votación abierta#1 → no pasó</a> 
- **Marzo de 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1080716109" target="_blank">Votación abierta#2 → no pasó</a> 
- **Mayo de 2022**: <a href="https://github.com/google/transit/pull/286#issuecomment-1121392932" target="_blank">Votación abierta#3 → aprobó</a> 
- **Agosto de 2022**: <a href="https://github.com/google/transit/issues/341" target="_blank">Comienza el debate comunitario sobre la próxima fase de Tarifas v2</a> 
- **Noviembre de 2022**: <a href="https://github.com/google/transit/pull/355" target="_blank">Se abre la solicitud de extracción del borrador de medios de tarifas para recibir comentarios</a> 
- **Diciembre de 2022**: <a href="https://github.com/google/transit/issues/341#issuecomment-1339947915" target="_blank">La comunidad identifica el orden de clasificación de las funciones parapriorizar las iteraciones</a> 
- **Marzo 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Tarifas de pases de medios</a> 
- **Julio de 2023**: <a href="https://github.com/google/transit/pull/357#issuecomment-1653561813" target="_blank">Tarifas que varían según los pases de hora/día</a> 
- **Noviembre de 2023**: <a href="https://github.com/google/transit/pull/405#issuecomment-1830665141" target="_blank">Archivos dedicados para definir redes</a> 
