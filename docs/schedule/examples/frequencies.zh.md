---
search:
  exclude: true
---

# 频率

<hr/>

## 描述一个基于频率的服务

蒙特利尔运输公司在蒙特利尔经营运输服务，为其地铁线路提供基于频率的服务。因此，在GTFS数据集中没有提供带有arrival和departure时间的时间表，而是用[frequencies.txt](../../reference/#frequenciestxt)文件来描述整个服务期间的服务频率。

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

上面，一个在绿线上的trip，`行程号=22M-GLOBAUX-00-S_1_2`被用作一个例子。对于这个trip，第一条记录表明在下午4:01:25到4:19:25之间，每180秒（或3分钟）有一趟列车。同样，第二条记录显示，在下午4:19:25到5:03:25之间，每隔165秒就有一趟列车运行。

[例子来源](https://www.stm.info/en/about/developers)