---
search:
  exclude: true
---

<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/routes-stops-trips.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# Rute, pemberhentian, dan perjalanan

<hr/>

## Rute

Rute merupakan inti dari operasi transit rute tetap karena menggambarkan jangkauan geografis jaringan transit. DiGTFS , menentukan rute adalah langkah pertama untuk menjelaskan operasi agen transit.

Langkah pertama adalah menambahkan informasi agensi seperti yang ditunjukkan pada file [agency.txt](../../reference/#agencytxt) di bawah. File ini berisi informasi tingkat tinggi tentang agensi.

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang,agency_phone
    CT,Calgary Transit,http://www.calgarytransit.com,America/Edmonton,,403-262-1000

Calgary Transit mengoperasikan LRT, BRT, layanan bus reguler, paratransit, dan transit berdasarkan permintaan di Calgary, AB. Dalam contoh ini, dua rute ditentukan, yang pertama adalah bus dan yang kedua adalah LRT. Menggunakan file [routes.txt](../../reference/#routestxt) , setiap rute ditugaskan unikid , dan nama pendek serta nama panjang agar mudah dibaca manusia.

[**routes.txt**](../../reference/#routestxt)

    agency_id,route_id,route_short_name,route_long_name,route_type,route_url,route_color,route_text_color
    CT,303-20670,303,MAX Orange Brentwood/Saddletowne,3,www.calgarytransit.com/content/transit/en/home/rider-information/max.html,#ff8000,#ffffff
    CT,202-20666,202,Blue Line - Saddletowne/69 Street CTrain,0,www.calgarytransit.com/content/transit/en/home/rider-information/lrt-and-bus-station-maps.html,#ff0000,#ffffff

Bidang kelima (route_type ) digunakan untuk membedakan jenis rute:

- Yang pertama adalah bus, maka `route_type=3`
- Yang kedua adalah LRT, maka `route_type=0`
- Daftar lengkap nilai untukroute_type dapat ditemukan [di sini](../../reference/#routestxt)

Bidang yang tersisa berisi informasi tambahan seperti aurl khusus untuk rute serta warna khusus agensi untuk mewakili layanan di peta.

<hr/>

## Berhenti

DiGTFS , perhentian dan stasiun dijelaskan menggunakan file [stops.txt](../../reference/#stopstxt) , di bawah, halte bus ditentukan dalam catatan pertama dan stasiun LRT ditentukan dalam catatan kedua.

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_lat,stop_lon,location_type
    8157,8157,44th Avenue NE (SB),51.091106,-113.958565,0
    6810,6810,NB Marlborough CTrain Station,51.058990,-113.981582,0

- `stop_id` adalah pengidentifikasi unik
- `stop_code` dan `stop_name` biasanya berisi informasi pengendara
- Lokasi tepatnya disediakan menggunakan koordinat ( `stop_lat` dan `stop_lon` )
- Kolom keenam ( `location_type` ) digunakan untuk membedakan perhentian dari stasiun
- Rekor pertama sesuai dengan halte bus, maka `location_type=0`
- Catatan kedua sesuai dengan stasiun, maka `location_type=1`
- Daftar lengkap nilai untuk `location_type` dapat ditemukan [di sini](../../reference/stopstxt)

<hr/>

## Perjalanan

Setelah mendeskripsikan rute-rute agensi, sekarang dimungkinkan untuk mendeskripsikan perjalanan-perjalanan yang dilayani oleh masing-masing rute.

Pertama, rentang layanan perlu didefinisikan menggunakan [calendar.txt](../../reference/#calendartxt) .

[**calendar.txt**](../../reference/#calendartxt)

    service_id,monday,tuesday,wednesday,thursday,friday,saturday,sunday,start_date,end_date
    weekend_service,0,0,0,0,0,1,1,20220623,20220903

Di sini, layanan yang hanya berjalan pada hari Sabtu dan Minggu dijelaskan, jadi bidang untuk hari tersebut diisi dengan 1, dan bidang untuk sisa hari diisi dengan nol. Layanan ini berjalan dari 23 Juni 2022 hingga 3 September 2022 seperti yang ditunjukkan di bawah kolom `start_date` dan `end_date` .

Dalam contoh ini, file [trips.txt](../../reference/#tripstxt) menggambarkan 3 perjalanan akhir pekan yang dilayani oleh rute MAX Orange yang telah dijelaskan di atas.

[**trips.txt**](../../reference/#tripstxt)

    route_id,service_id,trip_id,trip_headsign,direction_id,shape_id
    303-20670,weekend_service,60270564,"MAX ORANGE SADDLETOWNE",0,3030026
    303-20670,weekend_service,60270565,"MAX ORANGE BRENTWOOD",1,3030027
    303-20670,weekend_service,60270566,"MAX ORANGE BRENTWOOD",1,3030027

- Itu `route_id` dari [routes.txt](../../reference/#routestxt) yang sesuai dengan MAX Orange terdaftar
- Itu `service_id` dari [calendar.txt](../../reference/#calendartxt) yang sesuai dengan akhir pekan terdaftar
- Setiap catatan berisi unikid untuk setiaptrip

Tanda kepalatext disediakan, yang biasanya ditampilkan pada tanda di dalam dan di luar bus

- Lapangan `direction_id` memungkinkan perbedaan antara perjalanan dari rute yang sama menuju arah yang berbeda. Misalnya, membedakan antara perjalanan masuk dan perjalanan keluar - atau perjalanan ke selatan dan perjalanan ke utara.
  - Dalam hal ini, perjalanan menuju Saddletowne memiliki `direction_id=0` dan perjalanan menuju Brentwood memiliki `direction_id=1` . Nilai-nilai didirection_id tidak memiliki arti yang melekat, mereka hanya digunakan untuk menetapkan satu arah perjalanan versus yang lain
- Itu `shape_id` dari [shapes.txt](../../reference/#shapestxt) yang sesuai dengan rute MAX Orange menuju Saddletowne terdaftar untuk rekor pertama dan satu untuk rute MAX Orange menuju Brentwood terdaftar untuk rekor kedua dan ketiga

`shape_id=3030026` sesuai dengan MAX Orange menuju Saddletowne. File di bawah berisi informasi tentang titik-titik yang menguraikan rute serta jarak antara titik-titik tersebut. Dengan informasi ini, dimungkinkan untuk memplot rute di petatrip tujuan perencanaan atau analitik.

[**shapes.txt**](../../reference/#shapestxt)

    shape_id,shape_pt_lat,shape_pt_lon,shape_pt_sequence,shape_dist_traveled
    3030026,51.086506,-114.132259,10001,0.000
    3030026,51.086558,-114.132371,10002,0.010
    3030026,51.086781,-114.132865,10003,0.052
    3030026,51.086938,-114.133179,10004,0.080
    3030026,51.086953,-114.133205,10005,0.083
    3030026,51.086968,-114.133224,10006,0.085
    3030026,51.086992,-114.133249,10007,0.088
    3030026,51.087029,-114.133275,10008,0.093
    3030026,51.087057,-114.133286,10009,0.096
    3030026,51.087278,-114.133356,10010,0.121
    3030026,51.087036,-114.132864,10011,0.165
    3030026,51.086990,-114.132766,10012,0.173
    3030026,51.086937,-114.132663,10013,0.183

<hr/>

## Pengecualian layanan

Dimungkinkan untuk menentukan pengecualian untuk layanan seperti hari layanan tambahan hari kerja (hari khusus) atau hari kerja yang dihapus (seperti tidak ada layanan pada hari libur).

Misalnya, jika tidak ada layanan terjadwal pada hari Minggu 17 Juli 2022 - maka tanggal tersebut dapat dihapus dari `weekend_service` di [calendar.txt](../../reference/#calendartxt)  dengan memecah layanan menjadi dua:

|  Melayani          | start      | end        |
| ------------------ | ---------- | ---------- |
| `weekend_service1` | `20220623` | `20220716` |
| `weekend_service2` | `20220718` | `20220903` |

Namun, ini memperumit file sejak `service_id` rusak menjadi dua dan istirahat ini akan mengalir ke [trips.txt](../../reference/#tripstxt) . Sebaliknya, ini dapat dilakukan dengan cara yang lebih mudah menggunakan [calendar_dates.txt](../../reference/#calendar_datestxt) seperti yang ditunjukkan di bawah ini:

[**calendar_dates.txt**](../../reference/#calendar_datestxt)

    service_id,date,exception_type
    weekend_service,20220623,2

- Itu `service_id` `weekend_service` terdaftar
- Tanggal dihapus atau layanan tambahan terdaftar di bawah `date` (17 Juli 2022)
- Bidang `exception_type` disetel ke 2, yang berarti layanan dihapus untuk hari ini

[Contoh sumber](https://data.calgary.ca/download/npk7-z3bj/application%2Fzip)
