# データセットの帰属表示 {: #dataset-attributions}

## 集約されたGTFSデータセットにおけるデータ提供者への帰属 {: #attribute-data-to-a-data-producer-in-an-aggregated-gtfs-dataset}

一部のGTFSデータセットには、同一の管轄区域で運行する複数の事業者など、複数の情報源から集約されたデータが含まれています。場合によっては、[agency.txt](../../reference/#agencytxt) に記載された事業者を、プロデューサー(producer)、オペレーター(operator)、または当局(authority)として分類する必要があります。  

例えば、Rejseplanenはデンマークの鉄道およびバスサービスの検索エンジンです。この会社は、以下の [agency.txt](../../reference/#agencytxt) に示すように、複数の事業者や提供者からのデータを含むGTFSデータセットを公開しています。  

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang
202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
204,FYNBUS,https://fynbus.dk,Europe/Berlin,
206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,
```

Rejseplanenをデータプロデューサーとして帰属させるために、[attributions.txt](../../reference/#attributionstxt) ファイルが使用されます。このファイルでは、組織の名前やURLとともに帰属IDが定義されます。`is_producer`、`is_operator`、`is_authority` フィールドを使用して、以下のようにRejseplanenを分類します。  

[**attributions.txt**](../../reference/#attributionstxt)

```
attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
rp,Rejseplanen,https://www.rejseplanen.dk,1,,
```
