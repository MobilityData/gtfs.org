# 運賃乗継 (Fare Transfers) {: #fare-transfers}


*主なファイル: fare_leg_rules.txt, fare_transfer_rules.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー"

    運賃乗継(Fare Transfers)は、乗車区間(leg)間の乗継に適用されるルールを定義するために使用されます。旅程(journey)の合計費用は、個々の乗車区間(leg)に適用されるチケット商品(fare product)と、それらを接続する乗継に適用されるチケット商品から算出されます。詳細については、イントロダクションページの[機能のセクション](../intro/#fares-features-and-their-files)を参照してください。

!!! info "リマインダー"

    TransLink の場合:

    * 乗継は運賃認証後90分間有効です。  
    * この時間内のバスからバスへの乗継は無料です。  
    * 同一の運賃ゾーン番号内での乗継（元の運賃でサポートされている場合）も無料です。  
    * 乗客がより高い運賃のゾーンに乗継する場合、差額のみを支払います。これは AddFare と呼ばれます。

!!! Note

    このセクションには、非接触型運賃(Contactless fares)の例のみが含まれています。他のチケットメディア(fare media)タイプをサポートするには、該当する `fare_products.txt` の行を複製し、金額と `fare_media_id` フィールドを更新してください。

## 乗り換え運賃商品の作成 {: #create-transfer-fare-products}

乗り換え運賃商品は、有料の乗り換えにかかる費用を表します。無料の乗り換えについては作成する必要はありません。乗り換え運賃商品は、`fare_products.txt` に以下のように作成します。

1. **fare_product_id** 列に、その運賃商品を識別する一意のIDを入力します。  
2. **fare_product_name** 列に、乗客向けの運賃商品の名称を入力します（例: Zone 1 to Zone 2 Transfer Upgrade、Bus to Zone 1 Transfer Upgrade）。  
3. **amount** 列と **currency** 列に、乗り換えの費用とその通貨を入力します（[通貨コード](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)）。  
4. **fare_media_id** 列に、この運賃商品を保存・利用できるチケットメディアを入力します。  
    * これは `fare_media.txt` 内の **fare_media_id** を参照する外部キーです（[Fare Media](../../../reference/#fare_mediatxt)）。  
    * 複数のチケットメディアを同じ運賃商品に関連付けることができ、価格が異なる場合もあります。  
    * **fare_media_id** が空の場合は、チケットメディアが不明であることを意味します。  

詳細については [Fare Products のドキュメント](../../../reference/#fare_productstxt) を参照してください。

[Translink](../intro/#translink-vancouver) の場合、3つの乗り換え運賃商品が作成されます。

* `1_zone_to_2_zone_upgrade` は、1ゾーン運賃から2ゾーン運賃に乗り換える費用を表します。これは CAD 4.65 - CAD 3.20 = CAD 1.45（または Sea Island から始まる乗車区間の場合 CAD 9.65 - CAD 8.20 = CAD 1.45）です。  
* `2_zone_to_3_zone_upgrade` は、2ゾーン運賃から3ゾーン運賃に乗り換える費用を表します。これは CAD 6.35 - CAD 4.65 = CAD 1.70（または Sea Island から始まる乗車区間の場合 CAD 11.35 - CAD 9.65 = CAD 1.70）です。  
* `1_zone_to_3_zone_upgrade` は、1ゾーン運賃から3ゾーン運賃に乗り換える費用を表します。これは CAD 6.35 - CAD 3.20 = CAD 3.15 です。  

**fare_products.txt**

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| … | … | … | … | … |
| 1_zone_to_2_zone_upgrade | 1 zone  to 2 zones upgrade | 1,45 | CAD | contactless |
| 2_zone_to_3_zone_upgrade | 2 zones  to 3 zones upgrade | 1.70 | CAD | contactless |
| 1_zone_to_3_zone_upgrade | 1 zone  to 3 zones upgrade | 3.15 | CAD | contactless |

## 乗換ルールの作成 {: #create-transfer-rules}


乗換ルールは、旅程(journey)の対象となる乗車区間(leg)に適用可能な乗換を定義します。これらは `fare_transfer_rules.txt` に以下のように作成します。

1. **from_leg_group_id** と **to_leg_group_id** を入力します。  
    * これらは `fare_leg_rules.txt` の **leg_group_id** を参照する外部キーです。それぞれ、乗換前の乗車区間グループと乗換後の乗車区間グループを参照します。  
2. **duration_limit** に、乗換が有効である秒数を入力します。時間制限がない場合は空欄にします。  
   **duration_limit** が空でない場合は **duration_limit_type** を入力します。**duration_limit_type** は **duration_limit** の計算方法を表します。  
3. **fare_transfer_type** を入力し、運賃の計算方法を説明します。  
4. **transfer_count** を入力します。乗換回数に制限がある場合に使用します。このフィールドは **from_leg_group_id**=**to_leg_group_id** の場合は必須であり、それ以外の場合は入力してはいけません。

[ドキュメントを参照](../../../reference/#fare_transfer_rulestxt)して、乗換ルールのさまざまな値について学んでください。

この例では、Translink のすべての可能な乗車区間グループ間で複数の乗換が定義されています。すべての乗換は 5400 秒（180 分）有効です。**duration_limit_type** は 1 に設定されています。これは、乗客が **flat_fare_leg** 運賃区間で任意のルート・路線系統(route)に乗車した時点から乗換時間が開始され、別の運賃区間に乗車した時点で終了することを意味します。

**fare_transfer_type** は 0 に設定されています。これは A + AB 乗換とも呼ばれ、乗客が最初の区間運賃 (A) と B への乗換運賃 (AB) を支払う方式です。最後に、**transfer_count** は -1 に設定されており、乗換回数に制限がないことを示しています。

**fare_transfer_rules.txt**

| from_leg_group_id | from_leg_group_id | duration_limit | duration_limit_type | transfer_count | fare_transfer_type | fare_product_id |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| ZN1_ZN1 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN1_ZN1 | 5400 | 1 | -1 | 0 |  |
| ZN1_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade |
| ZN2_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  |
| flat_fare_leg | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  |
| … | … | … | … | … | … | … |
| ZN1_ZN1 | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade |
| ZN1_ZN1 | ZN1_ZN3 | 5400 | 1 |  | 0 | 1_zone_to_3_zone_upgrade |
| ZN1_ZN2 | ZN2_ZN2 | 5400 | 1 |  | 0 |  |
| ZN1_ZN2 | ZN1_ZN2 | 5400 | 1 |  | 0 |  |
| ZN1_ZN2 | ZN2_ZN3 | 5400 | 1 |  | 0 | 2_zone_to_3_zone_upgrade |
| … | … | … | … |  | … | … |

## 非連続乗り換えの有効化 {: #enable-nonconsecutive-transfers}


!!! Warning

    非連続乗り換えはまだ開発中であり、公式仕様の一部ではありません。しかし、Translink の運賃実装に関する包括的な概要を提供するために、このガイドに含まれています。

    非連続乗り換えの詳細については、関連する [pull request](https://github.com/google/transit/pull/498) および [proposal](https://docs.google.com/document/d/1HBskmMx32W7whP-fQGlNlv0c1rgIe0jS8Dm4Rp3R_2I/edit?usp=sharing) を参照してください。

非連続乗り換えは、旅程(journey)のある乗車区間(leg)が後の非隣接の乗車区間(leg)に影響を与える場合に必要です。非連続乗り換えが乗り換えルールに対して有効化されている場合、その乗り換えルールは連続する乗車区間(leg)と非連続の乗車区間(leg)の両方に適用することができます。これにより、すべての可能な乗り換えの組み合わせが考慮されます。

非連続乗り換えは、旅程(journey)のある乗車区間(leg)が後の非隣接の乗車区間(leg)に影響を与える場合に必要です。

非連続乗り換えは、`fare_transfer_rules.txt` において以下のように有効化されます：

1. **nonconsecutive_transfers_allowed** に 1 を入力すると、その乗り換えルールは非連続の乗車区間(leg)間でも適用可能になります。そうでない場合は 0 を設定するか空欄にします。

!!! info "リマインダー"

    Translink では有効時間が 90 分です。例えば、乗客が Zone 1 から Zone 2 へ移動（2ゾーン運賃を支払い）、次に Zone 2 から Zone 2 へ移動（乗り換え料金は 0）、最後に Zone 2 から Zone 1 に戻る場合、最初の 2ゾーン運賃のみが支払われます。

[Translink](../intro/#translink-vancouver) のシステムでは、乗客が以下のような 80 分間の旅程(journey)を複数のサービスをまたいで行うことがあります：

* **Leg 1**: Lonsdale Quay (Zone 2) から Waterfront Station (Zone 1) へ Seabus を利用 — 2ゾーン運賃が必要です。

* **Leg 2**: Waterfront Station (Zone 1) から Commercial-Broadway Station (Zone 1) へ SkyTrain を利用 — 1ゾーン運賃が必要です。

* **Leg 3**: Commercial-Broadway Station (Zone 1) から Lake City Way Station (Zone 2) へ SkyTrain を利用 — 2ゾーン運賃が必要です。

Leg 1 の運賃は、90 分以内の Zone 1 と Zone 2 間のすべての 2ゾーン移動をカバーするべきです。したがって、合計金額は次のように計算されます：

* Leg 1 (2ゾーン運賃) + Leg 1 から Leg 2 への乗り換え + Leg 1 から Leg 3 への乗り換え = CAD 4.65 + CAD 0.00 + CAD 0.00 = CAD 4.65

この計算は、`fare_transfer_rules.txt` において `nonconsecutive_transfers_allowed` を 1 に設定することで機能し、最初の乗車区間(leg)で通過したゾーンが、複数乗車区間(leg)の旅程(journey)における後続の乗り換えに影響を与えることを保証します。

非連続乗り換えを有効化しない場合、運賃は誤って次のように計算されます：

* Leg 1 + Leg 1 から Leg 2 への乗り換え + Leg 2 から Leg 3 への乗り換え = CAD 4.65 + CAD 0.00 + CAD 1.65 = CAD 6.30

この 2 つ目の計算結果は、実際の運賃の仕組みを反映していません。したがって、非連続乗り換えを有効化することで、すべての有効な乗り換えの可能性を考慮し、正確な運賃計算が保証されます。

**fare_transfer_rules.txt**

| from_leg_group_id | from_leg_group_id | duration_limit | duration_limit_type | transfer_count | fare_transfer_type | fare_product_id | nonconsecutive_transfers_allowed |
| :---- | :---- | :---- | :---- | :---- | :---- | :---- | :---- |
| flat_fare_leg | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN1 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN1_ZN1 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade | 1 |
| ZN2_ZN2 | flat_fare_leg | 5400 | 1 | -1 | 0 |  | 1 |
| flat_fare_leg | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| … | … | … | … | … | … | … | 1 |
| ZN1_ZN1 | ZN1_ZN2 | 5400 | 1 | -1 | 0 | 1_zone_to_2_zone_upgrade | 1 |
| ZN1_ZN1 | ZN1_ZN3 | 5400 | 1 | -1 | 0 | 1_zone_to_3_zone_upgrade | 1 |
| ZN1_ZN2 | ZN2_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | ZN1_ZN2 | 5400 | 1 | -1 | 0 |  | 1 |
| ZN1_ZN2 | ZN2_ZN3 | 5400 | 1 | -1 | 0 | 2_zone_to_3_zone_upgrade | 1 |
| … | … | … | … | -1 | … | … | 1 |
