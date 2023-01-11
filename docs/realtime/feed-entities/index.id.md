# Entitas Umpan

GTFS Realtime mendukung tiga jenis data realtime yang berbeda, yang dapat digabungkan dalam satu feed realtime. Ringkasan diberikan di bawah ini, dengan dokumentasi lengkap diberikan di bagian yang relevan.

## Pembaruan Perjalanan

#### "Bus X delay 5 menit"

Pembaruan perjalanan menunjukkan fluktuasi dalam jadwal. Kami berharap dapat menerima pembaruan perjalanan untuk semua perjalanan yang telah Anda jadwalkan yang dapat dilakukan secara waktu nyata. Pembaruan ini akan memberikan perkiraan kedatangan atau keberangkatan untuk perhentian di sepanjang rute. Pembaruan perjalanan juga dapat memberikan skenario yang lebih kompleks di mana perjalanan dibatalkan, ditambahkan ke jadwal, atau bahkan dialihkan.

[Selengkapnya tentang Pembaruan Perjalanan...](trip-updates.md)

## Peringatan Layanan

#### "Stasiun Y ditutup karena konstruksi"

Peringatan layanan mewakili masalah tingkat yang lebih tinggi dengan entitas tertentu dan umumnya dalam bentuk deskripsi tekstual dari gangguan tersebut.

Mereka dapat mewakili masalah dengan:

*   Stasiun
*   Garis
*   Seluruh jaringan
*   dll.

Lansiran layanan biasanya terdiri dari beberapa teks yang akan menjelaskan masalah, dan kami juga mengizinkan URL untuk informasi lebih lanjut serta informasi yang lebih terstruktur untuk membantu kami memahami siapa yang terpengaruh oleh lansiran layanan ini.

[Selengkapnya tentang Peringatan Layanan...](service-alerts.md)

## Posisi Kendaraan

#### "Bus ini berada di posisi X pada waktu Y"

Posisi kendaraan mewakili beberapa informasi dasar tentang kendaraan tertentu di jaringan.

Yang paling penting adalah garis lintang dan garis bujur tempat kendaraan berada, tetapi kita juga dapat menggunakan data kecepatan saat ini dan pembacaan odometer dari kendaraan tersebut.

[Selengkapnya tentang pembaruan Posisi Kendaraan...](vehicle-positions.md)

## Catatan historis tentang jenis umpan

Spesifikasi GTFS Realtime versi awal mengharuskan setiap feed hanya berisi satu jenis entitas. Contoh alat untuk mengonversi dari skema gabungan ke skema feed-per-type terletak di repositori GitHub [gtfsrt-examples Bliksem](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) Labs.
