# Entitas Umpan

GTFS Realtime mendukung tiga jenis data realtime yang berbeda, yang dapat digabungkan dalam satu feed realtime. Ringkasan diberikan di bawah ini, dengan dokumentasi lengkap diberikan di bagian yang relevan.

## Trip Updates

#### "Bus X delay 5 menit"

Trip updates menunjukkan fluktuasi dalam jadwal. Kami berharap dapat menerima trip updates untuk semua perjalanan yang telah Anda jadwalkan yang dapat dilakukan secara waktu nyata. Pembaruan ini akan memberikan perkiraan kedatangan atau keberangkatan untuk perhentian di sepanjang rute. Trip updates juga dapat memberikan skenario yang lebih kompleks di mana perjalanan dibatalkan, ditambahkan ke jadwal, atau bahkan dialihkan.

[Selengkapnya tentang Trip Updates...](trip-updates.md)

## Service Alerts

#### "Stasiun Y ditutup karena konstruksi"

Service alerts mewakili masalah tingkat yang lebih tinggi dengan entitas tertentu dan umumnya dalam bentuk deskripsi tekstual dari gangguan tersebut.

Mereka dapat mewakili masalah dengan:

*   Stasiun
*   Garis
*   Seluruh jaringan
*   dll.

Service alert biasanya terdiri dari beberapa teks yang akan menjelaskan masalah, dan kami juga mengizinkan URL untuk informasi lebih lanjut serta informasi yang lebih terstruktur untuk membantu kami memahami siapa yang terpengaruh oleh lansiran layanan ini.

[Selengkapnya tentang Service Alerts...](service-alerts.md)

## Vehicle Positions

#### "Bus ini berada di posisi X pada waktu Y"

Vehicle positions mewakili beberapa informasi dasar tentang kendaraan tertentu di jaringan.

Yang paling penting adalah garis lintang dan garis bujur tempat kendaraan berada, tetapi kita juga dapat menggunakan data kecepatan saat ini dan pembacaan odometer dari kendaraan tersebut.

[Selengkapnya tentang pembaruan Vehicle Positions...](vehicle-positions.md)

## Catatan historis tentang jenis umpan

Spesifikasi GTFS Realtime versi awal mengharuskan setiap feed hanya berisi satu jenis entitas. Contoh alat untuk mengonversi dari skema gabungan ke skema feed-per-type terletak di repositori GitHub [gtfsrt-examples Bliksem](https://github.com/bliksemlabs/gtfsrt-examples/blob/master/split_by_entitytype.py) Labs.
