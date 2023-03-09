# Vehicle Positions

Vehicle positionは、車載の GPS 装置などから自動的に生成される車両の位置情報を提供するために使用される。Vehicle positionは、それを提供することができるすべての車両について、1つだけ提供されるべきである。

車両が現在提供している旅行は、[TripDescriptor](../reference.md#message-tripdescriptor) を通して与えられるべきである。また、更新を提供する正確な物理的車両を指定する[VehicleDescriptor](../reference.md#message-vehicledescriptor)を提供することができます。ドキュメントは以下で提供されます。

位置の読み取りを行った時刻を示す**timestamp**提供することができる。これはフィードヘッダのタイムスタンプとは異なり、このメッセージがサーバーによって生成された時間であることに注意すること。

**Current passage**時刻を指定することもできる (`stop_sequence`または`stop_id` として)。これは、車両が向かっている途中、または既に停車している停車駅への参照である。

## Position

Position は、Vehicle Position 内の位置データを含む。緯度と経度は必須で、その他のフィールドはオプションである。これらのデータの種類は以下の通りです。

*   **Latitude**- WGS-84座標系で北緯度。
*   **Longitude**-東経度、WGS-84座標系にて
*   **Bearing**- 車両が向いている方向
*   **Odometer**- 車両の走行距離
*   **Speed**- 車両が計測した瞬間速度、単位はメートル/秒

## CongestionLevel

Vehicle positionは、その車両が現在経験している混雑度を指定することもできます。混雑度は、以下のカテゴリーに分類されます。

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

何を各渋滞の種類に分類するかは、代理店次第です。当社のガイダンスでは、深刻な渋滞は、人々が車から離れるほど渋滞している状況でのみ使用されることになっています。

## OccupancyStatus

また、vehicle positionは、その車両の乗客の占有度合いを指定することができます。乗員状況は以下のように分類されます。

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

このフィールドはまだ**実験的な**ものであり、変更される可能性があります。将来、正式に採用される可能性があります。

## VehicleStopStatus

車両停止状態（Vehicle stop status）は、現在接近中または停止中の停留所に関連する車両の状態をより意味深く示す。以下の値のいずれかに設定することができます。

*   **Incoming at**- 車両は、参照された停留所に到着しようとしている。
*   **Stopped at**中 - 車両が停止している。
*   **In transit to**- 参照された停留所は、車両の次の停留所である -**デフォルト**

## VehicleDescriptor

VehicleDescriptor は、正確な物理的車両を記述し、以下の属性のいずれかを含むことができます。

*   **ID**- 車両の識別のための内部システム。車両に固有のものである必要があります。
*   **Label**- ユーザーの目に見えるラベル。
*   **License plate**- 車両の実際のナンバープレート。
