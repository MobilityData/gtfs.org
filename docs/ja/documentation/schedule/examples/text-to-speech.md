#テキスト読み上げ

## 略語、珍しい発音、大きな数字、序数

略語、珍しい発音、大きな数字は、GTFSTextフィールドでよく使用されます。以下の TriMEt の例では、テキスト読み上げフィールドの使用するべきであるがわかります。

- 略語は完全に綴ります。例: 「SW」は「southwest」になります。「Ave」は「avenue」になります。
- 発音はソフトウェアが正しく読み取れるように綴ります。例: 「Orenco」は「orrainkoe​​」になります。「Merlo」は「murlo」になります。
- 大きな数字は発音どおりに綴ります。「3300」は「thirty-three hundred」になります。そうしないと、ソフトウェアは「3300」を「three thousand three hundred」と読み上げます。
- 1st、2nd、3rd などの序数は綴る必要があります。例: 「1st」は「first」になります。

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name | tts_stop_name |
| ---- | ---- | ---- |
| 9163 | SW 125th & Longhorn | southwest one hundred twenty fifth & longhorn |
| 9836 | Orenco MAX Station | orrainkoe max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | thirty-three-hundred block northwest thirty fifth |

## 頭字語

頭字語を文字で表す場合は、文字の後にピリオドを付けるか、スペースで区切りするべきである。これにより、頭字語は単語としてではなく、文字ごとに読むするべきであることが明確になります。

タンパの案内標識`h` to UATC`には、個々の文字で発音される頭字語が含まれています。テキスト読み上げ曖昧さ回避は次のようになります。

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u.a.t.c. |

または

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u a t c |

逆に、一部の頭字語は単語として読み上げられるするべきである: 例:「NATO」、「NASA」。テキスト読み上げフィールドはこれを反映するするべきである。

!!! 注

    フィールド `trips.tts_trip_headsign` は、まだ仕様で公式ではありません。

## 複数の意味を持つ略語の明確化

「St」という略語には複数の意味があります。「street」、「saint」、「station」、および「first」を意味する「1st」です。テキスト読み上げフィールドでは、正しい単語を綴り、TTS ソフトウェアで判読可能な方法で読み上げることで、これらの二重の意味に対処できます。