---
search:
  exclude: true
---

# 주파수

<hr/>

## 주파수 기반 서비스 설명

Société de Transport de Montréal은 몬트리올에서 교통 서비스를 운영하고 지하철 노선에 대한 주파수 기반 서비스를 운영합니다. 따라서 일정을 제공하는 대신arrival 그리고departure 시간GTFS 데이터 세트, 파일[frequencies.txt](../../reference/#frequenciestxt) 서비스 기간 동안 서비스 빈도를 설명하는 데 사용됩니다.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

위,trip `trip_id=22M-GLOBAUX-00-S_1_2` 녹색 라인이 예로 사용됩니다. 그에 대한trip , 첫 번째 레코드는 오후 4:01:25에서 오후 4:19:25 사이에 열차가 180초(또는 3분)마다 운행함을 나타냅니다. 마찬가지로 두 번째 레코드는 오후 4:19:25에서 오후 5:03:25 사이에 열차가 165초마다 운행함을 나타냅니다.

[정보예시 소스](https://www.stm.info/en/about/developers)
