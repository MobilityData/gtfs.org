# GTFS Realtime 变化

GTFS实时规范并不是一成不变的。相反，它是一个开放的规范，由公交机构、开发商和其他使用GTFS实时系统的利益相关者社区开发和维护。预计这个由GTFS实时数据的生产者和消费者组成的社区将提出扩展该规范以实现新功能的建议。

要为GTFS Realtime做出贡献，请阅读[规范修订过程](../process)，并关注谷歌Transit Github仓库[（google/transit](https://github.com/google/transit)）上的公开[问题](https://github.com/google/transit/issues)和[拉动请求](https://github.com/google/transit/pulls)中的讨论。![](../../assets/mark-github.svg)

!!! note ""

    官方规范、参考资料和文件都是用英文写的。如果翻译不同的语言与英文原文不同，则以后者为准。所有的交流都用英语进行。

<!-- <br><div class="landing-page">
    <a class="button" href="../process">规范修订过程</a><a class="button" href="../guiding-principles">指导原则</a><a class="button" href="../revision-history">修订历史</a><a class="button" href="../extensions">实时扩展</a>
</div> -->

## 活跃的提案 &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- 对GTFS Realtime中的新功能提出积极建议。  -->

加入[Github](https://github.com/google/transit/pulls)上的讨论 !

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">在警报中添加cause_detail和effect_detail</a></h3>
        <p class="maintainer">#第332号于2022年5月31日开业，由<a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">目前还没有关于GTFS Realtime的提案。</h3>
        <p class="prompt">有提案吗？&ensp;➜&ensp; 打开一个 <a href="https://github.com/google/transit/pulls" target="_blank">拉动请求</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近合并的提案 &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

最近合并的提案，现在是[官方GTFS Realtime规范](../reference)的特征。参见完整的[修订历史](../process#revision-history)以了解更多。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">在 "Alerts"中添加 "cause_detail"和 "effect_detail"。</a></h3>
        <p class="maintainer">#332由<a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a>于2022年6月26日合并而成</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>为alert原因和影响添加描述</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : 轮椅通道更新</a></h3>
        <p class="maintainer">#340 作者：<a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a>已于2022年7月25日合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>增加了行程无障碍的实时信息</li>
            <li>如果提供，将覆盖GTFS时间表数据集中的<code>trips.wheelchair_accessible</code>。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">警报中的特征/图片</a></h3>
        <p class="maintainer">#283由<a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>已于2021年11月26日合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>增加了一个图片（如照片或地图）的URL链接字段，可以显示在应用程序的服务提示中，以提高提示的理解力。</li>
            <li>变化包括：强制限制图片的大小，每个警报只有一张图片，并确保在图片的内容或语言发生变化时改变URL。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">添加GTFS-NewShapes为实验性的</a></h3>
        <p class="maintainer">#272 由<a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a>于2021年8月30日合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>能够实时更新路线形状以反映绕行情况</li>
            <li>路线更新可以通过引用现有的<code>shape_id</code>来反映，也可以通过实时定义一个新的形状作为编码的折线来反映。</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">在TripUpdate中添加departure_occupancy_status</a></h3>
        <p class="maintainer">#260由<a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a>于2021年4月14日被合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>根据当前或历史数据，提供未来站点的交通车辆的预测占用率</li>
        </ul>
    </div>
</div>

<div class="row"/>
