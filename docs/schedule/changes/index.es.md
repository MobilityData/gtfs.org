---
search:
  exclude: true
---
# Cambios en el GTFS Schedule

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

La especificación GTFS no está grabada en piedra. Por el contrario, es una especificación abierta desarrollada y mantenida por la comunidad de agencias de transporte, desarrolladores y otras partes interesadas que utilizan GTFS. Se espera que esta comunidad de productores y consumidores de datos GTFS tenga propuestas para ampliar la especificación para permitir nuevas capacidades.

Para contribuir GTFS, lea el [proceso de modificación de la especificación](../process) y siga los debates en las [cuestiones](https://github.com/google/transit/issues) abiertas y las [solicitudes de extracción](https://github.com/google/transit/pulls) en el repositorio Github de Google Transit[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!!note ""

    La especificación oficial, la referencia y la documentación están escritas en inglés. Si la Translation a otro idioma difiere del original en inglés, este último tiene preferencia. Toda la comunicación se realiza en inglés.

## Propuestas activas![](../../assets/pr-active.svg)

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> <glossary variable="Schedule">Schedule</glossary></glossary>.  -->

Únase a los debates en [Github](https://github.com/google/transit/pulls)

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> <glossary variable="Schedule">Schedule</glossary></glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propuestas recientemente fusionadas![](../../assets/pr-merged.svg)

Propuestas recientemente fusionadas que ahora son características de la [especificación oficial GTFS Schedule](../reference). Consulte el [historial de revisiones](../process#revision-history) completo para obtener más información.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Añadir transferencias trip con opción de asiento</a></h3>
        <p class="maintainer">#303 por <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> se fusionó el 26 de Jun de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Añade nuevos <code>transfer_type</code>`s para transferencias de trip a trip para definir si un usuario puede hacer una "transferencia en el asiento" cuando el mismo vehicle está operando dos viajes consecutivos y el usuario puede permanecer a bordo</li>
            <li>Puede definir cuando no se permiten las transferencias en el asiento pero puede unir dos viajes diferentes operativamente
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">Implementación base de GTFS-Fares V2</a></h3>
        <p class="maintainer">#286 por <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> se fusionó el 17 de mayo 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Tarifas y billetes de transporte</li>
            <li>Modelización de costes para tarifas y transbordos complejos (transbordos multirred, time y en el recuento)</li>
            <li>Modelo para asociar las paradas a las zonas tarifarias</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">Transferencias de trip y de ruta a ruta</a></h3>
        <p class="maintainer">#284 por <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> se fusionó el 5 de octubre de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Especificar las reglas para los transbordos entre pares de paradas, trip o rutas en transfers.txt</li>
             <li>Clasificación de la especificidad de las reglas de transferencia en función de las diferentes disposiciones de los pares</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 por <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> se fusionó el 13 de mayo de 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Permite recoger o dejar a los pasajeros en cualquier lugar a lo largo de la ruta de viaje de un vehicle</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 por <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> se fusionó el 9 de enero de 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Traducciones para campos de text, URLs localizadas e información de contacto</li>
        </ul>
    </div>
</div>

<div class="row"/>
