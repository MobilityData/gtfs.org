---
search:
  exclude: true
---

# Feed-Informationen

<hr/>

## Bereitstellung von Informationen über den GTFS

Zusätzlich zu den Informationen über die Agenturen und ihre Dienstleistungen ist es möglich, Informationen über den GTFS in der Datei [feed_info.txt](../../reference/#feed_infotxt) bereitzustellen. Dies beinhaltet:

- Angaben zum Herausgeber
- Feed-Sprache
- Gültigkeit des Feeds
- Version

Nachfolgend finden Sie ein Beispiel aus Transport for Cairio:

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[Beispiel Quelle](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
