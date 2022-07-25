---
search:
  exclude: true
---

# Visión general de GTFS Realtime

<div class="landing-page">
   <a class="button" href="reference">Referencia</a>
   <a class="button" href="best-practices">Mejores prácticas</a>
   <a class="button" href="feed-examples">Ejemplos</a>
   <a class="button" href="changes">Cambios</a>
</div>

## Cómo empezar

Proporcionar a los usuarios actualizaciones de los datos de tránsito en tiempo real mejora en gran medida su experiencia de los servicios de tránsito. Proporcionar información actualizada sobre los horarios de llegada y salida actuales permite a los usuarios planificar sus viajes sin problemas. Como resultado, en caso de un desafortunado retraso, un usuario se sentirá aliviado al saber que puede quedarse en casa un poco más.

GTFS Realtime es una especificación de alimentación que permite a las agencias de transporte público proporcionar actualizaciones Realtime sobre su flota a los desarrolladores de aplicaciones. Es una extensión de [GTFS](../schedule/reference) (General Transit Feed Specification), un formato de datos abierto para los horarios de transporte público y la información geográfica asociada. GTFS Realtime se diseñó en torno a la facilidad de implementación, la buena interoperabilidad de GTFS y un enfoque en la información de los pasajeros.

La especificación se diseñó a través de una asociación de las agencias asociadas iniciales de [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), una serie de desarrolladores de transporte y Google. La especificación se publica bajo la [licencia Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

## ¿Cómo empiezo?

1.  Siga leyendo la descripción general que aparece a continuación.
2.  Decida qué [entidades de alimentación](feed-entities) va a proporcionar.
3.  Eche un vistazo a los feeds de [ejemplo](feed-examples).
4.  Cree sus propios feeds utilizando la [referencia](reference).
5.  [Publique su](best-practices/#feed-publishing-general-practices) feed.

## Visión general de los flujos GTFS Realtime

La especificación admite actualmente los siguientes tipos de información

*   **Actualizaciones de viaje** - retrasos, cancelaciones, cambios de ruta
*   **Alertas de** servicio - paradas movidas, eventos imprevistos que afectan a una estación, ruta o a toda la red
*   **Posiciones de los** vehículos - información sobre los vehículos, incluyendo su ubicación y nivel de congestión

Un feed puede, aunque no es necesario, combinar entidades de diferentes tipos. Los feeds se sirven a través de HTTP y se actualizan con frecuencia. El archivo en sí es un archivo binario normal, por lo que cualquier tipo de servidor web puede alojar y servir el archivo (también podrían utilizarse otros protocolos de transferencia). También se pueden utilizar servidores de aplicaciones web que, como respuesta a una solicitud HTTP GET válida, devolverán el feed. No hay restricciones en cuanto a la frecuencia ni al método exacto de cómo debe actualizarse o recuperarse el feed.

Dado que GTFS Realtime le permite presentar el estado _real_ de su flota, el feed debe actualizarse regularmente, preferiblemente cada vez que se reciban nuevos datos de su sistema de localización automática de vehículos.

[Más información sobre las entidades de alimentación...](feed-entities)

## Formato de los datos

El formato de intercambio de datos GTFS Realtime se basa en [los](https://developers.google.com/protocol-buffers/) búferes de protocolo.

Los búferes de protocolo son un mecanismo independiente del language y la plataforma para serializar datos estructurados (piense en XML, pero más pequeño, más rápido y más simple). La estructura de datos se define en un archivo [gtfs-realtime.proto](proto), que luego se utiliza para generar el código fuente para leer y escribir fácilmente sus datos estructurados desde y hacia una variedad de flujos de datos, utilizando una variedad de lenguajes - por ejemplo, Java, C ++ o Python.

[Más información sobre los búferes de protocolo....](https://developers.google.com/protocol-buffers/)

## Estructura de los datos

La jerarquía de elementos y sus definiciones de tipo se especifican en el archivo [gtfs-realtime.proto](proto).

Este archivo de texto se utiliza para generar las bibliotecas necesarias en el language de su elección. Estas bibliotecas proporcionan las clases y funciones necesarias para generar feeds GTFS Realtime válidos. Las bibliotecas no sólo facilitan la creación de feeds, sino que también garantizan que sólo se produzcan feeds válidos.

[Más información sobre la estructura de datos...](reference)

## Cómo obtener ayuda

Para participar en los debates sobre GTFS Realtime y sugerir cambios y adiciones a la especificación, únase a la [GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime) y siga las conversaciones en el [repositorio GitHub de google/transit](https://github.com/google/transit).

## Actualizaciones de Google Maps y Live Transit

Una de las posibles aplicaciones que utiliza GTFS Realtime es [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), una función de Google Maps que proporciona a los usuarios información sobre el tránsito Realtime. Si trabajas para una agencia de transporte público que está interesada en proporcionar actualizaciones Realtime tiempo real a Google Maps, visita la [página de socios de Google Transit](https://maps.google.com/help/maps/transit/partners/live-updates.html).
