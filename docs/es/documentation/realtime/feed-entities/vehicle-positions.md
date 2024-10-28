# Posiciones del vehículo (Vehicle Positions)

 La posición del vehículo se utiliza para proporcionar información generada automáticamente sobre la ubicación de un vehículo, como por ejemplo desde un dispositivo GPS a bordo. Debe preverse una única posición para cada vehículo que sea capaz de proporcionarla. 
 
 El viaje que actualmente realiza el vehículo debe darse a través de un [TripDescriptor](../../reference/#message-tripdescriptor). También puede proporcionar un [VehicleDescriptor](../../reference/#message-vehicledescriptor), que especifica un vehículo físico preciso sobre el que proporciona actualizaciones. La documentación se proporciona a continuación. 
 
 Se puede proporcionar una **timestamp** que indica la hora en que se tomó la lectura de posición. Tenga en cuenta que esto es diferente de la marca de tiempo en el encabezado del feed, que es la hora en que el servidor generó este message. 
 
 **El pasaje actual** también se puede proporcionar (ya sea como `stop_sequence` o `stop_id`). Esta es una referencia a la parada a la que el vehículo está en camino o en la que ya está detenido. 
 
## Position 
 
 Position contiene los datos de ubicación dentro de Position del vehículo. La latitud y la longitud son obligatorias, los demás campos son opcionales. Estos tipos de datos son: 
 
 * **Latitude** - grados Norte, en el sistema de coordenadas WGS-84 
 * **Longitude** - grados Este, en el sistema de coordenadas WGS-84 
 * **Bearing** - dirección hacia la que mira el vehículo 
 * **Odometer** - la distancia que ha recorrido el vehículo 
 * **Speed** - velocidad momentánea medida por el vehículo, en metros por segundo 
 § §## CongestionLevel 
 
 La posición del vehículo también permite a la agencia especificar el nivel de congestión que el vehículo está experimentando actualmente. La congestión se puede clasificar en las siguientes categorías: 
 
 * Nivel de congestión desconocido (Unknown congestion level)
 * Funcionamiento fluido (Running smoothly)
 * Parar y continuar (Stop and go)
 * Congestión (Congestion)
 * Congestión severa (Severe congestion)
 
 Corresponde a la agencia clasificar qué clasificas como cada tipo de congestión. Nuestra recomendación es que la congestión severa sólo se utiliza en situaciones en las que el tráfico está tan congestionado que la gente abandona sus automóviles. 
 
## OccupancyStatus 
 
 La posición del vehículo también permite a la agencia especificar el grado de ocupación de pasajeros del vehículo. El estado de ocupación se puede clasificar en las siguientes categorías: 
 
 * Vacío (Empty)
 * Muchos asientos disponibles (Many seats available)
 * Pocos asientos disponibles (Few seats available)
 * Solo espacio para estar de pie (Standing room only)
 * Solo espacio para estar de pie aplastado (Crushed standing room only)
 * Lleno (Full)
 * No aceptar pasajeros (Not accepting passengers)
 
 Este campo aún es **experimental** y está sujeto a cambios. Es posible que se adopte formalmente en el futuro. 
 
## VehicleStopStatus 
 
 El estado de parada del vehículo da más significado al estado de un vehículo en relación con una parada a la que se está acercando o en la que se encuentra actualmente. Se puede establecer en cualquiera de estos valores. 
 
 * **Incoming at** - el vehículo está a punto de llegar a la parada de referencia 
 * **Stopped at** - el vehículo está detenido en la parada de referencia 
 * **In transit to** - la parada de referencia es la siguiente parada del vehículo- **predeterminado** 
 
## VehicleDescriptor 
 
 VehicleDescriptor describe un vehículo físico preciso y puede contener cualquiera de los siguientes atributos: 
 
 * **ID** - sistema interno de identificación del vehículo. Debe ser exclusivo del vehículo 
 * **Label** - una etiqueta visible para el usuario- por ejemplo, el nombre de un tren 
 * **License plate** - la matrícula real del vehículo 
