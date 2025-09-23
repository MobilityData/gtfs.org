# GTFS Schedule ベストプラクティス {: #gtfs-schedule-best-practices}

ここでは、[General Transit Feed Specification (GTFS)](../reference) における公共交通サービスの記述に関する推奨プラクティスを示します。これらのプラクティスは、[GTFS ベストプラクティス作業部会](#gtfs-best-practices-working-group) のメンバーの経験や、[アプリケーション固有の GTFS プラクティス推奨事項](http://www.transitwiki.org/TransitWiki/index.php/Best_practices_for_creating_GTFS) に基づいてまとめられたものです。  

さらに詳しい背景については、[よくある質問](#frequently-asked-questions-faq) を参照してください。

## ドキュメント構成 {: #document-structure}

実践事項は、主に次の4つのセクションに整理されています。

* __[データセット公開と一般的な実践事項](#dataset-publishing-general-practices):__ これらの実践事項は、GTFSデータセット全体の構造や、GTFSデータセットの公開方法に関連します。
* __[ファイルごとに整理された推奨事項](#practice-recommendations-organized-by-file):__ 推奨事項は、公式のGTFSリファレンスに対応付けやすいように、GTFS内のファイルおよびフィールドごとに整理されています。
* __[ケースごとに整理された推奨事項](#practice-recommendations-organized-by-case):__ ループ路線のような特定のケースでは、複数のファイルやフィールドにわたって実践事項を適用する必要がある場合があります。そのような推奨事項は、このセクションにまとめられています。

## データセット公開と一般的な運用慣行 {: #dataset-publishing-general-practices}


* データセットは、zipファイル名を含む公開かつ恒久的なURLで公開するべきです。（例: www.agency.org/gtfs/gtfs.zip）。理想的には、ログインを必要とせずに直接ダウンロード可能なURLとすることで、利用するソフトウェアアプリケーションによるダウンロードを容易にするべきです。GTFSデータセットをオープンにダウンロード可能とすることが推奨され（また最も一般的な慣行です）、データ提供者がライセンスやその他の理由でGTFSへのアクセスを制御する必要がある場合は、自動ダウンロードを容易にするためにAPIキーを用いてGTFSデータセットへのアクセスを制御することが推奨されます。
* GTFSデータは反復的に公開され、安定した場所にある単一のファイルが常に事業者（または複数の事業者）の最新の公式運行情報を含むようにします。
* データの反復において可能な限り、`stop_id`、`route_id`、`agency_id` の永続的な識別子(idフィールド)を維持してください。
* 1つのGTFSデータセットには、現在および今後の運行情報（「マージされた」データセットと呼ばれることもあります）を含めるべきです。Google transitfeed ツールの [merge function](https://github.com/google/transitfeed/wiki/Merge) を使用して、2つの異なるGTFSフィードからマージされたデータセットを作成することができます。
    * 公開されるGTFSデータセットは、常に少なくとも今後7日間は有効であるべきであり、理想的には事業者がその運行スケジュールが継続されると確信できる限り有効であるべきです。
    * 可能であれば、GTFSデータセットは少なくとも今後30日間の運行をカバーするべきです。
* 古い運行情報（期限切れのカレンダー）はフィードから削除してください。
* 7日以内に運行変更が発効する場合は、静的なGTFSデータセットではなく、[GTFS-realtime](../../realtime/reference) フィード（運行情報や便の更新）を通じてこの運行変更を表現してください。
* GTFSデータをホスティングするWebサーバーは、ファイルの更新日を正しく報告するように設定しなければなりません（[HTTP/1.1 - Request for Comments 2616](https://tools.ietf.org/html/rfc2616#section-14.29) のセクション14.29を参照）。

## ファイルごとに整理された実践推奨事項 {: #practice-recommendations-organized-by-file}

このセクションでは、[GTFS リファレンス](../reference)に沿って、ファイルおよびフィールドごとに整理された実践推奨事項を示します。

### 全ファイル {: #all-files}


| フィールド名 | 推奨事項 |
| --- | --- |
| Mixed Case | すべての利用者向けテキスト文字列（停留所等(stop)名、ルート・路線系統(route)名、行先表示(headsign)を含む）は、Mixed Case（すべて大文字ではなく）を使用するべきです。これは、小文字を表示できるディスプレイにおいて、地名の大文字小文字の表記に関する地域の慣習に従うものです。 |
| | 例: |
| | Brighton Churchill Square |
| | Villiers-sur-Marne |
| | Market Street |
| Abbreviations | フィード全体において、名前やその他のテキストに略語（例: Street を St. とするなど）を使用することは避けるべきです。ただし、場所が略称で呼ばれている場合（例: “JFK Airport”）は例外です。略語はスクリーンリーダーソフトウェアや音声ユーザーインターフェースによるアクセシビリティに問題を引き起こす可能性があります。利用側のソフトウェアは、完全な単語を略語に変換して表示するように設計することは可能ですが、略語から完全な単語に変換することは誤りのリスクが高くなります。 |

### agency.txt {: #agencytxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| `agency_phone` | 顧客サービス用の電話番号が存在しない場合を除き、含めるべきです。 |
| `agency_email` | 顧客サービス用のメールアドレスが存在しない場合を除き、含めるべきです。 |
| `agency_fare_url` | 事業者が完全に無賃で運行している場合を除き、含めるべきです。 |

__例:__

- 複数の小規模なバス事業者がバスサービスを運行しています。しかし、1つの大規模な事業者がダイヤ編成とチケット発行を担当しており、利用者の視点からはその事業者がバスサービスの責任を負っています。この大規模な事業者をフィード内の agency として定義するべきです。データが内部的に異なる小規模事業者ごとに分割されていたとしても、フィード内で定義される agency は1つだけであるべきです。
  
- フィード提供者がチケットポータルを運営していますが、実際にサービスを運行しており、利用者から責任を持つと認識されているのは別の事業者です。この場合、実際にサービスを運行している事業者をフィード内の agency として定義するべきです。

### stops.txt {: #stopstxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| `stop_name` | 公開されている停留所等(stop)名がない場合は、フィード全体で一貫した停留所等(stop)の命名規則に従うべきです。 |
| | デフォルトでは、`stop_name` に「Station」や「Stop」といった一般的または冗長な単語を含めるべきではありませんが、いくつかの例外が認められます。<ul><li>実際に名前の一部である場合（Union Station、Central Station）</li><li>`stop_name` があまりに一般的すぎる場合（都市名そのものなど）。この場合、「Station」「Terminal」などの単語を加えることで意味が明確になります。</li></ul> |
| `stop_lat` & `stop_lon` | 停留所等(stop)の位置は可能な限り正確であるべきです。実際の停留所等(stop)の位置と比較して、誤差は4メートル以内でなければなりません。 |
| | 停留所等(stop)の位置は、乗客が乗車する歩行者用通路のすぐ近く（例：正しい道路側）に配置するべきです。 |
| | 停留所等(stop)の位置が複数のデータフィードで共有される場合（例：2つの事業者がまったく同じ停留所等(stop)／乗車施設を使用する場合）、両方の停留所等(stop)に対して同一の `stop_lat` および `stop_lon` を使用することで、共有されていることを示すべきです。 |
| `parent_station` & `location_type` | 多くの駅やターミナルには複数の乗車施設があります（モードによって、バスベイ、プラットフォーム、桟橋、ゲートなどと呼ばれる場合があります）。このような場合、フィード作成者は駅、乗車施設（子停留所等とも呼ばれる）、およびそれらの関係を記述するべきです。<ul><li>駅やターミナルは、`stops.txt` 内で `location_type = 1` のレコードとして定義するべきです。</li><li>各乗車施設は、`location_type = 0` の停留所等(stop)として定義するべきです。`parent_station` フィールドは、その乗車施設が属する駅の `stop_id` を参照するべきです。</li></ul> |
| | 駅および子停留所等(stop)の命名にあたっては、乗客に広く認識されており、駅や乗車施設（バスベイ、プラットフォーム、桟橋、ゲートなど）を識別するのに役立つ名前を設定するべきです。<table class='example'><thead><tr><th>親駅名</th><th>子停留所等(stop)名</th></tr></thead><tbody><tr><td>Chicago Union Station</td><td>Chicago Union Station Platform 19</td></tr><tr><td>San Francisco Ferry Building Terminal</td><td>San Francisco Ferry Building Terminal Gate E</td></tr><tr><td>Downtown Transit Center</td><td>Downtown Transit Center Bay B</td></tr></tbody></table> |

### routes.txt {: #routestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| `route_long_name` | 仕様書の定義: <q>この名称は一般的に <code>route_short_name</code> よりも説明的であり、多くの場合、ルートの目的地や停留所(stop)を含みます。<code>route_short_name</code> または <code>route_long_name</code> の少なくとも一方を指定しなければならず、適切であれば両方を指定することも可能です。ルートに長い名称がない場合は、<code>route_short_name</code> を指定し、このフィールドの値には空文字列を使用してください。</q><br>以下に長い名称の種類の例を示します:<table class='example'><thead><tr><th colspan='3'>主要な経路または走行回廊</th></tr><tr><th>ルート名</th><th>形式</th><th>事業者</th></tr></thead><tbody><tr><td><a href='https://www.sfmta.com/getting-around/transit/routes-stops/n-judah'>“N”/“Judah”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://www.sfmta.com/'>Muni</a>（サンフランシスコ）</td></tr><tr><td><a href='https://trimet.org/schedules/r006.htm'>“6“/“ML King Jr Blvd“</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://trimet.org/'>TriMet</a>（オレゴン州ポートランド）</td></tr><tr><td><a href='http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6'>“6”/“Nation - Étoile”</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='http://www.ratp.fr/'>RATP</a>（フランス・パリ）</td></tr><tr><td><a href='http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf'>“U2”-“Pankow – Ruhleben”</a></td><td><code>route_short_name</code>-<br><code>route_long_name</code></td><td><a href='http://www.bvg.de/'>BVG</a>（ドイツ・ベルリン）</td></tr></tbody></table><table class='example'><thead><tr><th>サービスの説明</th></tr></thead><tbody><tr><td><a href='https://128bc.org/schedules/rev-bus-hartwell-area/'>“Hartwell Area Shuttle“</a></td></tr></tbody></table>        
| | `route_long_name` に `route_short_name` を含めるべきではありません。 |
| | `route_long_name` を入力する際には、サービスのブランド名を含む完全な名称を記載してください。例:<table class='example'><thead><tr><th>サービスブランド</th><th>推奨事項</th><th>例</th></tr></thead><tbody><tr><td>"MAX Light Rail"<br>TriMet（オレゴン州ポートランド）</td><td><code>route_long_name</code> にはブランド名（MAX）と特定のルート名を含めるべきです</td><td>"MAX Red Line" "MAX Blue Line"</td></tr><tr><td>"Rapid Ride"<br>ABQ Ride（ニューメキシコ州アルバカーキ）</td><td><code>route_long_name</code> にはブランド名（Rapid Ride）と特定のルート名を含めるべきです</td><td>"Rapid Ride Red Line"<br>"Rapid Ride Blue Line"</td></tr></tbody></table>
| `route_id` | 特定の名称を持つルート上のすべての便(trip)は同じ `route_id` を参照するべきです。<li>ルートの異なる方向を別々の `route_id` に分けてはいけません。</li><li>ルートの異なる運行時間帯を別々の `route_id` に分けてはいけません。例: “Downtown AM” と “Downtown PM” サービスのために `routes.txt` に異なるレコードを作成してはいけません。</li> |
| | ルートグループに明確に異なる名称の枝分かれ（例: 1A と 1B）が含まれる場合は、ルートの[枝分かれ](#branches)の推奨事項に従って `route_short_name` と `route_long_name` を決定してください。 |
| `route_color` & `route_text_color` | 標識や印刷物、オンラインの利用者向け情報と一貫性を持たせるべきです（他の場所に存在しない場合は含めるべきではありません）。 |

### trips.txt {: #tripstxt}


* __ループ系統の特別なケースを参照してください:__ ループ系統とは、便(trip)が同じ停留所等(stop)で開始し終了する場合を指します。これに対して、線形系統は2つの異なる終点を持ちます。ループ系統は特定の方法に従って記述しなければなりません。[ループ系統のケースを参照してください。](#loop-routes)  
* __ラッソ系統の特別なケースを参照してください:__ ラッソ系統とは、線形とループの形状を組み合わせたもので、ルートの一部のみでループを走行するものです。ラッソ系統は特定の方法に従って記述しなければなりません。[ラッソ系統のケースを参照してください。](#lasso-routes)

| フィールド名 | 推奨事項 |
| --- | --- |
| `trip_headsign` | `trip_headsign` または `stop_headsign` フィールドに、`route_short_name` や `route_long_name` に一致するルート名を記載してはいけません。 |
| | 行先表示(headsign)に表示される目的地、方向、その他の便(trip)の識別テキストを含めるべきです。これはルート内の便を区別するために使用されることがあります。GTFSデータセットで提供される行先表示(headsign)を決定する際の最優先かつ最重要の目標は、車両に表示される方向情報との一貫性です。この主要な目標を損なわない限りにおいて、その他の情報を含めることができます。便の途中で行先表示(headsign)が変わる場合は、`trip_headsign` を `stop_times.stop_headsign` で上書きしてください。以下にいくつかのケースにおける推奨事項を示します: |
| | <table class="example"><thead><tr><th>ルートの説明</th><th>推奨事項</th></tr></thead><tbody><tr><td>2A. 目的地のみ</td><td>終点の目的地を記載してください。例: "Transit Center"、"Portland City Center"、"Jantzen Beach"</td></tr><tr><td>2B. 経由地を含む目的地</td><td>&lt;目的地&gt; via &lt;経由地&gt; 例: "Highgate via Charing Cross"。車両が経由地を通過した後に乗客に表示される行先表示から経由地が削除される場合は、<code>stop_times.stop_headsign</code> を使用して更新された行先表示を設定してください。</td></tr><tr><td>2C. 地域名とその地域内の停留所等</td><td>目的地の都市や行政区内に複数の停留所等がある場合は、目的地の都市に到達した時点で <code>stop_times.stop_headsign</code> を使用してください。</td></tr><tr><td>2D. 方向のみ</td><td>“Northbound”、“Inbound”、“Clockwise” などの方向を示す用語を使用してください。</td></tr><tr><td>2E. 方向と目的地</td><td>&lt;方向&gt; to &lt;終点名&gt; 例: “Southbound to San Jose”</td></tr><tr><td>2F. 方向、経由地、目的地</td><td>&lt;方向&gt; via &lt;経由地&gt; to &lt;目的地&gt; 例: “Northbound via Charing Cross to Highgate”</td></tr></tbody></table> |
| | 行先表示(headsign)を “To” や “Towards” で始めてはいけません。 |
| `direction_id` | データセット全体で値 0 と 1 を一貫して使用してください。例:<ul><li>1 = Red ルートの Outbound の場合、1 = Green ルートの Outbound</li><li>1 = Route X の Northbound の場合、1 = Route Y の Northbound</li><li>1 = Route X の clockwise の場合、1 = Route Y の clockwise</li></ul> |
| `bikes_allowed` | フェリー便については、自転車が許可されているかどうかを明示してください。データが欠落しているためにフェリー便を避けると、大きな迂回が発生することが多いためです。 |

### stop_times.txt {: #stop_timestxt}


循環ルート: 循環ルートは特別な `stop_times` の考慮が必要です。（参照: [循環ルートのケース](#loop-routes)）

| フィールド名 | 推奨事項 |
| --- | --- |
| `pickup_type` & `drop_off_type` | 乗客サービスを提供しない収益外（回送）便は、すべての `stop_times` 行で `pickup_type` および `drop_off_type` の値を `1` に設定するべきです。 |
| | 収益便において、運行パフォーマンスを監視するための内部「時刻管理点」や、乗客が乗車できない車庫などの場所は、`pickup_type = 1`（乗車不可）および `drop_off_type = 1`（降車不可）でマークするべきです。 |
| `arrival_time` & `departure_time` | `arrival_time` および `departure_time` フィールドは、可能な限り時刻値を指定するべきです。これには、拘束力のない推定時刻や時刻管理点間の補間時刻も含まれます。 |
| `stop_headsign` | 一般的に、行先表示(headsign)の値は駅の案内表示とも一致させるべきです。<br><br>以下のケースでは、「Southbound」という表記は駅の案内表示で使用されていないため、利用者を誤解させる可能性があります。 |
| | <table class="example"><thead><tr><th colspan="2">ニューヨーク市において、2番線が南行きの場合:</th></tr><tr><th><code>stop_times.txt</code> の行:</th><th>使用する <code>stop_headsign</code> の値:</th></tr></thead><tbody><tr><td>マンハッタンに到達するまで</td><td><code>Manhattan & Brooklyn</code></td></tr><tr><td>ダウンタウンに到達するまで</td><td><code>Downtown & Brooklyn</code></td></tr><tr><td>ブルックリンに到達するまで</td><td><code>Brooklyn</code></td></tr><tr><td>ブルックリンに到達した後</td><td><code>Brooklyn (New Lots Av)</code></td></tr></tbody></table> |
| | <table class="example"><thead><tr><th colspan="2">ボストンにおいて、レッドラインが南行きで Braintree 支線の場合:</th></tr><tr><th><code>stop_times.txt</code> の行:</th><th>使用する <code>stop_headsign</code> の値:</th></tr></thead><tbody><tr><td>ダウンタウンに到達するまで</td><td><code>Inbound to Braintree</code></td></tr><tr><td>ダウンタウンに到達した後</td><td><code>Braintree</code></td></tr><tr><td>ダウンタウン以降</td><td><code>Outbound to Braintree</code></td></tr></tbody></table> |

### calendar.txt {: #calendartxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | `calendar.service_name` フィールドを含めることで、仕様には採用されていないものの、GTFS の可読性を高めることができます。 |

### calendar_dates.txt {: #calendar_datestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | `calendar.service_name` フィールドを含めることで、GTFS の可読性を高めることができますが、これは仕様には採用されていません。|

### fare_attributes.txt {: #fare_attributestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| | 運賃体系を正確にモデル化できない場合は、さらなる混乱を避けるために空白のままにしてください。 |
| | 運賃情報（`fare_attributes.txt` および `fare_rules.txt`）を含め、可能な限り正確にモデル化してください。運賃を正確にモデル化できない特殊なケースでは、乗客が不足した運賃で乗車を試みないように、実際より安くではなく高く表現するべきです。大多数の運賃を正しくモデル化できない場合は、フィードに運賃情報を含めないでください。 |

### fare_rules.txt {: #fare_rulestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | 運賃体系を正確にモデル化できない場合は、さらなる混乱を避けるために空白のままにしてください。 |
| | 運賃情報（`fare_attributes.txt` および `fare_rules.txt`）を含め、可能な限り正確にモデル化してください。運賃を正確にモデル化できない特殊なケースでは、乗客が不足した運賃で乗車を試みないように、実際より安くではなく高く表現するべきです。大多数の運賃を正しくモデル化できない場合は、フィードに運賃情報を含めてはいけません。 |

### shapes.txt {: #shapestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | 理想的には、共有される経路（例: Route 1 と Route 2 が同じ道路や線路の区間を走行する場合）については、共有部分の経路が完全に一致するべきです。これは高品質な交通地図作成を容易にします。 <!-- (77) --> |
| | 経路は車両が走行する道路の中心線に沿うべきです。これは、専用レーンがない場合は道路の中心線、または車両の進行方向側の車道の中心線となります。<br><br>経路は停留所、プラットフォーム、乗車位置に「ジグザグ」してはいけません。 |
| `shape_dist_traveled` | `shape_dist_traveled` フィールドを使用すると、事業者は `stop_times.txt` ファイル内の停留所がそれぞれの shape にどのように対応するかを正確に指定することができます。`shape_dist_traveled` フィールドに一般的に使用される値は、車両が走行した shape の始点からの距離です（走行距離計の読み取りのようなものを想像してください）。<li>ルート経路（`shapes.txt` 内）は、便が停車する停留所の位置から 100 メートル以内であるべきです。</li><li>経路を簡略化し、<code>shapes.txt</code> に不要な点を含めないようにするべきです（例: 直線区間の余分な点を削除する。線の簡略化問題に関する議論を参照）。</li>

### frequencies.txt {: #frequenciestxt}


| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | `frequencies.txt` で参照される便(trip)については、実際の停車時刻(stop_time)は無視され、停留所等(stop)間の所要時間の間隔のみが重要となります。明確さや人間の可読性のために、`frequencies.txt` で参照される便(trip)の最初の停車時刻(stop_time)は 00:00:00（最初の `arrival_time` 値が 00:00:00）から始まることが推奨されます。 |
| `block_id` | 頻度ベースの便(trip)に対して指定することができます。 |

### transfers.txt {: #transferstxt}


`transfers.transfer_type` は [GTFS で定義されている](../reference/#transferstxt) 4つの値のいずれかを取ることができます。これらの `transfer_type` の定義は以下に _イタリック体_ で GTFS 仕様から引用し、さらに実務上の推奨事項を付記しています。

| フィールド名 | 推奨事項 |
| --- | --- |
| `transfer_type` | <q>0 または (空): これはルート間の推奨される乗換地点です。</q><br>複数の乗換機会があり、その中に優れた選択肢（例: 追加の設備を備えた交通センターや、隣接または接続された乗車施設/プラットフォームを持つ駅）が含まれる場合は、推奨される乗換地点を指定してください。 |
| | <q>1: これは2つのルート間の時刻調整された乗換地点です。出発する車両は到着する車両を待つことが期待され、乗客がルート間を乗り換えるのに十分な時間が確保されます。</q><br>この乗換タイプは、確実に乗換を行うために必要な間隔を上書きします。例として、Google Maps では乗客が安全に乗換を行うために3分が必要であると仮定しています。他のアプリケーションでは異なるデフォルトを仮定する場合があります。 |
| | <q>2: この乗換には接続を確実にするために到着と出発の間に最小限の時間が必要です。必要な乗換時間は <code>min_transfer_time</code> で指定されます。</q><br>停留所間の移動時間を増加させる障害物やその他の要因がある場合は、最小乗換時間を指定してください。 |
| | <q>3: この場所ではルート間の乗換は不可能です。</q><br>物理的な障害がある場合や、困難な道路横断や歩行者ネットワークの欠落によって乗換が安全でない、または複雑になる場合は、この値を指定してください。 |
| | 車内（ブロック）乗換が便間で許可されている場合、到着便の最後の停留所等(stop)は出発便の最初の停留所等(stop)と同じでなければなりません。 |

## ケース別の推奨事項 {: #practice-recommendations-organized-by-case}

このセクションでは、ファイルやフィールド全体に影響を及ぼす特定のケースについて説明します。

### ループ系統 {: #loop-routes}


ループ系統では、車両の便(trip)は同じ場所（時には交通拠点や乗換センター）で始まり、同じ場所で終わります。車両は通常、連続的に運行され、乗客は車両がループを続ける間、車内に留まることができます。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;">

そのため、乗客に車両が進む方向を示すために、行先表示(headsign)の推奨事項を適用するべきです。

進行方向の変化を示すために、`stop_times.txt` ファイルに `stop_headsigns` を設定してください。`stop_headsign` は、その停留所等(stop)から出発する便(trip)の方向を表します。便(trip)の各停留所等(stop)に `stop_headsigns` を追加することで、便(trip)の途中で行先表示(headsign)の情報を変更することができます。

2つの終点間を往復する系統（同じバスが行き来する場合など）については、`stop_times.txt` ファイルに1つの循環便を定義してはいけません。その代わりに、便(trip)を2つの異なる方向に分割してください。
  
__循環便のモデリング例:__

- 各停留所等(stop)で行先表示(headsign)が変わる循環便

| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "B"           |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "C"           |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "D"           |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "E"           |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "A"           |
| trip_1  | 06:35:00     | 06:35:00       | stop_A  | 6             | ""            |
 
- 2種類の行先表示(headsign)を持つ循環便

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
| `trips.trip_id `| ループ全体の往復を1つの便(trip)としてモデリングしてください。 |
| `stop_times.stop_id` | ループ便(trip)の場合、`stop_times.txt` に最初と最後の停留所等(stop)を2回含めてください。以下の例を参照してください。多くの場合、ループ系統にはループ全体を走行しない始発便や最終便が含まれることがあります。これらの便も含めてください。 <table class="example"><thead><tr><th><code>trip_id</code></th><th><code>stop_id</code></th><th><code>stop_sequence</code></th></tr></thead><tbody><tr><td>9000</td><td>101</td><td>1</td></tr><tr><td>9000</td><td>102</td><td>2</td></tr><tr><td>9000</td><td>103</td><td>3</td></tr><tr><td>9000</td><td>101</td><td>4</td></tr></tbody></table> |
| `trips.direction_id` | ループが逆方向（例: 時計回りと反時計回り）に運行される場合は、`direction_id` を `0` または `1` として指定してください。 |
| `trips.block_id` | 同じ `block_id` を使用して、連続するループ便を示してください。 |

### ラッソ型ルート {: #lasso-routes}

ラッソ型ルートは、循環ルートと方向性のあるルートの両方の特徴を組み合わせたものです。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;">

| 例: |
| -------- |
| 地下鉄ルート（[シカゴ](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)） |
| 郊外から都心へのバスルート（[セントアルバート](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) または [エドモントン](http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf)） |
| CTA ブラウン線（[CTA公式サイト](http://www.transitchicago.com/brownline/) および [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn)） |

| フィールド名 | 推奨事項 |
| --- | --- |
| `trips.trip_id` | 「車両の往復運行」（上記[図](#lasso-routes)参照）の全体は、AからB、Bを経由して再びAに戻る運行で構成されます。車両の往復運行全体は以下のいずれかで表現することができます： <li>__1つ__ の `trip_id` 値/レコード（`trips.txt` 内）</li><li>`block_id` によって連続運行が示される、__複数__ の `trip_id` 値/レコード（`trips.txt` 内）</li> |
| `stop_times.stop_headsign` | A-B 区間の停留所等(stop)は両方向で通過します。`stop_headsign` は運行方向を区別するのに役立ちます。そのため、これらの便(trip)については `stop_headsign` を提供することが推奨されます。例: <table class="example"><thead>  <tr><th>例:</th></tr></thead><tbody><tr><td>"A via B"</td></tr><tr><td>"A"</td></tr></tbody></table><table class="example"><thead><tr><th>シカゴ交通局 <a href="http://www.transitchicago.com/purpleline/">パープル線</a></th></tr></thead><tbody><tr><td>"Southbound to Loop"</td></tr><tr><td>"Northbound via Loop"</td></tr><tr><td>"Northbound to Linden"</td></tr></tbody></table><table class="example"><thead><tr><th>エドモントン交通局 バス路線、例: <a href="http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">39番</a></th></tr></thead><tbody><tr><td>"Rutherford"</td></tr><tr><td>"Century Park"</td></tr></tbody></table> |
| `trip.trip_headsign` | trip headsign は、時刻表に表示されるような便(trip)の全体的な説明であるべきです。例としては「Linden to Linden via Loop」（シカゴの例）、または「A to A via B」（一般的な例）などが考えられます。 |

### 枝分かれルート {: #branches}


一部のルート・路線系統(route)には枝分かれが含まれる場合があります。ルート形状(shape)や停留所等(stop)はこれらの枝分かれの間で共有されますが、それぞれが固有の停留所等(stop)やルート形状(shape)の区間を持ちます。枝分かれ間の関係は、ルート名、行先表示(headsign)、便(trip)の短縮名を用いて、以下のガイドラインに従って示すことができます。

<img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;">

| フィールド名 | 推奨事項 |
| --- | --- |
| 全フィールド | 枝分かれルートの命名においては、他の乗客向け情報資料に従うことが推奨されます。以下に2つのケースの説明と例を示します。 |
| | 時刻表や街頭の案内表示が、明確に異なる名前のルート（例: 1A と 1B）を示している場合は、GTFS においてもそのように表現し、`route_short_name` および/または `route_long_name` フィールドを使用してください。例: GoDurham Transit の [routes 2, 2A, and 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) は、ルートの大部分で共通のルート形状(shape)を共有していますが、いくつかの点で異なります。<ul><li>Route 2 は基幹サービスであり、ほとんどの時間帯に運行されます。</li><li>Route 2 は夜間、日曜日、祝日に Main Street で迂回します。</li><li>Routes 2A および 2B は月曜から土曜の日中に運行されます。</li><li>Route 2B は共通ルート形状の経路から外れた追加の停留所等(stop)に停車します。</li></ul> |
| | 事業者が提供する情報で、枝分かれが同じ名前のルートとして記載されている場合は、`trips.trip_headsign`、`stop_times.stop_headsign`、および/または `trips.trip_short_name` フィールドを使用してください。例: GoTriangle の [route 300](https://gotriangle.org/sites/default/files/route_300_v.1.19.pdf) は、時間帯によって異なる場所に運行します。通勤ピーク時には、標準ルートに追加の乗車区間(leg)が加えられ、都市に出入りする労働者に対応しています。 |

## よくある質問 (FAQ) {: #frequently-asked-questions-faq}

### なぜこれらの GTFS ベストプラクティスが重要なのか？ {: #why-are-these-gtfs-best-practices-important}


GTFS ベストプラクティスの目的は以下の通りです:

* 公共交通アプリにおけるエンドユーザーの利用体験を向上させること
* ソフトウェア開発者がアプリケーション、製品、サービスを容易に展開・拡張できるように、幅広いデータの相互運用性を支援すること
* GTFS をさまざまなアプリケーションカテゴリ（元々の便検索に特化した用途を超えて）で活用できるようにすること

GTFS ベストプラクティスが調整されていなければ、GTFS を利用するさまざまなアプリケーションが、調整されないまま独自に要件や期待値を定めてしまい、要件の分岐やアプリケーション固有のデータセットが生じ、相互運用性が低下します。ベストプラクティスが公開される以前は、正しく構成された GTFS データとは何かについて、より多くの曖昧さや意見の相違が存在していました。

### どのように策定されたのか？誰が策定したのか？ {: #how-were-they-developed-who-developed-them}


これらのベストプラクティスは、アプリ提供者やデータ利用者、交通事業者、そしてGTFSに深く関わってきたコンサルタントを含む、GTFSに関与する17の組織からなるワーキンググループによって策定されました。ワーキンググループは [Rocky Mountain Institute](http://www.rmi.org/mobility) によって招集され、運営されました。

ワーキンググループのメンバーは、それぞれのベストプラクティスについて投票を行いました。ほとんどのベストプラクティスは全会一致で承認されました。少数のケースでは、大多数の組織によって承認されました。

### なぜ単に GTFS リファレンスを変更しないのですか？ {: #why-not-just-change-the-gtfs-reference}

良い質問です！仕様、データ利用、ニーズを検討する過程で、実際に仕様にいくつかの変更が加えられました（[GitHub のクローズ済みプルリクエスト](https://github.com/google/transit/pulls?q=is%3Apr+is%3Aclosed)を参照してください）。  
仕様リファレンスの修正は、ベストプラクティスよりも厳格な精査とコメントの対象となります。特定のベストプラクティスは、その採用状況やコミュニティの合意に基づいて仕様に統合されています。最終的には、すべての GTFS ベストプラクティスがコアの GTFS リファレンスの一部になる可能性があります。

### これらのベストプラクティスへの準拠を確認する方法 {: #how-to-check-for-conformance-with-these-best-practices}


Canonical GTFS Schedule Validator は、これらのベストプラクティスへの準拠を確認します。この検証ツールの詳細については、[検証ページ](../../../getting-started/validate)をご覧ください。

### 私は交通事業者を代表しています。私たちのソフトウェアサービス提供者やベンダーがこれらのベストプラクティスに従うようにするには、どのような手順を踏めばよいですか？ {: #i-represent-a-transit-agency-what-steps-can-i-take-so-that-our-software-service-providers-and-vendors-follow-these-best-practices}

ベンダーやソフトウェアサービス提供者に、これらのベストプラクティスを参照するよう伝えてください。GTFS を生成するソフトウェアの調達においては、GTFS Best Practices の URL およびコア仕様リファレンスを参照することを推奨します。

### GTFS データフィードがこれらのベストプラクティスに準拠していないことに気付いた場合、どうすればよいですか？ {: #what-should-i-do-if-i-notice-a-gtfs-data-feed-does-not-conform-to-these-best-practices}

フィードの連絡先を特定してください。存在する場合は *feed_info.txt* 内の [提案されている feed\_contact\_email または feed\_contact\_url](https://github.com/google/transit/pull/31/files) フィールドを使用するか、交通事業者またはフィード提供者のウェブサイトで連絡先情報を探してください。フィード提供者に問題を伝える際には、該当する GTFS ベストプラクティスへのリンクを提示してください。（["このドキュメントへのリンク"](#linking-to-this-document) を参照してください）。

### どのように参加できますか？ {: #how-do-i-get-involved}


[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) にメールを送ってください。

## このドキュメントについて {: #about-this-document}

### 目的 {: #objectives}

GTFS ベストプラクティスを維持する目的は以下の通りです:

* 公共交通データの相互運用性を高めることを支援する  
* 公共交通アプリにおけるエンドユーザーの利用体験を改善する  
* ソフトウェア開発者がアプリケーション、製品、サービスを展開・拡張しやすくする  
* GTFS をさまざまなアプリケーションカテゴリ（元々の便検索への特化を超えて）で活用できるようにする  

### 公開されている GTFS ベストプラクティスを提案または修正する方法 {: #how-to-propose-or-amend-published-gtfs-best-practices}


ベストプラクティスは現在、仕様に統合される過程にあります。新しいベストプラクティスを提案したい場合は、[GTFS Reference GitHub repository](https://github.com/google/transit/) にアクセスして issue を作成するか PR を提出するか、[specifications@mobilitydata.org](mailto:specifications@mobilitydata.org) に連絡してください。

### 本ドキュメントへのリンク {: #linking-to-this-document}

GTFS データを正しく作成するためのガイダンスをフィード提供者に提供するには、ここにリンクしてください。各推奨事項にはアンカーリンクがあります。推奨事項をクリックすると、ページ内アンカーリンクの URL を取得できます。

GTFS を利用するアプリケーションが、ここに記載されていない GTFS データの運用に関する要件や推奨事項を設ける場合は、これらの共通ベストプラクティスを補足するために、その要件や推奨事項を記載したドキュメントを公開することが推奨されます。

### GTFS ベストプラクティス作業部会 {: #gtfs-best-practices-working-group}

GTFS ベストプラクティス作業部会は、2016年から2017年にかけて [Rocky Mountain Institute](http://rmi.org/) によって招集され、公共交通事業者、GTFS を利用するアプリケーションの開発者、コンサルタント、学術機関が参加し、GTFS データに関する共通の実践と期待を定義しました。  
この作業部会のメンバーには以下が含まれていました:

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

現在、この文書は [MobilityData](http://mobilitydata.org/) によって維持されています。
