# 翻訳

## 駅名を翻訳する

一部の交通機関プロバイダーは複数の言語でサービスを提供しています。その 1 つがベルギー国鉄 (現地では NMBS/SNCB、オランダ語では Nationale Maatschappij der Belgische Spoorwegen、フランス語では Société nationale des chemins de fer belges として知られています) です。同社は駅名を複数の言語で提供しており、ユーザーの言語と場所の設定に応じて表示されます。

NMBS/SNCB は、以下のファイルに示すように、GTFS データをフランス語で公開しています。

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr
```

事業者の言語がフランス語に設定されているため、[stops.txt](../../reference/#stopstxt) には駅名がフランス語で記載されています。

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,
```

[translations.txt](../../reference/#translationstxt) ファイルを使用して、駅名をデフォルトの事業者言語 (この場合はフランス語) からオランダ語に翻訳します。

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,record_id,language,translation
stops,stop_name,S8815040,nl,Brussel-West
```

- この例では、[stops.txt](../../reference/#stopstxt) の駅名が翻訳され、[stops.txt](../../reference/#stopstxt) 内のレコードは `stop_id` によって識別されます。したがって、次のようになります。
    - `stops` はテーブル名の下にリストされます ([stops.txt](../../reference/#stopstxt) を参照)
    - `stop_name` は `field_name` の下にリストされます (駅名が翻訳されるため)
    - フランス語から翻訳される駅名の `stop_id` は `record_id` の下にリストされます (この場合、Bruxelles-Ouest の `stop_id`)
- 名前はオランダ語 (ISO 639-2 コード: `nl`) に翻訳されます
- 最後に、翻訳された名前は translation の下にリストされます

GTFS で名前を翻訳する別の方法として、[translations.txt](../../reference/#translationstxt) ファイルを使用する方法があります。この方法では、`record_id` の代わりにフィールド `field_value` が使用されます。この場合、駅名は [stops.txt](../../reference/#stopstxt) から翻訳するレコードを見つけるために使用されます。

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,field_value,language,translation
stops,stop_name,Bruxelles-Ouest,nl,Brussel-West
```

