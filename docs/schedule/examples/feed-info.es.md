---
search:
  exclude: true
---

# Información de alimentación

<hr/>

## Proporcionar información sobre el conjunto de datos GTFS

Además de proporcionar información sobre las agencias y sus servicios, es posible proporcionar información sobre el conjunto de datos GTFS utilizando el archivo [feed_info.txt](../../reference/#feed_infotxt). Esto incluye

- Detalles del editor
- lengua del feed
- Validez de la fuente
- Versión

A continuación se muestra un ejemplo de Transport for Cairo:

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[Ejemplo de fuente](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
