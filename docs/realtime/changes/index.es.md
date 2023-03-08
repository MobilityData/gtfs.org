# Cambios en GTFS Realtime

La especificación GTFS Realtime no está grabada en piedra. Se trata de una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS Realtime. Se espera que esta comunidad de productores y consumidores de datos GTFS Realtime presente propuestas para ampliar la especificación con el fin de habilitar nuevas capacidades.

Para contribuir a GTFS Realtime, lea el [Proceso de modificación de la especificación](../process) y siga los debates en las [cuestiones](https://github.com/google/transit/issues) abiertas y las [solicitudes de extracción](https://github.com/google/transit/pulls) en el repositorio Github de Google Transit[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!!note ""

    La especificación oficial, la referencia y la documentación están escritas en inglés. Si la traducción a otro idioma difiere del original en inglés, este último tiene preferencia. Toda la comunicación se realiza en inglés.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Proceso de modificación del pliego de condiciones</a><a class="button" href="../guiding-principles">Principios rectores</a><a class="button" href="../revision-history">Historial de revisiones</a><a class="button" href="../extensions">ExtensionesRealtime</a>
</div> -->

## Propuestas activas &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Propuestas activas de nuevas funciones en GTFS Realtime.  -->

Únase a los debates en [Github](https://github.com/google/transit/pulls)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Añadir cause_detail y effect_detail a las alertas</a></h3>
        <p class="maintainer">#332 abierto el Puede 31, 2022 por<a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">Actualmente no hay propuestas activas para GTFS Realtime.</h3>
        <p class="prompt">¿Tiene una propuesta? &ensp;➜&ensp; Abrir un <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propuestas recientemente fusionadas &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Propuestas recientemente fusionadas que ahora forman parte de la [especificación oficial GTFS Realtime](../reference). Consulte el [historial de revisiones](../process#revision-history) completo para obtener más información.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Añadir cause_detail y effect_detail a las Alertas</a></h3>
        <p class="maintainer">#332 por <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> se fusionó el 26 de Jun de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Añade descripciones a las causas y efectos de las Alertas</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : actualización del acceso en silla de ruedas</a></h3>
        <p class="maintainer">#340 por <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> se fusionó el 25 de Jul de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Añade información en tiempo real sobre la accesibilidad de los viajes</li>
            <li>Si se proporciona, sobrescribe <code>trips.wheelchair_accessible</code> en el conjunto de datos GTFS Schedule</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Función/imagen en alertas</a></h3>
        <p class="maintainer">#283 por <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> se fusionó el 26 de November de 2021.</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Añade un campo con un enlace URL a una imagen (por ejemplo, una foto o un mapa) que se mostrará en las alertas de servicio de las aplicaciones, con el fin de mejorar la comprensión de la alerta.</li>
            <li>Cambios: límite de tamaño de la imagen, una imagen por alerta y garantía de que la URL cambia si cambia el contenido o el idioma de las imágenes.</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Añadir GTFS-NewShapes como experimental</a></h3>
        <p class="maintainer">#272 por <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> se fusionó el 30 de ago de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Capacidad para actualizar las formas de ruta en tiempo real para reflejar los desvíos</li>
            <li>Las actualizaciones de ruta se reflejan haciendo referencia a un <code>shape_id</code> existente o definiendo en tiempo real un nuevo shape como una polilínea codificada</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Añadir departure_occupancy_status a TripUpdate</a></h3>
        <p class="maintainer">#260 por <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> se fusionó el 14 de Abr de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Proporcionar la ocupación prevista de los vehículos de tránsito en las paradas futuras sobre la base de datos actuales o históricos</li>
        </ul>
    </div>
</div>

<div class="row"/>
