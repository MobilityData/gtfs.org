# Frequencies {: #frequencies}

## 頻度ベースのサービスの記述 {: #describe-a-frequency-based-service}

モントリオール交通局 (Société de Transport de Montréal) はモントリオールで公共交通サービスを運営しており、地下鉄路線に対して頻度ベースのサービスを提供しています。したがって、GTFS データセットに到着時刻や出発時刻を含む時刻表を提供する代わりに、[frequencies.txt](../../reference/#frequenciestxt) ファイルを使用して、サービス全体の運行頻度を記述します。便(trip)の繰り返しは、停留所等(stop)間の時間がすべての停留所等(stop)で一貫している場合にのみ機能します。頻度ベースのサービスをモデリングする際には、stop_times.txt (@TODO link) に停留所等(stop)間の相対的な時間が含まれており、それによって乗客に表示する時刻を決定します。

[**frequencies.txt**](../../reference/#frequenciestxt)

```
trip_id,start_time,end_time,headway_secs
22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165
```

上記の例では、`trip_id=22M-GLOBAUX-00-S_1_2` のグリーンラインの便(trip)が使用されています。この便(trip)において、最初のレコードは午後4時01分25秒から午後4時19分25秒の間、列車が180秒（3分）ごとに運行されることを示しています。同様に、2つ目のレコードは午後4時19分25秒から午後5時03分25秒の間、列車が165秒ごとに運行されることを示しています。

<sup>[例の出典](https://www.stm.info/en/about/developers)</sup>
