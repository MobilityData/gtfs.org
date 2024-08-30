# テキスト読み上げ

## 略語、珍しい発音、大きな数字、序数

略語、珍しい発音、大きな数字は、GTFS テキスト フィールドでよく使用されます。以下の TriMEt の例では、テキスト読み上げフィールドの使用方法がわかります。

- 略語は完全に綴ります。たとえば、`SW`は`southwest`、`Ave`は`avenue`になります。
- 発音は、ソフトウェアが正しく読み取れるように綴ります。たとえば、`Orenco`は`orrainkoe​​`になります。 “Merlo” は “murlo” になります。
- 大きな数字は発音どおりに表記されます: “3300” は “thirty-three hundred” になります。
そうしないと、ソフトウェアは “3300” を “three thousand three hundred” と読み取ります。
- 1st、2nd、3rd などの序数は表記する必要があります: たとえば “1st” は “first” になります。

[** stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name | tts_stop_name |
|----|----|----|
| 9163 | SW 125th &amp; Longhorn | southwest one century five &amp; longhorn |
| 9836 | Orenco MAX Station | orrainkoe​​ max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | third-three-hundred block northwest third five |

## 頭字語

頭字語を文字で表す場合は、文字の後にピリオドを付けるか、スペースで区切ります。これにより、頭字語は単語としてではなく、文字ごとに読む必要があることが明確になります。

タンパの案内標識`h` to UATC`には、個々の文字で発音される頭字語が含まれています。テキスト読み上げによる曖昧さ回避は次のようになります。

[** trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
|----|----|
| North to UATC | north to uatc |

または

| trip_headsign | tts_trip_headsign |
|----|----|
| North to UATC | north to uatc |

逆に、一部の頭字語は単語として読み上げられる必要があります: 例: NATO; NASA。音声合成フィールドはこれを反映する必要があります。

!!! 注

    フィールド `trips.tts_trip_headsign` は、まだ仕様で公式ではありません。

## 複数の意味を持つ略語の明確化

`St`の略語には複数の意味があります: `street`、`saint`、`station`、および`first`を意味する`1st`です。音声合成フィールドは、正しい単語をスペルアウトし、TTS ソフトウェアで判読可能な方法で行うことで、これらの二重の意味に対処できます。