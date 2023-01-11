# Posición del vehículo

La posición del vehículo se utiliza para proporcionar información generada automáticamente sobre la ubicación de un vehículo, por ejemplo, a partir de un dispositivo GPS a bordo. Se debe proporcionar una única posición del vehículo para cada vehículo que sea capaz de proporcionarla.

El viaje que el vehículo está realizando en ese momento debe indicarse mediante un [TripDescriptor](../reference.md#message-tripdescriptor). También puede proporcionar un [VehicleDescriptor](../reference.md#message-vehicledescriptor), que especifica un vehículo físico preciso sobre el que está proporcionando actualizaciones. A continuación se proporciona documentación al respecto.

Se puede proporcionar una **marca de tiempo** que indique la hora en que se tomó la lectura de la posición. Tenga en cuenta que esto es diferente de la marca de tiempo en el encabezado de alimentación, que es el momento en que este mensaje fue generado por el servidor.

También se puede proporcionar**el paso actual** (como `stop_sequence` o `stop_id`). Se trata de una referencia a la parada a la que se dirige el vehículo o en la que ya se ha detenido.

## Position

Posición contiene los datos de ubicación dentro de Posición del vehículo. La latitud y la longitud son obligatorias, los demás campos son opcionales. Estos tipos de datos son:

*   **Latitude** - grados Norte, en el sistema de coordenadas WGS-84
*   **Longitude** - grados Este, en el sistema de coordenadas WGS-84
*   **Bearing** - dirección en la que está orientado el vehículo
*   **Odometer**: distancia recorrida por el vehículo.
*   **Speed** - velocidad momentánea medida por el vehículo, en metros por segundo

## CongestionLevel

La posición del vehículo también permite a la agencia especificar el nivel de congestión que experimenta el vehículo en ese momento. La congestión puede clasificarse en las siguientes categorías:

*   Nivel de congestión desconocido
*   Circulando sin problemas
*   Parado y en marcha
*   Congestión
*   Congestión grave

Corresponde a la agencia clasificar lo que clasifica como cada tipo de congestión. Nuestra orientación es que la congestión grave sólo se utiliza en situaciones en las que el tráfico está tan congestionado que la gente abandona sus coches.

## OccupancyStatus

La posición del vehículo también permite a la agencia especificar el grado de ocupación del vehículo. El estado de ocupación puede clasificarse en las siguientes categorías:

*   Vacío
*   Muchos asientos disponibles
*   Pocos asientos disponibles
*   Sólo asientos de pie
*   Aplastado sólo de pie
*   Lleno
*   No se aceptan pasajeros

Este campo es aún **experimental** y está sujeto a cambios. Es posible que se adopte formalmente en el futuro.

## VehicleStopStatus

El estado de parada del vehículo da más significado al estado de un vehículo en relación con una parada a la que se aproxima o en la que se encuentra. Puede establecerse en cualquiera de estos valores.

*   **Incoming at** - el vehículo está a punto de llegar a la parada referenciada
*   **Stopped at** en - el vehículo está parado en la parada referenciada
*   **In transit to** - la parada referenciada es la próxima parada del vehículo - **default**

## VehicleDescriptor

VehicleDescriptor describe un vehículo físico preciso y puede contener cualquiera de los siguientes atributos:

*   **ID** - sistema interno de identificación del vehículo. Debe ser único para el vehículo
*   **Label** - una etiqueta visible para el usuario - por ejemplo el nombre de un tren
*   **License plate** - la matrícula real del vehículo
