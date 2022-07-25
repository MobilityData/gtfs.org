---
search:
  exclude: true
---

# GTFS Schedule Ringkasan

<div class="landing-page"><a class="button" href="reference">Referensi</a> <a class="button" href="examples">Contoh</a> <a class="button" href="best-practices">Praktik Terbaik</a> <a class="button" href="changes">Perubahan</a></div>

## Mulai

SEBUAHGTFS feed, yang berisi informasi transit statis, terdiri dari sejumlah file teks (.txt) yang terdapat dalam satu file ZIP. Setiap file menjelaskan aspek tertentu dari informasi transit: pemberhentian, rute, perjalanan, tarif, dll. Untuk informasi lebih lanjut tentang setiap file, lihat GTFS referensi.

Untuk membuatGTFS umpan ikuti langkah-langkah di bawah ini.

1. Buat semua file yang diperlukan yang dijelaskan dalam GTFS Schedule referensi. Buat file opsional jika fungsionalitasnya diinginkan.
1. Simpan semua file dalam format .txt. Nilai bidang harus dipisahkan koma dan setiap baris harus diakhiri dengan jeda baris. LihatGTFS referensi untuk informasi rinci tentang isi file.
1. Zip semua file teks bersama-sama. File zip terdiri dari versi feed.
1. Publikasikan umpan dengan menggunakan salah satu opsi di bawah ini.

## Membuat Umpan Transit Tersedia untuk Umum

<hr/>

Kumpulan data harus dipublikasikan di URL publik dan permanen, termasuk nama file zip. (misalnya, www.agency.org/gtfs/gtfs.zip). Idealnya, URL harus dapat langsung diunduh tanpa memerlukan login untuk mengakses file, untuk memudahkan pengunduhan dengan menggunakan aplikasi perangkat lunak. Meskipun dianjurkan (dan praktik yang paling umum) untuk membuat a GTFS kumpulan data dapat diunduh secara terbuka, jika penyedia data memang perlu mengontrol akses keGTFS untuk lisensi atau alasan lain, disarankan untuk mengontrol akses ke GTFS kumpulan data menggunakan kunci API, yang akan memfasilitasi pengunduhan otomatis.

Hosting server web GTFS data harus dikonfigurasi untuk melaporkan tanggal modifikasi file dengan benar (lihat HTTP/1.1 - Permintaan Komentar 2616, di bawah Bagian 14.29).

Lihat “ [Praktik Terbaik: Penerbitan Kumpulan Data](best-practices/#dataset-publishing-general-practices) ” untuk rekomendasi lebih lanjut.

## Pelatihan

<hr/>

Open Learning Campus (OLC) Bank Dunia menawarkan kursus online berbasis mandiri yang disebut “[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)”. Kursus ini mencakup bagian berikut:

* Apa GTFS ? Sejarah & Struktur File
* Apa GTFS ? Visualisasi & Komunitas
* Menyiapkan GTFS Memberi makan
* Pengantar GitHub & Alat Sumber Terbuka
* Cerita dari Lapangan
* Cara Memetakan Data Transit
* Cara Mengumpulkan Data untuk Umpan Pertama Kota
* Survei Aplikasi
* GTFS-Realtime

Lihat [kursus online](../resources/other/#on-line-courses) lainnya.

## Mendapatkan Bantuan & Komunitas

<hr/>

### Daftar surat

Ada sejumlah milis yang dapat menjadi sumber yang baik ketika Anda memiliki pertanyaan tentang data angkutan umum, perangkat lunak, format sepertiGTFS dan GTFS-Realtime , dan masalah lainnya:

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): diskusi proposal untuk memperluas spesifikasi GTFS, seperti yang diuraikan dalam [dokumen GTFS Changes](https://github.com/google/transit/blob/master/gtfs/CHANGES.md).
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): diskusi tentang [GTFS-realtime specification](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack "organisasi" di dengan saluran yang dikhususkan untuk topik GTFS. [Request an invite to mobilitydata-io.slack.com here](https://share.mobilitydata.org/slack).
* [transitfeed](https://groups.google.com/group/transitfeed): diskusi proyek open-source [transitfeed](https://groups.google.com/group/transitfeed), serta diskusi spesifikasi GTFS dan alat terkait.
* [transit-developers](https://groups.google.com/group/transit-developers): diskusi pengembang transit umum. Banyak agen transit juga memiliki milis pengembang sendiri yang khusus untuk agen tersebut. Sebagai contoh:
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Wilayah Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Tanyakan kepada agen transit lokal Anda untuk melihat apakah mereka memiliki milis mereka sendiri.


Lihat lebih banyak [sumber daya komunitas](../resources/community) .
