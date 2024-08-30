# Cambios en GTFS Realtime 

 La referencia GTFS Realtime no está escrita en piedra. Más bien, es una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS Realtime. Se espera que esta comunidad de productores y consumidores de datos GTFS Realtime tenga propuestas para ampliar la especificación para habilitar nuevas capacidades. 
 
 Para contribuir a GTFS Realtime, lea el [Proceso de enmienda de GTFS Realtime](../../../../community/governance/gtfs_realtime_amendment_process) y siga las discusiones en los <a href="https://github.com/google/transit/issues" target="_blank">temas</a> abiertos y <a href="https://github.com/google/transit/pulls" target="_blank">las solicitudes de extracción</a> en el Repositorio GTFS Github ( <a href="https://github.com/google/transit" target="_blank">google/transit</a> ). ![](../../../assets/mark-github.svg) 
 
 <!-- <div class="row"> 
     <div class="active-container"> 
         <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Add cause_detail and effect_detail to Alerts</a></h3> 
         <p class="maintainer">#332 opened on May 31, 2022 by <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p> 
     </div> 
 </div> 
 <div class="row"></div> --> 
 
 <!-- <div class="row no-active"> 
     <div class="no-active-container"> 
         <h3 class="title">There are currently no active proposals for GTFS Realtime.</h3> 
         <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p> 
     </div> 
 </div> 
 <div class="row"></div> --> 
 
## Propuestas adoptadas recientemente <img src="../../../../assets/pr-merged.svg" style="height:1em;"/> 
 
 Propuestas adoptadas recientemente que ahora son funciones de la [referencia oficial de GTFS Realtime](../../reference). Consulte el [Historial de revisiones](../revision_history) completo para obtener más información. 
 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/403" class="no-icon" target="_blank">Agregar Trip-Modifications</a></h3> 
<p class="maintainer">#332 por <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> se adoptó el 11 de marzo de 2024</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Agrega modificaciones de viaje como una característica experimental que se utiliza para describir desvíos que afectan un conjunto de viajes.</li> 
<li> Una modificación de viaje puede cancelar ciertas paradas, ajustar el tiempo de los viajes, proporcionar una nueva forma que tomarán los viajes y proporcionar la ubicación de paradas temporales a lo largo del camino.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/352" class="no-icon" target="_blank">Agregar enum DELETED <br>a schedule_relationship</a></h3> 
<p class="maintainer">#332 por <a href="https://github.com/mads14" class="no-icon" target="_blank">mads14</a> se adoptó el 30 de noviembre de 2022</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Agrega una nueva enumeración experimental de relación de programación de viaje <code>DELETED</code></li> 
<li> Esto se puede utilizar para transmitir que un proveedor de transporte tiene la intención de que un viaje desaparezca por completo de las aplicaciones públicas.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Agregar cause_detail y effect_detail a Alertas</a></h3> 
<p class="maintainer">#332 por <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> se adoptó el 26 de junio de 2022</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Agrega descripciones a las causas y efectos de las alertas.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt: actualización del acceso <br>para sillas de ruedas</a></h3> 
<p class="maintainer"># 340 por <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> se adoptó el 25 de julio de 2022</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Agrega información en tiempo real sobre la accesibilidad del viaje.</li> 
<li> Si se proporciona, sobrescribe <code>trips.wheelchair_accessible</code> en el conjunto de datos del GTFS Schedule.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Feature/image en alertas</a></h3> 
<p class="maintainer"># 283 por <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> se adoptó el 26 de noviembre de 2021</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Agrega un campo de un enlace URL a una imagen (por ejemplo, foto o mapa) que se mostrará en las alertas de servicio de las aplicaciones, para mejorar la comprensión de la alerta.</li> 
<li> Los cambios incluyen: límite de tamaño de imagen obligatorio, una imagen por alerta y garantía de que la URL cambie si cambia el contenido o el idioma de las imágenes.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"> 
<div class="leftcontainer"> 
<h3 class="title"> <a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Agregar GTFS-NewShapes como experimental</a></h3> 
<p class="maintainer"># 272 por <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> se adoptó el 30 de agosto de 2021</p> 
</div> 
<div class="featurelist"> 
<ul> 
<li> Capacidad para actualizar las formas de la ruta en tiempo real para reflejar los desvíos</li> 
<li> Las actualizaciones de ruta se reflejan haciendo referencia a un <code>shape_id</code> existente o definiendo en tiempo real una nueva forma como una polilínea codificada.</li> 
</ul> 
</div> 
</div> 
 
<div class="row"></div> 
