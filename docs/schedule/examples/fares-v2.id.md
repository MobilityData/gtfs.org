---
search:
  exclude: true
---

# Fares V2

<hr/>

Fares V2 adalah GTFS proyek ekstensi yang bertujuan untuk mengatasi keterbatasan Fares V1 . Proyek perluasan ini diadopsi dalam iterasi, dan contoh di bawah menunjukkan apa yang dapat dimodelkan menggunakan porsi dari Fares V2 yang telah diadopsi dalam spesifikasi resmi. Lihat informasi lebih lanjut tentang [Fares V2 proyek ekstensi](../../../extensions/fares-v2) .

Untuk sementara, produsen dapat menerapkan Fares V2 di samping implementasi dari Fares V1 dalam kumpulan data yang sama karena tidak ada konflik teknis antara keduanya. Konsumen akan memiliki pilihan implementasi mana yang akan dikonsumsi secara independen dari yang lain. Dengan adopsi dan dukungan yang memadai Fares V2 ,Fares V1 mungkin akan ditinggalkan di masa mendatang.

## Tentukan tarif transit

Ada beberapa cara untuk membayar ongkos menggunakan sistem transit TTC di Toronto. TTC menyediakan dua opsi harga tarif tergantung pada metode pembayaran. Tarif dewasa adalah 3,20 CAD untuk bepergian jika menggunakan kartu PRESTO, sedangkan tarif yang sama adalah 3,25 CAD untuk bepergian jika membayar dengan uang tunai.

Tiket atau tarif transit dapat dijelaskan menggunakan [fare_products.txt](../../reference/#fare_productstxt) mengajukan. Setiap entri sesuai dengan tarif tertentu.

[**fare_products.txt**](../../reference/#fare_productstxt)

    fare_product_id,fare_product_name,amount,currency
    presto_fare,PRESTO Card Fare,3.2,CAD
    cash_fare,Cash Fare,3.25,CAD

[Contoh sumber](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Jelaskan lokasi layanan di zona tarif yang sama

Beberapa agen transit mengoperasikan struktur tarif berbasis zona. Zona tarif dibagi wilayah geografis yang terkait dengan harga tarif yang berbeda. Apakah mereka bepergian dalam satu zona atau dari satu zona ke zona lainnya, penumpang transit perlu mengetahui tarif yang tepat. Dalam sistem TTC Toronto, hanya ada satu zona tarif. Pengendara transit hanya perlu membayar tarif tiket tunggal yang sama untuk semuatrip jarak dalam batas Kota Toronto, apa pun bentuk transit yang digunakan.

Zona tarif dapat dideskripsikan menggunakan file [stops_areas.txt](../../reference/#stops_areastxt) , yang menentukan asal perhentian [stops.txt](../../reference/#stopstxt) ke [areas.txt](../../reference/#areastxt).

Pertama, identifikasi area (zona tarif).

[**areas.txt**](../../reference/#areastxt)

    area_id,area_name
    ttc_service_area,TTC Fare Zone

Setelah itu, menggunakan `stop_id` dari [stops.txt](../../reference/#stopstxt) file, grup berhenti bersama ke area yang ditentukan masing-masing (zona tarif).

[**stop_areas.txt**](../../reference/#stops_areastxt)

    area_id,stop_id
    ttc_service_area,262
    ttc_service_area,263
    ttc_service_area,264
    ttc_service_area,265
    ttc_service_area,266
    …

[Contoh sumber](http://opendata.toronto.ca/toronto.transit.commission/ttc-routes-and-schedules/OpenData_TTC_Schedules.zip)

<hr/>

## Buat aturan untuk perjalanan satu kaki

DiGTFS , kaki tarif sesuai dengan atrip yang dibuat pengendara tanpa berpindah antar moda, rute, jaringan, atau agensi yang berbeda. Tarif tunggal memungkinkan pengendara untuk melakukan perjalanan dalam sepasang halte bus, stasiun kereta bawah tanah, dan halte trem dalam jaringan TTC.

Grup kaki menentukan perjalanan dalam jaringan dari asal ke tujuan (atau sekumpulan asal ke sekumpulan tujuan jika ID area sesuai dengan perhentian yang dikelompokkan). File di bawah menjelaskan dua aturan untuk bepergian ke mana saja dalam jaringan TTC. Aturan pertama berkaitan dengan bepergian menggunakan tarif PRESTO dan aturan kedua berkaitan dengan bepergian menggunakan tarif tunai.

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

    leg_group_id,network_id,from_area_id,to_area_id,fare_product_id
    ttc_trip_presto,ttc_network,ttc_service_area,ttc_service_area,presto_fare
    ttc_trip_cash,ttc_network,ttc_service_area,ttc_service_area,cash_fare

[Contoh sumber](https://www.ttc.ca/Fares-and-passes)

<hr/>

## Buat aturan untuk transfer

Penunggang yang menggunakan kartu PRESTO mereka untuk mengendarai TTC memiliki jendela transfer tak terbatas selama 2 jam. Ini berarti bahwa mereka dapat mentransfer jumlah yang tidak terbatas antara bus agensi, kereta bawah tanah, dan trem dalam jangka waktu 2 jam.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

    from_leg_group_id,to_leg_group_id,transfer_count,duration_limit,duration_limit_type,fare_transfer_type,fare_product_id
    ttc_trip_presto,ttc_trip_presto,-1,7200,3,0,free_transfer

File di atas mewakili ini diGTFS dengan bidang berikut:

- Transfer dimungkinkan ke dan dari leg yang dibayar dengan kartu PRESTO ( `ttc_trip_presto` )
- Itu `transfer_count` diatur ke `-1` karena tidak ada batasan jumlah transfer yang diizinkan
- Itu `duration_limit` diatur ke `7200` detik, yang setara dengan 2 jam
- `duration_limit_type` disetel ke `3` , karena pengendara harus mengetuk kartu PRESTO segera setelah memasuki zona tarif berbayar atau segera setelah naik bus atau trem. Ini sesuai denganarrival validasi tarif kaki saat ini danarrival validasi tarif leg berikutnya.
- `fare_transfer_type` diatur ke `0` karena pengendara hanya membayar tarif pertama saja. Tidak ada biaya transfer atau tarif kedua untuk mentransfer dalam jendela 2 jam. Oleh karena itu, biaya dapat dimodelkan sebagai jumlah tarif pertama dan jumlah biaya transfer.
- Biaya transfer ditetapkan nol karena gratis dalam sistem TTC. Ini ditunjukkan oleh `fare_product_id=free_transfer` .

[Contoh sumber](https://www.ttc.ca/Fares-and-passes/PRESTO-on-the-TTC/Two-hour-transfer)
