---
search:
  exclude: true
---

# ルート、ストップ、トリップ

<hr>

## ルート

ルートは、交通ネットワークの地理的な範囲を示すもので、固定ルート輸送の中核をなすものです。GTFS では、路線を定義することが、交通機関の運営を記述するための最初のステップとなる。

最初のステップは、以下のファイル[agency.txt](../../reference/#agencytxt)に示されるように、代理店情報を追加することです。このファイルには、代理店に関するハイレベルな情報が含まれています。

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transitは、AB州カルガリーでLRT、BRT、通常のバスサービス、パラトランジット、オンデマンド輸送を運営しています。この例では、2つのルートが定義されています。1つ目はバスで、2つ目はLRTです。[routes.txtという](../../reference/#routestxt)ファイルを使って、各ルートに一意のID、短い名前、そして人間が読みやすいように長い名前を割り当てています。

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

5番目のフィールド`（route_type`）は、路線の種類を区別するために使用される。

- 1番目はバスなので、`route_type=3`
- 2つ目はLRTであるため、rout`e_type=0と`なる。
- `route_typeの`値の完全なリストは、[routes.txt](../../reference/#routestxt)あります。

残りのフィールドには、路線に固有のURLや、地図上でサービスを表現するための機関固有の色などの追加情報が含まれる。

<hr>

## 停留所

GTFSでは、[stops.txt](../../reference/#stopstxt)というファイルを使って、バス停や駅を記述します。以下、1レコード目にバス停を、2レコード目にLRT駅を定義します。

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_idは`一意な識別子である．
- `stop_codeと` `stop_nameは`、通常、ライダー向けの情報を含みます。
- 正確な位置は、座標`(stop_lat`と`stop_lon`) を使用して提供されます。
- 6番目のフィールド`(location_type`)は、停留所と駅を区別するために使用される。
- 最初のレコードはバス停に対応するため、`location_type=0と`なる。
- 2番目のレコードは駅に対応し、`location_type=1`である。
- ` location_typeの  `値の完全なリストは、[stops.txt](../../reference/stopstxt)見つけることができる。

<hr>

## トリップ

経路を記述した後、各経路が提供するトリップを記述することができる。

まず、[calendar.txt](../../reference/#calendartxt)xtを使用して、サービスのスパンを定義する必要があります。

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

ここでは、土日のみ運行するサービスを記述しているので、これらの日のフィールドには1が、残りの日のフィールドには0が入力されています。このサービスは、`start_dateと` `end_dateの`フィールドにあるように、2022年6月23日から2022年9月3日まで運行されます。

この例では、[trips.txt](../../reference/#tripstxt)ファイルに、上記で説明した MAX Orange ルートが提供する 3 つの週末トリップが記述されています。

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- [routes.txt](../../reference/#routestxt)のうち、MAX Orange に対応する`route_id`が記載されています。
- [calendar.txt](../../reference/#calendartxt)xt のうち、週末に該当する`service_id`が記載されています。
- 各レコードには、各旅行に対して一意のID

ヘッドサインのテキストは、バスの内部と外部の標識に通常表示されるもので、提供されます。

- `direction_id`フィールドは、同じルートで異なる方向に向かうトリップを区別することができます。例えば、インバウンドのトリップとアウトバウンドのトリップ、あるいは南行きのトリップと北行きのトリップを区別することができます。
  - この場合、Saddletowne方面のトリップは`direction_id=0`、Brentwood方面のトリップは`direction_id=1`です。direction_id の値には固有の意味はなく、ある進行方向と別の進行方向を指定するために使用されるだけである。
- [shapes.txt](../../reference/#shapestxt)xtから、Saddletowne方面のMAX Orangeルートに対応する`shape_idが`1レコード目に、Brentwood方面のMAX Orangeルートに対応するものが2レコード目と3レコード目に記載されている

`shape_id=3030026`は、Saddletowne 方面の MAX Orange に対応する。以下のファイルには、ルートの輪郭となる点と、その点間の距離の情報が含まれています。この情報を使って、旅行計画や分析のために地図上にルートをプロットすることが可能です。

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr>

## サービス例外

運行日の追加（特別日）や運行日の削除（休日運休など）を設定することができます。

例えば、2022年7月17日（日）に予定されているサービスがない場合、サービスを2つに分けることで、[calendar.txtの](../../reference/#calendartxt) `weekend_serviceから`その日付を削除することができます。

| サービス               | 開始         | 終了         |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

しかし、`service_idが`2つに分割され、この分割が[trips.txtに](../../reference/#tripstxt)連鎖してしまうため、ファイルが複雑になってしまいます。代わりに、以下のように[calendar_dates.txtを](../../reference/#calendar_datestxt)使用することで、より簡単な方法でこれを行うことができます。

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- `service_id` `weekend_serviceと`なる。
- `date`下に削除または追加されたサービスの日付が表示されます（2022年7月17日）。
- `exception_type`フィールドが2に設定されており、この日のサービスが削除されたことを意味します。

[ソース例](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
