---
search:
    exclude: true
---

# 音声合成

<hr>

## 略語、特殊な発音、大きな数字、序数について

GTFSのテキストフィールドでは、略語や特殊な発音、大きな数字がよく使われます。以下のTriMEtの例では、音声合成フィールドをどのように使用すべきかを示している。

- 略語は完全なスペルで表記する。例えば、「SW」は「southwest」、「Ave」は「avenue」となる。
- 例："Orenco "は "orrainkoe "に、"Merlo "は "murlo "になります。
- 大きな数字も、発音に近い形で表記します。「3300 "は "3300 "となります。

そうしないと、ソフトウェアが "3300 "を "three thousand three hundred "と読んでしまいます。

- 1st、2nd、3rdのような序数はスペルアウトする必要があります。

[**stops.txt**](../../reference/#stopstxt)

| stop_id | stop_name                       | tts_stop_name               |
| ------- |---------------------------------| --------------------------------------- |
| 9163    | SW 125th &amp; Longhorn         | southwest one hundred twenty fifth & longhorn           |
| 9836    | Orenco MAX Station                       | orrainkoe max station                             |
| 9828    | Merlo Rd/SW 158th Ave MAX Station | murlo road southwest one hundred fifty eighth avenue max station |
| 10074   | 3300 Block NW 35th                | 	thirty-three-hundred block northwest thirty fifth       |

## 頭字語

頭字語が文字で表記されている場合は、文字の後にピリオドを付けるか、スペースで区切ってください。これは、頭字語が単語としてではなく、一文字ずつ読むべきものであることを明確にするためです。

タンパの場合、「North to UATC」というヘッドサインには、頭字語が含まれていますが、これは個々の文字で発音されます。音声合成の曖昧さ解消は次のようになります。

[**trips.txt**](../../reference/#tripstxt)

| trip_headsign | tts_trip_headsign |
| ---------- |-------------------|
| North to UATC   | north to u.a.t.c.       |

または

| trip_headsign | tts_trip_headsign |
| ---------- | ---------------------------- |
| North to UATC   | north to u a t c          |

逆に、頭字語の中には、NATOやNASAなど、単語として読み上げるべきものもあります。音声合成のフィールドにこれを反映させる必要があります。

!!!注記

    フィールドトリップ.`tts_trip_headsign`は、仕様上まだ正式なものではありません。

## 複数の意味を持つ略語の明確化

St "略語には複数の意味があります。「通り」、「聖人」、「駅」、そして「1st」は「最初の」という意味です。音声合成の分野では、正しい単語を綴り、TTSソフトウェアが読みやすい方法で行うことで、これらの二重の意味に対応することができます。
