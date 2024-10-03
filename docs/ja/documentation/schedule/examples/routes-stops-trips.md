# ルート・路線系統、停留所等、および便

## ルート・路線系統

ルート・路線系統は、交通ネットワークの地理的範囲を記述するため、固定ルートの交通運営の中核となります。GTFS では、ルート・路線系統の定義が交通事業者の運営を記述する最初のステップです。

最初のステップは、以下のファイル [agency.txt](../../reference/#agencytxt ) に示すように、事業者の情報を追加することです。このファイルには、事業者に関する概要情報が含まれています。 

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000
```

Calgary Transit は、アルバータ州カルガリーで LRT、BRT、定期バス サービス、準交通機関、オンデマンド交通を運営しています。この例では、2 つのルート・路線系統が定義されており、1 つ目はバス、2 つ目は LRT です。ファイル [routes.txt](../../reference/#routestxt) を使用して、各ルートにユニーク IDと、人間が読みやすいように短い名前と長い名前が割り当てられます。

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff
```

5番目のフィールド (`route_type`) は、ルートの種類を区別するために使用されます。

- 1番目はバスなので、`route_type=3` です。
- 2番目は LRT なので、`route_type=0` です。
- `route_type` の値の完全なリストは、[こちら](../../reference/#routestxt) にあります。

残りのフィールドには、ルート固有の URL や、地図上でサービスを表す機関固有の色などの追加情報が含まれます。

<hr> 

## 停留所等

GTFS では、停留所等と駅はファイル [stops.txt](../../reference/#stopstxt) を使用して記述されます。以下では、バス停は最初のレコードで定義され、LRT 駅は 2 番目のレコードで定義されます。 

[**stops.txt**](../../reference/#stopstxt) 

```
stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1
```

- `stop_id` は一意の識別子です
- `stop_code` と `stop_name` には通常、乗客向けの情報が含まれます
- 正確な場所は座標 (`stop_lat` と `stop_lon`) を使用して提供されます
- 6 番目のフィールド (`location_type`) は、停留所と駅を区別するために使用されます
- 最初のレコードはバス停に対応するため、`location_type=0` です
- 2 番目のレコードは駅に対応するため、`location_type=1` です
- `location_type の値の完全なリストは [こちら](../../reference/#stopstxt) にあります。

<hr> 

## 便

機関のルート・路線系統を記述した後、各ルートで提供される便を記述できるようになります。 

まず、[calendar.txt](../../reference/#calendartxt) を使用してサービスの範囲を定義する必要があります。

[**calendar.txt**](../../reference/#calendartxt) 

```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
weekend_service,0,0,0,0,0,1,1,20220623,20220903
```

ここでは、土曜日と日曜日のみに実行されるサービスが記述されているため、それらの曜日のフィールドには 1 が設定され、残りの曜日のフィールドには 0 が設定されます。このサービスは、 `start_date` フィールドと `end_date` フィールドに示されているように、2022年6月23日から2022年9月3日まで実行されます。 

この例では、ファイル [trips.txt](../../reference/#tripstxt) に、上で説明した MAX Orange ルートで運行される 3 つの週末便が記述されています。

[**trips.txt**](../../reference/#tripstxt) 

```
route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027
```

- MAX Orange に対応する [routes.txt](../../reference/#routestxt) の `route_id` がリストされます
- 週末に対応する [calendar.txt](../../reference/#calendartxt) の `service_id` がリストされます
- 各レコードには、各旅行の一意の ID が含まれます。
ヘッドサイン テキストが提供されます。これは、通常、バスの内外の標識に表示されます
- フィールド `direction_id` を使用すると、同じルートの異なる方向への旅行を区別できます。たとえば、インバウンド旅行とアウトバウンド旅行、または南行き旅行と北行き旅行を区別できます。
- この場合、Saddletowne への旅行には `direction_id=0` があり、Brentwood への旅行には `direction_id=1` があります。 direction_id の値には固有の意味はなく、移動の方向を別の方向に割り当てるためにのみ使用されます
- [shapes.txt](../../reference/#shapestxt) の `shape_id` は、サドルタウン行きの MAX Orange ルートに対応しており、最初のレコードにはリストされています。また、2 番目と 3 番目のレコードには、ブレントウッド行きの MAX Orange ルートに対応しています

`shape_id=3030026` は、サドルタウン行きの MAX Orange に対応しています。以下のファイルには、旅行の概要を示すポイントに関する情報と、各ポイントと旅行の開始点の間の距離が含まれています。この情報を使用して、旅行計画や分析の目的でルートをマップ上にプロットすることができます。

[**shapes.txt**](../../reference/#shapestxt) 

```
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
```

<hr> 

## サービスの例外

追加のサービス日 (特別日) や削除されたサービス日 (休日のサービスなしなど) などのサービスの例外を定義できます。

たとえば、2022 年 7 月 17 日 (日曜日) にスケジュールされたサービスがない場合は、サービスを 2 つに分割して、[calendar.txt](../../reference/#calendartxt) の `weekend_service` からそのdateを削除できます。

| サービス | 開始 | 終了 |
|-----|-----|-----|
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

ただし、`service_id` が 2 つに分割され、この分割が [trips.txt](../../reference/#tripstxt) にカスケードされるため、ファイルが複雑になります。代わりに、以下に示すように [calendar_dates.txt](../../reference/#calendar_datestxt) を使用して、これをより簡単に行うことができます:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

```
service_id,date,exception_type
weekend_service,20220717,2
```

- `service_id` `weekend_service` がリストされます
- 削除または追加されたサービスの日付が `date` の下にリストされます (2022 年 7 月 17 日)
- フィールド `exception_type` が 2 に設定されています。これは、この日にサービスが削除されることを意味します

<sup>[サンプル ソース](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)</sup>