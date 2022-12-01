---
search:
  exclude: true
---

# フィード情報

<hr>

## GTFSデータセットに関する情報の提供

機関やそのサービスに関する情報を提供するだけでなく、[feed_info.txt](../../reference/#feed_infotxt)ファイルを使って、GTFSデータセットに関する情報を提供することも可能です。これには

- パブリッシャーの詳細
- フィードの言語
- フィードの有効性
- バージョン

以下は、Transport for Cairioの例です。

[**feed_info.txt**](../../reference/#feed_infotxt)

    feed_publisher_name,feed_publisher_url,feed_lang,feed_start_date,feed_end_date,feed_version
    Transport for Cairo,http://transportforcairo.com/,en,20160101,20161201,0.5

[ソース例](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)
