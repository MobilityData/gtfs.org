# GTFS スケジュールのベスト プラクティス

これらは、[General Transit Feed Specific (GTFS)](../reference) で公共交通事業者のサービスを記述するための推奨プラクティスです。これらのプラクティスは、[GTFS ベスト プラクティス ワーキング グループ](#gtfs-best-practices-working-group) メンバーの経験と [アプリケーション固有の GTFS プラクティス推奨事項](http://www.transitwiki.org/TransitWiki/index.php/Best_practices_for_creating_GTFS) からまとめられたものです。

詳細な背景情報については、[よくある質問](#frequently-asked-questions-faq) を参照してください。

## ドキュメント構造

プラクティスは、4 つの主要なセクションに分かれています。

* __[データセットの公開と一般的なプラクティス](#dataset-publishing-general-practices):__ これらのプラクティスは、GTFS データセットの全体的な構造と、GTFS データセットが公開される方法に関連しています。
* __[ファイル別に整理された実践推奨事項](#practice-recommendations-organized-by-file):__ 実践を公式 GTFS リファレンスにマッピングしやすくするために、推奨事項は GTFS 内のファイルとフィールド別に整理されています。
* __[ケース別に整理された実践推奨事項](#practice-recommendations-organized-by-case):__ ループ ルートなどの特定のケースでは、実践を複数のファイルとフィールドに適用する必要がある場合があります。このような推奨事項はこのセクションにまとめられています。

## データセットの公開と一般的な実践

* データセットは、zip ファイル名を含むパブリックの永続的な URL で公開する必要があります (例: www.agency.org/gtfs/gtfs.zip)。理想的には、ソフトウェア アプリケーションを使用するダウンロードを容易にするために、ファイルにアクセスするためにログインする必要なく、URL を直接ダウンロードできる必要があります。 GTFS データセットはオープンにダウンロード可能にすることが推奨されています (最も一般的な方法) が、データ プロバイダがライセンスやその他の理由で GTFS へのアクセスを制御する必要がある場合は、自動ダウンロードを容易にする API キーを使用して GTFS データセットへのアクセスを制御することをお勧めします。
* GTFS データは反復的に公開されるため、安定した場所にある 1 つのファイルには常に、交通事業者 (または複数の事業者) のサービスの最新の公式説明が含まれます。
* 可能な限り、データの反復全体で ​​`stop_id`、`route_id`、および `agency_id` の永続的な識別子 (id フィールド) を維持します。
* 1つの GTFS データセットには、現在のサービスと今後のサービス (「マージされた」データセットと呼ばれることもあります) を含める必要があります。Google トランジットフィード ツールの [マージ機能](https://github.com/google/transitfeed/wiki/Merge) を使用すると、2 つの異なる GTFS フィードからマージされたデータセットを作成できます。
    * 公開された GTFS データセットは、いつでも少なくとも今後 7 日間は有効である必要があります。理想的には、運行会社がスケジュールが継続して運用されると確信している限り有効です。
    * 可能であれば、GTFS データセットは少なくとも今後 30 日間のサービスをカバーする必要があります。
* フィードから古いサービス (期限切れのカレンダー) を削除します。
* サービスの変更が 7 日以内に有効になる場合は、静的な GTFS データセットではなく、[GTFS-realtime](../../realtime/reference) フィード (サービス アドバイザリまたは便更新) を通じてこのサービスの変更を表現します。
* GTFS データをホストする Web サーバーは、ファイル変更日を正しく報告するように構成する必要があります ([HTTP/1.1 - Request for Comments 2616](https://tools.ietf.org/html/rfc2616#section-14.29) のセクション 14.29 を参照)。

## ファイル別にまとめた実践推奨事項

このセクションでは、[GTFS リファレンス](../reference) に沿って、ファイルとフィールド別にまとめた実践方法を示します。

### すべてのファイル

| フィールド名 | 推奨事項 |
|---|---|
| 大文字と小文字の混在 | 顧客するべきであるのすべてのText文字列 (停留所名、路線名、行先表示を含む) では、小文字を表示できるディスプレイ上の地名の大文字化に関するローカルな慣例に従い、大文字と小文字の混在 (すべて大文字ではない) を使用する必要があります。 |
| | 例: |
| | Brighton Churchill Square |
| | Villiers-sur-Marne |
| | Market Street |
| 略語 | 場所が略称で呼ばれている場合 (例: “JFK Airport”) を除き、フィード全体で名前やその他のTextの略語を使用しないでください。略語は、スクリーン リーダー ソフトウェアや音声ユーザー インターフェイスによるアクセシビリティに問題が生じる可能性がありしてもよい。表示用に完全な単語を略語に確実に変換するようにソフトウェアを設計することはできますが、略語から完全な単語に変換すると、エラーが発生するリスクが高くなります。 |

### agency.txt 

| フィールド名 | 推奨事項 |
|---|---|
| `agency_phone` | そのようなカスタマー サービス電話番号が存在しない限り、含めるするべきである。 |
| `agency_email` | そのようなカスタマー サービス メールが存在しない限り、含めるするべきであるます。 |
| `agency_fare_url` | 完全に無料の便事業者でない限り、含めるするべきである。 |

__例:__

- バス サービスは、いくつかの小さなバス会社によって運営されています。しかし、スケジュールとチケット発行を担当し、ユーザーの観点からバス サービスを担当する 1 つの大きな事業者があります。フィード内では、1 つの大きな事業者を代理事業者として定義するするべきである。データが複数の小規模バス運行会社によって内部的に分割されている場合でも、フィードに定義される事業者は 1 つだけにするするべきである。

- フィード プロバイダーはチケット ポータルを運営しますが、実際にサービスを運営し、ユーザーに責任があることが知られている代理店は複数あります。実際にサービスを運営している代理店は、フィード内で代理店として定義するするべきである。

### stops.txt 

| フィールド名 | 推奨事項 |
|---|---|
| `stop_name` | 停留所名が公開されていない場合は、フィード全体で一貫した停留所の命名規則に従ってください。 | |
| | デフォルトでは、`stop_name` に `Station` や `Stop` などの一般的な単語や冗長な単語を含めするべきではない。ただし、一部の例外は許可されます。<ul><li>実際に名前の一部である場合（ユニオン駅、セントラル駅<li> `stop_name` が一般的すぎる場合 (都市名など)、`駅`、`ターミナル` などの単語を使用すると意味が明確になります。</ul> |
| `stop_lat` と `stop_lon` | 停留所の位置はできる限り正確であるするべきである。実際の停留所Positionと比較して、停留所の位置の誤差は 4 メートル以内であるするべきである。 |
| | 停留所の位置は、乗客が乗車する歩行者通行権のすぐ近く (つまり、道路の正しい側) に配置するするべきである。 |
| | 停留所の位置が別のデータ フィード間で共有されている場合 (つまり、2 つの事業者がまったく同じ停留所/乗車施設を使用している場合)、両方の停留所等にまったく同じ `stop_lat` と `stop_lon` を使用して、停留所が共有されていることを示します。 |
| `parent_station` と `location_type` | 多くの駅やターミナルには複数の乗車施設があります (モードに応じて、バス停、プラットフォーム、埠頭、ゲートなどと呼ばれる場合があります)。このような場合、フィード作成者は駅、乗車施設 (子停留所等とも呼ばれます)、およびそれらの関係を説明するするべきである。<ul><li>駅またはターミナルは、 `location_type = 1` の `stops.txt` 内のレコードとして定義するするべきである。</li><li>各乗車施設は、`location_type = 0` の停留所として定義するするべきである。`parent_station` フィールドは、乗車施設がある駅の `stop_id` を参照するするべきである。</li></ul> |
| | 駅や子停留所等に名前を付ける場合は、乗客によく知られ、乗客が駅や乗車施設（バス停、プラットホーム、埠頭、ゲートなど）を識別できるような名前を付けてください。<table class=’example’><thead><tr><th>親ステーション名</th><th>子の停留所名</th></tr></thead><tbody><tr><td>シカゴ ユニオン駅</td><td>シカゴ ユニオン駅 19番線</td></tr><tr><td>サンフランシスコフェリービルディングターミナル</td><td>サンフランシスコフェリービルターミナルゲートE</td></tr><tr><td>ダウンタウン トランジット センター</td><td>ダウンタウン トランジット センター ベイ B</td></tr></tbody></table> |

### routes.txt 
| フィールド名 | 推奨事項 |
| --- | --- |
| `route_long_name` | 仕様リファレンスの定義: <q>この名前は一般に <code>route_short_name</code> よりも説明的であり、多くの場合、ルートの目的地または停留所が含まれます。<code>route_short_name</code> または <code>route_long_name</code> の少なくとも 1 つを指定する必要があります。適切な場合は両方を指定することもできます。ルートに長い名前がない場合は、<code>route_short_name</code> を指定し、このフィールドの値として空の文字列を使用してください。</q><br>長い名前の種類の例を以下に示します。<table class='example'><thead><tr><th colspan='3'>主要な移動経路または回廊</th></tr><tr><th>ルート名</th><th>フォーム</th><th>事業者</th></tr></thead><tbody><tr><td><a href='https://www.sfmta.com/getting-around/transit/routes-stops/n-judah'>“N”/“Judah”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://www.sfmta.com/'>Muni</a>、サンフランシスコフランシスコ</td></tr><tr><td><a href='https://trimet.org/schedules/r006.htm'>“6“/“ML King Jr Blvd“</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://trimet.org/'>TriMet</a>、オレゴン州ポートランド</td></tr><tr><td><a href='http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6'>“6”/“Nation - Étoile”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='http://www.ratp.fr/'>RATP</a>、 </td></tr><tr><td><a href='http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf'>“U2”-“Pankow – Ruhleben”</a></td><td><code>route_short_name</code>-<br><code>route_long_name</code></td><td><a href='http://www.bvg.de/'>BVG</a>、ドイツ、ベルリン</td></tr></tbody></table><table class='example'><thead><tr><th>サービスの説明</th></tr></thead><tbody><tr><td><a href='https://128bc.org/schedules/rev-bus-hartwell-area/'>“Hartwell Area Shuttle“</a></td></tr></tbody></table>
| | `route_long_name` には `route_short_name` を含めないでください。|
| | `route_long_name` を入力するときは、サービス ID を含む完全な指定を含めてください。例:<table class='example'><thead><tr><th>サービス ID</th><th>推奨事項</th><th>例</th></tr></thead><tbody><tr><td>"MAX Light Rail"<br>オレゴン州ポートランドの TriMet</td><td><code>route_long_name</code> には、ブランド (MAX) と特定のルート指定を含める必要があります</td><td>"MAX Red Line" "MAX Blue Line"</td></tr><tr><td>"Rapid Ride"<br>ニューメキシコ州アルバカーキの ABQ Ride</td><td><code>route_long_name</code> には、ブランド (Rapid Ride) と特定のルート指定を含める必要があります</td><td>"Rapid Ride Red Line"<br>"Rapid Ride Blue Line"</td></tr></tbody></table>
| `route_id` |特定の名前付きルートのすべての便は、同じ `route_id` を参照する必要があります。<li>ルートの異なる方向を、異なる `route_id` 値に分割しないでください。</li><li>ルートの異なる運行区間を、異なる `route_id` 値に分割しないでください。つまり、`routes.txt` で「Downtown AM」サービスと「Downtown PM」サービスに異なるレコードを作成しないでください。</li> |
| | ルート グループに明確に名前が付けられたブランチ (例: 1A と 1B) が含まれている場合は、ルート [branches](#branches) ケースの推奨事項に従って、`route_short_name` と `route_long_name` を決定します。 |
| `route_color` と `route_text_color` | 標識、印刷された顧客情報、オンラインの顧客情報と一致している必要があります (他の場所に存在しない場合は含まれません)。 |

### trips.txt 

* __環状ルート・路線系統の特殊なケースを参照してください :__ 環状ルート・路線系統は、2 つの異なる終点がある線形ルート・路線系統とは対照的に、便が同じ停留所で開始および終了する場合です。環状ルート・路線系統は、特定のプラクティスに従って記述するしなければならない。[ループ ルートのケースを参照してください。](#loop-routes)
* __投げ縄状ルート・路線系統の特殊なケースを参照してください :__ 投げ縄状ルート・路線系統は、線形ジオメトリとループ ジオメトリのハイブリッドであり、車両はルートの一部のみをループして移動します。 Lassoルート・路線系統は、特定のプラクティスに従って記述するしなければならない。[Lasso ルートのケースを参照してください。](#lasso-routes)

| フィールド名 | 推奨事項 |
| --- | --- |
| `trip_headsign` | `trip_headsign` または `stop_headsign` フィールドにルート名 (`route_short_name` および `route_long_name` に一致するもの) を指定しないでください。 |
| | ルート内の便を区別するために使用できる、車両のヘッドサインに表示される目的地、方向、およびその他の便指定テキストを含める必要があります。車両に表示される方向情報との一貫性は、GTFS データセットで提供されるヘッドサインを決定するための主要かつ最優先の目標です。その他の情報は、この主要目標を損なわない場合にのみ含める必要があります。便中にヘッドサインが変わる場合は、`trip_headsign` を `stop_times.stop_headsign` で上書きします。以下に、考えられるいくつかのケースに対する推奨事項を示します。 |
| | <table class="example"><thead><tr><th>ルートの説明</th><th>推奨事項</th></tr></thead><tbody><tr><td>2A.目的地のみ</td><td>終点の目的地を指定します。例: 「Transit Center」、「Portland City Center」、または「Jantzen Beach」> </td></tr><tr><td>2B. ウェイポイントのある目的地</td><td>&lt;destination&gt; via &lt;waypoint&gt; 「Highgate via Charing Cross」。車両がウェイポイントを通過した後に、乗客に表示されるヘッドサインからウェイポイントが削除された場合は、<code>stop_times.stop_headsign</code> を使用して更新されたヘッドサインを設定します。> </td></tr><tr><td>2C. ローカル停留所のある地域の地名</td><td>目的地の都市または自治区内に複数の停留所がある場合は、目的地の都市に到着したら <code>stop_times.stop_headsign</code> を使用します。> </td></tr><tr><td>2D.方向のみ</td><td>「北行き」、「内行き」、「時計回り」などの用語を使用して示します。</td></tr><tr><td>2E. 目的地を含む方向</td><td>&lt;direction&gt; から &lt;terminus name&gt; へ。例: 「南行き、サンノゼ行き」</td></tr><tr><td>2F. 目的地とウェイポイントを含む方向</td><td>&lt;direction&gt; から &lt;waypoint&gt; へ (「北行き、チャリング クロス経由、ハイゲート行き」)。</td></tr></tbody></table> |
| | ヘッドサインの先頭に「To」または「Towards」という語句を使用しないでください。 |
| `direction_id` | データセット全体で一貫して 0 と 1 の値を使用します。つまり、<ul><li>赤ルートで 1 = 下りの場合、緑ルートで 1 = 下り</li><li>ルート X で 1 = 北行きの場合、ルート Y で 1 = 北行き</li><li>ルート X で 1 = 時計回りの場合、ルート Y で 1 = 時計回り</li></ul> |
| `bikes_allowed` | フェリー便の場合、自転車が許可されている (または許可されていない) ことを明示的に示してください。データが欠落しているためにフェリー便を避けると、通常、大きな迂回につながります。 |

### stop_times.txt 

環状ルート・路線系統: 環状ルート・路線系統では、特別な`stop_times`の考慮が必要です。(参照: [ループ ルートのケース](#loop-routes))

| フィールド名 | 推奨事項 |
| --- | --- |
| `pickup_type` および `drop_off_type` | 乗客サービスを提供しない非収益 (回送) の便は、すべての `stop_times` 行で `pickup_type` および `drop_off_type` の値を `1` としてマークする必要があります。
| | 収益便では、運用パフォーマンスを監視するための内部の「タイミング ポイント」や、乗客が乗車できないガレージなどの場所は、`pickup_type = 1` (ピックアップなし) および `drop_off_type = 1` (ドロップオフなし) としてマークする必要があります。 |
| `arrival_time` および `departure_time` | `arrival_time` フィールドと `departure_time` フィールドには、可能な限り、拘束力のない推定時間またはタイム ポイント間の補間時間を含め、時間値を指定する必要があります。 |
| `stop_headsign` |一般的に、ヘッドサインの値も駅の標識に対応している必要があります。<br><br>以下の場合、「南行き」は駅の標識では使用されていないため、お客様に誤解を与える可能性があります。
| | <table class="example"><thead><tr><th colspan="2">ニューヨーク市では、南行きの 2 路線について:</th></tr><tr><th><code>stop_times.txt</code> 行の場合:</th><th><code>stop_headsign</code> 値を使用します:</th></tr></thead><tbody><tr><td>マンハッタンに到着するまで</td><td><code>マンハッタン & ブルックリン</code></td></tr><tr><td>ダウンタウンに到着するまで</td><td><code>ダウンタウン & ブルックリン</code></td></tr><tr><td>ブルックリンに到着するまで</td><td><code>ブルックリン</code></td></tr><tr><td>ブルックリンに到着したら</td><td><code>ブルックリン (New Lots Av)</code></td></tr></tbody></table> |
| | <table class="example"><thead><tr><th colspan="2">ボストンのレッドライン南行き、ブレインツリー支線の場合:</th></tr><tr><th><code>stop_times.txt</code> 行の場合:</th><th><code>stop_headsign</code> 値を使用します:</th></tr></thead><tbody><tr><td>ダウンタウンに到着するまで</td><td><code>ブレインツリー行き</code></td></tr><tr><td>ダウンタウンに到着したら</td><td><code>ブレインツリー</code></td></tr><tr><td>ダウンタウンの後</td><td><code>ブレインツリー行き</code></td> </tr></tbody></table> |

### calendar.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | `calendar.service_name`も GTFS の可読性を高めることができますが、これは仕様では採用されていません。 |

### calendar_dates.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | `calendar.service_name`も GTFS の可読性を高めることができますが、これは仕様では採用されていません。|

### fare_attributes.txt 

| フィールド名 | 推奨事項 |
|---|---|
| | 運賃システムを正確にモデル化できない場合は、混乱を避けるために空白のままにしておきます。 |
| | 運賃 (`fare_attributes.txt` および `fare_rules.txt`) を含め、できるだけ正確にモデル化します。運賃を正確にモデル化できないエッジケースでは、運賃を安くするのではなく高く表現して、顧客が不足運賃で搭乗しないようにするするべきであるます。運賃の大部分を正しくモデル化できない場合は、運賃情報をフィードに含めないでください。 |

### fare_rules.txt 

| フィールド名 | 推奨事項 |
|---|---|
| すべてのフィールド | 運賃システムを正確にモデル化できない場合は、混乱を避けるために空白のままにしておきます。 |
| | 運賃 (`fare_attributes.txt` および `fare_rules.txt`) を含めて、できるだけ正確にモデル化します。運賃を正確にモデル化できないエッジケースでは、運賃を安くするのではなく高く表現して、顧客が不足運賃で搭乗しないようにする必要がありするべきである。運賃の大部分を正しくモデル化できない場合は、運賃情報をフィードに含めないでください。 |

### shapes.txt 

| フィールド名 | 推奨事項 |
| --- | --- |
| すべてのフィールド | 理想的には、共有されている線形 (つまり、ルート 1 と 2 が同じ道路または線路のセグメントで動作している場合) の場合、共有されている線形部分は完全に一致する必要があります。これにより、高品質の交通地図作成が容易になります。<!-- (77) -->
| | 線形は、車両が走行する道路の中心線に従う必要があります。これは、指定車線がない場合は道路の中心線、または車両が移動する方向の道路の側の中心線のいずれかになります。<br><br>線形は、縁石の停止、プラットフォーム、または乗車場所に対して「ギザギザ」になってはなりません。 |
| `shape_dist_traveled` | `shape_dist_traveled` フィールドを使用すると、事業者は `stop_times.txt` ファイル内の停止がそれぞれの形状にどのように適合するかを正確に指定できます。 `shape_dist_traveled` フィールドに使用する一般的な値は、車両が移動した形状の開始点からの距離です (走行距離計の読み取り値のようなものと考えてください)。<li>ルートの配置 (`shapes.txt` 内) は、便がサービスを提供する停止場所から 100 メートル以内である必要があります。</li><li>配置を簡素化して、<code>shapes.txt</code> に余分なポイントが含まれないようにします (つまり、直線セグメント上の余分なポイントを削除します。線の簡素化の問題に関する説明を参照してください)。</li> |

### frequencies.txt 

| フィールド名 | 推奨事項 |
| --- | --- |
| すべてのフィールド | `frequencies.txt` で参照される便では実際の停車時間は無視されます。頻度ベースの便では、停車間の移動時間間隔のみが重要です。明確さと読みやすさのために、`frequencies.txt` で参照される便の最初の停車時間は 00:00:00 (最初の `arrival_time` 値が 00:00:00) から開始することをお勧めします。 |
| `block_id` | 頻度ベースの便に提供できます。 |

### transfers.txt 

`transfers.transfer_type` は、[GTFS で定義](../reference/#transferstxt) の 4 つの値のいずれかになります。これらの `transfer_type` 定義は、以下の GTFS 仕様から引用され、_斜体_ で示されています。追加の実践的な推奨事項も含まれています。

| フィールド名 | 推奨事項 |
| --- | --- |
| `transfer_type` | <q>0 または (空): これは、ルート間の推奨乗換ポイントです。</q><br>より優れたオプション (追加のアメニティを備えた交通センター、または隣接または接続された乗車施設/プラットフォームを備えた駅など) を含む乗換機会が複数ある場合は、推奨乗換ポイントを指定します。 |
| | <q>1: これは、2 つのルート間の時間指定乗換ポイントです。出発車両は、乗客がルート間を乗り換えるのに十分な時間、到着車両を待つことが期待されます。</q><br>この乗換タイプは、確実に乗り換えを行うために必要な間隔をオーバーライドします。たとえば、Google マップでは、乗客が安全に乗り換えるのに 3 分かかると想定しています。他のアプリケーションでは、他のデフォルトが想定される場合があります。 |
| | <q>2: この乗り換えでは、接続を確実にするために、到着から出発までの間に最小限の時間が必要です。乗り換えに必要な時間は、<code>min_transfer_time</code> で指定します。</q><br>障害物やその他の要因により停留所間の移動時間が長くなる場合は、最小乗り換え時間を指定します。 |
| | <q>3: この場所ではルート間の乗り換えはできません。</q><br>物理的な障壁のために乗り換えができない場合、または難しい道路横断や歩行者ネットワークの隙間によって乗り換えが安全でなかったり複雑になったりする場合は、この値を指定します。 |
| | 便間で座席内 (ブロック) 乗り換えが許可されている場合、到着便の最後の停留所は、出発便の最初の停留所と同じである必要があります。 |


## 事例別に整理された実践推奨事項

このセクションでは、ファイルやフィールド全体に影響を与える特定の事例について説明します。

### 環状ルート・路線系統

環状ルート・路線系統では、車両の便は同じ場所 (場合によってはトランジット センターまたは乗り換えセンター) で始まり、終わります。車両は通常、連続的に運行し、車両がループを続ける間、乗客は車内にとどまることができます。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"> 

したがって、乗客に車両の進行方向を示すために、行先表示の推奨事項を適用するするべきである移動方向の変更を示すには、 `stop_times.txt`ファイルに`stop_headsigns` を`stop_headsign`します。`stop_headsign` は、定義されている停留所から出発する便の方向を説明します。便の各停留所に`stop_headsigns` を追加すると、便中のヘッドサイン情報を変更できます。

2つのエンドポイント間で動作するルート (同じバスが往復する場合など) に対して、 stop_times.txtファイルで 1 つの循環便を定義しないでください。代わりに、便を 2 つの別々の便方向に分割します。

__循環便のモデリングの例:__

- 停留所ごとにヘッドサインが変化する循環便à

| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "B"           |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "C"           |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "D"           |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "E"           |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "A"           |
| trip_1  | 06:35:00     | 06:35:00       | stop_A  | 6             | ""            |

- 2つの行先表示がある循環便 

| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "outbound"    |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "outbound"    |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "outbound"    |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "inbound"     |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "inbound"     |
| trip_1  | 06:35:00     | 06:35:00       | stop_F  | 6             | "inbound"     |
| trip_1  | 06:40:00     | 06:40:00       | stop_A  | 7             | ""            |

| フィールド名 | 推奨事項 |
| --- | --- |
| `trips.trip_id `| ループの完全な往復を 1 回の便でモデル化します。 |
| `stop_times.stop_id` | ループである便の場合は、`stop_times.txt` に最初/最後の停留所を 2 回含めます。以下に例を示します。多くの場合、ループ ルートには、ループ全体を移動しない最初と最後の便が含まれます。これらの便も含めます。 <table class="example"><thead><tr><th><code>trip_id</code></th><th><code>stop_id</code></th><th><code>stop_sequence</code></th></tr></thead><tbody><tr><td>9000</td><td>101</td><td>1</td></tr><tr><td>9000</td><td>102</td><td>2</td></tr><tr><td>9000</td><td>103</td><td>3</td></tr><tr><td>9000</td><td>101</td><td>4</td></tr></tbody></table> |
| `trips.direction_id` |ループが反対方向 (時計回りと反時計回り) に動作する場合は、`direction_id` を `0` または `1` に指定します。|
| `trips.block_id` | 同じ `block_id` で連続ループ トリップを示します。|

### Lasso Routes

Lasso routes は、環状ルートと方向ルートの側面を組み合わせたものです。

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;"> 

| 例: |
|--------|
| 地下鉄ルート・路線系統([シカゴ](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)) |
| 郊外からダウンタ​​ウンへのバスルート・路線系統([セント アルバート](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) または [エドモントン](http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf)) |
| CTA ブラウン ライン ([CTA ウェブサイト](http://www.transitchicago.com/brownline/) および [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn)) |

| フィールド名 | 推奨事項 |
| --- | --- |
| `trips.trip_id` | 「車両の往復」の全範囲 ([上記](#lasso-routes) の図を参照) は、A から B、B、そして A に戻る移動で構成されます。車両の往復全体は、次のように表現できます。<li>`trips.txt` 内の __single__ `trip_id` 値/レコード</li><li>`trips.txt` 内の__Multiple__ `trip_id` 値/レコード。連続した移動は `block_id` で示されます。</li> |
| `stop_times.stop_headsign` | A-B セクションに沿った停留所は、両方向で通過します。`stop_headsign` により、移動方向の区別が容易になります。したがって、これらの便には `stop_headsign` を提供することをお勧めします。example_table: <table class="example"><thead> <tr><th>例:</th></tr></thead><tbody><tr><td>"A via B"</td></tr><tr><td>"A"</td></tr></tbody></table><table class="example"><thead><tr><th>シカゴ交通局の <a href="http://www.transitchicago.com/purpleline/">パープル ライン</a></th></tr></thead><tbody><tr><td>"Southbound to Loop"</td></tr><tr><td>"Northbound via Loop"</td></tr><tr><td>"Northbound to Linden"</td></tr></tbody></table><table class="example"><thead><tr><th>エドモントン交通サービス バス路線、こちら <a href="http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">39</a></th></tr></thead><tbody><tr><td>"Rutherford"</td></tr><tr><td>"Century Park"</td></tr></tbody></table>
| `trip.trip_headsign` | 便のヘッドサインは、スケジュールに表示されるような便の全体的な説明である必要があります。「Linden から Linden 経由 Loop」(シカゴの例) または「A から A 経由 B」(一般的な例) などです。|

### 分岐

一部のルート・路線系統には分岐が含まれるしてもよい。これらの分岐間では配置と停留所等が共有されますが、それぞれが異なる停留所等と配置セクションも提供します。分岐間の関係は、以下の追加のガイドラインを使用して、ルート名、行先表示、便の短縮名で示すことがしてもよい。

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;"> 

| フィールド名 | 推奨事項 |
| --- | --- |
| すべてのフィールド | 分岐ルートの命名では、他の乗客向け情報資料に従うことをお勧めします。以下は、2 つのケースの説明と例です。 |
| | 時刻表と路上標識が 2 つの別個のルート名 (例: 1A と 1B) を表している場合は、`route_short_name` フィールドと `route_long_name` フィールドを使用して、GTFS でそのように示します。例: GoDurham Transit [ルート 2、2A、および 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) は、ルートの大部分で共通の配置を共有していますが、いくつかの異なる側面で異なります。 <ul><li>ルート 2 はコア サービスであり、ほとんどの時間帯に運行しています。</li><li>ルート 2 には、夜間、日曜日、休日にメイン ストリートへの迂回が含まれます。</li><li>ルート 2A と 2B は、月曜日から土曜日まで日中に運行します。</li><li>ルート 2B は、共有の配置パスから迂回して追加の停留所に停車します。</li></ul> |
| | 事業者が提供する情報で、分岐が同じ名前のルートとして説明されている場合は、`trips.trip_headsign`、`stop_times.stop_headsign`、および/または `trips.trip_short_name` フィールドを使用します。例: GoTriangle [ルート 300](https://gotriangle.org/sites/default/files/route_300_v.1.19.pdf) は、時間帯によって異なる場所に移動します。通勤ラッシュ時には、市内に出入りする労働者に対応するために、標準ルートに追加の区間が追加されます。 |

## よくある質問（FAQ）

### これらの GTFS ベスト プラクティスはなぜ重要ですか？

GTFS ベスト プラクティスの目的は次のとおりです。

* 公共交通事業者アプリにおけるエンドユーザーのカスタマー エクスペリエンスを向上させる
* 幅広いデータの相互運用性をサポートし、ソフトウェア開発者がアプリケーション、製品、サービスを導入および拡張しやすくする
* さまざまなアプリケーション カテゴリで GTFS の使用を促進する（便計画という当初の重点を超えて）

GTFS ベスト プラクティスが調整されていないと、GTFS を利用するさまざまなアプリケーションが、調整されていない方法で要件と期待を確立するしてもよい。その結果、要件とアプリケーション固有のデータセットが分散し、相互運用性が低下します。ベスト プラクティスがリリースされる前は、正しい形式の GTFS データを構成する要素について、より大きな曖昧さと意見の不一致がありました。

### これらはどのように開発されたのですか？誰が開発しましたか?

これらのベスト プラクティスは、GTFS に深く関わっているアプリ プロバイダーとデータ コンシューマー、交通事業者プロバイダー、コンサルタントなど、GTFS に関わる 17 の組織からなるワーキング グループによって開発されました。ワーキング グループは [Rocky Mountain Institute](http://www.rmi.org/mobility) によって招集され、運営されました。

ワーキング グループのメンバーは、各ベスト プラクティスに投票しました。ほとんどのベスト プラクティスは満場一致で承認されました。少数のケースでは、ベスト プラクティスが組織の大多数で承認されました。

### GTFS 参照を変更しないのはなぜですか?

よい質問です。仕様、データの使用法、ニーズを調査するプロセスによって、実際に仕様にいくつかの変更が加えられました ([GitHub のクローズされたプル リクエスト](https://github.com/google/transit/pulls?q=is%3Apr+is%3Aclosed) を参照)。
仕様参照の修正は、ベスト プラクティスよりも厳しい精査とコメントの対象となります。特定のベスト プラクティスは、採用レベルとコミュニティの合意に基づいて仕様に統合されています。最終的には、すべての GTFS ベスト プラクティスがコア GTFS リファレンスの一部になる可能性があります。

### これらのベスト プラクティスへの準拠を確認するにはどうすればよいですか？

Canonical GTFS schedule Validator は、これらのベスト プラクティスへの準拠を確認します。この検証ツールの詳細については、[検証ページ](../../../getting_started/validate) を参照してください。

### 私は交通事業者の代表です。ソフトウェア サービス プロバイダーとベンダーがこれらのベスト プラクティスに従うようにするには、どのような手順を踏めばよいでしょうか？

ベンダーまたはソフトウェア サービス プロバイダーにこれらのベスト プラクティスを勧めてください。 GTFS を生成するソフトウェアを調達する際は、GTFS ベスト プラクティスの URL とコア仕様リファレンスを参照することをおすすめします。

### GTFS データ フィードがこれらのベスト プラクティスに準拠していないことに気付いた場合はどうすればするべきであるか?

`feed_info.txt` に [proposed feed\_contact\_email or feed\_contact\_url](https://github.com/google/transit/pull/31/files) フィールドがある場合はそれを使用して、または交通事業者またはフィード プロデューサーのウェブサイトで連絡先情報を検索して、フィードの連絡先を特定します。フィード プロデューサーに問題を伝えるときは、議論中の特定の GTFS ベスト プラクティスにリンクします。 （[`このドキュメントへのリンク`](#linking-to-this-document)を参照してください）。

### 参加するにはどうすればいいですか？

[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org)にメールを送信してください。

## このドキュメントについて

### 目的

GTFS ベスト プラクティスを維持する目的は次のとおりです。

* 交通データの相互運用性の向上をサポートする
* 公共交通事業者アプリにおけるエンド ユーザーの顧客エクスペリエンスを向上させる
* ソフトウェア開発者がアプリケーション、製品、およびサービスを導入および拡張しやすくする
* さまざまなアプリケーション カテゴリで GTFS の使用を促進する（当初の重点である便計画を超えて）

### 公開されている GTFS ベスト プラクティスを提案または修正する方法

ベスト プラクティスは、現在仕様に統合中です。新しいベスト プラクティスを提案したい場合は、[GTFS リファレンス GitHub リポジトリ](https://github.com/google/transit/) にアクセスして問題を報告または PR を作成するか、[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) にお問い合わせください。

### このドキュメントへのリンク

フィード プロデューサーに GTFS データを正しく作成するためのガイダンスを提供するために、ここにリンクしてください。個々の推奨事項にはそれぞれアンカー リンクがあります。推奨事項をクリックすると、ページ内のアンカー リンクの URL が表示されます。

GTFS を利用するアプリケーションが、ここで説明されていない GTFS データの取り扱いに関する要件や推奨事項を提示している場合は、これらの一般的なベスト プラクティスを補足するために、それらの要件や推奨事項を記載したドキュメントを公開することを推奨。

### GTFS ベスト プラクティス ワーキング グループ

GTFS ベスト プラクティス ワーキング グループは、2016 ～ 2017 年に [Rocky Mountain Institute](http:) によって招集され、公共交通事業者、GTFS を利用するアプリケーションの開発者、コンサルタント、学術事業者で構成され、GTFS データに関する一般的な取り扱いと期待を定義します。 
このワーキンググループのメンバーは次のとおりです:

* [Cambridge Systematics](https://www.camsys.com/)
* [Capital Metro](https://www.capmetro.org/)
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
