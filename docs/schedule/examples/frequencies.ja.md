---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>


# フリークエンシー

<hr>

## 頻度ベースのサービスを記述する

モントリオール交通局（Société de Transport de Montréal）は、モントリオールの交通サービスを運営しており、そのメトロー路線では頻度ベースのサービスを実施しています。そのため，GTFSデータセットでは発着時刻を記載したスケジュールを提供する代わりに，[frequencies.txtという](../../reference/#frequenciestxt)ファイルを用いて，運行期間中のサービス頻度を記載している．

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

上記では、`trip_id=22M-GLOBAUX-00-S_1_2`のグリーンラインでのトリップを例としています。このトリップでは、最初のレコードによると、午後4時1分25秒から午後4時19分25秒の間、列車は180秒（または3分）ごとに運転されることがわかります。同様に、2番目の記録は、午後4時19分25秒から午後5時3分25秒の間、列車は165秒ごとに走っていることを示しています。

[ソース例](https://www.stm.info/en/about/developers)
