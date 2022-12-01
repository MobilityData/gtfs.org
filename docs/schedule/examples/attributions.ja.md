<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/attributions.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# データセット 属性

<hr>

## GTFSデータセットに集約されたデータ生産者への属性データ

GTFSのデータセットには、同じ管轄区域にサービスを提供する異なるサービスプロバイダーなど、複数のソースから集約されたデータを含むものがある。場合によっては、[agency.txtに](../../reference/#agencytxt)記載されている機関を、生産者、運営者、当局のいずれかに分類する必要がある。

たとえば、Rejseplanenは、デンマークの鉄道およびバスサービスの検索エンジンです。同社は、以下のように複数の機関およびプロバイダからのデータを含む GTFS データセットを[agency.txt](../../reference/#agencytxt) で公開しています。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Rejseplanenをデータ作成者として特定するために、[attributions.txtという](../../reference/#attributionstxt)ファイルを使用します。このファイルには、組織の名前とURLとともに、attribution IDが定義されています。`is_producer`、`is_operator`、`is_authorityの`各フィールドは、以下のようにRejseplanenを分類するために使用されます。

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[ソースの例](http://www.rejseplanen.info/labs/GTFS.zip)
