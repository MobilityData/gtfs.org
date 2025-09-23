# GTFSフィードの品質を評価する {: #evaluate-your-gtfs-feeds-quality}

高品質なGTFSは、完全で、正確で、最新である必要があります。これは、サービスが現在どのように運行されているかを正しく表現し、可能な限り多くの情報を提供することを意味します。

## 完全なデータ {: #complete-data}

高品質な GTFS には、祝日や夏季のダイヤ変更、正確な停留所等(stop)の位置、その他の乗客向け資料と一致するルート・路線系統(route)や行先表示(headsign)の名称といった、重要な運行情報が含まれています。事業者がベンダーと協力して GTFS を作成する場合でも、最終的には印刷物、車内、オンラインで提示される情報が一貫していることを保証するのは事業者の責任です。

## 正確なデータ {: #accurate-data}

正確なデータは、公共交通の乗客に信頼性が高く使いやすい移動体験を提供するために不可欠です。データに誤りがあると、データセットの一部または全体が利用できなくなる可能性があります。

## 最新のデータ {: #up-to-date-data}

古いデータは、フィードがまったく利用できない場合よりも問題になることがあります。単に情報を公開するだけでは不十分であり、それは乗客が目にし、体験するものと一致しなければなりません。最大規模の交通事業者の中には、GTFS を毎週、あるいは毎日更新しているところもありますが、多くの事業者は数か月ごと、または年に数回の運行変更時に GTFS を更新する必要があります。これには、新しいルートや停留所(stop)、時刻表の変更、運賃体系の更新などが含まれます。

多くの事業者は、GTFS の作成と管理をベンダーに委託しています。ベンダーの中には、運行変更について積極的に問い合わせてくるところもありますが、事業者がベンダーに対して今後の運行変更を伝えることが重要です。運行変更を事前に反映した GTFS を公開することも可能であり、そのことで事業者、ベンダー、経路検索サービス、そして乗客にとって円滑な移行を実現することができます。

## 公式バリデータの使用 {: #using-official-validators}


公式 GTFS バリデータは、データセットの品質を公式仕様に照らして評価し、業界内で高品質なデータセットとは何かについて共通の理解を確保します。  

[MobilityData](https://mobilitydata.org/) によって維持されている、無料かつオープンソースの [Canonical GTFS Schedule validator](https://gtfs-validator.mobilitydata.org/)[^1] は、GTFS データが公式の [GTFS Schedule Reference](../../documentation/schedule/reference/) および [Best Practices](../../documentation/schedule/schedule_best_practices) に準拠していることを保証します。これは、他者と共有可能な使いやすいレポートと包括的なドキュメントを提供します。

<div class="usage">
    <div class="usage-list">
        <ol>
            <li><a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a> にアクセスします。</li>
            <li>GTFS データセットを読み込みます。ZIP ファイルを選択またはドラッグ＆ドロップするか、URL をコピー＆ペーストすることができます。</li>
            <li>バリデーションが完了すると、レポートを開くオプションが表示されます。</li>
            <li>バリデータがデータに問題を見つけたかどうかを確認でき、修正方法に関するドキュメントへのリンクが表示されます。バリデーションレポートの URL は 30 日間有効で、他者と共有することができます。</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls>
            <source src="../../assets/validator-demo-large.mp4" type="video/mp4">
        </video>
    </div>
</div>

同様に、無料かつオープンソースの公式 [GTFS Realtime Validator](https://github.com/MobilityData/gtfs-realtime-validator) を使用することで、GTFS データが公式の [GTFS Realtime Reference](../../documentation/realtime/reference/) および [Best Practices](../../documentation/realtime/realtime_best_practices) に準拠していることを保証できます。  

高品質なデータを作成するための情報については、[California Transit Data Guidelines](https://dot.ca.gov/cal-itp/california-transit-data-guidelines)、[GTFS Schedule Best Practices](../../documentation/schedule/schedule_best_practices)、および [GTFS Realtime Best Practices](../../documentation/realtime/realtime_best_practices) を参照してください。  

[^1]: このツールをデータパイプラインで使用する方法や、このプロジェクトに貢献する方法についての詳細な手順は、[GitHub リポジトリ](https://github.com/MobilityData/gtfs-validator) をご覧ください。
