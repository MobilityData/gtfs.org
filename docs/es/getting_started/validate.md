# Evalúe la calidad de su feed GTFS 
 
 Un GTFS de alta calidad es completo, preciso y está actualizado. Esto significa que representa cómo funcionan actualmente los servicios y proporciona la mayor cantidad de información posible. 
 
## Datos completos 
 
 Calidad GTFS incluye detalles importantes del servicio, como cambios de horario durante días festivos y verano, ubicaciones precisas de las paradas y nombres de rutas y señales que coinciden con otros materiales orientados al pasajero. Incluso si una agencia trabaja con un proveedor para producir GTFS, en última instancia depende de la agencia garantizar que la información presentada impresa, a bordo y en línea sea consistente. 
 
## Datos precisos 
 
 Los datos precisos son esenciales para brindar a los pasajeros del transporte público una experiencia de transporte confiable y fácil de usar. Los errores en los datos pueden bloquear el uso de una parte o la totalidad de un conjunto de datos. 
 
## Datos actualizados 
 
 Los datos desactualizados pueden ser más problemáticos que no tener ningún feed disponible. No basta simplemente con publicar información: tiene que coincidir con lo que el usuario ve y experimenta. Algunas de las agencias de transporte más grandes actualizan su GTFS semanalmente o incluso diariamente, pero la mayoría de las agencias necesitarán actualizar su GTFS cada pocos meses o algunas veces al año cuando cambia el servicio. Esto incluye cosas como nuevas rutas o paradas, cambios de horarios o actualizaciones de la estructura de tarifas. 
 
 Muchas agencias contratan a un proveedor para que cree y administre su GTFS. Algunos proveedores pueden ser proactivos al preguntar sobre cambios en el servicio, pero es importante que las agencias se comuniquen con los proveedores sobre los próximos cambios en el servicio. Es posible publicar GTFS con cambios de servicio por adelantado, asegurándose de que la transición se realice sin problemas para todos: agencias, proveedores, planificadores de viajes y pasajeros. 
 
## Uso de validadores oficiales 
 
 Los validadores oficiales de GTFS evalúan la calidad de un conjunto de datos con respecto a la especificación oficial, lo que garantiza un entendimiento común dentro de la industria sobre lo que constituye un conjunto de datos de alta calidad. 
 
 El [validador de programación GTFS canónico](https://gtfs-validator.mobilitydata.org/)[^1] gratuito y de código abierto mantenido por [MobilityData](https://mobilitydata.org/) garantiza sus datos GTFS cumplen con la [Referencia de programación GTFS](../../documentation/schedule/reference/) y las [Mejores prácticas](../../documentation/schedule/schedule_best_practices) oficiales. Proporciona un informe fácil de usar que se puede compartir con otras partes y documentación completa. 
 
<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Go to <a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a>. </li>
            <li> Cargue su conjunto de datos GTFS: puede seleccionar o arrastrar y soltar un archivo ZIP, o copiar/pegar una URL.</li> 
            <li> Cuando finalice la validación, se proporcionará una opción para abrir el informe.</li> 
            <li> Verá si el validador encontró problemas con los datos y encontrará enlaces a nuestra documentación sobre cómo solucionarlos. La URL del informe de validación funcionará durante 30 días y se podrá compartir con otras personas.</li> 
        </ol> 
    </div> 
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </video>
    </div>
</div>
 
 De manera similar, el uso del [GTFS Realtime Validator](https://github.com/MobilityData/gtfs-realtime-validator) garantiza que sus datos GTFS cumplan con la [GTFS Realtime Reference](../../documentation/realtime/reference/) oficial y las [Mejores prácticas](../../documentation/realtime/realtime_best_practices). 
 
 Para obtener información sobre la creación de datos de alta calidad, consulte las [Pautas de datos de tránsito de California](https://dot.ca.gov/cal-itp/california-transit-data-guidelines), las [Mejores prácticas del cronograma GTFS](../../documentation/schedule/schedule_best_practices) y las [Mejores prácticas de GTFS en tiempo real](../../documentation/realtime/realtime_best_practices). 
 
 [^1]: Para ver más instrucciones sobre cómo usar esta herramienta en su proceso de datos y contribuir a este proyecto, visite el [repositorio de GitHub](https://github.com/MobilityData/gtfs-validator ). 
