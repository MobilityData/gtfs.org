---
search:
    exclude: true
---

# Teks pidato

<hr/>

## Singkatan, pengucapan yang tidak biasa, angka besar dan ordinal

Singkatan, pengucapan yang tidak biasa, dan angka besar adalah hal yang umum GTFS bidang teks. Pada contoh di bawah untuk TriMEt, kita dapat melihat bagaimana bidang text-to-speech harus digunakan:

- Singkatan dieja secara lengkap: misalnya “SW” menjadi “southwest”; "Ave" menjadi "jalan".
- Pengucapan dieja sedemikian rupa sehingga perangkat lunak membacanya dengan benar: misalnya "Orenco" menjadi "orrainkoe"; "Merlo" menjadi "murlo".
- Digit besar dieja seperti yang akan dikatakan: "3300" menjadi "tiga puluh tiga ratus".

Jika tidak, perangkat lunak akan membaca "3300" sebagai "tiga ribu tiga ratus".

- Ordinal, seperti 1, 2 dan 3, harus dieja: misalnya “1” menjadi “pertama”.

[**stops.txt**](../../reference/#stopstxt)

| stop_id |  stop_name                         |  tts_stop_name                                                       |
| ------- | ---------------------------------- | -------------------------------------------------------------------- |
|  9163   |  SW 125th &amp; Longhorn           |  barat daya seratus dua puluh lima &amp; longhorn                    |
|  9836   |  Stasiun Orenco MAX                |  stasiun orrainkoe max                                               |
|  9828   |  Stasiun Merlo Rd/SW 158th Ave MAX |  murlo road barat daya seratus lima puluh delapan stasiun max avenue |
|  10074  |  3300 Blok NW 35th                 |  tiga puluh tiga ratus blok barat laut tiga puluh lima               |

## Akronim

Untuk akronim yang diacu dengan hurufnya, huruf-hurufnya harus diikuti dengan tanda titik atau dipisahkan dengan spasi. Ini mengklarifikasi bahwa akronim harus dibaca huruf demi huruf, dan tidak dibaca sebagai sebuah kata.

Untuk Tampa, tajuk "North to UATC" berisi akronim yang dilafalkan dengan hurufnya masing-masing. Disambiguasi text-to-speech adalah:

[**trips.txt**](../../reference/#tripstxt)

|  trip_headsign |  tts_trip_headsign |
| -------------- | ------------------ |
|  Utara ke UATC |  utara ke u.a.t.c.     |

atau

|  trip_headsign |  tts_trip_headsign |
| -------------- | ------------------ |
|  Utara ke UATC |  utara ke u a t c     |

Sebaliknya, beberapa akronim harus dibaca sebagai kata-kata: misalnya NATO; NASA. Bidang text-to-speech harus mencerminkan hal ini.

!!! Catatan

    Field `trips.tts_trip_headsign` belum resmi di spesifikasi.

## Mengklarifikasi singkatan dengan banyak arti

Singkatan "St" memiliki banyak arti: "jalan", "santo", "stasiun", dan "1" berarti "pertama". Bidang text-to-speech dapat mengatasi inidouble artinya dengan mengeja kata yang benar, dan melakukannya dengan cara yang dapat dibaca oleh perangkat lunak TTS.
