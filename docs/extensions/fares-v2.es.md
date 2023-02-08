<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2 es un proyecto de extensión de GTFS Schedule que pretende abordar las limitaciones de [Fares v1](/schedule/examples/fares-v1).

Los principales conceptos que Fares v2 tiene previsto representar son

- Productos tarifarios (por ejemplo, billetes y abonos)
- Categorías de usuarios (por ejemplo, mayores y niños)
- Opciones de pago (por ejemplo, tarjeta bancaria y tarjeta de crédito)
- Limitación de tarifas

Estos conceptos permitirán a los productores de datos modelar tarifas basadas en zonas, dependientes del tiempo e interinstitucionales. Este proyecto de ampliación se está adoptando por iteraciones.

En la actualidad, la implementación básica adoptada de Fares v2 funciona para los siguientes casos de uso:

- Definición de una tarifa de transporte
- Descripción de ubicaciones de servicio en la misma zona tarifaria
- Creación de normas para trayectos de ida
- Creación de normas para transbordos

[Aquí puede ver ejemplos](/schedule/examples/fares-v2) que muestran lo que se puede modelar utilizando la implementación base adoptada de Fares v2.

Los productores pueden implementar Fares v2 en el mismo conjunto de datos que Fares v1, ya que no existe ningún conflicto técnico entre ambas. Los consumidores pueden elegir qué versión utilizar independientemente de la otra. Con la adopción y el respaldo suficiente de Fares v2, Fares v1 podrá quedar obsoleta en el futuro.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">Ver la propuesta completa</a>

## Trabajo en curso sobre Fares v2

La comunidad GTFS está trabajando actualmente en la finalización de la propuesta de [contenedores de tarifas](https://share.mobilitydata.org/fare-containers-to-fare-payment-types-proposal).

Entre los puntos actualmente en discusión figuran

- Creación de un archivo de contenedores de tarifas
- Alineación de los tipos que deben incluirse en la enumeración de opciones de contenedores de tarifas.

<a class="button no-icon" href="https://share.mobilitydata.org/slack" target="_blank">Únase a #gtfs-fares en Slack</a><a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">Vea el calendario de reuniones</a><a  class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">Vea las notas de la reunión</a>.

## Primeros adoptantes

🎉 ¡Salud a los primeros en adoptar Fares v2! Al menos un productor de datos y un consumidor deben comprometerse a implementar una función experimental antes de que se abra una votación pública para añadirla a la especificación oficial. Estas organizaciones invierten una gran cantidad de tiempo y energía en cambios experimentales para garantizar que GTFS siga evolucionando.

En el caso de la implementación básica adoptada, los primeros en adoptarla fueron

- Productores: [Interline](https://www.interline.io/), [Departamento de Transporte de Maryland](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consumidores: [Tránsito](https://transitapp.com/)

Para la función de contenedores de tarifas actualmente en discusión, los primeros en adoptarla son

- Productores: [Interline](https://www.interline.io/)
- Consumidores: [Apple](https://www.apple.com/), [Tránsito](https://transitapp.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">Vea quién utiliza los archivos y campos de Fares v2</a>

## Características de las Fares v2 en discusión

<iframe src="https://portal.productboard.com/xcpvceqebovhprgzprgr2ryb" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## Historia

- **2017**: Investigación del sector y modelización de datos
- **Octubre de 2021**: [Implementación base redactada y compartida](https://github.com/google/transit/pull/286#issue-1026848880)
- **Diciembre de2021**: [Votación abierta nº 1 → no aprobada](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Marzo de 2022**: [Votación abierta nº 2 → no aprobada](https://github.com/google/transit/pull/286#issuecomment-1080716109) 
- **Mayo de 2022**: [Votación abierta nº 3 → aprobada](https://github.com/google/transit/pull/286#issuecomment-1121392932) 
- **Agosto de 2022**: [Comienza el debate comunitario sobre la siguiente fase de Fares v2](https://github.com/google/transit/issues/341)
- **Diciembre de 2022**: [La comunidad identifica el orden de clasificación de las características para priorizar las iteraciones](https://github.com/google/transit/issues/341#issuecomment-1339947915)
