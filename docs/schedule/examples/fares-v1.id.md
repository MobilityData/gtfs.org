---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/fares-v1.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Fares V1

<hr/>

Terdiri dari [fare_attributes.txt](../../reference/#fare_attributestxt) dan [fare_rules.txt](../../reference/#fare_rulestxt) ,Fares V1 secara historis menjadi metode resmi untuk menggambarkan informasi tarif masukGTFS . Namun kedua file tersebut terbatas pada luasnya faktor yang dapat mereka gambarkan secara efisien, dan tidak jelas untuk diterapkan.[Fares V2](../../examples/fares-v2/) adalah proyek ekstensi dalam pengembangan aktif, dan bertujuan untuk mengatasi keterbatasanFares V1 .

## Tentukan aturan tarif agen

SEBUAHtrip di jaringan kereta bawah tanah Toronto Transit Commission dikenai biaya \$3,20 CAD jika pengendara membayar menggunakan kartu PRESTO. Pengendara juga dapat berpindah ke rute kereta bawah tanah, trem, atau bus lain yang dioperasikan oleh TTC dalam waktu dua jam.

Layanan ini dapat direpresentasikan menggunakan file [fare_attributes.txt](../../reference/#fare_attributestxt) ,[fare_rules.txt](../../reference/#fare_rulestxt) , dan [transfers.txt](../../reference/#transferstxt). Berkas pertama, [fare_attributes.txt](../../reference/#fare_attributestxt) menggambarkan tarif agen, di bawah ini adalah contoh tarif presto:

[**fare_attributes.txt**](../../reference/#fare_attributestxt)

    fare_id,price,currency_type,payment_method,transfers,transfer_duration
    presto_fare,3.2,CAD,1,,7200

- Harga tarif tercantum di bawah price and `currency_type`
- Pengendara harus membayar ongkosnya di gerbang ongkos stasiun sebelum naik kereta bawah tanah. Ini diwakili oleh `payment_method=1`
- Transfer bidang dibiarkan kosong untuk mewakili transfer tak terbatas
- Bidang `transfer_duration` sesuai dengan jendela transfer 2 jam (dalam detik)

Berkas kedua,[fare_rules.txt](../../reference/#fare_rulestxt) menetapkan tarif untuk perjalanan melalui mengikat tarif ke rute serta asal/tujuan pada rute tersebut.

Untuk itu, dua jalur kereta bawah tanah ditentukan di bawah ini [routes.txt](../../reference/#routestxt) :

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_type
    TTC,Line1,1
    TTC,Line2,1

Dalam contoh ini, transfer di stasiun Bloor-Yonge dimodelkan. Untuk itu, stasiun ini dimodelkan sebagai dua perhentian terpisah, yang pertama adalah Stasiun Bloor yang dilayani oleh Jalur 1, dan yang kedua adalah stasiun Yonge yang dilayani oleh Jalur 2. Keduanya memiliki `zone_id=ttc_subway_stations` untuk mengelompokkan semua stasiun kereta bawah tanah dalam satu zona tarif.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_name,stop_lat,stop_lon,zone_id
    Bloor,Bloor Station,,43.670049,-79.385389,ttc_subway_stations
    Yonge,Yonge Station,,43.671049,-79.386789,ttc_subway_stations

Di [fare_rules.txt](../../reference/#fare_rulestxt), tarif PRESTO dikaitkan dengan jalur kereta bawah tanah dan stasiun menggunakan hubungan berikut:

- Untuk `fare_id=presto_fare` , pengendara dapat melakukan perjalanan antara dua stasiun di Jalur 1 ( `route_id=line1` ) dan `origin_id=ttc_subway_stations` dan `destination_id=ttc_subway_stations` .

[**fare_rules.txt**](../../reference/#fare_rulestxt)

    fare_id,route_id,origin_id,destination_id
    presto_fare,line1,ttc_subway_stations,ttc_subway_stations
    presto_fare,line2,ttc_subway_stations,ttc_subway_stations

Arsip ketiga,[transfers.txt](../../reference/#transferstxt) menentukan titik transfer antara rute yang berbeda. Untuk memodelkan transfer di stasiun Bloor-Yonge, diperlukan dua entri:

[**transfers.txt**](../../reference/#transferstxt)

    from_stop_id,to_stop_id,from_route_id,to_route_id,transfer_type
    Bloor,Yonge,line1,line2,0
    Yonge,Bloor,line2,line1,0

- Model pertama mentransfer dari Jalur 1 ke Jalur 2 menggunakan `from_route_id` dan `to_route_id` dari stasiun Bloor ke stasiun Yonge
- Model kedua mentransfer dari Jalur 2 ke Jalur 1 menggunakan `from_route_id` dan `to_route_id` dari stasiun Yonge ke stasiun Bloor
- Nilai untuk `transfer_type` adalah `0` karena tidak ada persyaratan atau pertimbangan khusus untuk transfer

[Contoh sumber](https://www.ttc.ca/Fares-and-passes)
