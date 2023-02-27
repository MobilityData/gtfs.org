---
search:
  exclude: true
---

# Информация о фиде

<hr/>

## Предоставление информации о наборе данных GTFS

Помимо предоставления информации об агентствах и их услугах, можно предоставить информацию о наборе данных GTFS с помощью файла [feed_info.txt](../../reference/#feed_infotxt). Это включает в себя:

- Сведения об издателе
- язык подачи
- Действительность фида
- Версия

Ниже приведен пример из Transport for Cairio:

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[Пример источника](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
