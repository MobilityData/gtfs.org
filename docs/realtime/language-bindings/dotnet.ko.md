# .NET GTFS-realtime 언어 바인딩

[![NuGet 버전](https://badge.fury.io/nu/GtfsRealtimeBindings.svg)](http://badge.fury.io/nu/GtfsRealtimeBindings)

[GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer 사양에서 생성된 .NET 클래스를 제공합니다. 이러한 클래스를 사용하면 바이너리 ProtocolBuffer GTFS-realtime 데이터 피드를 C# 개체로 파싱할 수 있습니다.

## 종속성 추가

자신의 프로젝트에서 `gtfs-realtime-bindings` 클래스를 사용하려면 먼저 [NuGet 리포지토리](https://www.nuget.org/packages/GtfsRealtimeBindings/) 에서 모듈을 설치해야 합니다.

    Install-Package GtfsRealtimeBindings

## 예제 코드

다음 코드 스니펫은 특정 URL에서 GTFS 실시간 데이터 피드를 다운로드하여 FeedMessage(GTFS-realtime 스키마의 루트 유형)로 파싱하고 결과를 반복하는 방법을 보여줍니다.

```csharp
using System.Net;
using ProtoBuf;
using TransitRealtime;

WebRequest req = HttpWebRequest.Create("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
FeedMessage feed = Serializer.Deserialize<FeedMessage>(req.GetResponse().GetResponseStream());
foreach (FeedEntity entity in feed.Entities) {
  ...
}
```
