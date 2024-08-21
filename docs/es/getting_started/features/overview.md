# Funciones GTFS 
 
 A medida que el formato de referencia GTFS evoluciona para satisfacer las necesidades actuales de los sistemas de tránsito, sus funciones pueden volverse cada vez más complejas. Las **Funciones GTFS** tienen como objetivo proporcionar una explicación clara y definitiva de las funcionalidades habilitadas por el formato de referencia GTFS. Esto ayuda a las agencias de tránsito, proveedores, consumidores e investigadores a comprender las capacidades de GTFS y responder la pregunta: **¿Qué puedo hacer con GTFS?** 
 
 Los siguientes grupos de funciones explican el propósito de cada función, así como el archivos y campos asociados con ellos, lo que ayuda a los usuarios a comprender qué datos se necesitan para respaldar una característica específica. 
 
## Base 
 Estas funciones esenciales forman el núcleo de un feed GTFS. Son los elementos mínimos necesarios para representar un servicio de tránsito. 
 
<div class="grid cards" markdown> 
 
 - :material-subway-variant:{ .lg.middle } __Agencia__ 
 
    Comunicar detalles sobre las agencias responsables del servicio de tránsito. 
 
    [:octicons-arrow-right-24: Más información](../base/#agencia) 
 
 - :material-subway-variant:{ .lg.middle } __Paradas__ 
 
    Definir los lugares donde un servicio de tránsito recoge y deja pasajeros. 
 
    [:octicons-arrow-right-24: Más información](../base/#paradas) 
 
 - :material-subway-variant:{ .lg.middle } __Rutas__ 
 
    Definir los elementos de una ruta de tránsito como el nombre y el tipo de servicio. 
 
    [:octicons-arrow-right-24: Más información](../base/#rutas) 
 
 - :material-subway-variant:{ .lg.middle } __Fechas de servicio__ 
 
    Crear la estructura para programar viajes y exenciones de servicios. 
 
    [:octicons-arrow-right-24: Más información](../base/#fechas-de-servicio) 
 
 - :material-subway-variant:{ .lg.middle } __Viajes__ 
 
    Representar vehículos de tránsito que viajan a lo largo de una ruta definida en horarios programados. 
 
    [:octicons-arrow-right-24: Más información](../base/#viajes) 
 
 - :material-subway-variant:{ .lg.middle } __Horarios de Parada__ 
 
    Definir los horarios de llegada y salida de cada viaje para cada parada. 
 
    [:octicons-arrow-right-24: Más información](../base/#horarios-de-parada) 
 
</div> 
 
## Complementos 
 Estas funciones mejoran un conjunto de datos GTFS, mejorando la experiencia del usuario y facilitando la colaboración entre agencias, proveedores y reutilizadores de datos. Pueden implicar agregar nuevos campos a archivos existentes o crear archivos nuevos. 
 
<div class="grid cards" markdown> 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Información del Feed__ 
 
    Comunicar información importante sobre el feed en sí. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#informacion-del-feed) 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Shapes__ 
 
    Definir la ruta geográfica que sigue un vehículo a lo largo de un viaje. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#shapes) 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Colores de Ruta__ 
 
    Representar y comunicar con precisión el esquema de color asignado a rutas específicas. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons//#colores-de-ruta) 
 
 - :material-plus-box-multiple-outline:{ .lg.medio } __Bicicleta Permitida__ 
 
    Comunicar si los vehículos tienen capacidad para bicicletas o no. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#bicicleta-permitida) 
 
 - :material-plus-box-multiple-outline:{ .lg.medio } __Cartel de destino__ 
 
    Comunicar la señalización utilizada por los vehículos indicando el destino del viaje. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#cartel-de-destino) 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Tipos de Ubicación__ 
 
    Clasificar áreas clave dentro de las estaciones de tránsito, como entradas y salidas. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#tipos-de-ubicacion) 
 
 - :material-plus-box-multiple-outline:{ .lg.medio } __Frecuencias__ 
 
    Representan servicios que operan en una frecuencia regular o en intervalos específicos. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#servicio-basado-en-frecuencia) 
 
 - :material-plus-box-multiple-outline:{. lg.middle } __Transferencias__ 
 
    Describe las transferencias permitidas entre diferentes servicios de tránsito. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#transferencias) 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Traducciones__ 
 
    Comunicar información de servicio en múltiples idiomas. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#traducciones) 
 
 - :material-plus-box-multiple-outline:{ .lg.middle } __Atribuciones__ 
 
    Comunicar quién participó en la creación del conjunto de datos. 
 
    [:octicons-arrow-right-24: Más información](../base_add-ons/#atribuciones) 
 
</div> 
 
 
## Accesibilidad 
 Las funciones de Accesibilidad brindan información esencial para que las personas con discapacidades accedan al servicio. 
 
<div class="grid cards" markdown> 
 
 - :material-wheelchair:{ .lg.middle } __Stops Wheelchair Accessibility__ 
 
    Indica si es posible el embarque en silla de ruedas desde un lugar. 
 
    [:octicons-arrow-right-24: Más información](../accessibility/#stops-wheelchair-accessibility) 
 
 - :material-wheelchair:{ .lg.middle } __Trips Accesibilidad para sillas de ruedas__  
 
    Indica si un vehículo puede acomodar pasajeros en sillas de ruedas. 
 
    [:octicons-arrow-right-24: Más información](../accessibility/#trips-wheelchair-accessibility) 
 
 - :material-wheelchair:{ .lg.middle } __Texto a Voz__ 
 
    Proporciona las entradas necesarias para convertir el texto de los nombres de las paradas en audio. 
 
    [:octicons-arrow-right-24: Más información](../accessibility/#text-to-speech) 
</div> 
 
 
## Tarifas 
 GTFS puede modelar varias estructuras de tarifas, como tarifas basadas en zona, distancia o hora del día. Informa a los pasajeros sobre los precios de los viajes y los métodos de pago. 
 
<div class="grid cards" markdown> 
 
 - :material-cash:{ .lg.middle } __Productos de Tarifa__ 
 
    Definir la lista de boletos o tipos de tarifas disponibles para los usuarios. 
 
    [:octicons-arrow-right-24: Más información](../fares/#fare-products) 
 
 - :material-cash:{ .lg.middle } __Medios de Tarifa__ 
 
    Defina los medios que se pueden utilizar para retener y/o validar un producto tarifario. 
 
    [:octicons-arrow-right-24: Más información](../fares/#fare-media) 
 
 - :material-cash:{ .lg.middle } __Tarifas Basadas en Rutas__ 
 
    Describir las reglas utilizadas para aplicar diferentes tarifas para grupos específicos de rutas. 
 
    [:octicons-arrow-right-24: Más información](../fares/#route-based-fares) 
 
 - :material-cash:{ .lg.middle } __Tarifas Basadas en Tiempo__ 
 
    Describir tarifas diferenciadas por hora del día o día de la semana. 
 
    [:octicons-arrow-right-24: Más información](../fares/#time-based-fares) 
 
 - :material-cash:{ .lg.middle } __Tarifas Basadas en Zonas__ 
 
    Describir tarifas diferenciadas al viajar de una zona a otra. 
 
    [:octicons-arrow-right-24: Más información](../fares/#zone-based-fares) 
 
 - :material-cash:{ .lg.middle } __Fares Transfers__ 
 
    Definir las tarifas aplicables al transbordo de un tramo del viaje a otro. 
 
    [:octicons-arrow-right-24: Más información](../fares/#fares-transfers) 
 
 - :material-cash:{ .lg.middle } __Tarifas V1__ 
 
    Función heredada que permite una representación más sencilla de la información de tarifas. 
 
    [:octicons-arrow-right-24: Más información](../fares/#fares-v1) 
 
</div> 
 
 
## Recorridos 
 
 Las funciones de los Recorridos permiten modelar grandes estaciones de tránsito, de modo que los pasajeros sean guiados desde las entradas hasta las áreas de embarque. Proporcionan detalles de la ruta, tiempos de navegación estimados y sistemas de orientación. 
 
<div class="grid cards" markdown> 
 
 - :material-escalator:{ .lg.middle } __Conexiones de Recorridos__ 
 
    Modelar rutas que conectan puntos relevantes dentro de una estación de tránsito. 
 
    [:octicons-arrow-right-24: Más información](../pathways/#pathway-connections) 
 
 - :material-escalator:{ .lg.middle } __Detalles de Recorridos__ 
 
    Proporcione detalles adicionales sobre las características físicas de una vía. 
 
    [:octicons-arrow-right-24: Más información](../pathways/#pathway-details) 
 
 - :material-escalator:{ .lg.middle } __Niveles__ 
 
    Describir y enumerar todos los diferentes niveles dentro de una estación de tránsito. 
 
    [:octicons-arrow-right-24: Más información](../pathways/#levels) 
 
 - :material-escalator:{ .lg.middle } __Tiempo de recorrido en la estación__ 
 
    Comunicar el tiempo estimado para recorrer trayectos dentro de una estación de tránsito. 
 
    [:octicons-arrow-right-24: Más información](../pathways/#in-station-traversal-time) 
 
 - :material-escalator:{ .lg.middle } __Señalamientos de Recorridos__ 
 
    Comunicar la señalización en la estación asociada a una vía. 
 
    [:octicons-arrow-right-24: Más información](../pathways/#pathway-signs) 
 
</div> 
 
## Servicios flexibles 

 Servicios flexibles, o servicios que responden a la demanda, que no siguen horarios regulares ni rutas fijas. 
 
<div class="grid cards" markdown> 
 
 - :material-transit-detour:{ .lg.middle } __Paradas Continuas__ 
 
    Indique si un usuario puede ser recogido y/o dejado entre paradas. 
 
    [:octicons-arrow-right-24: Más información](../flexible_services/#continuous-stops) 
 
 - :material-transit-detour:{ .lg.middle } __Reglas de reserva__ 
 
    Indique si los usuarios pueden reservar un viaje en un servicio que responda a la demanda. 
 
    [:octicons-arrow-right-24: Más información](../flexible_services/#booking-rules) 
 
 - :material-transit-detour:{ .lg.middle } __Rutas predefinidas con desviación__ 
 
    Vehículos que pueden desviarse brevemente de una ruta para recoger o dejar. 
 
    [:octicons-arrow-right-24: Más información](../flexible_services/#rutas-predefinidas-con-desviación) 
 
 - :material-transit-detour:{ .lg.middle } __Servicios Bajo Demanda Basados en Zonas__ 
 
    Servicios que permiten recoger/dejar en cualquier lugar dentro de un área específica. 
 
    [:octicons-arrow-right-24: Más información](../flexible_services/#zone-based-demand-responsive-services) 
 
 - :material-transit-detour:{ .lg.medio } __Servicios Bajo Demanda con Paradas Fijas__ 
 
    Servicios que permiten recoger/dejar en cualquier ubicación dentro de un grupo de paradas. 
 
    [:octicons-arrow-right-24: Más información](../flexible_services/#fixed-stops-demand-responsive-services) 
 
</div> 
