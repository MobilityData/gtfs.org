---
search:
  exclude: true
---


# フリークエンシー

<hr>

## 頻度ベースのサービスを記述する

モントリオール交通局（Société de Transport de Montréal）は、モントリオールの交通サービスを運営しており、そのメトロー路線では頻度ベースのサービスを実施しています。そのため，GTFSデータセットでは発着時刻を記載したスケジュールを提供する代わりに，[frequencies.txt](../../reference/#frequenciestxt)というファイルを用いて，運行期間中のサービス頻度を記載している．

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

上記では、`trip_id=22M-GLOBAUX-00-S_1_2`のグリーンラインでのトリップを例としています。このトリップでは、最初のレコードによると、午後4時1分25秒から午後4時19分25秒の間、列車は180秒（または3分）ごとに運転されることがわかります。同様に、2番目の記録は、午後4時19分25秒から午後5時3分25秒の間、列車は165秒ごとに走っていることを示しています。

[ソース例](https://www.stm.info/en/about/developers)
