# 翻訳 {: #translations}

## 駅名の翻訳 {: #translate-station-names}

一部の交通事業者は複数言語でサービスを提供しています。その一例がベルギー国鉄（現地ではオランダ語で *Nationale Maatschappij der Belgische Spoorwegen*、フランス語で *Société nationale des chemins de fer belges*、略称 NMBS/SNCB として知られています）です。この事業者は駅名を複数言語で提供しており、利用者の言語や位置情報の設定に応じて表示されます。

NMBS/SNCB は以下のファイルのようにフランス語で GTFS データを公開しています。

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr
```

事業者の言語がフランス語に設定されているため、[stops.txt](../../reference/#stopstxt) に記載される駅名はフランス語で表記されています。

[**stops.txt**](../../reference/#stopstxt)

```
stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,
```

次に、[translations.txt](../../reference/#translationstxt) ファイルを使用して、デフォルトの事業者言語（この場合はフランス語）からオランダ語に駅名を翻訳します。

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,record_id,language,translation
stops,stop_name,S8815040,nl,Brussel-West
```

- この例では、[stops.txt](../../reference/#stopstxt) にある駅名が翻訳され、[stops.txt](../../reference/#stopstxt) 内のレコードは `stop_id` によって識別されます。したがって:
  - `stops` はテーブル名に記載されます（[stops.txt](../../reference/#stopstxt) を参照）
  - `stop_name` は `field_name` に記載されます（駅名を翻訳するため）
  - 翻訳対象の駅名に対応する `stop_id` が `record_id` に記載されます（この場合は Bruxelles-Ouest の `stop_id`）
- 駅名はオランダ語 (nl) に翻訳されます
- 最後に、翻訳後の駅名が `translation` に記載されます

GTFS では、[translations.txt](../../reference/#translationstxt) ファイルを使って別の方法で名前を翻訳することもできます。この場合、`record_id` の代わりに `field_value` を使用します。この方法では、[stops.txt](../../reference/#stopstxt) 内の駅名を直接指定して翻訳対象のレコードを特定します。

[**translations.txt**](../../reference/#translationstxt)

```
table_name,field_name,field_value,language,translation
stops,stop_name,Bruxelles-Ouest,nl,Brussel-West
```
