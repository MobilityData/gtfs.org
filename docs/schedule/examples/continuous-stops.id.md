---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/continuous-stops.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Berhenti terus menerus

<hr/>

## Pickup dan drop off di mana-mana

Agen transit The Current (Rockingham, US-VT) menerapkan kebijakan berhenti terus-menerus di rute 2, 53, dan 55. Pengendara dapat dijemput dan diantar antara scheduled berhenti di sepanjang rute, asalkan ada tempat yang aman bagi bus untuk berhenti.

Berkas [routes.txt](../../reference/#routestxt)  digunakan untuk menjelaskan layanan ini menggunakan bidang `continuous_pickup` dan `continuous_drop_off` . Bidang diatur ke `0` untuk menunjukkan bahwa pengambilan dan pengantaran terus menerus diizinkan.

[**routes.txt**](../../reference/#routestxt)

    route_id,route_short_name,route_long_name,route_type,continuous_pickup,continuous_drop_off
    2,2,Bellows Falls In-Town,3,0,0
    53,53,Bellows Falls / Battleboro Commuter,3,0,0
    55,55,Bellows Falls / Springfield Shuttle,3,0,0

[Contoh sumber](https://crtransit.org/bus-schedules/)

<hr/>

## Penjemputan dan pengantaran di bagian rute

Agen transit Victor Valley Transit (Victorville, US-CA) menerapkan kebijakan berhenti terus-menerus hanya pada bagian dari rute 22. Penumpang hanya dapat naik dan turun dari bus di lokasi aman mana pun dalam zona County Fare. Penjemputan dan pengantaran terus-menerus tidak dimungkinkan dalam zona Tarif Lokal.

Zona Tarif Lokal dan zona Tarif Kabupaten dipisahkan oleh Air Expressway seperti yang ditunjukkan pada gambar di bawah ini. Itu scheduled halte National Trails Highway - Air Expressway terletak sedikit di utara perbatasan ini. Agar akurat, agen transit dapat menambahkan perhentian di persimpangan rute bus yang sebenarnya dengan batas, dari mana tersedia penjemputan dan pengantaran terus menerus. Perhentian ini mungkin tetap ada unscheduled .

![](../../assets/victor-valley-transit.svg)

Ini dijelaskan menggunakan file [stops.txt](../../reference/#stopstxt) dan [stop_times.txt](../../reference/#stoptimestxt) :

- File pertama menentukan perhentian di sepanjang rute
- File kedua menentukan aturan pengambilan dan pengantaran terus menerus di antara perhentian.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon
    A,Victoriaville Transfer Station,34.514356,-117.318323
    B,Dante St & Venus Ave,34.564499,-117.287097
    C,Victorville Transportation Center,34.538433,-117.294703
    X,Local/County Fare Boundary,34.566224,-117.318357
    D,National Trails Highway - Air Expressway,34.567536,-117.319716
    E,Oro Grande Post Office,34.599292,-117.334452
    F,Silver Lakes Market,34.744662,-117.335407

Di [stop_times.txt](../../reference/#stoptimestxt) , untuk diberikantrip :

- Catatan dengan `continuous_pickup=0` menunjukkan bahwa pengambilan terus menerus diizinkan dari perhentian tersebut hingga perhentian berikutnya
- Catatan dengan `continuous_pickup=1` menunjukkan bahwa pengambilan terus menerus dilarang dari perhentian tersebut hingga perhentian berikutnya

[**stop_times.txt**](../../reference/#stoptimestxt)

    trip_id,stop_id,stop_sequence,departure_time,arrival_time,continuous_pickup,continuous_drop_off,timepoint
    22NB9AM,A,1,09:00:00,09:00:00,1,1,1
    22NB9AM,B,2,09:14:00,09:14:00,1,1,1
    22NB9AM,C,3,09:21:00,09:21:00,1,1,1
    22NB9AM,X,4,,,0,0,0
    22NB9AM,D,5,09:25:00,09:25:00,0,0,1
    22NB9AM,E,6,09:31:00,09:31:00,0,0,1
    22NB9AM,F,7,09:46:00,09:46:00,0,0,1

Logika yang sama berlaku untuk bidang `continuous_drop_off` tetapi untuk kasus drop off.

Pada contoh di atas, perhentian A, B, C memiliki continuous_pickup dan `continuous_drop_off` disetel ke `1` , yang melarang pengambilan dan pengantaran terus menerus di antaranya. Perhentian `X` , `D` , `E` , dan `F` memiliki bidang `continuous_pickup` dan `continuous_drop_off` disetel ke `0` , yang memungkinkan pengambilan dan pengantaran terus menerus di antaranya.

[Contoh sumber](https://vvta.org/routes/route-22/)
