# チケットメディア {: #fare-media}


*主なファイル: fare_media.txt, fare_products.txt*  
*例: [Translink (バンクーバー)](../intro/#translink-vancouver)*

!!! info "リマインダー" 

    チケット商品は、公共交通機関に乗車する際に検証するために使用される、異なるチケットメディア内に格納されます。詳細については、イントロダクションページの [機能のセクション](../intro/#fares-features-and-their-files) を参照してください。

## チケットメディアの作成 {: #create-fare-media}

チケットメディアのエントリは、`fare_media.txt` に以下のように作成します。

1. **fare_media_id** 列に、チケットメディアを識別する一意のIDを入力します。  
    * これは `fare_products.txt` と関連付けるために使用される主キーです。  
2. **fare_media_name** 列に、乗客向けのチケットメディアの名称を入力します。  
3. **fare_media_type** 列に、適切な列挙値を入力します (0=None、1=紙のチケット、2=交通系ICカード、3=cEMV、4=モバイルアプリ)。

チケット商品の詳細については、[ドキュメントを参照してください](https://gtfs.org/documentation/schedule/reference)。

この例では、5種類の異なるチケットメディアが作成され、それぞれにID、名称、メディアの種類が割り当てられています。例えば、Compass Card は交通系ICカードであるため、`fare_media_type=2` が割り当てられています。

[**fare_media.txt**](../../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
| :---- | :---- | :---- |
| cash | Cash | 0 |
| contactless | Contactless | 3 |
| compass_card | Compass Card | 2 |
| compass_ticket | Compass Ticket | 1 |
| wallet | Mobile Wallet | 3 |
