# Vehicle Positions

Vehicle position用于提供自动生成的车辆位置信息，例如来自车上的GPS设备。应该为每个能够提供位置的车辆提供一个单一的车辆位置。

车辆目前所服务的行程应该通过[TripDescriptor](../reference.md#message-tripdescriptor)给出。你也可以提供一个[VehicleDescriptor](../reference.md#message-vehicledescriptor)，它指定了一个精确的物理车辆，你正在提供有关的更新。文件在下面提供。

可以提供一个**timestamp**，表示读取位置的时间。请注意，这与报文头中的时间戳不同，后者是该消息由服务器生成的时间。

也可以提供**Current passage**（作为`stop_sequence`或`stop_id`）。这是对车辆正在前往或已经停在的站点的引用。

## Position

位置包含vehicle position内的位置数据。纬度和经度是必须的，其他字段是可选的。这些类型的数据是。

*   **Latitude**--北纬度，在WGS-84坐标系中
*   **Longitude**--东经度，在WGS-84坐标系中
*   **Bearing**- 车辆所处的方向
*   **Odometer**--车辆已经行驶的距离
*   **Speed**- 车辆测量的瞬间速度，单位为米/秒

## CongestionLevel

Vehicle position还允许机构指定车辆目前正在经历的拥堵程度。拥堵可以分为以下几类。

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

由机构来划分你所归类的每种拥堵类型。我们的指导意见是，严重拥堵只用于交通拥堵到人们离开汽车的情况。

## OccupancyStatus

Vehicle position也允许机构指定车辆的乘客占用程度。占用状态可分为以下几类。

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

这个领域仍然是**实验性的**，可能会有变化。它可能在将来被正式采用。

## VehicleStopStatus

车辆停靠状态为车辆的状态提供了更多的意义，与它目前正在接近或处于的停靠站有关。它可以被设置为这些值中的任何一个。

*   **Incoming at**到达--车辆即将到达所指的站点
*   **Stopped at**在--车辆停在参考站。
*   **In transit to**--参考站是车辆的下一站--**默认的**

## VehicleDescriptor

VehicleDescriptor描述了一个精确的物理车辆，可以包含以下任何属性。

*   **ID**- 车辆的内部识别系统。对车辆来说应该是唯一的。
*   **Label**- 用户可见的标签 - 例如火车的名称
*   **License plate**--车辆的实际车牌
