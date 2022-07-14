# GTFS Realtime Ringkasan

<div class="landing-page"><a class="button" href="reference">Referensi</a>  <a class="button" href="best-practices">Praktik Terbaik</a> <a class="button" href="feed-examples">Contoh</a> <a class="button" href="changes">Perubahan</a></div>

## Mulai

Memberikan pembaruan data transit kepada pengguna secara real time sangat meningkatkan pengalaman mereka terhadap layanan transit Anda. Memberikan informasi terkini tentang waktu kedatangan dan keberangkatan saat ini memungkinkan pengguna untuk merencanakan perjalanan mereka dengan lancar. Akibatnya, jika terjadi keterlambatan yang tidak menguntungkan, pengendara akan lega mengetahui bahwa mereka dapat tinggal di rumah sedikit lebih lama.

GTFSRealtime adalah spesifikasi umpan yang memungkinkan agen transportasi umum untuk menyediakanRealtime update tentang armada mereka untuk pengembang aplikasi. Ini adalah perpanjangan dari [GTFS](../schedule/reference) (General Transit Feed Specification ), format data terbuka untuk jadwal transportasi umum dan informasi geografis terkait.GTFSRealtime dirancang di sekitar kemudahan implementasi, bagusGTFS interoperabilitas dan fokus pada informasi penumpang.

Spesifikasi ini dirancang melalui kemitraan awal dengan agensi mitra [Pembaruan Transit Langsung](https://developers.google.com/transit/google-transit#LiveTransitUpdates) , sejumlah pengembang angkutan umum dan Google. Spesifikasi diterbitkan di bawah [Lisensi Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) .

## Bagaimana cara memulai?

1.  Lanjutkan membaca ikhtisar di bawah ini.
2.  Tentukan [entitas feed](feed-entities) mana yang akan Anda sediakan.
3.  Lihatlah [contoh feed](feed-examples) .
4.  Buat feed Anda sendiri menggunakan [referensi](reference) .
5.  [Publikasikan umpan Anda](best-practices/#feed-publishing-general-practices) .

## Ikhtisar tentangGTFSRealtime feed

Spesifikasi saat ini mendukung jenis informasi berikut:

*   **Pembaruan perjalanan** - penundaan, pembatalan, perubahan rute
*   **Peringatan layanan** - berhenti bergerak, peristiwa tak terduga yang memengaruhi stasiun, rute, atau seluruh jaringan
*   **Posisi kendaraan** - informasi tentang kendaraan termasuk lokasi dan tingkat kemacetan

Umpan dapat, meskipun tidak diharuskan, menggabungkan entitas dari jenis yang berbeda. Umpan disajikan melalui HTTP dan sering diperbarui. File itu sendiri adalah file biner biasa, jadi semua jenis server web dapat meng-host dan melayani file (protokol transfer lain mungkin juga digunakan). Sebagai alternatif, server aplikasi web juga dapat digunakan yang sebagai respons terhadap permintaan GET HTTP yang valid akan mengembalikan umpan. Tidak ada batasan tentang seberapa sering atau metode yang tepat tentang bagaimana feed harus diperbarui atau diambil.

KarenaGTFSRealtime memungkinkan Anda untuk menyajikan status _aktual_ armada Anda, umpan perlu diperbarui secara berkala - sebaiknya setiap kali data baru masuk dari sistem Lokasi Kendaraan Otomatis Anda.

[Selengkapnya tentang entitas feed...](feed-entities)

## Format data

ItuGTFSRealtime format pertukaran data didasarkan pada [Protocol Buffer](https://developers.google.com/protocol-buffers/)

Buffer protokol adalahlanguage - dan mekanisme platform-netral untuk membuat serialisasi data terstruktur (pikirkan XML, tetapi lebih kecil, lebih cepat, dan lebih sederhana). Struktur data didefinisikan dalam [gtfs-realtime.proto](proto), yang kemudian digunakan untuk menghasilkan kode sumber agar mudah membaca dan menulis data terstruktur Anda dari dan ke berbagai aliran data, menggunakan berbagai bahasa – misalnyaJava , C++ atauPython .

[Lebih lanjut tentang Protokol Buffer...](https://developers.google.com/protocol-buffers/) .

## Struktur data

Hirarki elemen dan definisi tipenya ditentukan dalam [gtfs-realtime.proto](proto) file.

File teks ini digunakan untuk menghasilkan perpustakaan yang diperlukan dalam pilihan pemrograman Andalanguage. Pustaka ini menyediakan kelas dan fungsi yang diperlukan untuk menghasilkanGTFSRealtime feed. Pustaka tidak hanya membuat pembuatan feed lebih mudah tetapi juga memastikan bahwa hanya feed yang valid yang diproduksi.

[Selengkapnya tentang struktur data...](reference)

## Mendapatkan bantuan

Untuk berpartisipasi dalam diskusi seputarGTFSRealtime dan menyarankan perubahan dan penambahan spesifikasi, bergabunglah dengan GTFS Realtime mailing list](https://groups.google.com/group/gtfs-realtime) dan ikuti percakapan di [repositori Google/transit GitHub](https://github.com/google/transit) .

## Google Maps dan Pembaruan Transit Langsung

Salah satu kemungkinan aplikasi yang menggunakanGTFSRealtime adalah [Pembaruan Transit Langsung](https://developers.google.com/transit/google-transit#LiveTransitUpdates) , fitur dalam Google Maps yang memberi penggunaRealtime informasi angkutan. Jika Anda bekerja untuk agen transportasi umum yang tertarik untuk menyediakanRealtime pembaruan Google Maps, kunjungi [Laman Mitra Google Transit](https://maps.google.com/help/maps/transit/partners/live-updates.html) .
