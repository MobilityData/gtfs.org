---
search:
  exclude: true
---

# Jalur

<hr/>

## Jelaskan lokasi pintu masuk dan keluar stasiun

Dengan GTFS, stasiun dapat dideskripsikan secara akurat menggunakan informasi tentang pintu masuk dan interior stasiun. Contoh ini menggambarkan bagian stasiun Waterfront di pusat kota Vancouver. Stasiun ini merupakan bagian dari jaringan Skytrain kota dan dilayani oleh Canada Line, Expo Line, SeaBus, dan West Coast Express. Tiga pintu masuk tingkat jalan memungkinkan pengendara masuk dan keluar stasiun. Stasiun lainnya berada di bawah tanah dengan tingkat concourse untuk validasi tarif dan tingkat yang lebih rendah dengan platform.

Pertama, lokasi stasiun dan pintu masuknya ditentukan [stops.txt](../../reference/#pathwaystxt) :

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    12034,Waterfront Station,49.285687,-123.111773,1,,
    90,Waterfront Station Stairs Entrance on Granville,49.285054,-123.114375,2,12034,2
    91,Waterfront Station Escalator Entrance on Granville,49.285061,-123.114395,2,12034,2
    92,Waterfront Station Elevator Entrance on Granville,49.285257,-123.114163,2,12034,1
    93,Waterfront Station Entrance on Cordova,49.285607,-123.111993,2,12034,1
    94,Waterfront Station Entrance on Howe,49.286898,-123.113367,2,12034,2

Pada file di atas, record pertama berkaitan dengan lokasi stasiun, oleh karena itu, `location_type` diatur ke `1` . Lima lainnya berkaitan dengan tiga pintu masuk stasiun (lima catatan diperlukan karena pintu masuk Granville sebenarnya memiliki tiga pintu masuk terpisah, tangga, eskalator, dan lift). Kelima catatan ini didefinisikan sebagai pintu masuk karena `location_type` diatur ke `3` .

Selain itu,stop_id untuk Stasiun Waterfront terdaftar di bawah `parent_station` untuk pintu masuk yang menghubungkannya dengan stasiun. Pintu masuk yang dapat diakses memiliki `wheelchair_boarding` yang disetel ke `1` dan yang tidak dapat diakses disetel ke `2` .

## Jelaskan tangga dan eskalator

Pintu masuk ke Stasiun Waterfront di jalan Granville memiliki lift, eskalator, dan tangga, pintu masuk didefinisikan sebagai node di atas [stops.txt](../../reference/#stopstxt) . Untuk menghubungkan pintu masuk ke bagian dalam stasiun, node tambahan harus dibuat [stops.txt](../../reference/#stopstxt) di bawah `parent_station` dari Waterfront Station. Dalam [stops.txt](../../reference/#stopstxt) file di bawah, node generik ( `location_type 3` ) yang sesuai dengan bagian bawah tangga dan eskalator ditentukan.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    ...
    95,Waterfront Station Granville Stair Landing, 49.285169,-123.114198,3,12034,
    96,Waterfront Station Granville Escalator Landing,49.285183,-123.114222,3,12034,

<img class="center" src="../../../assets/pathways.png" width="700px"/>

Selanjutnya, file [pathways.txt](../../reference/#pathwaystxt) digunakan untuk menghubungkan node untuk membuat jalur, di mana record pertama menghubungkan node yang berkaitan dengan bagian atas dan bawah tangga. `pathway_mode` diatur ke `2` untuk menunjukkan tangga, dan bidang terakhir menjelaskan bahwa penumpang dapat berjalan dua arah (naik dan turun) di tangga.

Demikian pula, catatan kedua menjelaskan eskalator ( `pathway_mode` diatur ke `4` ). Karena eskalator hanya dapat bergerak dalam satu arah, bidang `is_bidirectional` diatur ke `0` , sehingga eskalator bergerak satu arah, dari node `96` ke `91` (ke atas).

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    stairsA,90,95,2,1
    escalatorA,96,91,4,0

## Jelaskan lift dan jalur

Lift di jalan Granville membawa penumpang ke jalur di tingkat concourse tempat eskalator dan tangga beradaend . Lift di tingkat permukaan sudah didefinisikan sebagai pintu masuk stasiun di atas (`stop_id 92` ). Oleh karena itu, pintu lift di tingkat concourse juga perlu ditentukan.

Selain itu, seperti yang ditunjukkan pada gambar di bawah, terdapat jalan bawah tanah yang menghubungkan bagian bawah tangga, eskalator, dan elevator di jalan Granville ke gedung stasiun utama. Oleh karena itu, dua node tambahan dibuat untuk menentukan bagian jalan.

<img class="center" src="../../../assets/pathways-2.png" width="500px"/>

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,location_type,parent_station,wheelchair_boarding
    …
    97,Underground walkway turn,49.286253,-123.112660,3,12034,
    98,Underground walkway end,49.286106,-123.112428,3,12034,
    99,Elevator_concourse,49.285257,-123.114163,3,12034,

<img class="center" src="../../../assets/pathways-3.png" width="500px"/>

Terakhir, node dihubungkan bersama untuk menentukan jalur bawah tanah seperti yang ditunjukkan pada file [pathways.txt](../../reference/#pathwaystxt) di bawah:

[**pathways.txt**](../../reference/#pathwaystxt)

    pathway_id,from_stop_id,to_stop_id_pathway_mode,is_bidirectional
    underground_walkway1,99,96,1,1
    underground_walkway2,96,95,1,1
    underground_walkway3,95,97,1,1
    underground_walkway4,97,98,1,1
