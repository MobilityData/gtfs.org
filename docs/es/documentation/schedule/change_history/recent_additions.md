# Cambios en GTFS Schedule

 La referencia del GTFS Schedule no está escrita en piedra. Más bien, es una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS. Se espera que esta comunidad de productores y consumidores de datos GTFS tenga propuestas para ampliar la especificación para habilitar nuevas capacidades. 
 
 Para contribuir al GTFS, lea el [Proceso de modificación de GTFS Schedule](../../../../community/governance/gtfs_schedule_amendment_process) y siga las discusiones en los <a href="https://github.com/google/transit/issues" target="_blank">temas</a> abiertos y <a href="https://github.com/google/transit/pulls" target="_blank">las Pull Requests</a> en el GTFS Repositorio de Github ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ). ![](../../../assets/mark-github.svg) 
 
 <!-- <div class="row"> 
     <div class="active-container"> 
         <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add trip-to-trip transfers with in-seat option</a></h3> 
         <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p> 
     </div> 
 </div> 
 <div class="row"></div> --> 
 
 <!-- <div class="row no-active"> 
     <div class="no-active-container"> 
         <h3 class="title">There are currently no active proposals for GTFS Schedule.</h3> 
         <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p> 
     </div> 
 </div> 
 <div class="row"></div> --> 
 
## Propuestas adoptadas recientemente <img src="../../../../assets/pr-merged.svg" style="height:1em;"/> 
 
 Propuestas recientemente adoptadas que ahora son funciones de la [referencia oficial de GTFS Schedule](../../referencia). Consulte el [Historial de revisiones](/documentation/schedule/change_history/revision_history) completo para obtener más información. 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/433" class="no-icon" target="_blank">Adopción de GTFS Flex</a></h3> 
        <p class="maintainer">#433 por <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> se adoptó el 19 de marzo de 2024</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> La <a href="../../../../community/extensions/flex" class="no-icon" target="_blank">propuesta GTFS-Flex</a> permite a los pasajeros descubrir servicios que respondan a la demanda en los planificadores de viajes</li> 
        <li> Se agregaron varios archivos a la especificación, incluido locations.geojson, que integra GeoJson en GTFS.</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/405" class="no-icon" target="_blank">networks.txt y route_networks.txt añadidos</a></h3> 
        <p class="maintainer"># 406 por <a href="https://github.com/tzujenchanmbd" class="no-icon" target="_blank">tzujenchanmbd</a> se adoptó el 28 de noviembre de 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Agrega dos archivos nuevos: <code>networks.txt</code> y <code>route_networks.txt</code> para construir redes de rutas asociadas a tarifas.</li> 
        <li> Proporciona una alternativa a <code>routes.network_id</code> para que los archivos de horarios y tarifas puedan ser distintos</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/406" class="no-icon" target="_blank">Mejores prácticas: agregar pautas de publicación <br> de feeds y recomendaciones para todos los archivos</a></h3> 
        <p class="maintainer">#406 por <a href="https://github.com/Sergiodero" class="no-icon" target="_blank">Sergiodero</a> se adoptó el 16 de noviembre de 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Agrega dos secciones de las mejores prácticas de GTFS a la especificación: pautas de publicación de conjuntos de datos y recomendaciones de prácticas para todos los archivos.</li> 
        <li> Actualiza una referencia a la función de combinación de la herramienta TransitFeed de Google, por lo que en su lugar hace referencia a una lista de herramientas de combinación.</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/386" class="no-icon" target="_blank">Mejores prácticas: agregar presencia recomendada</a></h3> 
        <p class="maintainer">#386 por <a href="https://github.com/emmambd" class="no-icon" target="_blank">emmambd</a> se adoptó el 1 de agosto de 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Agrega una nueva presencia Recomendado en la especificación que cumple con las convenciones RFC</li> 
        <li> Permite indicar claramente que un campo o archivo no es obligatorio, pero agregarlo es una mejor práctica que debe considerarse</li> 
        <li> Actualiza la información de varios archivos y campos para reflejar su presencia recomendada según las mejores prácticas de GTFS.</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/357" class="no-icon" target="_blank">Tarifas variables por hora o día añadidas</a></h3> 
        <p class="maintainer"># 357 de <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> se adoptó el 27 de julio de 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Las tarifas variables en el tiempo son una funcionalidad importante desarrollada como parte de la <a href="../../../../community/extensions/fares-v2">propuesta de extensión GTFS Fares-v2</a></li> 
        <li> Permite representar tarifas diferenciadas según la hora del día o el día de la semana, como tarifas pico y valle.</li> 
        <li> Agrega un nuevo archivo: <code>timeframes.txt</code>, para definir momentos en el tiempo donde se aplica la tarifa</li> 
            <li> Extiende <code>fare_leg_rules.txt</code> con <code>from_timeframe_id</code> y <code>to_timeframe_id</code> para especificar que una regla de tramo de tarifa se aplica solo si el comienzo o el final del tramo está en un período de tiempo específico.</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"> 
    <div class="leftcontainer"> 
        <h3 class="title"> <a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">Medios de tarifa añadidos</a></h3> 
        <p class="maintainer">#355 por <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> se adoptó el 14 de marzo de 2023</p> 
    </div> 
    <div class="featurelist"> 
        <ul> 
            <li> Medios de Tarifa es un elemento clave en la <a href="../../../../community/extensions/fares-v2">propuesta de extensión GTFS Fares-v2</a></li> 
        <li> Representa lo que un pasajero puede usar para validar su viaje (por ejemplo, una tarjeta de transporte público, una aplicación móvil o tocar para pagar con una tarjeta bancaria sin contacto).</li> 
        <li> Un producto tarifario se puede asociar a un Medios de Tarifa específico (por ejemplo, un pase mensual solo está disponible en una tarjeta de transporte público).</li> 
        <li> El precio de un producto tarifario se puede definir en función de Medios de Tarifa (por ejemplo, el billete es más barato si se compra a través de una aplicación móvil).</li> 
        </ul> 
    </div> 
</div> 
 
<div class="row"></div>