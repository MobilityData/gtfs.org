# Extensiones 

 <!-- GTFS is a community driven data format. Users can propose and vote on changes. For detailed information see the [GTFS Schedule](../schedule/process) and [GTFS Realtime](../realtime/process) amendment process. 
  
 Extensions that are currently in development can be found on MobilityData’s [roadmap](https://mobilitydata.org/roadmaps/#transit). 
  
 Extension proposals can be found in the following places: 
  
 - MobilityData maintains a [portal with a list of GTFS extension proposals](https://mobilitydata.org/roadmaps/#transit). The roadmap is based on their members’ prioritization. You can contribute ideas or extensions via the portal. 
 - TransitWiki.org contains a [list GTFS extension projects](https://www.transitwiki.org/TransitWiki/index.php/General_Transit_Feed_Specification#GTFS_Extensions). 
  
 For more information, contact [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) --> 
 
=== "GTFS Schedule" 
 
    Se pueden ampliar archivos y campos adicionales a los conjuntos de datos del GTFS Schedule para adaptarse a una variedad de necesidades específicas de aplicaciones comunicadas entre agencias de tránsito y proveedores de software, incluso si estos campos no están en la [especificación oficial](../../../documentation/schedule/reference). 
 
    A continuación se muestra una lista de extensiones del GTFS Schedule que pueden implementarse. 
 
    !!! info "Hacer oficial una extensión en la especificación" 
 
        Las extensiones pueden convertirse en propuestas activas y posteriormente [adoptarse](../../../documentation/schedule/change_history/recent_additions/) en la especificación oficial a través de [Proceso de modificación de especificaciones](../../governance/gtfs_schedule_amendment_process/). 
 
    !!! note "Contribuir a esta lista" 
 
        ¿Tiene una extensión que desea compartir con la comunidad GTFS? Solicite agregar una extensión a GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">aquí</a>. 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="http://bit.ly/gtfs-pathways" class="no-icon" target="_blank">GTFS-Pathways</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Centrado en la accesibilidad para caminos que unen ubicaciones dentro de las estaciones de tránsito para la planificación de rutas y la orientación.</li> 
    <li> Si bien la especificación principal de GTFS-Pathways se ha integrado completamente en GTFS, es necesario integrar información adicional, como instrucciones de texto a voz, información sobre asistencia en silla de ruedas, informes de fallas de equipos, cierres de entradas o salidas planificados o programados, e interrupciones en ascensores y escaleras mecánicas.ser agregado.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <a href="../fares-v2" class="no-icon" target="_blank"><h3 class="title"> GTFS-Fares v2</h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Permite que las aplicaciones de planificación de viajes muestren información de precios a los pasajeros.</li> 
    <li> Si bien recientemente se votó la implementación básica de GTFS-Fares v2 para pasar a GTFS, algunas funciones y funcionalidades de esta extensión que aún quedan incluyen tarifas zonales/basadas en distancia, categorías de pasajeros, límites y rangos de tarifas, pases de paquetes de tarifas y contenedores., precios en horas pico/vacaciones, secuencias de transferencia y comportamiento de una ruta.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <a href="../flex" class="no-icon" target="_blank"><h3 class="title"> GTFS-Flex</h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Amplía GTFS al incluir rutas fijas desviadas y funciones de servicios de transporte bajo demanda en su modelado de datos que no siempre siguen lo mismo para las paradas fijas.</li> 
    <li> La propuesta se compone de 2 extensiones: GTFS-FlexibleTrips, que describe el servicio en sí y GTFS-BookingRules, que proporciona la información de reserva de GTFS-FlexibleTrips.</li> 
    </ul> 
    </div> 
    </div> 
    
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="http://bit.ly/gtfs-occupancies" class="no-icon" target="_blank">GTFS-Occupancies</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Describe la aglomeración de pasajeros de un vehículo de forma habitual o proyectada.</li> 
    <li> Complementa la disponibilidad de información sobre aglomeración descrita en GTFS Realtime al ofrecer predicciones estáticas para viajes futuros basadas en tendencias anteriores, lo que puede ayudar a los pasajeros a planificar viajes según sus preferencias de aglomeración y comodidad.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://developers.google.com/transit/gtfs/reference/gtfs-extensions" class="no-icon" target="_blank">Extensiones de Google Transit para GTFS</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://developers.google.com/transit" class="no-icon" target="_blank">Google</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Proporciona soporte de traducción, amplía los tipos de rutas, permite reglas de transferencia más detalladas y agrega otras funciones.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://www.transitwiki.org/TransitWiki/index.php/File:GTFS%2B_Additional_Files_Format_Ver_1.7.pdf" class="no-icon" target="_blank">MTC GTFS+</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://mtc.ca.gov/" class="no-icon" target="_blank">MTC</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Creado por la Comisión de Transporte Metropolitano del Área de la Bahía de San Francisco. Agrega información adicional en tiempo real, direcciones, categorías de pasajeros y más.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://github.com/mbta/gtfs-documentation/" class="no-icon" target="_blank">MBTA</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://www.mbta.com/" class="no-icon" target="_blank">MBTA</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Agrega puntos de control de seguimiento del desempeño puntual, información de estaciones e instalaciones y más.</li> 
    </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">GTFS-Eligibilities</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://github.com/ODOT-PTS/gtfs-eligibilities" class="no-icon" target="_blank">el Departamento de Transporte de Oregón</a></p> 
    </div> 
    <div class="featurelist"> 
    <p> Las elegibilidades GTFS se basan en el concepto de que deben proporcionar una manera para que los sistemas que operan en función de las cuentas de usuario comprendan si un viaje es elegible en función de la información de la cuenta del usuario. Esto significa que los campos propuestos proporcionan:</p> 
    <ul> 
    <li> Atributos comunes asociados con cuentas de usuario, como edad, sexo, afiliación a la empresa, propósitos del viaje y niveles de asistencia brindados.</li> 
    <li> Autenticaciones personalizables de atributos y estados definidos localmente. Se proporcionan elegibilidades personalizadas, así como una forma de comprender cómo se puede autenticar la elegibilidad personalizada.</li> 
    </ul> 
    </div> 
    </div> 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">GTFS-Capabilities</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://github.com/ODOT-PTS/gtfs-capabilities" class="no-icon" target="_blank">el Departamento de Transporte de Oregón</a></p> 
    </div> 
    <div class="featurelist"> 
    <p> Describe las capacidades adicionales que un servicio puede proporcionar para atender a personas con discapacidades y a quienes tienen dispositivos de movilidad.</p> 
    <ul> 
    <li> Información sobre los servicios disponibles para un pasajero por parte de una persona, como un conductor u otro recurso humano proporcionado por la agencia.</li> 
    <li> Información del vehículo, descrita por la especificación <a href="https://docs.google.com/document/d/156RiBjI6FnWJvO8_XWX11Q9nLdOiBdS_rilA-oamlv8/edit#heading=h.tosuo6e9e0z7">GTFS-VehicleCategories</a> (ampliada aún más). Véase también el borrador de la extensión <a href="https://docs.google.com/document/d/1mcQ-oEaP5WiGh46DmUQqmeS-rQ5W96L-c3TRKinGS0g/edit#heading=h.oxdoxruczgni">de asientos GTFS</a> .</li> 
    <li> Un enfoque en describir las comodidades del vehículo relacionadas con los dispositivos de movilidad y cómo abordar con esos dispositivos afecta la capacidad para otros pasajeros y dispositivos.
    </li> 
    </ul> 
    </div> 
    </div> 
    <div class="row"></div> 
 
=== "GTFS Realtime" 
 
    Se pueden ampliar archivos y campos adicionales en fuentes GTFS Realtime para adaptarse a una variedad de necesidades específicas de aplicaciones comunicadas entre agencias de tránsito y proveedores de software, incluso si estos campos no están en la [especificación oficial](../../../documentation/realtime/reference). 
 
    A continuación se muestra una lista de extensiones GTFS Realtime que pueden implementarse. 
 
    !!! info "Hacer oficial una extensión en la especificación" 
 
        Las extensiones pueden convertirse en propuestas activas y posteriormente [adoptarse](../../../documentation/realtime/change_history/recent_additions/) en la especificación oficial a través de [Proceso de modificación de especificaciones](../../governance/gtfs_realtime_amendment_process/). 
 
    !!! note "Contribuir a esta lista" 
 
        ¿Tiene una extensión que desea compartir con la comunidad GTFS? Solicite agregar una extensión a GTFS.org <a href="https://forms.gle/fUVHy5EEw2uXMdmT6" target="_blank">aquí</a>. 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://docs.google.com/document/d/1qJOTe4m_a4dcJnvXYt4smYj4QQ1ejZ8CvLBYzDM5IyM/edit#bookmark=id.av58okxmwekh" class="no-icon" target="_blank">Actualizaciones de GTFS-Pathway</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Describir los cambios en los recorridos de las estaciones en tiempo real, como el tiempo de inactividad de los ascensores o los recorridos cerrados.</li> 
    </ul> 
    </div> 
    </div> 
 
    <div class="row"> 
    <div class="leftcontainer"> 
    <h3 class="title"> <a href="https://github.com/google/transit/pull/212" class="no-icon" target="_blank">GTFS- OccupancyStatus</a></h3> 
    <p class="maintainer"> Mantenido por <a href="https://mobilitydata.org/" class="no-icon" target="_blank">MobilityData</a></p> 
    </div> 
    <div class="featurelist"> 
    <ul> 
    <li> Proporcionar información en tiempo real sobre la aglomeración de vehículos de tránsito.
    </li> 
    </ul> 
    </div> 
    </div> 
    
    <div class="row"></div> 
 
Para obtener más información, comuníquese con [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) 
