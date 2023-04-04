# Fares V2

<hr/>

Fares V2 adalah GTFS proyek ekstensi yang bertujuan untuk mengatasi keterbatasan Fares V1 . Proyek ekstensi ini diadopsi dalam iterasi. Contoh di bawah menguraikan cara memodelkan konsep dasar, termasuk produk tarif dan bagaimana pengendara dapat menggunakan tarif mereka untuk transfer. Lihat informasi lebih lanjut [tentang](/extensions/fares-v2/) Fares V2 [proyek perpanjangan di sini](/extensions/fares-v2/) .

Untuk sementara, produsen dapat menerapkan Fares V2 di samping implementasi dari Fares V1 dalam kumpulan data yang sama karena tidak ada konflik teknis antara keduanya. Konsumen akan memiliki pilihan implementasi mana yang akan dikonsumsi secara independen dari yang lain. Dengan adopsi dan dukungan yang memadai Fares V2, Fares V1 mungkin akan ditinggalkan di masa mendatang.

## Tentukan tarif transit

Ada beberapa cara untuk membayar tarif menggunakan sistem Maryland Transit Administration. <a href="https://www.mta.maryland.gov/regular-fares" target="_blank">Ada empat jenis reguler penuh pilihan tarif harga</a>

- Tiket sekali jalan seharga $2,00 USD
- Tiket harian seharga $4,60 USD
- Tiket masuk mingguan seharga $22 USD
- Pass bulanan seharga $77 USD

Tiket atau tarif transit disebut sebagai produk tarif di GTFS. Mereka dapat dijelaskan menggunakan [fare_products.txt](../../reference/#fare_productstxt) mengajukan. Setiap entri sesuai dengan tarif tertentu.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id         |  fare_product_name                 | amount | currency |
| ----------------------- | ---------------------------------- |--------|----------|
|  core_local_oneway_fare |  One Way Full Fare              | 2.00   | USD      |
|  core_local_1_day_fare  |  1-Day Pass - Core Service | 4.60   | USD      |
|  core_local_31_day_fare |  31-Day Pass - Core Service     | 77.00  | USD      |
|  core_local_7_day_fare  |  7-Day Pass - Core Service      | 22.00  | USD      |

<sup>[Unduh bus lokal Maryland Transit Administration GTFS memberi makan](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Buat aturan untuk perjalanan satu kaki

Di dalam GTFS, tarif sesuai dengan perjalanan yang dilakukan pengendara tanpa berpindah antar moda, rute, jaringan, atau agensi yang berbeda. Dalam umpan Maryland Transit Administration, satu tarif memungkinkan pengendara untuk melakukan perjalanan dalam sepasang halte dan stasiun kereta bawah tanah dalam jaringan `core` bus BaltimoreLink, rute Light RailLink, dan Metro SubwayLink.

Grup kaki menentukan perjalanan dalam jaringan dari asal ke tujuan (atau sekumpulan asal ke sekumpulan tujuan jika ID area sesuai dengan perhentian yang dikelompokkan). File di bawah menjelaskan aturan untuk bepergian ke mana pun dalam jaringan inti Maryland Transit Administration. Setiap aturan terkait dengan salah satu produk tarif reguler di [contoh Tentukan tarif transit](#tentukan-tarif-transit) .

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id            | network_id | fare_product_id         |
| ------------------------ |------------| ----------------------- |
|  core_local_one_way_trip | core       |  core_local_oneway_fare |
|  core_local_one_way_trip | core       |  core_local_1_day_fare  |
|  core_local_one_way_trip | core       |  core_local_31_day_fare |
|  core_local_one_way_trip | core       |  core_local_7_day_fare  |

<sup>[Unduh bus lokal Maryland Transit Administration GTFS memberi makan](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Buat aturan untuk transfer

Ada transfer 90 menit untuk pengendara yang membeli ongkos sekali jalan untuk naik bus lokal BaltimoreLink, Metro SubwayLink, atau Light RailLink. Ini berarti bahwa mereka dapat mentransfer jumlah yang tidak terbatas antara bus lokal, kereta bawah tanah, dan kereta ringan dalam jangka waktu 90 menit.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id        | to_leg_group_id          | duration_limit | duration_limit_type |  fare_transfer_type | transfer_count |
| ------------------------ | ------------------------ | -------------- | ------------------- | ------------------- | -------------- |
|  core_local_one_way_trip |  core_local_one_way_trip |  5400          |  1                  |  0                  |  -1            |

File di atas mewakili ini di GTFS dengan bidang berikut:

- Transfer dimungkinkan ke dan dari kaki yang merupakan perjalanan satu arah ( `core_local_one_way_trip` )
- Itutransfer_count diatur ke `-1` karena tidak ada batasan jumlah transfer yang diizinkan
- Ituduration_limit diatur ke `5400` detik, yang setara dengan 90 menit
- Ituduration_limit_type diatur ke `1` karena waktu transfer dimulai saat pengendara berangkat pada rute mana pun di segmen tarif `core_local_one_way_trip` dan berakhir saat mereka berangkat dengan segmen tarif yang berbeda.
- `fare_transfer_type` diatur ke `0` karena pengendara hanya membayar tarif pertama saja. Tidak ada biaya transfer atau tarif kedua untuk mentransfer dalam jendela 90 menit. Oleh karena itu, biaya dapat dimodelkan sebagai jumlah tarif pertama dan jumlah biaya transfer.
- Itu `transfer_count` diatur ke `-1` karena pengendara dapat men transfer jumlah yang tidak terbatas dalam 90 menit `duration_limit` jendela.

Setelah menentukan tarif, membuat `fare_leg_rule` yang sesuai, dan menentukan `fare_transfer_rule` , Anda dapat melihat `core_local_oneway_fare` \$2,00 USD muncul di perencana perjalanan. Berikut adalah contoh dari Transit:

<div class="flex-photos"><img src="../../../assets/transit-fares-mdot.png" alt="tarif $2 USD"/></div>

[Unduh bus lokal Maryland Transit Administration GTFS memberi makan](https://feeds.mta.maryland.gov/gtfs/local-bus)

## Jelaskan lokasi layanan di zona tarif yang sama

Beberapa agen transit mengoperasikan struktur tarif berbasis zona. Zona tarif dibagi wilayah geografis yang terkait dengan harga tarif yang berbeda. Dalam sistem BART Bay Area, tarif berbeda tergantung pada asal dan tujuan [(perbedaan tarif BART)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf) , dan pengendara transit perlu mengetahui tarif yang tepat. Area tarif dapat dideskripsikan menggunakan file [stops_areas.txt](../../reference/#stops_areastxt) , yang menetapkan titik perhentian [stops.txt](../../reference/#stopstxt) ke [areas.txt](../../reference/#areastxt).

Pertama, identifikasi area di `areas.txt` . Boleh dibiarkan kosong `area_name` jika tidak ada nama area. Pada tabel di bawah ini, ada tigaarea_id `ASHB` , `GLEN` , dan `OAKL` .

[**areas.txt**](../../reference/#areastxt)

| area_id       |  area_name |
| ------------- | ---------- |
|  ASB          |            |
|  GLEN |            |
|  OAKL         |            |

Setelah itu, menggunakan `stop_id` dari [stops.txt](../../reference/#stopstxt) file, grup berhenti bersama ke area yang ditentukan masing-masing (zona tarif).

Selanjutnya, kelompok `stop_id` untuk masing-masing `area_id`. Dalam contoh BART, setiap area hanya berisi 1 `stop_id`. Misalnya, hanya halte `ASHB` (Ashby Station) yang termasuk dalam area `ASHB` Namun, jika suatu area mencakup banyak halte, beberapa `stop_id` harus dicantumkan.

[**stop_areas.txt**](../../reference/#stops_areastxt)

| area_id       | stop_id       |
| ------------- | ------------- |
|  ASB          |  ASB          |
|  GLEN |  GLEN |
|  OAKL         |  OAKL         |

Di dalam `fare_leg_rules.txt`, produk tarif yang berbeda dapat diidentifikasi berdasarkan area keberangkatan dan kedatangan yang berbeda. Misalnya, entri pertama menunjukkan:

- Area keberangkatan adalah `ASHB`
- Area kedatangan adalah `GLEN`
- Produk tarif untuk area keberangkatan/kedatangan adalah `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

|  leg_group_id | from_area_id | to_area_id    | fare_product_id       |
| ------------- | ------------ | ------------- | --------------------- |
|  BA           |  ASB         |  GLEN |  BA:matrix:ASHB-GLEN |
|  BA           |  ASKB        |  OAKL         |  BA:matrix:ASHB-OAKL |

Tarifnya tertera di `fare_products.txt`.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id       |  fare_product_name | amount | currency |
| --------------------- | ------------------ |--------|----------|
|  BA:matrix:ASHB-GLEN |  generated       | 4.75   | USD      |
|  BA:matrix:ASHB-OAKL |  generated       | 9.45   | USD      |

<sup><a href="https://511.org/open-data/transit" target="_blank">Lihat feed Wilayah Teluk San Francisco</a></sup>

<hr/>

## Jelaskan media tarif apa yang diterima

Pengendara San Francisco Muni dapat menggunakan beberapa jenis media tarif yang berbeda untuk membayar perjalanan mereka dan memvalidasi tarif mereka:

- Gunakan <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">kartu Clipper</a>,, kartu transit Bay Area
- Gunakan <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">aplikasi Munimobile</a>
- Bayar ongkosnya secara tunai

Metode validasi ini disebut sebagai `fare_media` in GTFS-Fares V2 dan dapat dideskripsikan menggunakan `fare_media.txt` .

Di bawah ini adalah contoh cuplikan dari <a href="https://511.org/open-data/transit" target="_blank">San Francisco Bay Area Regional Feed</a> yang dapat diakses dengan 511 SF Bay API.

`Clipper` digambarkan sebagai kartu transit fisik dengan `fare_media_type=2`. `SFMTA Munimobile` digambarkan sebagai aplikasi seluler dengan `fare_media_type=2` . `Cash` tidak memiliki media tarif, karena diberikan langsung kepada pengemudi tanpa tiket. Akibatnya, `Cash` menjadi `fare_media_type=0`.

Produser yang ingin mendeskripsikan tiket fisik sebagai jenis media tarif dapat menggunakan opsi eksperimental `fare_media_type=1` yang ada di <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">penuh Fares V2 usulan</a>.

[**fare_media.txt**](../../reference/#fare_mediatxt)

|  fare_media_id | fare_media_name  |  fare_media_type |
| -------------- |------------------| ---------------- |
|  clipper | Clipper          |  2               |
|  munimobile    | SFMTA MuniMobile |  4               |
|  cash    | Cash             |  0               |

<sup><a href="https://511.org/open-data/transit" target="_blank">Lihat feed Wilayah Teluk San Francisco</a>

## Menentukan perbedaan harga berdasarkan media tarif

Harga tarif Muni berbeda berdasarkan media tarif yang digunakan pengendara. Contoh ini akan mencakup perubahan harga tarif lokal dewasa saat menggunakan uang tunai atau kartu Clipper. Tarif lokal dewasa yang dibayar dengan uang tunai seharga 3 USD dan tarif yang sama yang dibayarkan dengan kartu Clipper berharga 2,50, lebih murah 50 sen.

Setiap entri di bawah ini menjelaskan media tarif.

[**fare_media.txt**](../../reference/#fare_mediatxt)

|  fare_media_id |  fare_media_name |  fare_media_type |
| -------------- | ---------------- | ---------------- |
|  alat pemotong |  Alat pemotong   |  2               |
|  uang tunai    |  Uang tunai      |  0               |

Itu `fare_products.txt` cuplikan file di bawah ini menunjukkan bagaimana jumlah produk `Muni single local fare` bervariasi tergantung pada media tarif yang digunakan pengendara.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     |  fare_product_name        |  amount | currency | fare_media_id |
| ------------------- | ------------------------- | ------- |----------|---------------|
|  SF:local:single |  Muni single local fare |  3      | USD      | cash          |
|  SF:local:single |  Muni single local fare |  2.5    | USD      | clipper       |

Di Apple Maps, pengendara dapat melihat perubahan harga tarif mereka. Anda dapat membandingkan harga tarif berdasarkan instruksi "Board the Muni J Church train":

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="tarif tunai $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Tarif kartu clipper $2,50 USD"/>
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">Lihat feed Wilayah Teluk San Francisco</a></sup>

## Jelaskan opsi media tarif nirsentuh

<a href="https://vimeo.com/539436401" target="_blank">Clean Air Express di Northern Santa Barbara County menerima pembayaran tanpa kontak</a> dengan kartu kredit, Google Pay, dan Apple Pay.

Di feed Clean Air Express, ada media tarif `tap_to_ride` dengan `fare_media_type=3` , karena ini adalah opsi cEMV (Europay, Mastercard, dan Visa nirkontak).

|  fare_media_id |  fare_media_name        |  fare_media_type |
| -------------- | ----------------------- | ---------------- |
|  tap_to_ride   |  Tap to Ride |  3               |

Produk tarif sekali jalan yang ditunjukkan di bawah ini memiliki opsi media tarif `cash` dan `tap-to-ride` . Ketika sekali perjalanan dibayar dengan media tarif `tap-to-ride` , harganya lebih murah satu dolar USD.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     |  fare_product_name  |  fare_media_id |  jumlah |  mata uang |
| ------------------- | ------------------- | -------------- | ------- | ---------- |
|  single-ride |  Single Ride |  tap_to_ride   |  6      |  USD       |
|  single-ride |  Single Ride |                |  7      |  USD       |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">GTFS Unduh feed Clean Air Express</a></sup>
