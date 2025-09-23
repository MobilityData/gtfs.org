# 読み上げ用フィールド(text-to-speech) {: #text-to-speech}

## 略語、特殊な発音、大きな数字および序数 {: #abbreviations-unusual-pronunciations-large-digits-and-ordinals}

略語、特殊な発音、大きな数字は、GTFS のテキストフィールドでよく見られます。以下の TriMet の例では、読み上げ用フィールド(text-to-speech field)をどのように使用するべきかを示しています。

- 略語はすべて綴りを展開します。例: “SW” は “southwest” に、“Ave” は “avenue” になります。
- 発音はソフトウェアが正しく読み上げられるように綴ります。例: “Orenco” は “orrainkoe” に、“Merlo” は “murlo” になります。
- 大きな数字は、実際に発音される通りに綴ります。例: “3300” は “thirty-three hundred” になります。  
  そうしないと、ソフトウェアは “3300” を “three thousand three hundred” と読み上げてしまいます。
- 序数（1st, 2nd, 3rd など）は綴りで表記するべきです。例: “1st” は “first” になります。

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name | tts_stop_name |
| ---- | ---- | ---- |
| 9163 | SW 125th & Longhorn | southwest one hundred twenty fifth & longhorn |
| 9836 | Orenco MAX Station | orrainkoe max station |
| 9828 | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074 | 3300 Block NW 35th | thirty-three-hundred block northwest thirty fifth |

## 頭字語(Acronyms) {: #acronyms}


頭字語をアルファベットで表記する場合、文字の後にピリオドを付けるか、スペースで区切るべきです。これにより、その頭字語が単語としてではなく、1文字ずつ読み上げられるべきであることが明確になります。

タンパの場合、行先表示(headsign)「North to UATC」には、個々の文字で発音される頭字語が含まれています。読み上げ用フィールド(text-to-speech field)での曖昧性解消は以下のようになります。

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u.a.t.c. |

または

| trip_headsign | tts_trip_headsign |
| ---- | ---- |
| North to UATC | north to u a t c |

逆に、いくつかの頭字語は単語として読まれるべきです（例: NATO、NASA）。この場合、読み上げ用フィールド(text-to-speech field)はそれを反映するべきです。

!!! Note

    `trips.tts_trip_headsign` フィールドは、まだ仕様において公式ではありません。

## 複数の意味を持つ略語の明確化 {: #clarifying-abbreviations-with-multiple-meanings}

「St」という略語には複数の意味があります。「street（通り）」、「saint（聖）」、 「station（駅）」、そして「1st（first、1番目）」です。読み上げ用フィールド(text-to-speech field)は、正しい単語を綴って明示することで、これらの二重の意味を解消することができ、その際にはTTSソフトウェアが正しく読み上げられるように記述する必要があります。
