---
search:
  exclude: true
---

# Informações sobre alimentação

<hr/>

## Fornecer informações sobre o conjunto de dados GTFS

Além de fornecer informações sobre agências e seus serviços, é possível fornecer informações sobre o conjunto de dados GTFS usando o arquivo [feed_info.txt](../../reference/#feed_infotxt). Isto inclui:

- Detalhes da editora
- linguagem de alimentação
- Validade das rações
- Versão

Abaixo está um exemplo do Transport for Cairio:

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[Exemplo de fonte](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
