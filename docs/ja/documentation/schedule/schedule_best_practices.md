# GTFS Scheduleのベスト プラクティス

これらは、[General Transit Feed Specification (GTFS)](../reference) で公共交通機関のサービスを記述するための推奨プラクティスです。これらのプラクティスは、[GTFS ベスト プラクティス ワーキング グループ](#gtfs-best-practices-working-group) メンバーの経験と [アプリケーション固有の GTFS プラクティス推奨事項](http://www.transitwiki.org/TransitWiki/index.php/Best_practices_for_creating_GTFS) から統合されました。 

詳細な背景については、[よくある質問](#frequently-asked-questions-faq)をご覧ください。

## ドキュメントの構造

プラクティスは、4つの主要なセクションに分かれています。

* __[データセットの公開と一般的なプラクティス](#dataset-publishing-general-practices):__ これらのプラクティスは、GTFSデータセットの全体的な構造と、GTFSデータセットが公開される方法に関連しています。
* __[ファイル別にまとめたプラクティスの推奨事項](#practice-recommendations-organized-by-file):__ 推奨事項は、GTFS内のファイルとフィールド別にまとめられており、プラクティスを公式のGTFSリファレンスにマッピングしやすくなっています。
* __[ケース別にまとめたプラクティスの推奨事項](#practice-recommendations-organized-by-case):__ ループルートなどの特定のケースでは、プラクティスを複数のファイルとフィールドに適用する必要がある場合があります。このような推奨事項は、このセクションにまとめられています。

## データセットの公開と一般的なプラクティス

* データセットは、zip ファイル名を含むパブリックの永続的な URL で公開する必要があります。(例: www.agency.org/gtfs/gtfs.zip) 理想的には、ソフトウェア アプリケーションを使用してダウンロードしやすいように、ファイルにアクセスするためにログインする必要なく、URL を直接ダウンロードできる必要があります。 GTFS データセットはオープンにダウンロード可能にすることが推奨されています (最も一般的な方法) が、データ プロバイダーがライセンスやその他の理由で GTFS へのアクセスを制御する必要がある場合は、自動ダウンロードを容易にする API キーを使用して GTFS データセットへのアクセスを制御することが推奨されます。
* GTFS データは反復的に公開されるため、安定した場所にある 1 つのファイルには常に、交通機関 (または複数の機関) のサービスの最新の公式説明が含まれます。
* 可能な限り、データの反復にわたって`stop_id`、 `route_id`、および`agency_id`の永続的な識別子 (id フィールド) を維持します。
* 1 つの GTFS データセットには、現在のサービスと今後のサービス (`統合`データセットと呼ばれることもあります) を含める必要があります。 Google トランジットフィード ツールの [マージ機能](https://github.com/google/transitfeed/wiki/Merge) を使用すると、2 つの異なる GTFS フィードからマージされたデータセットを作成できます。
    * 公開された GTFS データセットは、いつでも少なくとも今後 7 日間は有効である必要があります。理想的には、運行会社がスケジュールが継続して運用されると確信している限り有効です。
    * 可能であれば、GTFS データセットは少なくとも今後 30 日間のサービスをカバーする必要があります。
* フィードから古いサービス (期限切れのカレンダー) を削除します。
* サービスの変更が 7 日以内に有効になる場合は、静的な GTFS データセットではなく、[GTFS-realtime](../../realtime/reference) フィード (サービス アドバイザリまたはルート更新) を使用してこのサービスの変更を表現します。
* GTFS データをホストするウェブサーバーは、ファイル変更dateを正しく報告するように設定する必要があります ([HTTP/1.1- Request for Comments 2616](https://tools.ietf.org/html/rfc2616#section-14.29)、セクション 14.29 を参照してください。

## ファイル別にまとめた実践推奨事項

このセクションでは、[GTFS リファレンス](../reference) に沿って、ファイルとフィールド別にまとめた実践方法を示します。

### すべてのファイル

| フィールド名 | 推奨事項 |
|---|---|
| 大文字と小文字の混在 | 顧客向けのすべてのテキスト文字列 (停留所名、路線名、行先標識を含む) では、小文字を表示できるディスプレイ上の地名の大文字化に関するローカルな慣例に従い、大文字と小文字の混在 (すべて大文字ではない) を使用する必要があります。 |
| | 例: |
| | Brighton Churchill Square |
| | Villiers-sur-Marne |
| | Market Street |
| 略語 | 場所が略称で呼ばれている場合 (例: “JFK Airport”) を除き、フィード全体で名前やその他のテキストの略語を使用しないでください。略語は、スクリーン リーダー ソフトウェアや音声ユーザー インターフェイスによるアクセシビリティに問題が生じる可能性があります。表示用に完全な単語を略語に確実に変換するようにソフトウェアを設計することはできますが、略語から完全な単語に変換すると、エラーが発生するリスクが高くなります。 |

### agency.txt 

| フィールド名 | 推奨事項 |
|---|---|
| `agency_phone` | そのようなカスタマー サービス電話番号が存在しない限り、含める必要があります。 |
| `agency_email` | そのようなカスタマー サービス メールが存在しない限り、含める必要があります。 |
| `agency_fare_url` | 完全に無料の旅行会社でない限り、含める必要があります。 |

例:__

- バス サービスは、いくつかの小さなバス会社によって運営されています。しかし、スケジュールとチケット発行を担当し、ユーザーの観点からバス サービスを担当する 1 つの大きな会社があります。フィード内では、1 つの大きな会社を代理店として定義する必要があります。データが複数の小規模バス運行会社によって内部的に分割されている場合でも、フィードに定義される代理店は 1 つだけにする必要があります。

- フィード プロバイダーはチケット ポータルを運営しますが、実際にサービスを運営し、ユーザーに責任があることが知られている代理店は複数あります。実際にサービスを運営する代理店は、フィード内で代理店として定義する必要があります。

### stops.txt 

| フィールド名 | 推奨事項 |
|---|---|
| `stop_name` | 停留所名が公開されていない場合は、フィード全体で一貫した停留所の命名規則に従います。 | |
| | デフォルトでは、 `stop_name`に`Station`や`Stop`などの一般的な単語や冗長な単語を含めないでください。ただし、一部の例外は許可されます。<ul><li>実際に名前の一部である場合（ユニオン駅、セントラル駅<li>`stop_name`が一般的すぎる場合 (都市名など)、`駅`、`ターミナル`などの単語を使用すると意味が明確になります。</ul> |
| `stop_lat`と`stop_lon` | 停留所の位置はできる限り正確である必要があります。実際の停留所の位置と比較して、停留所の位置の誤差は 4 メートル以内である必要があります。 |
| | 停留所の位置は、乗客が乗車する歩行者通行権のすぐ近くに配置する必要があります (つまり、道路の正しい側)。 |
| | 停留所の位置が別のデータ フィード間で共有されている場合 (つまり、2 つの機関がまったく同じ停留所/乗車施設を使用している場合)、両方の停留所にまったく同じ`stop_lat`と`stop_lon`を使用して、停留所が共有されていることを示します。 |
| `parent_station`と`location_type` | 多くの駅やターミナルには複数の乗車施設があります (モードに応じて、バス ベイ、プラットフォーム、埠頭、ゲート、またはその他の用語で呼ばれる場合があります)。このような場合、フィード作成者は、駅、乗車施設 (子停留所とも呼ばれます)、およびそれらの関係を説明する必要があります。<ul><li>駅またはターミナルは、`location_type = 1`の`stops.txt`内のレコードとして定義する必要があります。</li><li>各乗車施設は、`location_type = 0`の停留所として定義する必要があります。`parent_station` フィールドは、乗車施設がある駅の`stop_id`を参照する必要があります。</li></ul> |
| | 駅や子供用停留所に名前を付ける場合は、乗客によく知られ、乗客が駅や乗車施設（バス停、プラットホーム、埠頭、ゲートなど）を識別できるような名前を付けてください。<table class=’example’><thead><tr><th>親ステーション名</th><th>子の停留所名</th></tr></thead><tbody><tr><td>シカゴ ユニオン駅</td><td>シカゴ ユニオン駅 19番線</td></tr><tr><td>サンフランシスコフェリービルディングターミナル</td><td>サンフランシスコフェリービルターミナルゲートE</td></tr><tr><td>ダウンタウン トランジット センター</td><td>ダウンタウン トランジット センター ベイ B</td></tr></tbody></table> |

### routes.txt 

| フィールド名 | 推奨事項 |
|---|---|
| `route_long_name` | 仕様リファレンスの定義:<q>この名前は、通常、 <code>route_short_name</code>よりも説明的で、ルートの目的地または停車地が含まれることがよくあります。route_short_name または<code>route_long_name</code>の少なくとも 1 つを指定する必要があります。適切な場合は、両方を指定することも<code>route_short_name</code>ます。ルートに長い名前がない場合は、 <code>route_short_name</code>を指定し、このフィールドの値として空のstringを使用してください。</q><br>長い名前の種類の例を以下に示します。<table class=’example’><thead><tr><th colspan=’3’>主な移動経路または回廊</th></tr><tr><th>ルート名</th><th>形状</th><th>事業者</th></tr></thead><tbody><tr><td><a href=’https://www.sfmta.com/getting-around/transit/routes-stops/n-judah’>`N`/`ユダ`</a></td><td> <code>route_short_name</code>/<br> <code>route_long_name</code></td><td>サンフランシスコの<a href=’https://www.sfmta.com/’>Muni</a></td></tr><tr><td> <a href=’https://trimet.org/schedules/r006.htm’>`6`/`L` キング ジュニア ブルバード`</a></td><td> <code>route_short_name</code>/<br> <code>route_long_name</code></td><td>オレゴン州ポートランドの<a href=’https://trimet.org/’>TriMet</a> 。</td></tr><tr><td> <a href=’http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6’>『6』/『ネイション～エトワール』</a></td><td> <code>route_short_name</code>/<br> <code>route_long_name</code></td><td>フランスのパリにある<a href=’http://www.ratp.fr/’>RATP</a> 。</td></tr><tr><td> <a href=’http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf’>`U2`-`パンコウ – ルーレーベン`</a></td><td> <code>route_short_name</code> -<br> <code>route_long_name</code></td><td> <a href=’http://www.bvg.de/’>BVG</a> 、ドイツ、ベルリン</td></tr></tbody></table><table class=’example’><thead><tr><th>サービスの説明</th></tr></thead><tbody><tr><td><a href=’https://128bc.org/schedules/rev-bus-hartwell-area/’>`ハートウェルエリアシャトル`</a></td></tr></tbody></table>        
| | `route_long_name`には`route_short_name`を含めないでください。 |
| | `route_long_name`を入力するときは、サービス ID を含む完全な指定を含めます。例:<table class=’example’><thead><tr><th>サービス ID</th><th>おすすめ</th><th>例</th></tr></thead><tbody><tr><td>`MAXライトレール`<br>オレゴン州ポートランドのTriMet</td><td> <code>route_long_name</code>はブランド（MAX）と特定のルート指定を含める必要があります。</td><td> `MAXレッドライン``MAXブルーライン`</td></tr><tr><td> `ラピッドライド`<br>ニューメキシコ州アルバカーキの ABQ ライド</td><td><code>route_long_name</code>はブランド（Rapid Ride）と特定のルート指定を含める必要があります。</td><td> `ラピッドライドレッドライン`<br> `ラピッドライドブルーライン`</td></tr></tbody></table> 
| `route_id` | 指定された名前付きルート上のすべての旅行は、同じ`route_id`を参照する必要があります。<li>ルートの異なる方向を異なる`route_id`値に分割しないでください。</li><li>ルートの異なる運行区間を異なる`route_id`値に分割しないでください。つまり、 `routes.txt`に`n` AM`サービスと`n` PM`サービスに異なるレコードを作成しないでください。</li> |
| | ルート グループに明確に名前が付けられた分岐 (1A と 1B など) が含まれる場合は、ルート [branches](#branches) の場合の推奨事項に従って、 `route_short_name`と`route_long_name`を決定します。 |
| `route_color`と`route_text_color` | 標識や印刷物およびオンラインの顧客情報と一致している必要があります (したがって、他の場所に存在しない場合は含めないでください)。 |

### trips.txt 

* __ループ ルートの特殊なケースを参照してください:__ ループ ルートは、2 つの異なる終点がある線形ルートとは対照的に、旅行が同じ停留所で開始および終了する場合です。ループ ルートは、特定のプラクティスに従って記述する必要があります。[ループ ルートのケースを参照してください。](#loop-routes)
* __ラッソ ルートの特殊なケースを参照してください:__ ラッソ ルートは、線形ジオメトリとループ ジオメトリのハイブリッドであり、車両はルートの一部のみをループして移動します。ラッソ ルートは、特定のプラクティスに従って記述する必要があります。 [Lasso ルートのケースを参照してください。](#lasso-routes)

| フィールド名 | 推奨事項 |
|---|---|
| `trip_headsign` | ` `trip_headsign`または`stop_headsign`フィールドにルート名 ( `route_short_name`および`route_long_name`と一致するもの) を指定しないでください。 |
| | ルート内の旅行を区別するために使用できる、車両のヘッドサイン上に表示される目的地、方向、およびその他の旅行指定テキストを含める必要があります。車両に表示される方向情報との一貫性は、GTFS データセットで提供されるヘッドサインを決定するための最優先の目標です。その他の情報は、この主要目標を損なわない場合にのみ含める必要があります。旅行中にヘッドサインが変更される場合は、 `trip_headsign`を`stop_times.stop_headsign`で上書きします。以下に、考えられるいくつかのケースに対する推奨事項を示します。 |
| |<table class="example"><thead><tr><th>ルートの説明</th><th>おすすめ</th></tr></thead><tbody><tr><td>2A. 目的地のみ</td><td>終点の目的地を入力してください。例: `ト` センター`、`ド` シティ センター`、`ン` ビーチ`></td></tr><tr><td> 2B. ウェイポイントのある目的地</td><td>&lt;destination> 経由 &lt;waypoint> “Highgate via Charing Cross”。車両がそれらのウェイポイントを通過した後に、乗客に表示されるヘッドサインからウェイポイントが削除された場合は、 <code>stop_times.stop_headsign</code>を使用して更新されたヘッドサインを設定します。</td></tr><tr><td> 2C. 地方の地名と停留所</td><td>目的地の市内または自治区内に複数の停留所がある場合は、目的地の市内に到着したら<code>stop_times.stop_headsign</code>を使用します。</td></tr><tr><td> 2D. 方向のみ</td><td>`北行き`、`内向き`、`時計回り`などの用語を使用して方向を示します。</td></tr><tr><td> 2E. 目的地までの道順</td><td>&lt;方向> から &lt;終点名> へ (例: `南行きサンノゼ行き`)</td></tr><tr><td> 2F. 目的地と経由地を含む方向</td><td>&lt;方向> から &lt;ウェイポイント> を経由して &lt;目的地> へ（`グ` クロス経由でハイゲートへ北行き`）。</td></tr></tbody></table> |
| | ヘッドサインの先頭に`To`や`Towards`という言葉を使用しないでください。 |
| `direction_id` | データセット全体で一貫して 0 と 1 の値を使用します。つまり<ul><li>1 = 赤ルートのアウトバウンドの場合、1 = 緑ルートのアウトバウンド</li><li>1 = ルート X の北行きの場合、1 = ルート Y の北行き</li><li>ルートXが1 = 時計回りの場合、ルートYも1 = 時計回り</li></ul>|
| `bikes_allowed` | フェリー旅行の場合、自転車が許可されている (または許可されていない) ことを明示的に指定します。データが欠落しているためにフェリー旅行を避けると、通常、大きな迂回につながります。 |

### stop_times.txt 

ループ ルート: ループ ルートでは、特別な`stop_times`の考慮が必要です。(参照: [ループ ルートのケース](#loop-routes))

| フィールド名 | 推奨事項 |
|---|---|
| `pickup_type`および`drop_off_type` | 旅客サービスを提供しない無収入 (回送) 旅行では、すべての`stop_times`行で`pickup_type`および`drop_off_type`の値を`1`に設定する必要があります。
| |有償運行の場合、運行状況を監視するための内部の`グ` ポイント`や、乗客が乗車できない車庫などのその他の場所は、` pickup_type = 1` (乗車不可) および `drop_off_type = 1` (降車不可) でマークする必要があります。 |
| `arrival_time`および`departure_time` | `arrival_time`と`departure_time`フィールドには、可能な限り、拘束力のない推定時間またはタイム ポイント間の補間時間を含め、時間値を指定する必要があります。 |
| `stop_headsign` | 一般に、ヘッドサイン値は駅の標識にも対応する必要があります。<br><br>以下の場合、`南行き`は駅の標識では使用されていないため、顧客に誤解を与える可能性があります。
| |<table class="example"><thead><tr><th colspan="2"> NYC で南行きの 2 名の場合:</th></tr><tr><th> <code>stop_times.txt</code>行の場合:</th><th> <code>stop_headsign</code>値を使用します:</th></tr></thead><tbody><tr><td>マンハッタンに到着するまで</td><td><code>Manhattan &amp; Brooklyn</code></td></tr><tr><td>ダウンタウンに到着するまで</td><td><code>Downtown &amp; Brooklyn</code></td></tr><tr><td>ブルックリンに到着するまで</td><td><code>Brooklyn</code></td></tr><tr><td>ブルックリンに到着したら</td><td><code>Brooklyn (New Lots Av)</code></td></tr></tbody></table> |
| |<table class="example"><thead><tr><th colspan="2">ボストン、レッドライン南行き、ブレインツリー支線の場合：</th></tr><tr><th> <code>stop_times.txt</code>行の場合:</th><th> <code>stop_headsign</code>値を使用します:</th></tr></thead><tbody><tr><td>ダウンタウンに到着するまで</td><td><code>Inbound to Braintree</code></td></tr><tr><td>ダウンタウンに到着したら</td><td><code>Braintree</code></td></tr><tr><td>ダウンタウンの後</td><td><code>Outbound to Braintree</code></td></tr></tbody></table> |

### calendar.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | `calendar.service_name`も` GTFS の可読性を高めることができますが、これは仕様では採用されていません。 |

### calendar_dates.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | `calendar.service_name`も` GTFS の可読性を高めることができますが、これは仕様では採用されていません。|

### fare_attributes.txt 

| フィールド名 | 推奨事項 |
|---|---|
| | 運賃システムを正確にモデル化できない場合は、混乱を避けるために空白のままにしておきます。 |
| | 運賃 (`fare_attributes.txt`および`fare_rules.txt`) を含めて、できるだけ正確にモデル化します。運賃を正確にモデル化できないエッジケースでは、運賃を安くするのではなく高く表現して、顧客が不足運賃で搭乗しないようにする必要があります。運賃の大部分を正しくモデル化できない場合は、運賃情報をフィードに含めないでください。 |

### fare_rules.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | 運賃システムを正確にモデル化できない場合は、混乱を避けるために空白のままにしておきます。 |
| | 運賃 (`fare_attributes.txt`および`fare_rules.txt`) を含めて、できるだけ正確にモデル化します。運賃を正確にモデル化できないエッジケースでは、運賃を安くするのではなく高く表現して、顧客が不足運賃で搭乗しないようにする必要があります。運賃の大部分を正しくモデル化できない場合は、運賃情報をフィードに含めないでください。 |

### shapes.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | 理想的には、共有されている線形の場合 (つまり、ルート・路線系統1 と 2 が同じ道路または線路のセグメントで動作している場合)、線形の共有部分は完全に一致する必要があります。これにより、高品質の交通地図作成が容易になります。<!-- (77) --> 
| | 線形は、車両が走行する道路の中心線に沿う必要があります。これは、指定された車線がない場合は道路の中心線、または車両の移動方向の道路側の中心線のいずれかになります。<br><br>配置は、縁石の停留所、プラットフォーム、または乗車場所に対して`ギザギザ`になってはなりません。 |
| `shape_dist_traveled` | `shape_dist_traveled`フィールドを使用すると、機関は`shape_dist_traveled` `stop_times.txt`ファイル内の停留所がそれぞれの形状にどのように適合するかを正確に指定できます。`shape_dist_traveled` フィールドに使用する一般的な値は、車両が移動した形状の開始点からの距離です (走行距離計の読み取り値のようなものと考えてください)。<li>ルートの配置 ( `shapes.txt`内) は、旅行がサービスを提供する停留所の位置から 100 メートル以内である必要があります。</li><li> <code>shapes.txt</code>に余分な点が含まれないように配置を簡素化します (つまり、直線セグメント上の余分な点を削除します。線の簡素化の問題に関する説明を参照してください)。</li> 

### frequencies.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | `frequencies.txt`で参照される旅行では、実際の停車時刻は無視されます。定期運行の旅行では、停車時刻間の移動時間間隔のみが重要です。明確さと可読性のため、 `frequencies.txt`は` 00:00:00 (最初の`arrival_time`が` 00:00:00) から開始することをお勧めします。 |
| `block_id` | 定期運行の旅行に指定できます。 |

### transfers.txt 

 `transfers.transfer_type`は、[GTFS で定義](../reference/#transferstxt) の 4 つの値のいずれかになります。これらの`transfer_type`定義は、以下の GTFS 仕様から _斜体_ で引用されており、追加の推奨事項が実践されています。

| フィールド名 |推奨 |
|---|---|
| `transfer_type` | <q>0 または (空): これはルート間の推奨される乗り換えポイントです。</q><br>複数の乗り換え機会があり、その中により優れた選択肢（追加の設備を備えた交通センター、または隣接または接続された乗車施設/プラットフォームを備えた駅など）がある場合は、推奨される乗り換えポイントを指定します。 |
| | <q>1: これは、2 つのルート間の時間指定の乗り換えポイントです。出発車両は、乗客がルート間を乗り換えるのに十分な時間、到着車両を待つことが期待されます。</q><br>この乗り換えタイプは、乗り換えを確実に行うために必要な間隔をオーバーライドします。たとえば、Google マップでは、乗客が安全に乗り換えを行うには 3 分かかると想定しています。他のアプリケーションでは、他のデフォルトを想定する場合があります。|
| | <q>2: この乗り換えでは、接続を確実にするために、到着と出発の間に最小限の時間が必要です。乗り換えに必要な時間は、 <code>min_transfer_time</code>で指定します。</q><br>停留所間の移動時間が長くなる障害物やその他の要因がある場合は、最小乗り換え時間を指定します。 |
| | <q>3: この場所ではルート間の乗り換えはできません。</q><br>物理的な障壁のために乗り換えが不可能な場合、または困難な道路横断や歩行者ネットワークの隙間によって乗り換えが安全でなかったり複雑になったりする場合は、この値を指定します。 |
| | 乗車間で座席内 (ブロック) 乗り換えが許可されている場合、到着乗車の最後の停車地は、出発乗車の最初の停車地と同じである必要があります。 |


## 事例別に整理された実践推奨事項

このセクションでは、ファイルやフィールド全体に影響を与える特定の事例について説明します。

### ループルート・路線系統

ループ ルートでは、車両の乗車は同じ場所 (場合によってはトランジット センターまたは乗り換えセンター) で始まり、終わります。車両は通常、連続的に運行し、車両がループを続ける間、乗客は車内にとどまることができます。

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"> 

 したがって、乗客に車両の進行方向を示すために、行先表示の推奨事項を適用する必要があります。

移動方向の変更を示すには、 `stop_times.txt`ファイルに`stop_headsigns`を指定します。`stop_headsign`は、定義されている停留所から出発する旅行の方向を説明します。旅行の各停留所に`stop_headsigns`を追加すると、旅行中のヘッドサイン情報を変更できます。

2 つのエンドポイント間で動作するルート (同じバスが往復する場合など) に対して、 stop_times.txtファイルで 1 つの循環旅行を定義しないでください。代わりに、旅行を 2 つの別々の旅行方向に分割します。

循環旅行のモデリングの例:__

- 停留所ごとにヘッドサインが変化する循環旅行

| trip_id | arrive_time | department_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1 | 06:10:00    | 06:10:00       | stop_A | 1             | "B"          |
| trip_1 | 06:15:00    | 06:15:00       | stop_B | 2             | "C"          |
| trip_1 | 06:20:00    | 06:20:00       | stop_C | 3             | "D"          |
| trip_1 | 06:25:00    | 06:25:00       | stop_D | 4             | "E"          |
| trip_1 | 06:30:00    | 06:30:00       | stop_E | 5             | "A"          |
| trip_1 | 06:35:00    | 06:35:00       | stop_A | 6             | ""            |

- 2 つの行先標識がある循環旅行

| trip_id | arrive_time | departmental | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|--------------|---------------|
| trip_1 | 06:10:00    | 06:10:00       | stop_A | 1             | "outbound"    |
| trip_1 | 06:15:00    | 06:15:00       | stop_B | 2             | "outbound"    |
| trip_1 | 06:20:00    | 06:20:00       | stop_C | 3             | "outbound"    |
| trip_1 | 06:25:00    | 06:25:00       | stop_D | 4             | "inbound"    |
| trip_1 | 06:30:00    | 06:30:00       | stop_E | 5             | "inbound"    |
| trip_1 | 06:35:00    | 06:35:00       | stop_F | 6             | "inbound"    |
| trip_1 | 06:40:00    | 06:40:00       | stop_A | 7             | ""            |

| フィールド名 | 推奨事項 |
|---|---|
| `trips.trip_id `| ループの完全な往復を 1 回の旅行でモデル化します。 |
| `stop_times.stop_id` | ループである旅行の場合は、 `stop_times.txt`に最初/最後の停車地を 2 回含めます。以下に例を示します。多くの場合、ループ ルートには、ループ全体を移動しない最初と最後の旅行が含まれることがあります。これらの旅行も含めます。<table class="example"><thead><tr><th> <code>trip_id</code></th><th> <code>stop_id</code></th><th> <code>stop_sequence</code></th></tr></thead><tbody><tr><td> 9000</td><td> 101</td><td> 1</td></tr><tr><td> 9000</td><td> 102</td><td> 2</td></tr><tr><td> 9000</td><td> 103</td><td> 3</td></tr><tr><td> 9000</td><td> 101</td><td> 4</td></tr></tbody></table> |
| `trips.direction_id` | ループが反対方向 (つまり時計回りと反時計回り) に動作する場合、 `direction_id` を`0` または`1`に指定します。 |
| `trips.block_id` | 同じ`block_id`プ` トリップを示します。 |

### Lassoルート・路線系統

Lasso ルートは、ループ ルートと方向ルートの側面を組み合わせたものです。

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;"> 

| 例: |
|--------|
| 地下鉄ルート・路線系統([シカゴ](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)) |
| 郊外からダウンタ​​ルート・路線系統へのバス路線 ([セント アルバート](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) または [エドモントン](http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf)) |
| CTA ブラウン ライン ([CTA ウェブサイト](http://www.transitchicago.com/brownline/) および [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn)) |

| フィールド名 | 推奨事項 |
|---|---|
| `trips.trip_id` | `車両の往復`の全範囲 ([上記](#lasso-routes) の図を参照) は、A から B、B、そして A に戻る移動で構成されます。車両の往復全体は、次のように表すことができます。<li> `trips.txt`の` __single__ `trip_id`値/レコード</li><li>`trips.txt`は` __複数の__ `trip_id`値/レコードがあり、連続した移動は`block_id`で示されます。</li> |
| `stop_times.stop_headsign` | AB セクションに沿った停留所は両方向に通過します。`stop_headsign` により移動方向の区別が容易になります。したがって、これらの旅行では`stop_headsign`を指定することをお勧めします。example_table:<table class="example"><thead><tr><th>例:</th></tr></thead><tbody><tr><td> `A経由B`</td></tr><tr><td> `あ`</td></tr></tbody></table><table class="example"><thead><tr><th>シカゴ交通局の<a href="http://www.transitchicago.com/purpleline/">パープルライン</a></th></tr></thead><tbody><tr><td>`ループ南行き`</td></tr><tr><td> `ループ経由北行き`</td></tr><tr><td> `リンデンへ北上`</td></tr></tbody></table><table class="example"><thead><tr><th>エドモントン交通サービスバス路線、ここでは<a href="http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">39</a></th></tr></thead><tbody><tr><td> `ラザフォード`</td></tr><tr><td> `センチュリーパーク`</td></tr></tbody></table> 
| `trip.trip_headsign` | 旅行の行先標識は、スケジュールに表示されるような旅行の全体的な説明である必要があります。`n` から Linden へ、Loop 経由`(シカゴの例) または`A` から A へ、B 経由`(一般的な例) などです。 |

### 分岐

一部のルートには分岐が含まれる場合があります。これらの分岐間では配置と停留所が共有されますが、それぞれが異なる停留所と配置セクションも提供します。分岐間の関係は、以下の追加のガイドラインを使用して、ルート名、行先標識、旅行の短縮名で示すことができます。

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;"> 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | 分岐ルートに名前を付ける場合は、他の旅客情報資料に従うことをお勧めします。以下は、2 つのケースの説明と例です。 |
| | 時刻表と路上標識が 2 つの異なる名前のルート (例: 1A と 1B) を表している場合は、 `route_short_name`フィールドや`route_long_name`フィールドを使用して、GTFS でそのように示します。例: GoDurham Transit [ルート 2、2A、および 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) は、ルートの大部分で共通の配置を共有していますが、いくつかの異なる側面で異なります。<ul><li>ルート 2 はコア サービスであり、ほとんどの時間帯に運行されます。</li><li>ルート 2 では、夜間、日曜日、祝日にメイン ストリートを迂回します。</li><li>ルート・路線系統2Aと2Bは月曜日から土曜日までの日中に運行されます。</li><li>ルート 2B は、共有線形パスから外れて追加の停留所に停車します。</li></ul> |
| | 機関が提供する情報に同じ名前のルートとして分岐が記載されている場合は、 `trips.trip_headsign`、`stop_ti`を使用します。

mes.stop_headsign`、および/または`trips.trip_short_name`フィールド。例: GoTriangle [route 300](https:) は、時間帯に応じて異なる場所に移動します。通勤ラッシュ時には、市内に出入りする労働者に対応するために、標準ルートに追加の区間が追加されます。 |

## よくある質問（FAQ）

### これらの GTFS ベスト プラクティスはなぜ重要ですか？

GTFS ベスト プラクティスの目的は次のとおりです。

* 公共交通機関アプリにおけるエンドユーザーのカスタマー エクスペリエンスを向上させる
* 幅広いデータの相互運用性をサポートし、ソフトウェア開発者がアプリケーション、製品、サービスを導入および拡張しやすくする
* さまざまなアプリケーション カテゴリで GTFS の使用を促進する（旅行計画という当初の重点を超えて）

GTFS ベスト プラクティスが調整されていないと、GTFS を利用するさまざまなアプリケーションが、調整されていない方法で要件と期待を確立する可能性があります。その結果、要件とアプリケーション固有のデータセットが分散し、相互運用性が低下します。ベスト プラクティスがリリースされる前は、正しい形式の GTFS データを構成する要素について、より大きな曖昧さと意見の不一致がありました。

### これらはどのように開発されたのですか？誰が開発しましたか?

これらのベスト プラクティスは、GTFS に深く関わっているアプリ プロバイダーとデータ コンシューマー、交通機関プロバイダー、コンサルタントなど、GTFS に関わる 17 の組織からなるワーキング グループによって開発されました。ワーキング グループは [Rocky Mountain Institute](http://www.rmi.org/mobility) によって招集され、運営されました。

ワーキング グループのメンバーは、各ベスト プラクティスに投票しました。ほとんどのベスト プラクティスは満場一致で承認されました。少数のケースでは、ベスト プラクティスが組織の大多数で承認されました。

### GTFS 参照を変更しないのはなぜですか?

よい質問です。仕様、データの使用法、ニーズを調査するプロセスによって、実際に仕様にいくつかの変更が加えられました ([GitHub のクローズされたプル リクエスト](https://github.com/google/transit/pulls?q=is%3Apr+is%3Aclosed) を参照)。
仕様参照の修正は、ベスト プラクティスよりも厳しい精査とコメントの対象となります。特定のベスト プラクティスは、採用レベルとコミュニティの合意に基づいて仕様に統合されています。最終的には、すべての GTFS ベスト プラクティスがコア GTFS リファレンスの一部になる可能性があります。

### これらのベスト プラクティスへの準拠を確認するにはどうすればいいですか?

Canonical GTFS Schedule Validator は、これらのベスト プラクティスへの準拠を確認します。この検証ツールの詳細については、[検証ページ](../../../getting_started/validate) を参照してください。

### 私は交通機関の代表です。ソフトウェア サービス プロバイダーとベンダーがこれらのベスト プラクティスに従うようにするには、どのような手順を踏めばよいでしょうか?

ベンダーまたはソフトウェア サービス プロバイダーにこれらのベスト プラクティスを勧めてください。 GTFS を生成するソフトウェアを調達する際は、GTFS ベスト プラクティスの URL とコア仕様リファレンスを参照することをおすすめします。

### GTFS データ フィードがこれらのベスト プラクティスに準拠していないことに気付いた場合はどうすればよいですか?

* feed_info.txt * に [提案された feed\_contact\_email または feed\_contact\_url](https://github.com/google/transit/pull/31/files) フィールドがある場合はそれを使用して、または交通機関またはフィード プロデューサーのウェブサイトで連絡先情報を検索して、フィードの連絡先を特定します。フィード プロデューサーに問題を伝えるときは、議論中の特定の GTFS ベスト プラクティスにリンクします。 （[`このドキュメントへのリンク`](#linking-to-this-document)を参照してください）。

### 参加するにはどうすればいいですか？

[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)にメールを送信してください。

## このドキュメントについて

### 目的

GTFS ベスト プラクティスを維持する目的は次のとおりです。

* 交通データの相互運用性の向上をサポートする
* 公共交通機関アプリにおけるエンドユーザーの顧客エクスペリエンスを向上させる
* ソフトウェア開発者がアプリケーション、製品、およびサービスを導入および拡張しやすくする
* さまざまなアプリケーション カテゴリで GTFS を使用できるようにする（当初の重点である旅行計画を超えて）

### 公開されている GTFS ベスト プラクティスを提案または修正する方法

ベスト プラクティスは、現在仕様に統合中です。新しいベスト プラクティスを提案したい場合は、[GTFS リファレンス GitHub リポジトリ](https://github.com/google/transit/) にアクセスして問題を報告または PR を作成するか、[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) にお問い合わせください。

### このドキュメントへのリンク

フィード プロデューサーに GTFS データを正しく作成するためのガイダンスを提供するために、ここにリンクしてください。個々の推奨事項にはそれぞれアンカー リンクがあります。推奨事項をクリックすると、ページ内のアンカー リンクの URL が表示されます。

GTFS を利用するアプリケーションが、ここで説明されていない GTFS データの取り扱いに関する要件や推奨事項を提示している場合は、これらの一般的なベスト プラクティスを補足するために、それらの要件や推奨事項を記載したドキュメントを公開することをお勧めします。

### GTFS ベスト プラクティス ワーキング グループ

GTFS ベスト プラクティス ワーキング グループは、2016 ～ 2017 年に [Rocky Mountain Institute](http:) によって招集され、公共交通機関、GTFS を利用するアプリケーションの開発者、コンサルタント、学術機関で構成され、GTFS データに関する一般的な取り扱いと期待を定義します。 
このワーキンググループのメンバーは次のとおりです:

* [Cambridge Systematics](https://www.camsys.com/)
* [Capital Metro](https:://www.capmetro.org/)
* [Center for Urban Transportation Research at University of South Florida](https://www.cutr.usf.edu/)
* [Conveyal](http://conveyal.com/)
* [Google](https://www.google.com/)
* [IBI Group](http://www.ibigroup.com/)
* [Mapzen](https://mapzen.com/)
* [Microsoft](https://www.microsoft.com/)
* [Moovel](https://www.moovel.com/)
* [Oregon Department of Transportation](http://www.oregon.gov/odot/)
* [Swiftly](https://goswift.ly/)
* [Transit](https://transitapp.com/)
* [Trillium](http://trilliumtransit.com/)
* [TriMet](https://trimet.org/)
* [World Bank](http://www.worldbank.org/)

現在、このドキュメントは [MobilityData](http://mobilitydata.org/) によって管理されています。
