---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/pathways.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Vías de acceso

<hr/>

## Describir la ubicación de las entradas y salidas de la estación

Con GTFS, es posible describir con precisión las estaciones utilizando información sobre las entradas y el interior de las mismas. Este ejemplo describe secciones de la estación de Waterfront en el centro de Vancouver. La estación forma parte de la red de Skytrain de la ciudad y a ella llegan la Canada Line, la Expo Line, el SeaBus y el West Coast Express. Hay tres entradas a nivel de calle que permiten a los viajeros entrar y salir de la estación. El resto de la estación es subterránea, con un nivel de vestíbulo para la validación de billetes y un nivel inferior con andenes.

En primer lugar, la ubicación de la estación y sus entradas se definen en stops [stops.txt](../../reference/#pathwaystxt)txt:

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

En el archivo anterior, el primer registro corresponde a la ubicación de la estación, por lo que el `location_type` se establece en `1`. Los otros cinco corresponden a las tres entradas de la estación (se necesitan cinco registros, ya que la entrada de Granville tiene en realidad tres entradas distintas, una escalera, una escalera mecánica y un ascensor). Estos cinco registros se definen como entradas, ya que el `location_type` está fijado en `3`.

Además, el `stop_id` de la estación de Waterfront aparece en `parent_station` para las entradas con el fin de asociarlas con la estación. Las entradas accesibles tienen el valor `1` de `wheelchair_boarding` y las no accesibles el valor `2`.

## Describir las escaleras y escaleras mecánicas

La entrada de la estación Waterfront en la calle Granville tiene un ascensor, una escalera mecánica y escaleras, las entradas se definen como nodos arriba en stops. [stops.txt](../../reference/#stopstxt). Para conectar las entradas a las secciones interiores de la estación, hay que crear nodos adicionales en stops [stops.txt](../../reference/#stopstxt) txt bajo el `parent_station` de Waterfront Station. En el archivo [stops.txt](../../reference/#stopstxt).txt de abajo, se definen los nodos genéricos`(location_type 3`) que corresponden a la parte inferior de la escalera y la escalera mecánica.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

A continuación, se utiliza el archivo [pathways.txt](../../reference/#pathwaystxt).txt para enlazar los nodos y crear caminos, donde el primer registro enlaza los nodos correspondientes a la parte superior e inferior de las escaleras. El `pathway_mode` se establece en `2` para indicar las escaleras, y el último campo describe que los pasajeros pueden ir en ambos sentidos (arriba y abajo) en las escaleras.

Del mismo modo, el segundo registro describe las escaleras mecánicas`(pathway_mode` fijado en `4`). Dado que las escaleras mecánicas sólo pueden moverse en una dirección, el campo `is_bidirectional` se establece en `0`, por lo que la escalera mecánica se mueve en un solo sentido, del nodo `96` al `91` (hacia arriba).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Describir ascensores y caminos

El ascensor de la calle Granville lleva a los pasajeros a un camino en el nivel del vestíbulo donde end las escaleras mecánicas y las escaleras de mano. El ascensor en el nivel de superficie ya está definido como una entrada a la estación de arriba`stop_id` `92`). Por lo tanto, también hay que definir la puerta del ascensor en el nivel de vestíbulo.

Además, como se muestra en la figura siguiente, hay un pasillo subterráneo que conecta la parte inferior de las escaleras, la escalera mecánica y el ascensor en la calle Granville con el edificio principal de la estación. Por lo tanto, se crean dos nodos adicionales para definir las secciones de la pasarela.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Por último, los nodos se conectan entre sí para definir el trayecto subterráneo, como se muestra en el archivo [pathways.txt](../../reference/#pathwaystxt) txt que aparece a continuación:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
