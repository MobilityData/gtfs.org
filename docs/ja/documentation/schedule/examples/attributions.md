# データセットの帰属組織

## 集約された GTFS データセットでデータをデータ プロデューサーに帰属させる

一部の GTFS データセットには、同じ管轄区域にサービスを提供する異なるサービス プロバイダーなど、複数のソースから集約されたデータが含まれています。場合によっては、[agency.txt](../../reference/#agencytxt) にリストされている事業者をプロデューサー、オペレーター、または当局として分類する必要があります。

たとえば、Rejseplanen はデンマークの鉄道およびバス サービスの検索エンジンです。この会社は、以下の [agency.txt](../../reference/#agencytxt) に示すように、複数の事業者とプロバイダーからのデータを含む GTFS データセットを公開しています。 

[**Agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
204,FYNBUS,https://fynbus.dk,Europe/Berlin,
206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,
```

In Rejseplanen をデータ プロデューサーとして属性にするには、ファイル [attributions.txt](../../reference/#attributionstxt) が使用されます。ここで、名前と URL とともに属性IDが定義されます。組織の。フィールド `is_producer`、 `is_operator`、および `is_authority` は、以下に示すように、Rejseplanen を分類​​するために使用されます。

[**attributions.txt**](../../reference/#attributionstxt)

```
attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
rp,Rejseplanen,https://www.rejseplanen.dk,1,,
```
