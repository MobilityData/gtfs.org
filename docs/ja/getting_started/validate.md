# GTFS フィードの品質を評価する

高品質の GTFS は、完全かつ正確で最新のものです。つまり、サービスが現在どのように運営されているかを示し、可能な限り多くの情報を提供します。

## 完全なデータ

高品質の GTFS には、休日や夏季のスケジュール変更、正確な停車場所、路線名、乗客向け資料と一致するヘッドサインなど、重要なサービス詳細が含まれます。機関がベンダーと協力して GTFS を作成する場合でも、印刷物、車内、オンラインで提示される情報の一貫性を確保するのは、最終的には機関の責任です。

## 正確なデータ

正確なデータは、信頼性が高くユーザーフレンドリーな交通体験を公共交通機関の利用者に提供するために不可欠です。データにエラーがあると、データセットの一部または全部が使用できなくなる可能性があります。

## 最新のデータ

データが古いと、フィードが利用できないよりも問題になることがあります。情報を公開するだけでは不十分で、乗客が目にし、体験するものと一致している必要があります。最大規模の交通機関の中には、GTFS を毎週、あるいは毎日更新しているところもありますが、ほとんどの交通機関は数か月ごと、またはサービスの変更時に年に数回、GTFS を更新する必要があります。これには、新しいルートや停留所、時刻表の変更、運賃体系の更新などが含まれます。

多くの交通機関は、GTFS の作成と管理をベンダーに依頼しています。サービスの変更について積極的に問い合わせてくるベンダーもいますが、今後のサービスの変更について交通機関がベンダーとコミュニケーションを取ることが重要です。サービスの変更を事前に GTFS に反映させることで、交通機関、ベンダー、旅行計画者、乗客など、すべての人にとって移行がスムーズに進むようにすることができます。

## 公式検証ツールの使用 

公式 GTFS 検証ツールは、データセットの品質を公式仕様に照らして評価し、業界内で何が高品質のデータセットを構成するかについて共通の認識を確立します。 

[MobilityData](https://mobilitydata.org/)が管理する無料のオープンソース[Canonical GTFS Schedule validator](https://gtfs-validator.mobilitydata.org/)[^1]は、GTFSデータが公式の[GTFS Schedule Reference](../../documentation/schedule/reference/)および[Best Practices](../../documentation/schedule/schedule_best_practices)に準拠していることを確認します。他の関係者と共有できる使いやすいレポートと包括的なドキュメントを提供します。

<div class="usage"> 
   <div class="usage-list"> 
      <ol> 
            <li> <a href="https://gtfs-validator.mobilitydata.org/">gtfs-validator.mobilitydata.org</a>にアクセスしてください。</li> 
            <li> GTFS データセットを読み込みます。ZIP ファイルを選択またはドラッグ アンド ドロップするか、URL をコピー/貼り付けることができます。</li> 
            <li>検証が完了すると、レポートを開くオプションが提供されます。</li> 
            <li>検証ツールがデータに問題を発見したかどうか、また、その修正方法に関するドキュメントへのリンクが表示されます。検証レポートの URL は 30 日間有効で、他のユーザーと共有できます。</li> 
      </ol> 
   </div> 
   <div class="usage-video"> 
      <video class="center" width="560" height="315" controls> 
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4"> 
      </video> 
   </div> 
</div> 

同様に、無料かつオープンソースの標準 [GTFS Realtimeバリデータ](https://github.com/MobilityData/gtfs-realtime-validator) を使用すると、GTFS データが公式の [GTFS Realtimeリファレンス](../../documentation/realtime/reference/) および [ベスト プラクティス](../../documentation/realtime/realtime_best_practices) に準拠していることが保証されます。

高品質なデータの作成方法については、[カリフォルニア交通データ ガイドライン](https://dot.ca.gov/cal-itp/california-transit-data-guidelines)、[GTFS Scheduleベスト プラクティス](../../documentation/schedule/schedule_best_practices)、[GTFS Realtimeベスト プラクティス](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) を参照してください。プラクティス](../../documentation/realtime/realtime_best_practices).

[^1]: データ パイプラインでこのツールを使用する方法やこのプロジェクトに貢献する方法の詳細については、[GitHub リポジトリ](https://github.com/MobilityData/gtfs-validator).
 をご覧ください。