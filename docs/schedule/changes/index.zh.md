---
search:
  exclude: true
---

# GTFS Schedule变更

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

GTFS规范并不是一成不变的。相反，它是一个开放的规范，由使用GTFS的交通机构、开发商和其他利益相关者社区开发和维护。预计这个由GTFS数据的生产者和消费者组成的社区将提出扩展规范以实现新功能的建议。

要对GTFS做出贡献，请阅读[规范修订过程](../process)，并关注谷歌Transit Github仓库[（google/transit](https://github.com/google/transit)）上的公开[问题](https://github.com/google/transit/issues)和[拉动请求](https://github.com/google/transit/pulls)中的讨论。![](../../assets/mark-github.svg)

<div class="admonition note"><p> 官方规范、参考资料和文件都是用英文写的。如果Translation不同的语言与英文原文不同，则以后者为准。所有的交流都用英语进行。</p></div>


## 活跃的提案![](../../assets/pr-active.svg)

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

加入[Github](https://github.com/google/transit/pulls)上的讨论 !

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## 最近合并的提案![](../../assets/pr-merged.svg)

最近合并的提案，现在是[官方GTFS Schedule规范](../reference)的特征。请参阅完整的[修订历史](../process#revision-history)以了解更多。

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">增加trip转接，带座位选项</a></h3>
        <p class="maintainer">#303 由<a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a>已于2022年6月26日合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>为trip之间的换乘增加新的<code>transfer_type</code>'s，以定义当同一vehicle连续运营两个车次且用户可以留在车上时，用户是否可以进行 "座位内换乘"。</li>
            <li>可以定义什么时候不允许座位内换乘，但可以将两个不同的车次连接起来操作
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">GTFS-Fares V2基础实现</a></h3>
        <p class="maintainer">#286由<a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a>于2022年5月17日进行了合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>公交票价和车票</li>
            <li>复杂票价和换乘的成本模型（多网络、time和基于计数的换乘）。</li>
            <li>将站点与票价区域联系起来的模型</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">trip以及线路与线路之间的换乘</a></h3>
        <p class="maintainer">#284由<a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a>于2021年10月5日合并而成</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>在transfers.txt中指定站点、trip或路线对之间的换乘规则</li>
             <li>根据不同的配对安排，对转移规则的特殊性进行排序</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208由<a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a>于2020年5月13日合并而成</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>允许乘客在vehicle行驶路径的任何地方上车或下车</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180由<a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a>于2020年1月9日合并</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>对text字段、本地化的URL和联系信息进行翻译</li>
        </ul>
    </div>
</div>

<div class="row"/>
