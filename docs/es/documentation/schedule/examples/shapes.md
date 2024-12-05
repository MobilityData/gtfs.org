# Shapes

## Guía de datos de Shapes 

Los datos contenidos en el archivo shapes.txt desempeñan un papel fundamental en la representación de los servicios de tránsito. Las shapes construidos correctamente mejoran la precisión de las visualizaciones en las aplicaciones de planificación de viajes, lo cual garantiza una experiencia ideal para los pasajeros. Las siguientes prácticas recomendadas brindan orientación sobre la creación shapes de alta calidad que representan con precisión los movimientos del vehículo y se alinean con las rutas físicas de los viajes.

1. Cuando la ruta de viaje entre paradas no sea una línea recta, evite definir la forma con solo dos puntos. Asegúrese de que la forma refleje con precisión la ruta de viaje del vehículo.

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-1.png"> 

2. Asegúrese de que las formas comiencen en la estación de origen y finalicen en la estación de destino. Evite formas que sean demasiado cortas o demasiado largas.

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2a.png">

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2b.png"> 

3. Dentro de una forma definida por un solo shape_id, evite retrocesos ilógicos o inversiones de puntos innecesarias.

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-3.png"> 

4. Asegúrese de que las formas se alineen con la ruta que recorren los vehículos en el sistema de coordenadas WGS84, evite los desfases causados ​​por diferentes sistemas de coordenadas.

  - Para los servicios viales (por ejemplo, autobús), las alineaciones deben seguir la línea central de la calle era por la cual circula el vehículo. Esta puede ser la línea central de la calle si no hay carriles designados o la línea central del lado de la dirección de viaje si se especifican carriles.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4a.png"> 

  - En el caso de los servicios ferroviarios (por ejemplo, metro, tren, tranvía), las formas deben seguir las vías por las que circula el tren. Si un viaje no siempre transcurre por una vía específica en determinadas áreas y existen varias vías, asegúrese de que la forma se mantenga dentro del rango de vías por las que puede circular el tren.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4b.png"> 

5. Cuando el vehículo circule por curvas, los puntos de forma deben ser lo suficientemente densos para permitir una presentación visualmente fluida para los pasajeros.

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-5.png"> 

6. Las alineaciones no deben “desviarse” a una parada en la acera, una plataforma o un lugar de embarque.

  <img class="center" width="1500" height="100%" src="../../../../assets/shapes-6.png">