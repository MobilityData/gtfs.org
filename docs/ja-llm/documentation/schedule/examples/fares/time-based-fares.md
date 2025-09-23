# 時間帯別運賃 {: #time-based-fares}


*主なファイル: fare_leg_rules.txt, timeframes.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー"

    時間帯別運賃は、特定の時間帯や曜日に基づいて運賃を設定します。例えば、ピーク時運賃、オフピーク時運賃、週末運賃などです。詳細については、イントロダクションページの [機能のセクション](../intro/#fares-features-and-their-files) を参照してください。

## チケット商品と運賃区間ルールの作成 {: #create-fare-products-and-fare-leg-rules}

チケット商品と運賃区間ルールを作成します。運賃体系に基づいて、関連するチケット商品と運賃区間ルールを追加してください。

* ルート・路線系統ベースの運賃については、[Route-Based Fares](../route-based-fares) セクションをご覧ください。  
* ゾーンベースの運賃については、[Zone-Based Fares](../zone-based-fares) セクションをご覧ください。

この例では、Translink に対して Route-Based Fares セクションと Zone-Based Fares セクションで、ルート・路線系統ベースおよびゾーンベースの運賃が定義されています。

## タイムフレームの作成 {: #create-timeframes}

タイムフレームとは、異なる運賃が適用される時間帯を囲む時間ウィンドウのことです。例: 平日朝のラッシュアワーにピーク運賃を適用するタイムフレーム、週末の夜に割引運賃を適用するタイムフレームなど。

タイムフレームには、運賃が有効となる曜日と時間帯の両方が含まれます。これらは `timeframes.txt` に以下のように作成されます:

1. **timeframe_group_id** にタイムフレームのグループIDを入力します。  
2. **start_time** に特別運賃が適用されるタイムフレームの開始時刻を入力します。  
3. **end_time** に特別運賃が適用されるタイムフレームの終了時刻を入力します。  
4. **service_id** に `calendar.txt` または `calendar_dates.txt` の **service_id** を参照するIDを入力します。これにより、時間ベースの運賃を運行日(service day)または運行日の範囲に関連付けることができます。

[`timeframes.txt` の詳細なドキュメント](../../../reference/#timeframestxt)を参照して、設定方法を確認してください。

!!! Note  

	タイムフレームは **end_time** の1秒前に終了します。例: `end_time=11:00:00` の場合、タイムフレームは 10:59:59 に終了します。  
	タイムフレームが深夜をまたぐ場合は、同じ `timeframe_group_id` を持つ2つのタイムフレーム行に分割しなければなりません。24:00:00 を超える値は使用してはいけません。

!!! info "リマインダー"

    Translink では、夜間 (午後6時30分から午前3時) および週末に割引運賃を提供しています。SkyTrain と Seabus の運賃はすべて1ゾーン運賃 (CAD 3.20) になります。Sea Island からの移動は、夜間および週末には CAD 8.20 (CAD 5.00 の追加料金 + 1ゾーン運賃 CAD 3.20) となります。

これは `timeframes.txt` を使用してモデル化することができます。安い時間ベースの運賃 (チケット商品と有効運賃区間ルール) は、前のセクション ([ルートベース運賃](../route-based-fares) セクション、[ゾーンベース運賃](../zone-based-fares) セクション) で作成されたすべてのチケット商品に追加されます。

この例では、3つのタイムフレームグループが作成されます。  

まず、`weekday_daytime` タイムフレームを午前3時から午後6時30分までとして定義します。  

次に、`weekday_evening` タイムフレームは深夜をまたぐため、午後6時30分から深夜までと、深夜から午前3時までの2つに分割されます。両方とも平日サービスに関連付けられます。  

最後に、`weekend` タイムフレームを作成し、週末の1日全体をカバーします。このタイムフレームでは、`start_time` と `end_time` を空にしておくことで、`weekend_service` の全期間に適用されることを意味します。  

[**timeframes.txt**](../../../reference/#timeframestxt)

| timeframe_group_id | start_time | end_time | service_id |
| :---- | :---- | :---- | :---- |
| weekday_daytime | 03:00:00 | 18:30:00 | weekday_service |
| weekday_evening | 18:30:00 | 24:00:00 | weekday_service |
| weekday_evening | 00:00:00 | 03:00:00 | weekday_service |
| weekend |  |  | weekend_service |

以下は `calendar.txt` の簡単な例で、`timeframes.txt` に登場する service_id を示しています:

[**calendar.txt**](../../../reference/#calendartxt)

| service_id | monday | tuesday  | wednesday | thursday | friday | saturday | sunday | start_date | end_date |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| weekday_service | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 20250101 | 20251231 |
| weekend_service | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 20250101 | 20251231 |

## 運賃区間ルールを時間枠に関連付ける {: #associate-fare-leg-rules-to-timeframes}


運賃区間ルールは、運賃が適用される時間帯にのみ区間のマッチングが制限されるように、異なる時間枠に関連付けられます。これは `fare_leg_rules.txt` において以下のように行われます。

1. 運賃区間ルールの **from_timeframe_group_id** および **to_timeframe_group_id** に、運賃が適用される時間枠（または時間枠グループ）の ID を入力します。  
    * これは `timeframes.txt` の **timeframe_group_id** を参照する外部キーです。  
2. 同じ **leg_group_id** を複製しつつ、**from_timeframe_group_id**、**to_timeframe_group_id**、**fare_product_id** を異なる値にして、同じマッチングルール（**network_id**、**from_area_id**、**to_area_id**）を持ちながら、異なる時間枠や運賃を表現します。

!!! Note

    Translink では、区間の終了時刻が運賃に影響するかどうかの情報がないため、影響しないと仮定します。つまり、区間が `weekday_daytime` の時間枠内で開始した場合、たとえ別の時間枠で終了しても、その区間は `weekday_daytime` の一部として扱われます。

この例では、`flat_fare_leg` が 2 回繰り返されており、1 回は `weekday_evening` の時間枠用、もう 1 回は `weekend` の時間枠用です。これにより、平日夜間および週末において、SkyTrain と Seabus に対して 1ゾーン／均一料金運賃を関連付けることができます。

さらに、`flat_fare_sea_island_leg` が作成され、`sea_island` から出発する区間を、`daytime_evening` および `weekend` において、任意のゾーンに対して `sea_island_1_zone_fare` と関連付けています。

Sea Island 区間に対して `rule_priority=1` を設定することで、追加の 5.00 CAD 運賃を適用する優先度を保持します。平日昼間以外はすべて 1ゾーン運賃であるため、追加の 5.00 CAD が 1ゾーン運賃に加算され、Sea Island 発の便の新しい運賃は `sea_island_1_zone_fare` となり、その金額は 5.00 CAD + 3.20 CAD = 8.20 CAD となります。

!!! Note

    `rule_priority` 列が存在する場合、`from_area_id`（または `to_area_id`）が空欄であれば、出発ゾーン `from_area_id`（または到着ゾーン `to_area_id`）は区間のマッチングに影響しないことを意味します。同様に、`from_timeframe_group_id` または `to_timeframe_group_id` のいずれかが空欄であれば、そのフィールドはマッチング処理において無関係となります。

**[fare_leg_rules.txt](../../../reference/#fare-leg-rulestxt)（ファイル全体）**	

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |  |  |  |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 | weekday_daytime |  |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 | weekday_daytime |  |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 | weekday_daytime |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 | weekday_daytime |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 | weekday_daytime |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 | weekday_daytime |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 | weekday_daytime |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 | weekday_daytime |  | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 | weekday_daytime |  | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 | weekday_daytime |  | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island |  |  | 2 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekday_evening |  |  |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekend |  |  |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekday_evening |  | 1 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekend |  | 1 |

## rule_priority を使用した簡略化 {: #simplify-using-rule_priority}


!!! info "リマインダー"

    `rule_priority` フィールドは、マッチするルールが適用される順序を決定します。値が高い `rule_priority` を持つルールは、値が低いまたは空のルールよりも優先されます。

平日夜間および週末の運賃が均一運賃または1ゾーン運賃と同じであるため、**rule_priority** を使用することでさらなる簡略化が可能です。これは `fare_leg_rules.txt` において次のように行います。

1. 夜間／週末の区間(leg)に高い **rule_priority** を割り当てます。  
2. 平日日中の区間から時間枠の関連付けを削除します。

この例では、平日夜間および週末の区間に高い `rule_priority` を設定し、平日日中の区間については `rule_priority` フィールドを空（0を設定するのと同じ）にすることで、夜間および週末の区間が有効な時間枠において平日日中の区間よりも優先されます。これにより正しい運賃が計算されます。

* 平日夜間および週末の `flat_fare_leg` 区間には `rule_priority=1` が割り当てられ、他のすべての均一運賃区間やゾーンベースの区間よりも優先されます。そのため、旅程(journey)が `weekday_evening` または `weekend` の時間枠内で行われる場合、均一運賃区間が（Sea Island 区間を除き）すべての他の区間よりも優先的に選択されます。  
* 平日夜間および週末の `flat_fare_leg_sea_island` 区間には `rule_priority=2` が割り当てられ、これにより、これらの時間枠において Sea Island から出発する他の区間（前の [Zone-Based Fares](../zone-based-fares) セクションで rule_priority=1 が割り当てられている）よりも優先されます。  
* `sea_island_sea_island_leg` 区間には `rule_priority=3` が割り当てられ、常に `from_area_it=sea_island` かつ `to_area_it=sea_island` に一致する他のすべての区間よりも優先されます。これにより、時間枠に関係なく、Sea Island 内での無料運賃が常に保証されます。

**[fare_leg_rules.txt](../../../reference/#fare_leg_rulestxt)（ファイル全体）**	

| leg_group_id | network_id | fare_product_id | from_area_id | to_area_id | from_timeframe_group_id | to_timeframe_group_id | rule_priority |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | translink_bus | bus_flat_fare |  |  |  |  |  |
| ZN1_ZN1 | skytrain_seabus | 1_zone_fare | ZN1 | ZN1 |  |  |  |
| ZN2_ZN2 | skytrain_seabus | 1_zone_fare | ZN2 | ZN2 |  |  |  |
| ZN3_ZN3 | skytrain_seabus | 1_zone_fare | ZN3 | ZN3 |  |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN1 | ZN2 |  |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN2 | ZN3 |  |  |  |
| ZN1_ZN2 | skytrain_seabus | 2_zone_fare | ZN2 | ZN1 |  |  |  |
| ZN2_ZN3 | skytrain_seabus | 2_zone_fare | ZN3 | ZN2 |  |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN1 | ZN3 |  |  |  |
| ZN1_ZN3 | skytrain_seabus | 3_zone_fare | ZN3 | ZN1 |  |  |  |
| sea_island_ZN1 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN1 |  |  | 1 |
| sea_island_ZN2 | skytrain_seabus | sea_island_1_zone_fare | sea_island | ZN2 |  |  | 1 |
| sea_island_ZN3 | skytrain_seabus | sea_island_2_zone_fare | sea_island | ZN3 |  |  | 1 |
| sea_island_sea_island | skytrain_seabus | sea_island_sea_island_fare | sea_island | sea_island |  |  | 3 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekday_evening |  | 1 |
| flat_fare_leg | skytrain_seabus | 1_zone_fare |  |  | weekend |  | 1 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekday_evening |  | 2 |
| flat_fare_sea_island_leg | skytrain_seabus | sea_island_1_zone_fare | sea_island |  | weekend |  | 2 |
