# 車両の位置

車両の位置は、車載 GPS デバイスなどから自動的に生成された車両の位置情報を提供するために使用されます。位置を提供できるすべての車両に対して、1 つの車両の位置を提供する必要があります。

車両が現在提供している旅程は、[TripDescriptor](../../reference/#message-tripdescriptor) で提供する必要があります。また、[VehicleDescriptor](../../reference/#message-vehicledescriptor) を提供して、更新情報を提供する正確な物理的な車両を指定することもできます。ドキュメントは以下にあります。

位置の読み取りが行われた時間を示す**timestamp**を提供できます。これは、サーバーによってこのmessageが生成された時間であるフィード ヘッダーのタイムスタンプとは異なることに注意してください。

**現在の通路** も提供できます ( `stop_sequence`または`stop_id`として)。これは、車両が向かっている、またはすでに停止している停止場所への参照です。

##Position

Positionには、車両のPosition内の位置データが含まれます。緯度と経度は必須で、他のフィールドはオプションです。これらのデータの種類は次のとおりです。

*   **緯度** - WGS-84 座標系での北度
*   **経度** - WGS-84 座標系での東度
*   **方位** - 車両が向いている方向
*   **走行距離計** - 車両が移動した距離
*   **速度** - 車両が測定した瞬間速度 (メートル/秒)

##CongestionLevel

車両の位置により、機関は車両が現在経験している混雑レベルを指定することもできます。混雑は、次のカテゴリに分類できます:

*   混雑レベル不明
*   順調に走行
*   ストップ アンド ゴー
*   混雑
*   深刻な混雑

各タイプの混雑をどのように分類するかは、機関次第です。私たちのガイダンスでは、深刻な混雑は、交通が混雑しすぎて人々が車から降りる状況でのみ使用されます。

##OccupancyStatus

車両の位置により、機関は車両の乗客の占有度を指定することもできます。占有状況は、次のカテゴリに分類できます:

*   空席多数
*   空席わずか
*   立ち見のみ
*   立ち見のみ混雑
*   満席
*   乗客を受け入れていません

このフィールドはまだ**実験的**であり、変更される可能性があります。将来、正式に採用される可能性があります。

## VehicleStopStatus 

車両停止ステータスは、現在近づいている、または現在いる停止に関連して、車両のステータスにさらに意味を与えます。次のいずれかの値に設定できます。

*   **Incoming at** - 車両は参照された停止に到着しようとしています
*   **Stopped at** - 車両は参照された停止で停止しています
*   **In transit to** - 参照された停止は車両の次の停止です - **default**

## VehicleDescriptor 

 VehicleDescriptor は正確な物理車両を記述し、次の属性のいずれかを含めることができます:

*   **ID** - 車両を識別するための内部システム。車両に一意である必要があります
*   **Label** - ユーザーに表示されるラベル - たとえば、列車の名前
*   **License plate** - 車両の実際のナンバー プレート