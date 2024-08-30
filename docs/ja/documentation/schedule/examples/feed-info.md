# フィード情報

## GTFS データセットに関する情報を提供する

機関とそのサービスに関する情報の提供に加えて、[feed_info.txt](../../reference/#feed_infotxt) ファイルを使用して GTFS データセットに関する情報を提供することもできます。これには以下が含まれます:

- パブリッシャーの詳細
- フィード言語
- フィードの有効性 
- バージョン

以下は、カイロ交通局からの例です:

[** feed_info.txt**](../../reference/#feed_infotxt)

```
feed_publisher_name、feed_publisher_url、feed_lang、feed_start_date、feed_end_date、feed_version
カイロ交通局、http://transportforcairo.com/、en、20160101、20161201、0.5
```

 <sup>[サンプルソース](https://github.com/transportforcairo/Metro-GTFS/archive/master.zip#Metro-GTFS-master)</sup>