# ルート・路線系統(routes)、停留所等(stops)、便(trips) {: #routes-stops-and-trips}

## Routes {: #routes}

ルート・路線系統(routes)は、固定ルート型の公共交通運行の中核を成すものであり、交通ネットワークの地理的な範囲を記述します。GTFSにおいては、ルート・路線系統(routes)を定義することが、事業者の運行を記述する最初のステップとなります。

最初のステップは、以下の [agency.txt](../../reference/#agencytxt) ファイルに示すように、事業者情報を追加することです。このファイルには、事業者に関する高レベルの情報が含まれます。

[**agency.txt**](../../reference/#agencytxt)

```
agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000
```

Calgary Transit は、カナダ・アルバータ州カルガリーにおいて、LRT、BRT、通常のバスサービス、パラトランジット、オンデマンド交通を運行しています。この例では、2つのルート・路線系統(routes)が定義されており、1つ目はバス、2つ目はLRTです。[routes.txt](../../reference/#routestxt) ファイルを使用して、それぞれのルート・路線系統(route)に一意のID、短い名称、そして人間が読みやすい長い名称が割り当てられます。

[**routes.txt**](../../reference/#routestxt)

```
agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff
```

5番目のフィールド (`route_type`) は、ルート・路線系統(route)の種類を区別するために使用されます。

- 1つ目はバスであるため、`route_type=3`
- 2つ目はLRTであるため、`route_type=0`
- `route_type` の値の完全な一覧は [こちら](../../reference/#routestxt) にあります

残りのフィールドには、ルート・路線系統(route)固有のURLや、地図上でサービスを表現するための事業者固有の色など、追加情報が含まれます。

<hr>

## 停留所等(Stops) {: #stops}


GTFS では、停留所等(stop)や駅は [stops.txt](../../reference/#stopstxt) ファイルを用いて記述されます。以下の例では、1つ目のレコードでバス停が定義され、2つ目のレコードでLRT駅が定義されています。 

[**stops.txt**](../../reference/#stopstxt) 

```
stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,1
```

- `stop_id` は一意の識別子です
- `stop_code` と `stop_name` には通常、乗客向けの情報が含まれます
- 正確な位置は座標 (`stop_lat` および `stop_lon`) によって提供されます
- 6番目のフィールド (`location_type`) は停留所等(stop)と駅を区別するために使用されます
- 1つ目のレコードはバス停に対応するため、`location_type=0` です
- 2つ目のレコードは駅に対応するため、`location_type=1` です
- `location_type` の値の完全な一覧は [こちら](../../reference/#stopstxt) にあります。

<hr>

## Trips {: #trips}

事業者のルート・路線系統(route)を記述した後は、それぞれのルート・路線系統(route)で運行される便(trip)を記述することができます。  

まず、[calendar.txt](../../reference/#calendartxt) を使用して運行日(service day)の範囲を定義する必要があります。  

[**calendar.txt**](../../reference/#calendartxt) 

```
service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
weekend_service,0,0,0,0,0,1,1,20220623,20220903
```

ここでは、土曜日と日曜日のみ運行するサービスを記述しています。そのため、これらの日のフィールドには 1 が入力され、残りの日のフィールドには 0 が入力されています。このサービスは、`start_date` と `end_date` フィールドに示されている通り、2022年6月23日から2022年9月3日まで運行されます。  

この例では、[trips.txt](../../reference/#tripstxt) ファイルで、上記で記述した MAX Orange ルート・路線系統(route)で運行される 3 つの週末便(trip)を記述しています。  

[**trips.txt**](../../reference/#tripstxt) 

```
route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027
```

- [routes.txt](../../reference/#routestxt) に記載されている MAX Orange に対応する `route_id` が記載されています  
- [calendar.txt](../../reference/#calendartxt) に記載されている週末に対応する `service_id` が記載されています  
- 各レコードには、それぞれの便(trip)に固有の ID が含まれています  
- 行先表示(headsign)のテキストが提供されており、これは通常バスの車内外の表示に使用されます  
- `direction_id` フィールドは、同じルート・路線系統(route)で異なる方向に運行する便(trip)を区別するために使用されます。例えば、上り便と下り便、または南行き便と北行き便を区別することができます。  
  - この場合、Saddletowne 行きの便(trip)には `direction_id=0` が割り当てられ、Brentwood 行きの便(trip)には `direction_id=1` が割り当てられています。`direction_id` の値自体には固有の意味はなく、単に一方の方向ともう一方の方向を区別するために使用されます  
- [shapes.txt](../../reference/#shapestxt) に記載されている `shape_id` が、最初のレコードでは MAX Orange の Saddletowne 行きに対応し、2 番目と 3 番目のレコードでは MAX Orange の Brentwood 行きに対応しています  

`shape_id=3030026` は MAX Orange の Saddletowne 行きに対応しています。以下のファイルには、便(trip)を構成する点の情報と、それぞれの点から便(trip)の始点までの距離が含まれています。この情報を用いることで、便(trip)のルートを地図上に描画し、旅程(journey)の計画や分析に利用することができます。  

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

## 運行日の例外 {: #service-exceptions}

特別な運行日（追加の運行日）や、運行がない日（祝日などの運休日）のように、運行日に例外を定義することができます。

例えば、2022年7月17日（日曜日）に運行が予定されていない場合、その日付を `weekend_service` から削除するには、[calendar.txt](../../reference/#calendartxt) 内で運行日を2つに分割する方法があります。

| Service | Start | End |
| ----- | ----- | ----- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

しかし、この方法では `service_id` が2つに分割され、さらにその分割が [trips.txt](../../reference/#tripstxt) にも影響してしまうため、ファイルが複雑になります。代わりに、以下のように [calendar_dates.txt](../../reference/#calendar_datestxt) を使うことで、より簡単に対応することができます。

[**calendar_dates.txt**](../../reference/#calendar_datestxt) 

```
service_id,date,exception_type
weekend_service,20220717,2
```

- `service_id` として `weekend_service` が記載されています  
- 運行が追加または削除される日付が `date` に記載されています（2022年7月17日）  
- `exception_type` フィールドが 2 に設定されており、この日は運行が削除されることを意味します  

<sup>[例の出典](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)</sup>
