# 乗客カテゴリ {: #rider-categories}


*主なファイル: rider_categories.txt, fare_products.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー"

    乗客カテゴリは、高齢者、学生、子供、大人など、年齢、資格、またはニーズに基づいて特定の運賃に適用される異なる乗客グループを表します。詳細については、イントロダクションページの [機能セクション](../intro/#fares-features-and-their-files) を参照してください。

乗客カテゴリを定義することで、経路検索サービス（GTFS利用者）は、年齢、アクセシビリティのニーズ、または社会的状況など、乗客の状況に基づいて異なる運賃を表示することができ、各グループに適切な運賃が表示されるようになります。

## 乗客カテゴリの指定 {: #specify-rider-categories}

各乗客カテゴリは `rider_categories.txt` に以下のように作成されます:

1. **rider_category_id** に乗客カテゴリの一意のIDを入力します  
2. **rider_category_name** に乗客向けのカテゴリ名（Adult、Student など）を入力します  
3. **is_default_fare_cateory** を入力します。カテゴリがデフォルトの場合はこのフィールドを 1 に設定し、それ以外の場合は 0 に設定するか空のままにします。  
4. 利用可能であれば、**eligibility_url** にその乗客カテゴリの条件に関する情報を含むウェブページを入力します。そうでない場合、この列全体は任意です。

乗客カテゴリに関する詳細は [ドキュメントを参照してください](../../../reference/#rider_categoriestxt)。

この例では、[Translink](../intro/#translink-vancouver) に対して大人（adult）と割引（concession）の2つのカテゴリが指定されています。adult がデフォルトカテゴリです。さらに、concession カテゴリには **eligibility_url** が追加されており、どの乗客がこのカテゴリに含まれるかを説明しています。

[**rider_categories.txt**](../../../reference/#rider_categoriestxt)

| rider_category_id | rider_category_name | is_default_fare_category | eligibility_url |
| :---- | :---- | :---- | :---- |
| adult | Adult | 1 |  |
| concession | Concession |  | https://www.translink.ca/transit-fares/pricing-and-fare-zones#fare-pricing |

## チケット商品との関連付け {: #associate-with-fare-products}


各チケット商品は、1つまたは複数の乗客カテゴリに適用することができます。この適用可能性を示すために、乗客カテゴリは `fare_products.txt` 内でチケット商品と次のように関連付けられます。

1. 各チケット商品について、**rider_category_id** に、その乗車区間(leg)の料金を決定する乗客カテゴリのIDを入力します。  
   * これは `rider_categories.txt` 内の **rider_category_id** を参照する外部キーです。  
   * `fare_products.txt` 内の **rider_category_id** が空の場合、そのチケット商品はすべての乗客カテゴリに適用可能であることを意味します。

この例では、大人用と割引カテゴリ用の均一バス運賃に対して、2種類の異なるバスのチケット商品が指定されています。`bus_flat_fare` が大人の乗客カテゴリに関連付けられている場合、金額は CAD 3.20 です。`bus_flat_fare` が割引の乗客カテゴリに関連付けられている場合、金額は CAD 2.15 です。

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id | rider_category_id |
| :---- | :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless | adult |
| bus_flat_fare | Bus Flat Fare | 2.15 | CAD | contactless | concession |
