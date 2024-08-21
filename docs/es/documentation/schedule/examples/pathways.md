# Recorridos y accesibilidad física

## ¿Por qué mostrar información de Accesibilidad ? 
 
 **Afecta a un gran porcentaje de la población:** La Organización Mundial de la Salud estima que [el 16% de las personas en todo el mundo tienen una discapacidad](https://www.who.int/news-room/fact-sheets/detail/disability-and-health) y que las personas con discapacidad “encuentran transporte inaccesible e inasequible 15 veces más difícil que para quienes no tienen discapacidad”. Las personas con discapacidad también tienen [tasas más altas de adquirir nuevas condiciones de salud](https://www.who.int/publications/i/item/9789240063600), en parte debido al acceso reducido a la atención y los servicios. 
 
 **Es importante para ellos:** Los pasajeros necesitan información actualizada y precisa sobre sus opciones de transporte. Muchas agencias ya utilizan la General Transit Feed Specification (GTFS) para representar información sobre rutas, horarios y ubicaciones de paradas que es fundamental para que los pasajeros planifiquen sus viajes y comprendan sus opciones. Para los pasajeros con necesidades de accesibilidad, conocer la accesibilidad de una parada o de un vehículo es tan importante como conocer su ubicación. Estos pasajeros necesitan conocer cada parte de su viaje para asegurarse de no quedarse varados en algún lugar o darse cuenta demasiado tarde de que no podrán llegar a su última parada. 
 
 **Puede ser la ley:** Dependiendo de su ubicación, la ley local o nacional puede exigir que brinde igualdad de acceso y oportunidades a las personas con discapacidades. Las siguientes son algunas fuentes que quizás desee considerar: 
 
 * **Estados Unidos:** La [Americans and Disabilities Act (ADA)](https://www.ada.gov/topics/intro-to-ada/#public-transit) y [Sección 504](https://www.dol.gov/agencies/oasam/centers-offices/civil-rights-center/statutes/section-504-rehabilitation-act-of-1973 ) de la Ley de Rehabilitación de 1973 
 * **Japón:** Ley del Ministerio de Tierras, Infraestructura, Transporte y Turismo de Japón para promover la fácil movilidad y Accesibilidad para las personas mayores y discapacitadas (“[Ley sin barreras](https://www.mlit.go.jp/sogoseisaku/barrierfree/index.html)”) 
 * **Unión Europea:** [Empleo, Asuntos Sociales e Inclusión](https://ec.europa.eu/social/main.jsp?catId=1485&amp;langId=en) 
 
## Lista de verificación de Accesibilidad 
 
 Los siguientes son los pasos necesarios para agregar información de accesibilidad a sus datos. Las siguientes secciones proporcionan información más detallada sobre cada paso. 

 * Paso 1: Agregar información de accesibilidad para sillas de ruedas a `stops.txt` 
 * Paso 2: Agregar información de accesibilidad para sillas de ruedas a `trips.txt` 
 * Paso 3: Agregar información de navegación de audio a `stops.txt` 
 * Paso 4: Agregar información de accesibilidad física sobre las estaciones de transporte con GTFS Recorridos## Agregar Accesibilidad para sillas de ruedas en GTFS 
 
 Es posible que ya esté familiarizado con la estructura de GTFS como una serie de archivos.txt. La accesibilidad para sillas de ruedas se puede mostrar actualizando dos campos: `wheelchair_boarding` en `stops.txt` y `wheelchair_accessible` en `trips.txt`. 
 
 **Accesibilidad para sillas de ruedas en stops.txt** 
 El campo `wheelchair_boarding` en `stops.txt` permite indicar si es posible el embarque en silla de ruedas desde la ubicación especificada. 
 
 [Referencia: stops.txt](../../reference/#stopstxt) 
 
 Cuando este campo se deja vacío, no se muestra información de accesibilidad. Esto deja a los pasajeros inseguros sobre la accesibilidad y no pueden saber si el embarque en silla de ruedas realmente no es posible o si simplemente falta información. Incluso si el embarque en silla de ruedas no está disponible, es mejor completar esa información para dejarla clara a los pasajeros y permitirles planificar su viaje con información precisa. 
 
 **Accesibilidad para sillas de ruedas en trips.txt** 
 El campo `wheelchair_accessible` en `trips.txt` permite indicar si el vehículo que se utiliza para un viaje específico tiene capacidad para una silla de ruedas. 
 
 [Referencia: trips.txt](../../reference/#tripstxt) 
 
 Al igual que `wheelchair_boarding`, cuando este campo se deja vacío, no se muestra información de accesibilidad. Incluso si el vehículo no es accesible para sillas de ruedas, es mejor completar esa información para dejarla clara a los pasajeros y permitirles planificar su viaje con información precisa. 
 
## Agregar ayudas de audio para la navegación 
 
 Texto a voz es otra forma de aumentar la accesibilidad de su GTFS. La información precisa de texto a voz garantiza que los usuarios que utilizan tecnología de asistencia para leer texto en voz alta obtengan la información correcta. Esta información se puede incluir en su GTFS actualizando `tts_stop_name` en `stops.txt` para que corresponda a cada `stop_name`. Cada parada dentro de su GTFS debe tener una desambiguación de texto a voz que explique la parada fonéticamente para que pueda pronunciarse correctamente. 
 
 [Ejemplos: Texto a Voz](../../examples/text-to-speech) 
 
 Si bien `tts_stop_name` es actualmente el único campo de texto a voz adoptado oficialmente dentro del Especificación GTFS, se han discutido otros campos y es posible que se agreguen. Estos incluyen `tts_agency_name`, `tts_route_short_name`, `tts_route_long_name`, `tts_trip_headsign`, `tts_trip_short_name` y `tts_stop_headsign`. 
 
 Los pasajeros deberán utilizar una aplicación que admita la funcionalidad de conversión de texto a voz para poder beneficiarse de esta información. Algunas aplicaciones, como [NaviLensGo](https://www.navilens.com/en/), están diseñadas específicamente para ayudar a los pasajeros con discapacidad visual a navegar por las estaciones y encontrar el vehículo adecuado. 
 
## Agregar información de Accesibilidad física sobre una estación 
 
 GTFS-Pathways es un componente de GTFS que representa los detalles de la estación de tránsito. Permite a los pasajeros saber si podrán realizar el traslado requerido en una estación de tránsito. 
 
 GTFS-Pathways agrega los archivos `pathways.txt` y `levels.txt`, además de agregar el campo `location_type` en `stops.txt` para vincular la información descrita en `pathways.txt`. 
 
<img class="center" src="../../../../assets/pathways-visual.jpg"> 
 
### Describir la ubicación de las entradas y salidas de las estaciones 
 
 Con GTFS, es posible describir con precisión las estaciones utilizando información sobre las entradas y los interiores de las estaciones. Este ejemplo describe secciones de Waterfront Station en el centro de Vancouver. La estación forma parte de la red Skytrain de la ciudad y cuenta con el servicio de la Línea Canadá, la Línea Expo, el SeaBus y el West Coast Express. Tres entradas a nivel de calle permiten a los pasajeros entrar y salir de la estación. El resto de la estación es subterráneo, con un nivel de vestíbulo para validación de tarifas y un nivel inferior con andenes. 
 
 Primero, la ubicación de la estación y sus entradas se definen en [stops.txt](../../reference/#stopstxt): 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
12034,Waterfront Station,49.285687,-123.111773,1,,
90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2
```
 
 En el archivo anterior, el primer registro pertenece a la ubicación de la estación, por lo tanto, `location_type` se establece en `1`. Los otros cinco pertenecen a las tres entradas de la estación (se necesitan cinco registros ya que la entrada de Granville en realidad tiene tres entradas separadas, una escalera, una escalera mecánica y un ascensor). Estos cinco registros se definen como entradas ya que "`location_type`" está establecido en "2". 
 
 Además, el `stop_id` de Waterfront Station aparece en `parent_station` para las entradas para asociarlas con la estación. Las entradas accesibles tienen `wheelchair_boarding` establecido en `1` y las no accesibles están configuradas en `2`. 
 
### Describir escaleras y escaleras mecánicas 
 
 La entrada a la estación Waterfront en la calle Granville tiene un ascensor, una escalera mecánica y escaleras; las entradas se definen como nodos arriba en [stops.txt](../../reference/#stopstxt). Para conectar las entradas a las secciones internas de la estación, se deben crear nodos adicionales en [stops.txt](../../reference/#stopstxt) bajo `parent_station` de Waterfront Station. En el archivo [stops.txt](../../reference/#stopstxt) a continuación, se definen los nodos genéricos (`e` 3`) que corresponden a la parte inferior de la escalera y la escalera mecánica. 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
...
95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,
```
 
<img class="center" src="../../../../assets/pathways.png" width=700px> 
 
 A continuación, el archivo [pathways.txt](../../reference/#pathwaystxt) se utiliza para vincular nodos para crear caminos, donde el primer registro vincula los nodos pertenecientes a la parte superior e inferior de las escaleras..El `pathway_mode` está configurado en `2` para indicar escaleras, y el último campo describe que los pasajeros pueden subir y bajar escaleras en ambos sentidos. 
 
 De manera similar, el segundo registro describe la escalera mecánica (`pathway_mode` establecido en `4`). Dado que las escaleras mecánicas sólo pueden moverse en una dirección, el campo "`is_bidirectional`" se establece en "0", por lo que la escalera mecánica se mueve en una dirección, desde el nodo "96" al "91" (hacia arriba). 
 
 [** pathways.txt**](../../reference/#pathwaystxt) 
 
```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
stairsA,90,95,2,1
escalatorA,96,91,4,0
```
 
### Describe ascensores y vías 
 
 El ascensor en la calle Granville lleva a los pasajeros a una vía en el nivel de la explanada donde se encuentra la escalera mecánica y las escaleras terminan. El ascensor en el nivel de la superficie ya está definido como una entrada a la estación arriba (`stop_id` `92`). Por lo tanto, también es necesario definir la puerta del ascensor al nivel del vestíbulo. 
 
 Además, como se muestra en la siguiente figura, hay una pasarela subterránea que conecta la parte inferior de las escaleras, las escaleras mecánicas y el ascensor en la calle Granville con el edificio de la estación principal. Por lo tanto, se crean dos nodos adicionales para definir las secciones de pasarela. 
 
<img class="center" src="../../../../assets/pathways-2.png" width=500px> 
 
 [** stops.txt**](../../reference/#stopstxt) 
 
```
stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
…
97,Underground walkway turn,49.286253,-123.112660,3,12034,
98,Underground walkway end,49.286106,-123.112428,3,12034,
99,Elevator_concourse,49.285257,-123.114163,3,12034,
```
 
<img class="center" src="../../../../assets/pathways-3.png" width=500px> 
 
 Por último, los nodos se conectan entre sí para definir el camino subterráneo como se muestra en el archivo [pathways.txt](../../reference/#pathwaystxt) a continuación: 
 
 [** pathways.txt**](../../reference/#pathwaystxt) 
 
```
pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
underground_walkway1,99,96,1,1
underground_walkway2,96,95,1,1
underground_walkway3,95,97,1,1
underground_walkway4,97,98,1,1
```
 
## Adiciones futuras a GTFS-Pathways 
 
 Mientras que la especificación principal de GTFS-Pathways se ha integrado completamente en GTFS, se reconoce que se podría modelar información de accesibilidad adicional que sería útil para los pasajeros. Esto incluye información como instrucciones de texto a voz, información sobre asistencia en silla de ruedas, informes de fallas de equipos, cierres de entradas o salidas planificados o programados e interrupciones de ascensores y escaleras mecánicas. Puede encontrar más información sobre las partes restantes [en este documento](http://bit.ly/gtfs-pathways).