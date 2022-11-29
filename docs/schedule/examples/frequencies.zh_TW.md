---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

# 頻率

<hr/>

## 描述基於頻率的服務

Société de Transport de Montréal 在蒙特利爾經營交通服務，並為其地鐵線路提供基於頻率的服務。因此，與其提供時間表，不如arrival和departure次在GTFS數據集，文件[frequencies.txt](../../reference/#frequenciestxt)用於描述整個服務跨度內的服務頻率。

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

以上，一個trip以綠線上的`trip_id=22M-GLOBAUX-00-S_1_2`為例。為了那個原因trip，第一個記錄表示在下午 4:01:25 到下午 4:19:25 之間，火車每 180 秒（或 3 分鐘）運行一次。同樣，第二條記錄表明在下午 4:19:25 到下午 5:03:25 之間，火車每 165 秒運行一次。

[信息示例源](https://www.stm.info/en/about/developers)
