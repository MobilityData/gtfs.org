# GTFS Schedule验证器

这个免费和开源的标准GTFS Schedule验证器是由[MobilityData](https://mobilitydata.org)在GTFS社区的帮助下维护的。用它来评估你的数据集与官方的[GTFS参考](reference.md)和[最佳实践](best-practices.md)。它提供了一个易于使用的HTML格式的验证报告，可以在浏览器中打开并与其他各方共享。

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->

<br/>

<div class="usage-buttons">
   <a class="button" href="https://share.mobilitydata.org/validator-installer-mac">下载Mac</a>版<a class="button" href="https://share.mobilitydata.org/validator-installer-mac"> <img class="icon" src="../../assets/apple.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-windows">下载Windows版<img class="icon" src="../../assets/windows.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu">下载Ubuntu版</a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu"> <img class="icon" src="../../assets/ubuntu.svg" width="20"/>
</a></div>

**VERSION v4.0.0**/[阅读发行说明](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr/>

## 使用方法

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>下载基于我们操作系统的项目的最新版本。</li>
            <li>安装完毕后，运行该程序，会出现一个窗口。</li>
            <li>加载你的GTFS数据集：你可以指定一个url、ZIP文件或包含一个饲料的单个.txt文件的目录。</li>
            <li>选择一个输出目录。这是将写入验证报告的目录。</li>
            <li>当验证完成后，结果将自动在你的浏览器中打开。如果你看不到它们，只要打开在输出路径中创建的report.html文件就可以了。</li>
            <li>你会看到验证器是否发现了数据的问题，以及如何解决这些问题的文档链接。验证报告将被保存为一个HTML文件，所以它可以很容易地被保存并与他人分享。</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls="">
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </source></video>
    </div>
</div>

## 将此验证器作为你数据管道的一部分使用

要查看更多关于如何在你的数据管道中使用这个工具的说明，请访问[GitHub仓库](https://github.com/MobilityData/gtfs-validator)。

## 贡献

这个项目是一个社区工作，任何对这个项目感兴趣的人都可以加入这个社区，参与决策，并以不同的方式帮助推进这个项目。有许多不同的贡献方式：分享你对新功能的想法，报告问题，改进文档，教别人如何使用它，等等。

对这个项目的贡献感兴趣吗？请访问[GitHub仓库](https://github.com/MobilityData/gtfs-validator)并阅读我们的[贡献指南](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md)。
