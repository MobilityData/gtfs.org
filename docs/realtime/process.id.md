# Menambahkan kolom baru ke GTFS-realtime

Saat produsen atau konsumen tertarik untuk menambahkan kolom baru ke spesifikasi GTFS Realtime, mereka harus membuka masalah baru di [repositori GitHub GTFS Realtime](https://github.com/google/transit) yang menjelaskan kolom yang diusulkan dan mengumumkan kolom baru ini (termasuk link ke masalah) di [GTFS Milis waktu nyata](https://groups.google.com/forum/#!forum/gtfs-realtime) .

## Proses amandemen spesifikasi

1. Buat cabang git dengan memperbarui semua bagian definisi protokol, spesifikasi, dan file dokumentasi yang relevan (kecuali untuk terjemahan).
1. Buat permintaan tarik di <https://github.com/google/transit> . Permintaan penarikan harus berisi deskripsi tambalan yang diperluas. Pencipta pull request menjadi *advokat* .
1. Setelah permintaan tarik didaftarkan, permintaan tarik harus diumumkan oleh advokatnya di [milis GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime) . Setelah diumumkan, pull request dianggap sebagai proposal.
   - Karena advokat adalah kontributor, mereka harus menandatangani [Perjanjian Lisensi Kontributor](https://github.com/google/transit/blob/master/CONTRIBUTING.md) sebelum pull request dapat diterima.
1. Pembahasan proposal berikut. Komentar pull request harus digunakan sebagai satu-satunya forum diskusi.
   - Pembahasan berlangsung selama advokat merasa perlu, tetapi harus sekurang-kurangnya 7 hari kalender.
   - Advokat bertanggung jawab untuk memperbarui proposal secara tepat waktu (yaitu pull request) berdasarkan komentar yang mereka setujui.
   - Pada setiap titik ditime advokat dapat mengklaim proposal diabaikan.
1. Advokat dapat meminta pemungutan suara pada versi proposal kapan saja setelah interval 7 hari awal yang diperlukan untuk diskusi.
   - Sebelum meminta pemungutan suara, setidaknya satu produsen GTFS-realtime dan satu konsumen GTFS-realtime harus menerapkan perubahan yang diusulkan. Produsen GTFS-realtime diharapkan menyertakan perubahan dalam feed GTFS-realtime yang ditampilkan ke publik dan menyediakan link ke data tersebut dalam komentar pull request, dan konsumen GTFS-realtime menyediakan link dalam komentar permintaan tarik ke aplikasi yang memanfaatkan perubahan dengan cara yang tidak sepele (yaitu, mendukung fungsionalitas baru atau yang lebih baik).
   - Saat meminta pemungutan suara, advokat harus menyatakan dengan jelas apakah pemungutan suara tersebut untuk adopsi resmi lapangan ke dalam spesifikasi atau untuk bidang percobaan.
1. Pemungutan suara berlangsung selama periode minimum yang cukup untuk mencakup 7 hari kalender penuh dan 5 hari kerja Swiss penuh. Vote berakhir pada 23:59:59 UTC.
   - Advokat harus mengumumkan waktu akhir yang spesifik pada awal pemungutan suara.
   - Selama masa voting hanya diperbolehkan perubahan redaksional proposal (salah ketik, susunan kata boleh berubah asalkan tidak mengubah arti).
   - Siapapun diperbolehkan untuk memberikan suara ya/tidak dalam bentuk komentar pada pull request, dan suara dapat diubah hingga akhir periode pemungutan suara.
   Jika pemilih mengubah suaranya, disarankan untuk melakukannya dengan memperbarui komentar suara asli dengan mencoret suara dan menulis suara baru.
   - Suara sebelum dimulainya periode pemungutan suara tidak dipertimbangkan.
1. Usul diterima jika sudah ada kesepakatan bulat ya dengan minimal 3 suara.
   - Suara pengusul tidak dihitung terhadap total 3 suara. Misalnya, jika Pengusul X membuat pull request dan memilih ya, dan Pengguna Y dan Z memilih ya, ini dihitung sebagai total 2 suara ya.
   - Suara menentang harus dimotivasi, dan idealnya memberikan umpan balik yang dapat ditindaklanjuti.
   - Jika pemungutan suara gagal, maka advokat dapat memilih untuk melanjutkan pengerjaan proposal, atau meninggalkan proposal.
   Salah satu keputusan advokat harus diumumkan di milis.
   - Jika advokat melanjutkan pengerjaan proposal, maka pemungutan suara baru dapat dilakukan kapan saja.
1. Setiap pull request yang tidak aktif selama 30 hari kalender akan ditutup. Saat pull request ditutup, proposal terkait dianggap ditinggalkan. Advokat dapat membuka kembali pull request kapan saja jika mereka ingin melanjutkan atau mempertahankan percakapan.
   - Perhatikan bahwa advokat dapat memilih untuk mengimplementasikan fitur tersebut sebagai [ekstensi khusus](#extensions) , bukan sebagai bagian dari spesifikasi resmi.
1. Jika proposal diterima:
   - Google berkomitmen untuk menggabungkan versi pull request yang telah dipilih (asalkan kontributor telah menandatangani [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md) , dan melakukan pull request dalam waktu 5 hari kerja.
   - Google berkomitmen untuk memperbarui repositori <https://github.com/google/gtfs-realtime-bindings> secara tepat waktu. Komitmen pada gtfs-realtime-bindigs yang merupakan hasil dari proposal, harus mengacu pada pull request dari proposal tersebut.
   - Terjemahan tidak boleh dimasukkan ke dalam pull request asli.
   Google bertanggung jawab untuk akhirnya memperbarui terjemahan yang relevan ke dalam bahasa yang didukung, tetapi permintaan penarikan terjemahan murni dari komunitas diterima dan akan diterima segera setelah semua komentar editorial ditangani.

## Bidang *percobaan*

1. Jika komunitas dapat mencapai konsensus (a) bahwa kolom yang diusulkan tampaknya berguna dan (b) pada jenis kolom ( `optional` vs `repeated` , `string` vs `int` vs `bool` ), maka nomor kolom akan dialokasikan dalam pesan GTFS Realtime dan catatan akan dibuat di [file .proto](../proto) dan dokumentasi bahwa ini adalah bidang *percobaan* yang dapat berubah di masa mendatang.
   - Konsensus dicapai melalui proses diskusi dan pemungutan suara yang sama dengan [proses amandemen Spesifikasi](#specification-amendment-process) di bawah ini, tetapi alih-alih persetujuan dengan suara bulat, hanya 80% suara ya yang diperlukan untuk persetujuan.
   - Produsen dan konsumen GTFS-realtime yang ingin menggunakan kolom *eksperimental* baru akan membuat ulang pustaka mereka menggunakan file .proto dengan kolom baru (misalnya, Google akan memperbarui [pustaka gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings) ), dan mulai mengisi dan mengurai kolom dengan data hidup.
   - Setelah kami yakin bahwa bidang *eksperimen* bermanfaat dan baik produsen maupun konsumen menggunakan bidang tersebut, maka kami akan mengikuti [proses amandemen Spesifikasi](#specification-amendment-process) di bawah untuk menambahkan bidang tersebut secara resmi ke spesifikasi.
   - Jika bidang *percobaan* tidak diadopsi melalui [proses amandemen Spesifikasi](#specification-amendment-process) dalam waktu 2 tahun setelah disetujui sebagai bidang *percobaan* , bidang tersebut akan ditinggalkan dengan menambahkan `[deprecated=true]` di samping nilai bidang dalam [file .proto](../proto) . Dengan menggunakan `[deprecated=true]` (bukan `RESERVED` ), produsen dan konsumen yang telah mengadopsi bidang tersebut tidak harus menghapusnya dari penggunaan. Selain itu, bidang tersebut mungkin "tidak digunakan lagi" di masa mendatang jika disetujui dalam pemungutan suara berikutnya setelah [proses amandemen Spesifikasi](#specification-amendment-process) (misalnya, ketika produsen dan/atau konsumen tambahan mulai menggunakan bidang tersebut).
1. Jika kolom baru dianggap khusus untuk satu produsen atau ada perselisihan tentang jenis datanya, kami akan menetapkan [ekstensi khusus](../extensions) untuk produsen tersebut sehingga mereka dapat menggunakan kolom tersebut di feed mereka sendiri. Jika memungkinkan, kita harus menghindari ekstensi dan menambahkan kolom yang berguna bagi banyak agensi ke spesifikasi utama untuk menghindari fragmentasi dan kerja ekstra bagi konsumen untuk mendukung berbagai ekstensi pada spesifikasi.

## Prinsip Panduan

Untuk mempertahankan visi asli GTFS-realtime, sejumlah prinsip panduan telah ditetapkan untuk dipertimbangkan saat memperluas spesifikasi:

<br/>**Feed harus efisien untuk diproduksi dan dikonsumsi secara realtime.**

Informasi waktu nyata adalah aliran data yang terus menerus dan dinamis yang membutuhkan pemrosesan yang efisien. Kami memilih Protocol Buffers sebagai dasar spesifikasi karena menawarkan pertukaran yang baik dalam hal kemudahan penggunaan untuk pengembang dan dalam hal efisiensi untuk transmisi data. Tidak seperti GTFS, menurut kami tidak banyak agensi yang akan mengedit feed GTFS-realtime secara manual. Pilihan Protocol Buffer mencerminkan kesimpulan bahwa sebagian besar feed GTFS-realtime akan diproduksi dan digunakan secara terprogram.

<br/>**Spesifikasinya adalah tentang informasi penumpang.**

Seperti GTFS sebelumnya, GTFS Realtime terutama berkaitan dengan informasi penumpang. Artinya, spek harus menyertakan informasi yang dapat membantu alat-alat listrik untuk pengendara, pertama dan terutama. Ada potensi sejumlah besar informasi berorientasi operasi yang mungkin ingin ditransmisikan oleh agen transit secara internal antar sistem. GTFS-realtime tidak ditujukan untuk tujuan tersebut dan kemungkinan ada standar data berorientasi operasi lain yang mungkin lebih sesuai.

<br/>**Perubahan pada spesifikasi harus kompatibel ke belakang.**

Saat menambahkan fitur ke spesifikasi, kami ingin menghindari perubahan yang akan membuat feed yang ada menjadi tidak valid. Kami tidak ingin membuat lebih banyak pekerjaan untuk penerbit feed yang ada hingga mereka ingin menambahkan kemampuan ke feed mereka. Selain itu, jika memungkinkan, kami ingin parser yang ada dapat terus membaca bagian lama dari umpan yang lebih baru. Konvensi untuk memperluas Protocol Buffer akan menegakkan kompatibilitas mundur sampai batas tertentu. Namun, kami ingin menghindari perubahan semantik pada kolom yang ada yang mungkin juga merusak kompatibilitas mundur.

<br/>**Fitur spekulatif tidak disarankan.**

Setiap fitur baru menambah kerumitan dalam pembuatan dan pembacaan feed. Oleh karena itu, kami ingin berhati-hati untuk hanya menambahkan fitur yang kami tahu bermanfaat. Idealnya, proposal apa pun akan diuji dengan menghasilkan data untuk sistem transit nyata yang menggunakan fitur baru dan perangkat lunak penulisan untuk membaca dan menampilkannya.

## Riwayat Revisi

**12 Maret 2020**

- Memperbarui deskripsi `TripDescriptor` di halaman referensi GTFS-realtime.

**26 Februari 2015**

- Menambahkan field `direction_id` eksperimental ke `TripDescriptor` [(diskusi)](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J).

**30 Januari 2015**

- Menambahkan namespace ekstensi Protocol Buffer ke semua sisa pesan GTFS-realtime yang belum memilikinya (seperti `FeedMessage` dan `FeedEntity` ).

**28 Januari 2015**

- Menambahkan `delay` bidang eksperimental ke `TripUpdate` [(diskusi)](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8).

**16 Januari 2015**

- Perbarui deskripsi `TripDescriptor.start_time` .

**8 Januari 2015**

- Mendefinisikan enum eksperimental `OccupancyStatus` .
- Menambahkan bidang eksperimental `occupancy_status` ke `VehiclePosition` [(diskusi)](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM).

**22 Mei 2014**

- Deskripsi yang diperbarui dari enum `ScheduleRelationship` dalam pesan `StopTimeUpdate` [(diskusi)](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI).
- REPLACEMENT dihapus dari nilai enum `ScheduleRelationship` dalam pesan `TripDescriptor` [(diskusi)](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI).

**12 Oktober 2012**

- Menambahkan kolom stempel waktu ke pesan `TripUpdate` .

**30 Mei 2012**

- Menambahkan detail spesifik tentang Ekstensi ke spesifikasi.

**30 November 2011**

- Menambahkan namespace ekstensi Protocol Buffer ke pesan kunci GTFS-realtime untuk memfasilitasi penulisan ekstensi ke spesifikasi.

**25 Oktober 2011**

- Dokumentasi yang diperbarui untuk mengklarifikasi bahwa `alert` , `header_text` dan `description_text` keduanya merupakan nilai teks biasa.

**20 Agustus 2011**

- Dokumentasi yang diperbarui untuk mengklarifikasi semantik pesan `TimeRange` .

**22 Agustus 2011**

- Versi awal.
