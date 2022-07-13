# GTFSSchedule Ringkasan

<div class="landing-page"><a class="button" href="reference">Referensi</a> <a class="button" href="examples">Contoh</a> <a class="button" href="best-practices">Praktik Terbaik</a> <a class="button" href="changes">Perubahan</a></div>

## Mulai

SEBUAHGTFS feed, yang berisi informasi transit statis, terdiri dari sejumlah file teks (.txt) yang terdapat dalam satu file ZIP. Setiap file menjelaskan aspek tertentu dari informasi transit: pemberhentian, rute, perjalanan, tarif, dll. Untuk informasi lebih lanjut tentang setiap file, lihatGTFS referensi.

Untuk membuatGTFS umpan ikuti langkah-langkah di bawah ini.

1. Buat semua file yang diperlukan yang dijelaskan dalamGTFSSchedule referensi. Buat file opsional jika fungsionalitasnya diinginkan.
1. Simpan semua file dalam format .txt. Nilai bidang harus dipisahkan koma dan setiap baris harus diakhiri dengan jeda baris. LihatGTFS referensi untuk informasi rinci tentang isi file.
1. Zip semua file teks bersama-sama. File zip terdiri dari versi feed.
1. Publikasikan umpan dengan menggunakan salah satu opsi di bawah ini.

## Membuat Umpan Transit Tersedia untuk Umum

<hr/>

Kumpulan data harus dipublikasikan di URL publik dan permanen, termasuk nama file zip. (misalnya, [GTFS](<http://www.agency.org/\<glossary variable=>) [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip">www.agency.org/](<http://www.agency.org/\<glossary variable=>)GTFS [/](<http://www.agency.org/\<glossary variable=>)GTFS [.zip](<http://www.agency.org/\<glossary variable=>) ). Idealnya, URL harus dapat langsung diunduh tanpa memerlukan login untuk mengakses file, untuk memudahkan pengunduhan dengan menggunakan aplikasi perangkat lunak. Meskipun dianjurkan (dan praktik yang paling umum) untuk membuat aGTFS kumpulan data dapat diunduh secara terbuka, jika penyedia data memang perlu mengontrol akses keGTFS untuk lisensi atau alasan lain, disarankan untuk mengontrol akses keGTFS kumpulan data menggunakan kunci API, yang akan memfasilitasi pengunduhan otomatis.

Hosting server webGTFS data harus dikonfigurasi untuk melaporkan tanggal modifikasi file dengan benar (lihat HTTP/1.1 - Permintaan Komentar 2616, di bawah Bagian 14.29).

Lihat “ [Praktik Terbaik: Penerbitan Kumpulan Data](best-practices/#dataset-publishing-general-practices) ” untuk rekomendasi lebih lanjut.

## Pelatihan

<hr/>

Open Learning Campus (OLC) Bank Dunia menawarkan kursus online berbasis mandiri yang disebut “ [GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>) [-and-informal-transit-system-mapping">Pengantar](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)General Transit Feed Specification [(](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)GTFS [) dan Pemetaan Sistem Transit Informal](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>) ”. Kursus ini mencakup bagian berikut:

* ApaGTFS ? Sejarah & Struktur File
* ApaGTFS ? Visualisasi & Komunitas
* MenyiapkanGTFS Memberi makan
* Pengantar GitHub & Alat Sumber Terbuka
* Cerita dari Lapangan
* Cara Memetakan Data Transit
* Cara Mengumpulkan Data untuk Umpan Pertama Kota
* Survei Aplikasi
* GTFS -Realtime

Lihat [kursus online](../resources/other/#on-line-courses) lainnya.

## Mendapatkan Bantuan & Komunitas

<hr/>

### Daftar surat

Ada sejumlah milis yang dapat menjadi sumber yang baik ketika Anda memiliki pertanyaan tentang data angkutan umum, perangkat lunak, format sepertiGTFS danGTFS -Realtime , dan masalah lainnya:

* [GTFS](<https://groups.google.com/group/\<glossary variable=>) [-perubahan">](<https://groups.google.com/group/\<glossary variable=>)GTFS [Perubahan](<https://groups.google.com/group/\<glossary variable=>) : pembahasan usulan perpanjanganGTFS spesifikasi.
* [MobilityData Slack](https://mobilitydata-io.slack.com/) : Slack "organisasi" dengan saluran yang ditujukan untukGTFS topik. [Minta undangan ke mobilitydata-io.slack.com di sini](https://share.mobilitydata.org/slack) .
* [Pengembang Transit](https://groups.google.com/group/transit-developers) : diskusi pengembang angkutan umum. Banyak agen transit juga memiliki milis pengembang sendiri khusus untuk agen tersebut. Sebagai contoh:
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
  * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [Atlanta, wilayah GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 Sumber Daya Pengembang Area Teluk San Francisco](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Hubungi agen transit lokal Anda untuk mengetahui apakah mereka memiliki milis sendiri.

Lihat lebih banyak [sumber daya komunitas](../resources/community) .
