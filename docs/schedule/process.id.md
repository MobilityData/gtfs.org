---
search:
  exclude: true
---

# Proses amandemen spesifikasi

Itu GTFS Spesifikasi tidak diatur dalam batu. Sebaliknya, ini adalah spesifikasi terbuka yang dikembangkan dan dikelola oleh komunitas agen transit, pengembang, dan pemangku kepentingan lain yang menggunakannyaGTFS . Diharapkan komunitas produsen dan konsumen iniGTFS data akan memiliki proposal untuk memperluas spesifikasi guna mengaktifkan kemampuan baru. Untuk membantu mengelola proses tersebut, prosedur dan pedoman berikut telah ditetapkan.

!!!note ""

     Spesifikasi resmi, referensi dan dokumentasi ditulis dalam bahasa Inggris. Jika sebuah Translation ke bahasa yang berbeda berbeda dari aslinya bahasa Inggris, yang terakhir diutamakan. Semua komunikasi dilakukan dalam bahasa Inggris.

  1. Buat cabang git dengan memperbarui semua bagian definisi protokol, spesifikasi, dan file dokumentasi yang relevan (kecuali untuk terjemahan).
  1. Buat permintaan tarik di <https://github.com/google/transit> . Permintaan penarikan harus berisi deskripsi tambalan yang diperluas. Pencipta pull request menjadi _advokat_ .
  1. Setelah permintaan tarik didaftarkan, permintaan tersebut harus diumumkan oleh advokatnya di [GTFS perubahan Mengubah milis](https://groups.google.com/forum/#!forum/gtfs-changes) , termasuk tautan ke permintaan penarikan. Setelah diumumkan, pull request dianggap sebagai proposal. Permintaan penarikan juga harus diedit untuk memuat tautan ke pengumuman Google Grup sehingga dapat dengan mudah dirujuk silang.
     - Karena advokat adalah kontributor, mereka harus menandatangani [Perjanjian Lisensi Kontributor](https://github.com/google/transit/blob/master/CONTRIBUTING.md) sebelum pull request dapat diterima.
  1. Pembahasan proposal berikut. Komentar pull request harus digunakan sebagai satu-satunya forum diskusi.
     - Pembahasan berlangsung selama advokat merasa perlu, tetapi harus sekurang-kurangnya 7 hari kalender.
     - Advokat bertanggung jawab untuk memperbarui proposal secara tepat waktu (yaitu pull request) berdasarkan komentar yang mereka setujui.
     - Pada setiap titik ditime advokat dapat mengklaim proposal diabaikan.
  1. Advokat dapat meminta pemungutan suara pada versi proposal kapan sajatime mengikuti interval 7 hari awal yang diperlukan untuk diskusi.
     - Sebelum menyerukan pemungutan suara, setidaknya satuGTFS produser dan satuGTFS konsumen harus menerapkan perubahan yang diusulkan. Diharapkan bahwaGTFS produser(s) termasuk perubahan dalam menghadapi publikGTFS beri makan dan berikan tautan ke data itu dalam komentar permintaan tarik, dan bahwaGTFS konsumen menyediakan tautan dalam komentar permintaan tarik ke aplikasi yang memanfaatkan perubahan dengan cara yang tidak sepele (yaitu, mendukung fungsionalitas baru atau yang lebih baik).
  1. Vote berlangsung selama periode minimum yang cukup untuk menutupi 7FULL hari kalender dan 5FULL hari kerja Swiss. Vote berakhir pada 23:59:59 UTC.
     - Advokat harus mengumumkan yang spesifikendtime padastart suara.
     - Selama masa voting hanya diperbolehkan perubahan redaksional proposal (salah ketik, susunan kata boleh berubah asalkan tidak mengubah arti).
     - Siapapun diperbolehkan untuk memilih ya/tidak dalam bentuk komentar untuk pull request, dan suara dapat diubah sampaiend dari periode pemungutan suara.
     Jika pemilih mengubah suaranya, disarankan untuk melakukannya dengan memperbarui komentar suara asli dengan mencoret suara dan menulis suara baru.
     - Suara sebelumstart periode pemungutan suara tidak dipertimbangkan.
     - Pembukaan dan penutupan pemungutan suara harus diumumkan di [GTFS-perubahan Mengubah milis](https://groups.google.com/forum/#!forum/gtfs-changes) .
  1. Usul diterima jika sudah ada kesepakatan bulat ya dengan minimal 3 suara.
     - Suara pengusul tidak dihitung terhadap total 3 suara. Misalnya, jika Pengusul X membuat pull request dan memilih ya, dan Pengguna Y dan Z memilih ya, ini dihitung sebagai total 2 suara ya.
     - Suara menentang harus dimotivasi, dan idealnya memberikan umpan balik yang dapat ditindaklanjuti.
     - Jika pemungutan suara gagal, maka advokat dapat memilih untuk melanjutkan pengerjaan proposal, atau meninggalkan proposal.
     Salah satu keputusan advokat harus diumumkan di [GTFS-perubahan Mengubah milis](https://groups.google.com/forum/#!forum/gtfs-changes) .
     - Jika advokat melanjutkan pengerjaan proposal, maka pemungutan suara baru dapat dilakukan kapan sajatime .
  1. Setiap pull request yang tidak aktif selama 30 hari kalender akan ditutup. Saat pull request ditutup, proposal terkait dianggap ditinggalkan. Advokat dapat membuka kembali pull request kapan sajatime jika mereka ingin melanjutkan atau mempertahankan percakapan.
  1. Jika proposal diterima:
     - Google berkomitmen untuk menggabungkan versi pull request yang telah dipilih (asalkan kontributor telah menandatangani [PLK](https://github.com/google/transit/blob/master/CONTRIBUTING.md ), dan melakukan pull request dalam waktu 5 hari kerja.
     - Terjemahan tidak boleh dimasukkan ke dalam pull request asli.
     Google bertanggung jawab untuk memperbarui terjemahan yang relevan ke dalam bahasa yang didukung, tetapi murniTranslation tarik permintaan dari komunitas diterima dan akan diterima segera setelah semua komentar editorial ditangani.
  1. Hasil akhir dari pull request (diterima atau diabaikan) harus diumumkan di utas Google Grup yang sama tempat permintaan pull awalnya diumumkan.

  <hr/>

## Prinsip Panduan

  Untuk melestarikan visi asliGTFS , sejumlah prinsip panduan telah ditetapkan untuk dipertimbangkan saat memperluas spesifikasi:

  **Umpan harus mudah dibuat dan diedit**<br/>Kami memilih CSV sebagai dasar spesifikasi karena mudah dilihat dan diedit menggunakan program spreadsheet dantext editor, yang berguna untuk agensi yang lebih kecil. Ini juga mudah dihasilkan dari sebagian besar bahasa pemrograman dan basis data, yang bagus untuk penerbit umpan yang lebih besar.<br/>

  **Umpan harus mudah diuraikan**<br/>Pembaca umpan harus dapat mengekstrak informasi yang mereka cari dengan usaha sesedikit mungkin. Perubahan dan penambahan feed harus bermanfaat seluas mungkin, untuk meminimalkan jumlah jalur kode yang perlu diterapkan oleh pembaca feed. (Namun, membuat pembuatan lebih mudah harus diutamakan, karena pada akhirnya akan ada lebih banyak penerbit umpan daripada pembaca umpan.)<br/>

  **Spesifikasinya tentang informasi penumpang**<br/>GTFS terutama berkaitan dengan informasi penumpang. Artinya, spek harus menyertakan informasi yang dapat membantu alat-alat listrik untuk pengendara, pertama dan terutama. Ada potensi sejumlah besar informasi berorientasi operasi yang mungkin ingin ditransmisikan oleh agen transit secara internal antar sistem.GTFS tidak dimaksudkan untuk tujuan itu dan ada potensi standar data berorientasi operasi lain yang mungkin lebih tepat.<br/>

  **Perubahan pada spesifikasi harus kompatibel ke belakang**<br/>Saat menambahkan fitur ke spesifikasi, kami ingin menghindari perubahan yang akan membuat feed yang ada menjadi tidak valid. Kami tidak ingin membuat lebih banyak pekerjaan untuk penerbit feed yang ada hingga mereka ingin menambahkan kemampuan ke feed mereka. Selain itu, jika memungkinkan, kami ingin parser yang ada dapat terus membaca bagian lama dari umpan yang lebih baru.<br/>

  **Fitur spekulatif tidak disarankan**<br/>Setiap fitur baru menambah kerumitan pembuatan dan pembacaan feed. Oleh karena itu, kami ingin berhati-hati untuk hanya menambahkan fitur yang kami tahu bermanfaat. Idealnya, proposal apa pun akan diuji dengan menghasilkan data untuk sistem transit nyata yang menggunakan fitur baru dan perangkat lunak penulisan untuk membaca dan menampilkannya. Perhatikan bahwaGTFS dengan mudah memungkinkan ekstensi ke format melalui penambahan kolom dan file tambahan yang diabaikan oleh parser & validator resmi, sehingga proposal dapat dengan mudah dibuat prototipe dan diuji pada umpan yang ada.<br/>

  <hr/>

## Riwayat Revisi

**14 Maret 2023**<br/>

* Menambahkan media tarif. Lihat [diskusi](https://github.com/google/transit/pull/355) .

**26 Juli 2022**<br>

* Menambahkan transfer perjalanan-ke-perjalanan dengan opsi di kursi. Lihat [diskusi](https://github.com/google/transit/pull/303)

**17 Mei 2022**<br>

* GTFS-Fares v2 implementasi basis. Lihat [diskusi](https://github.com/google/transit/pull/286)

**22 Oktober 2021**<br>

* Ditambahkan Utama dan Asingid bidang. Lihat [diskusi](https://github.com/google/transit/pull/278)

**05 Oktober 2021**<br>

* Menambahkan transfer Trip-to-trip dan rute-ke-rute. Lihat [diskusi](https://github.com/google/transit/pull/284)

**15 September 2021**<br/>

* Gerbang tarif yang diizinkan (pathway_mode=6) menjadi dua arah. Lihat [diskusi](https://github.com/google/transit/pull/276) .

**13 September 2021**<br/>

* Memperbarui praktik terbaik `stop_name` . Lihat [diskusi](https://github.com/google/transit/pull/282) .

**27 Agustus 2021**<br/>

* Diperbarui GTFS Schedule ke [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119) . Lihat [diskusi](https://github.com/google/transit/pull/277) .

**4 Januari 2021**<br/>

* Deskripsi yang diklarifikasi tentang `stop_times.` `stop_id` `stop_id` . Lihat [diskusi](https://github.com/google/transit/pull/258) .
* Didefinisikan tanda-tanda bidang positif dan bukan nol. Lihat [diskusi](https://github.com/google/transit/pull/251) .

**2 Oktober 2020**<br/>

* Jenis kolom `frequencies.headway_secs` diubah dari non-negatif menjadi bilangan bulat positif. Lihat [diskusi](https://github.com/google/transit/pull/249) .

**25 Mei 2020**<br/>

* Ditetapkan `pathways.txt` ,`levels.txt` dan `attributions.txt` sebagai tabel yang dapat diterjemahkan. Menambahkan rekomendasi untuk menerjemahkan nilai `signposted_as` multibahasa. Lihat [diskusi](https://github.com/google/transit/pull/220) .

**13 Mei 2020**<br/>

* Menambahkan `continuous_pickup` dan `continuous_drop_off` ke `routes.txt` dan `stop_times.txt` . Berubah `shape_id` dari "Optional" ke "Conditionally required". Lihat [diskusi](https://github.com/google/transit/pull/208) .

**24 Maret 2020**<br/>

* Ditetapkantext -to-speech dan menambahkan `tts_stop_name` ke `stops.txt`. Lihat [diskusi](https://github.com/google/transit/pull/49) .

**5 Februari 2020**<br/>

* Menambahkan trolleybus dan monorel `route_types` . Lihat [diskusi](https://github.com/google/transit/pull/174) .

**9 Januari 2020**<br/>

* Ditambahkan `translations.txt`. Lihat [diskusi](https://github.com/google/transit/pull/180) .

**26 Desember 2019**<br/>

* Definisi yang diperbarui untuk trem kabel dan lift udara masuk `route_type`. Lihat [diskusi](https://github.com/google/transit/pull/186) .

**20 Desember 2019**<br/>

* Ditambahkan `attributions.txt`. Lihat [diskusi](https://github.com/google/transit/pull/192) .

**26 Agustus 2019**<br/>

* Ditentukan bahwa `stop_lat` dan `stop_lon` ditempatkan di tempat penumpang menunggu untuk naikvehicle . Lihat [diskusi](https://github.com/google/transit/pull/179) .

**9 Juli 2019**<br/>

* Ditambahkanarrival dandeparturetime praktik terbaik. Lihat [diskusi](https://github.com/google/transit/pull/165) .
* Menambahkan praktik terbaik headsign. Lihat [diskusi](https://github.com/google/transit/pull/167) .
* Ditambahkan `stop_id` praktik terbaik. Lihat [diskusi](https://github.com/google/transit/pull/169) .

**25 Juni 2019**<br/>

* Hubungan yang diklarifikasi dariShape poin dan berhenti. Lihat [diskusi](https://github.com/google/transit/pull/39) .

**4 April 2019**<br/>

* Menambahkan kolom `platform_code` di `stops.txt`. Lihat [diskusi](https://github.com/google/transit/pull/146) .

**27 Maret 2019**<br/>

* Ditambahkan `pathways.txt` dan `levels.txt` . Lihat [diskusi](https://github.com/google/transit/pull/143) .

**6 Februari 2019**<br/>

* Editorial dan perubahan pemformatan untuk kejelasan. Lihat [diskusi](https://github.com/google/transit/pull/120) .

**2 Oktober 2018**<br/>

* Jenis bidang yang difaktorkan. Lihat [diskusi](https://github.com/google/transit/pull/104) .

**14 September 2018**<br/>

* Menambahkan konsep "Conditionally required". Lihat [diskusi](https://github.com/google/transit/pull/100) .

**4 September 2018**<br/>

* Menyatukan definisi `agency_lang` dan `feed_lang` . Lihat [diskusi](https://github.com/google/transit/pull/98) .

**27 Agustus 2018**<br/>

* Diperbarui `CHANGES.md` dan tanggal revisi terakhir. Lihat [diskusi](https://github.com/google/transit/pull/99) .

**22 Agustus 2018**<br/>

* Menambahkan bidang `feed_contact_email` dan `feed_contact_url` di `feed_info.txt` mengajukan. Lihat [diskusi](https://github.com/google/transit/pull/31) .

**11 Desember 2017**<br/>

* Menambahkan `route_sort_order` ke `routes.txt`. Lihat [diskusi](https://github.com/google/transit/pull/83) .

**15 Maret 2017**<br/>

* Diklarifikasi bahwa suara pengusul tidak diperhitungkan dalam total. Lihat [diskusi](https://github.com/google/transit/pull/50) .
* Ditentukan bahwa sebelum melakukan pemungutan suara, setidaknya satuGTFS produser dan satuGTFS konsumen harus menerapkan perubahan yang diusulkan. Lihat [diskusi](https://github.com/google/transit/pull/46) .

**7 Februari 2017**<br/>

* Hubungan yang diklarifikasi dari `block_id` dan `service_id`. Lihat [diskusi](https://github.com/google/transit/pull/44) .
* Diklarifikasi bahwa layanan berbasis frekuensi dimulai padavehicledeparture . Lihat [diskusi](https://github.com/google/transit/pull/42) .
* Deskripsi yang diklarifikasi dari `stop_id` dan `stop_code` . Lihat [diskusi](https://github.com/google/transit/pull/40) .

**11 Desember 2017**<br/>

* Menambahkan bidang `route_sort_order` di `routes.txt` mengajukan. Lihat [diskusi](https://github.com/google/transit/pull/83) .

**27 November 2016**<br/>

* Menambahkan pintu masuk stasiun sebagai `stops.location_type` . Lihat [diskusi](https://github.com/google/transit/pull/30) .

**2 September 2016**<br/>

* Dokumentasi yang diperbarui untuk ditambahkan `agency_id` dibawah `fare_attributes.txt` . Lihat [diskusi](https://github.com/google/transit/pull/27) .

**16 Maret 2016**<br/>

* Transisi dari GTFS dokumentasi ke Github di <https://github.com/google/transit>

**3 Februari 2016**<br/>

* Menambahkan `agency_email` ke `agency.txt` proposal untuk spesifikasi: [diskusi](<https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2 Februari 2015**<br/>

* Ditambahkan `stop_times.txt` proposal 'titik waktu' untuk spesifikasi: [diskusi](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY>)

**17 Februari 2014**<br/>

* Ditambahkan `trips.txt` Proposal 'bikes_allowed' untuk spek: [diskusi](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**15 Oktober 2012**<br/>

* Ditambahkan `trips.txt` 'wheelchair_accessible' proposal untuk spesifikasi: [diskusi](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**20 Juni 2012**<br/>

* Menambahkan proposal 'wheelchair_boarding' ke spec: [diskusi](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2 Februari 2012**<br/>

* Menambahkan proposal 'stop_timezone' ke spec: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**18 Januari 2012**<br/>

* Memigrasikan dokumentasi dari code.google.com lama ke lokasi barunya di developers.google.com.

**26 September 2011**<br/>

* Menambahkan proposal 'feed_info' ke spec: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**6 September 2011**<br/>

* Menambahkan proposal 'agency_fare_url' ke spec: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* Menambahkan proposal 'exact_times' ke spec: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**30 Maret 2009**<br/>

* Bagian baru tentang membuat umpan transit tersedia untuk umum. Ini sebelumnya tidak dibahas di grup, karena ini bukan sepenuhnya perubahan pada cara data ditafsirkan atau ditulis. Namun, beberapa orang di Google berpendapat bahwa akan informatif jika menyertakan diskusi tentang penggunaan non-GoogleGTFS , karena semakin banyak aplikasi yang bisa dimanfaatkanGTFS -data yang diformat.
* Klarifikasi format CSV: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk) .
* Panduan tambahan tentang cara memilih warna kontras dalam deskripsi kolom route_color dan route_text_color.
* trip_short_name, seperti yang diusulkan dan diuji di utas ini: a dan b.
* Perbaikan untuk kesalahan kecil dalam data sampel yang disertakan diend dokumen (memberikan stop S7 parent_station S8).
* Menambahkan informasi "agency_lang" ke data sampel diend dokumen, seperti yang disarankan oleh Marcy selama periode komentar: [diskusi](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0) .
* Memperbarui tautan ke OCTAGTFS umpan di sidebar
* Lihat [ringkasan asli](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) .

**26 Februari 2009**<br/>

* Menghapus sebagian besar instruksi pengiriman umpan khusus Google, karena ada banyak aplikasi lain yang menggunakanGTFS data pada titik ini.
* Memperbaiki tautan yang rusak di sidebar ke feed publik Orange County OCTA.

**7 Agustus 2008**<br/>

* Memulihkan bidang stop_url, yang secara tidak sengaja dihilangkan pada versi 6 Agustus
* Menambahkan agency_phone ke data sampel
* Menambahkan penyebutan perjanjian penggunaan data saat mengirimkan feed ke Google

**6 Agustus 2008**<br/>

* Ditambahkantransfers.txt file, memungkinkan penayang feed memberikan petunjuk tentang perilaku transfer yang disukai ( [proposal asli](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw) )
* Menambahkan kolom location_type dan parent_station ke `stops.txt` , memungkinkan titik perhentian dikelompokkan ke dalam stasiun ( [proposal asli](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw) )
* Menambahkan kolom agency_phone untuk memberikan nomor telepon suara untuk agensi ( [proposal asli](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA) )
* Menambahkan bagian "Menguji Umpan Anda" yang menyebutkan alat pengujian sumber terbuka
* Menambahkan klarifikasi tentang format CSV, agency_timezone, agency_lang, route_color, route_text_color, waktu_kedatangan, waktu_keberangkatan,calendar.txt vs.calendar_dates.txt , tabel tarif, danfrequencies.txt
* Menambahkan tautan ke dokumen riwayat umpan, dan mengoreksi beberapa tautan umpan publik
* Gambar contoh yang diperbarui untuk menggambarkan UI Google Maps saat ini
* Data sampel yang diperbarui/diperbaiki dalam dokumen

**29 Februari 2008**<br/>

* Menambahkan bidang `stop_code` di `stops.txt` untuk memungkinkan spesifikasi kode berhenti yang menghadap pengendara ( [proposal asli](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc) )
* Klarifikasi deskripsi `route_short_name` dan `route_long_name` di `routes.txt`
* Memperjelas deskripsi waktu_kedatangan dan waktu_keberangkatan di `stop_times.txt`
* Memperbaiki kesalahan ketik di bagian Data Sampel

**20 Nopember 2007**<br/>

* Deskripsi block_id yang diklarifikasi
* Bahasa diubah untuk tidak menekankan Google Transit (karena aplikasi non-Google menggunakanGTFS , dan perutean transit kini menjadi fitur terintegrasi Google Maps), dan untuk memperbaiki berbagai kesalahan ketik
* Contoh tangkapan layar yang diperbarui untuk mencerminkan presentasiGTFS di UI Google Maps saat ini
* Memperbarui alamat email kontak Google untuk penyedia data transit
* Pemformatan diperbarui

**5 Oktober 2007**<br/>

* Berubahstop_sequence danshape_pt_sequence untuk memungkinkan peningkatan bilangan bulat non-negatif
* Deskripsi yang diklarifikasi dan kesalahan ketik yang diperbaiki

**31 Mei 2007**<br/>

* Memperbarui gaya halaman, menjadikan HTML lebih bersih dan lebih mudah diakses
* Menambahkan tautan ke contoh umpan publik dan situs bermanfaat lainnya
* Contoh yang dihapus dari masing-masing deskripsi kolom

**9 April 2007**<br/>

* Menambahkan bagian tentang [mengirimkan umpan](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle) .
* Menambahkan [Contoh umpan Agen Transit Demo](https://developers.google.com/transit/gtfs/examples/gtfs-feed) .
* Ditambahkan catatan itucalendar.txt dapat dihilangkan jika semua tanggal layanan ditentukancalendar_dates.txt .
* Terbuatagency_id kolom opsional di feed yang hanya berisi satu agensi. Hal ini memungkinkan feed yang ada tanpaagency_id untuk tetap berlaku.
* Menambahkan spesifikasi yang lebih lengkap untuk agency_url, stop_url, dan route_url, serta nilai contoh tambahan untuk kolom tersebut.
* Ditambahkan 6 (Gondola) dan 7 (Funicular) sebagai valid `route_type` nilai-nilai.

**8 Maret 2007**<br/>

* Edit kecil untuk memindahkan bidang `stop_url` dari `stop_times.txt` , yang salah ditentukan dalam pembaruan 28 Februari, ke `stops.txt` , tempatnya.

**5 Maret 2007**<br/>

* Edit kecil untuk mengklarifikasi deskripsi bidang `route_long_name`.

**28 Februari 2007**<br/>

* Penambahan dari `frequencies.txt` untuk dukungan jadwal berbasis headway.
* Beberapa agensi sekarang diizinkan di feed yang sama. Juga ditambahkan baru `agency_id` di kedua `agency.txt` dan `routes.txt` yang memungkinkan Anda menentukan rute mana yang dioperasikan oleh agen mana.
* Penambahan URL per-rute dan per-stop.
* Penambahan dari `direction_id` lapangan di `trips.txt` .
* Dukungan untuk pertengahantrip perubahan headsign dengan penambahan bidang stop_headsign di `stop_times.txt` .
* Dukungan untuk warna rute dengan tambahan route_color dan route_text_color opsional `routes.txt` .
* Menghapus kemampuan untuk menentukan perhentian menggunakan alamat jalan. Versi spesifikasi sebelumnya memungkinkan Anda memberikan lokasi perhentian transit menggunakan alamat jalan di bidang stop_street, stop_city, stop_region, stop_postcode, dan stop_country. Sekarang lokasi perhentian harus diberikan menggunakan stop_lat untuklatitude dan stop_lon untuklongitude , yang lebih berguna untuk sebagian besar aplikasi.
* Penambahan kereta gantungvehicle ketik untuk `route_type` lapangan di `routes.txt` .
* Lihat ringkasan [posting blog Headway](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) asli dari perubahan tersebut.

**29 Nopember 2006**<br/>

* Ditambahkan dukungan untuktrip Shape informasi melalui `shapes.txt`
* Memperjelas definisi dari `stop_sequence`
* Ditandai `pickup_type` dan `drop_off_type` opsional

**31 Oktober 2006**<br/>

* Menambahkan dukungan untuk informasi tarif
* Tanggal yang dihapus dari nama file individual
* Mengubah `route_type`  definisi nilai
* Diizinkan untuk memposting beberapa file feed secara bersamaantime , selama periode layanan mereka tidak tumpang tindih
* Memperbaiki `block_id` di `trips.txt` sehingga ditandai dengan benar Opsional
* Perhatikan bahwa tajuk kolom harus disertakan

**29 September 2006**<br/>

* Edit kecil untuk memperbaiki beberapa kesalahan dalam contoh.

**25 September 2006**<br/>

* Versi awal.
