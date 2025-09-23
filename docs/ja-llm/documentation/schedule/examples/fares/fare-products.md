# チケット商品(Fare Products) {: #fare-products}


*主なファイル: fare_products.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー" 

    チケット商品(Fare Products)とは、交通事業者がサービスを利用するために提供する運賃の種類（例: 片道運賃、定期券、乗り継ぎ料金など）を指します。詳細については、イントロダクションページの [機能のセクション](../intro/#fares-features-and-their-files) を参照してください。

!!! Note

    * このセクションでは、チケット商品の概要を説明します。以降のセクションでは、利用ケースに基づいてより具体的に定義します。  
    * このセクションには、異なる種類のパスを表すチケット商品が含まれています: 不定期利用のパスと1日乗車券です。後のセクションでは、例を簡潔に保つために不定期利用のパスのみを使用します。

## チケット商品の作成 {: #create-fare-products}


同じ旅程(journey)に対して、異なるチケット商品(fare product)が関連する場合があります。チケット商品は `fare_products.txt` に以下のように作成します。

1. **fare_product_id** 列に、そのチケット商品を識別する一意のIDを入力します。  
2. **fare_product_name** 列に、乗客向けのチケット商品の名称を入力します（例: Bus Flat Fare, Bus Flat Fare Monthly）。  
3. **amount** 列と **currency** 列に、運賃の金額とその通貨を入力します（[通貨コード](https://en.wikipedia.org/wiki/ISO_4217#Active_codes)）。  
4. **fare_media_id** 列に、そのチケット商品を保存・利用できるチケットメディアを入力します。  
    * これは `fare_media.txt` の **fare_media_id** を参照する外部キーです（[Fare Media](../../../reference/#fare_mediatxt)）。  
    * 複数のチケットメディアを同じチケット商品に関連付けることができ、価格が異なる場合もあります。  
    * **fare_media_id** が空の場合、そのチケットメディアは不明であることを意味します。

チケット商品についての詳細は、[ドキュメントを参照してください](../../../reference/#fare_productstxt)。

この例では、2つのチケット商品が定義されています: `bus_flat_fare` と `bus_flat_fare_daily`。どちらも Translink バス便(trip)で利用可能です。`bus_flat_fare` は短期的な旅程(journey)に適しています。`bus_flat_fare_daily` は同じ日に複数時間にわたる旅程(journey)に適しています。

[**fare_products.txt**](../../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | amount | currency | fare_media_id |
| :---- | :---- | :---- | :---- | :---- |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | contactless |
| bus_flat_fare | Bus Flat Fare | 3.20 | CAD | cash |
| bus_flat_fare | Bus Flat Fare | 2.60 | CAD | compass_card |
| bus_flat_fare_daily | Daily pass | 11.50 | CAD | compass_card |
| bus_flat_fare_daily | Daily pass | 11.50 | CAD | compass_ticket |
| … | … | … | … | … |
