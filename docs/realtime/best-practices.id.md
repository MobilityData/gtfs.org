# GTFSRealtime Praktik terbaik

## pengantar

Ini adalah praktik yang direkomendasikan untuk mendeskripsikanRealtime informasi transportasi umum diGTFSRealtime format data.

### Struktur Dokumen

Praktik yang direkomendasikan disusun menjadi dua bagian utama

* __[Rekomendasi Praktik Disusun berdasarkan Pesan](#practice-recommendations-organized-by-message) :__ Rekomendasi disusun berdasarkan pesan dan bidang dalam urutan yang sama seperti yang dijelaskan dalam resmiGTFSRealtime referensi.
* __[Rekomendasi Praktik Disusun berdasarkan Kasus](#practice-recommendations-organized-by-use-case) :__ Dengan kasus-kasus tertentu, seperti layanan berbasis frekuensi (vs.Schedule berbasis layanan), praktik mungkin perlu diterapkan di beberapa pesan dan bidang serta yang sesuaiGTFSSchedule data. Rekomendasi tersebut dikonsolidasikan dalam bagian ini.

### Penerbitan Umpan & Praktik Umum

* Umpan harus dipublikasikan di URL publik dan permanen
* URL harus dapat diakses langsung tanpa memerlukan login untuk mengakses feed. Jika diinginkan, kunci API dapat digunakan tetapi pendaftaran untuk kunci API harus otomatis dan tersedia untuk semua.
* Pertahankan pengidentifikasi persisten (bidang id) dalam aGTFSRealtime feed (misalnya, `FeedEntity.id` , `VehicleDescriptor.id` , `CarriageDetails.id` ) di seluruh iterasi feed.
* GTFSRealtime feed harus di-refresh setidaknya sekali setiap 30 detik, atau setiap kali informasi yang diwakili dalam feed (posisi kendaraan) berubah, mana yang lebih sering. VehiclePositions cenderung berubah lebih sering daripada entitas feed lainnya dan harus diperbarui sesering mungkin. Jika konten tidak berubah, umpan harus diperbarui dengan stempel waktu `FeedHeader.timestamp` yang mencerminkan bahwa informasi tersebut masih relevan pada stempel waktu tersebut.
* Data dalamGTFSRealtime feed tidak boleh lebih dari 90 detik untuk Pembaruan Perjalanan dan Posisi Kendaraan dan tidak lebih dari 10 menit untuk Peringatan Layanan. Misalnya, meskipun produsen terus memperbarui stempel waktu `FeedHeader.timestamp` setiap 30 detik, usia VehiclePositions dalam umpan tersebut tidak boleh lebih dari 90 detik.
* Server hostingGTFSRealtime data harus dapat diandalkan dan secara konsisten mengembalikan respons berkode protobuf yang diformat secara valid. Kurang dari 1% tanggapan seharusnya tidak valid (kesalahan protobuf atau kesalahan pengambilan).
* Hosting server webGTFSRealtime data harus dikonfigurasi untuk melaporkan tanggal modifikasi file dengan benar (lihat HTTP/1.1 - Permintaan Komentar 2616, di bawah Bagian 14.29) sehingga konsumen dapat memanfaatkan header HTTP `If-Modified-Since` . Ini menghemat bandwidth produsen dan konsumen dengan menghindari mentransfer konten feed yang tidak berubah.
* Umpan harus menyediakan konten umpan yang disandikan buffer protokol secara default saat ditanya melalui permintaan HTTP di URL yang diberikan - konsumen tidak perlu menentukan header penerimaan HTTP khusus untuk menerima konten yang dikodekan buffer protokol.
* Karena cara buffer protokol mengkodekan [nilai opsional](https://developers.google.com/protocol-buffers/docs/proto#optional) , sebelum membaca data dari aGTFSRealtime konsumen feed harus memeriksa keberadaan nilai menggunakan metode `hasX()` yang dihasilkan buffer protokol sebelum menggunakan nilai itu dan hanya boleh menggunakan nilai jika `hasX()` benar (di mana `X` adalah nama bidang). Jika `hasX()` mengembalikan `false` , nilai default untuk bidang itu ditentukan dalamGTFS `GTFS - Realtime .proto`Realtime nilai `GTFS - Realtime .proto` harus diasumsikan. Jika konsumen menggunakan nilai tanpa memeriksa metode `hasX()` terlebih dahulu, itu mungkin membaca data default yang tidak sengaja dipublikasikan oleh produsen.
* Umpan harus menggunakan HTTPS, bukan HTTP (tanpa enkripsi) untuk memastikan integritas umpan.
* Umpan harus mencakup sebagian besar perjalanan yang termasuk dalam statis pengiringGTFS Himpunan data. Secara khusus, ini harus mencakup data untuk area kota dengan kepadatan tinggi dan lalu lintas tinggi serta rute sibuk.

## Rekomendasi Praktik Disusun berdasarkan Pesan

### FeedHeader

|  Nama Bidang            |  Rekomendasi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `gtfs_realtime_version` |  Versi saat ini adalah "2.0". SemuaGTFSRealtime feed harus "2.0" atau lebih tinggi, sebagai versi awalGTFSRealtime tidak memerlukan semua bidang yang diperlukan untuk mewakili berbagai situasi transit secara memadai.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `timestamp`             |  Stempel waktu ini tidak boleh berkurang di antara dua iterasi feed berurutan.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
|                         |  Nilai stempel waktu ini harus selalu berubah jika konten feed berubah - konten feed tidak boleh berubah tanpa memperbarui header`timestamp` .<br/><br/>* Kesalahan Umum* - Jika ada beberapa contohGTFSRealtime umpan di belakang penyeimbang beban, setiap instans mungkin menarik informasi dariRealtime sumber data dan mempublikasikannya ke konsumen sedikit tidak sinkron. Jika sebuahGTFSRealtime konsumen membuat dua permintaan back-to-back, dan setiap permintaan dilayani oleh yang berbedaGTFSRealtime feed instance, konten feed yang sama berpotensi dikembalikan ke konsumen dengan stempel waktu yang berbeda.<br/><br/>* Solusi yang mungkin* - Produsen harus menyediakan`Last-Modified` Header HTTP, dan konsumen harus melewati yang terbaru`If-Modified-Since` Header HTTP untuk menghindari menerima data basi.<br/><br/>* Solusi yang mungkin* - Jika header HTTP tidak dapat digunakan, opsi seperti sesi sticky dapat digunakan untuk memastikan bahwa setiap konsumen dirutekan ke server produsen yang sama. |

### Entitas Umpan

Semua entitas hanya boleh dihapus dari aGTFSRealtime feed ketika mereka tidak lagi relevan bagi pengguna. Umpan dianggap tanpa kewarganegaraan, artinya setiap umpan mencerminkan seluruh status waktu nyata dari sistem transit. Jika suatu entitas disediakan dalam satu instans feed tetapi dihapus dalam pembaruan feed berikutnya, harus diasumsikan bahwa tidak ada informasi waktu nyata untuk entitas tersebut.

|  Nama Bidang |  Rekomendasi                                 |
| ------------ | -------------------------------------------- |
| `id`         |  Harus tetap stabil selama durasi perjalanan |

### Pembaruan Perjalanan

Pedoman umum untuk pembatalan perjalanan:

* Saat membatalkan perjalanan selama beberapa hari, produsen harus memberikan TripUpdates yang merujuk pada `trip_ids` dan `start_dates` yang diberikan sebagai `CANCELED` serta Peringatan dengan `NO_SERVICE` yang merujuk pada `trip_ids` dan `TimeRange` yang sama yang dapat ditunjukkan kepada pengendara yang menjelaskan pembatalan (mis., jalan memutar).
* Jika tidak ada perhentian dalam perjalanan yang akan dikunjungi, perjalanan harus `CANCELED` daripada semua `stop_time_updates` ditandai sebagai `SKIPPED` .

|  Nama Bidang       |  Rekomendasi                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `trip`             |  Mengacu pada[ pesan TripDescriptor](#TripDescriptor) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|                    |  Jika terpisah`VehiclePosition` dan`TripUpdate` umpan disediakan,[ PerjalananDescriptor](#TripDescriptor) dan[ KendaraanDescriptor](#VehicleDescriptor) Pasangan nilai ID harus cocok di antara kedua feed.<br/><br/> Misalnya,`VehiclePosition` entitas memiliki`vehicle_id:A` dan`trip_id:4` , maka yang sesuai`TripUpdate` entitas juga harus memiliki`vehicle_id:A` dan`trip_id:4` . Jika ada`TripUpdate` entitas memiliki`trip_id:4` dan apa saja`vehicle_id` selain 4, ini adalah kesalahan.                                                                                                                                                                                               |
| `vehicle`          |  Mengacu pada[ pesan KendaraanDescriptor](#VehicleDescriptor) .                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|                    |  Jika terpisah`VehiclePosition` dan`TripUpdate` umpan disediakan,[ PerjalananDescriptor](#TripDescriptor) dan[ KendaraanDescriptor](#VehicleDescriptor) Pasangan nilai ID harus cocok di antara kedua feed.<br/><br/> Misalnya,`VehiclePosition` entitas memiliki`vehicle_id:A` dan`trip_id:4` , maka yang sesuai`TripUpdate` entitas juga harus memiliki`vehicle_id:A` dan`trip_id:4` . Jika ada`TripUpdate` entitas memiliki`trip_id:4` dan apa saja`vehicle_id` selain 4, ini adalah kesalahan.                                                                                                                                                                                               |
| `stop_time_update` | `stop_time_updates` untuk diberikan`trip_id` harus dipesan secara ketat dengan meningkatkan`stop_sequence` dan tidak`stop_sequence` harus diulang.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|                    |  Saat perjalanan sedang berlangsung, semua`TripUpdates` harus mencakup setidaknya satu`stop_time_update` dengan perkiraan waktu kedatangan atau keberangkatan di masa yang akan datang. Perhatikan bahwa[GTFSRealtime spesifikasi](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/trip-updates.md#stop-time-updates) mengatakan bahwa produsen tidak boleh meninggalkan masa lalu`StopTimeUpdate` jika mengacu pada perhentian dengan waktu kedatangan yang dijadwalkan di masa depan untuk perjalanan yang diberikan (yaitu kendaraan telah melewati perhentian di depanSchedule ), karena jika tidak, akan disimpulkan bahwa tidak ada pembaruan untuk pemberhentian ini. |
| `timestamp`        |  Harus mencerminkan waktu prediksi perjalanan ini diperbarui.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| `delay`            | `TripUpdate.delay` harus mewakiliSchedule deviasi, yaitu nilai masa lalu yang diamati untuk seberapa di depan/belakangSchedule kendaraan tersebut. Prediksi untuk pemberhentian di masa depan harus diberikan melalui`StopTimeEvent.delay` atau`StopTimeEvent.time` .                                                                                                                                                                                                                                                                                                                                                                                                                            |

### PerjalananDescriptor

Jika feed `TripUpdate` dan `VehiclePosition` terpisah disediakan, pasangan nilai ID [TripDescriptor](#TripDescriptor) dan [VehicleDescriptor](#VehicleDescriptor) ID harus cocok di antara kedua feed tersebut.

Misalnya, entitas `VehiclePosition` memiliki `vehicle_id:A` dantrip_id `trip_id :4` , maka entitas `TripUpdate` yang sesuai juga harus memiliki `vehicle_id:A` dantrip_id `trip_id :4` .

|  Nama Bidang            |  Rekomendasi                                                                                     |
| ----------------------- | ------------------------------------------------------------------------------------------------ |
| `schedule_relationship` |  Perilaku dari`ADDED` perjalanan tidak ditentukan dan penggunaan enumerasi ini tidak dianjurkan. |

### KendaraanDescriptor

Jika feed `TripUpdate` dan `VehiclePosition` terpisah disediakan, pasangan nilai ID [TripDescriptor](#TripDescriptor) dan [VehicleDescriptor](#VehicleDescriptor) ID harus cocok di antara kedua feed tersebut.

Misalnya, entitas `VehiclePosition` memiliki `vehicle_id:A` dantrip_id `trip_id :4` , maka entitas `TripUpdate` yang sesuai juga harus memiliki `vehicle_id:A` dantrip_id `trip_id :4` .

|  Nama Bidang |  Rekomendasi                                                                              |
| ------------ | ----------------------------------------------------------------------------------------- |
| `id`         |  Harus mengidentifikasi kendaraan secara unik dan stabil selama seluruh durasi perjalanan |

### StopTimeUpdate

|  Nama Bidang    |  Rekomendasi                                                                                                                                                                                                                                                                |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `stop_sequence` |  Menyediakan`stop_sequence` bila memungkinkan, karena jelas memutuskan untuk aGTFS hentikan waktu di`stop_times.txt` tidak seperti`stop_id` , yang dapat terjadi lebih dari sekali dalam satu perjalanan (misalnya, rute loop).                                             |
| `arrival`       |  Waktu kedatangan antara pemberhentian berurutan harus meningkat - tidak boleh sama atau berkurang.                                                                                                                                                                         |
|                 |  Kedatangan`time` (ditentukan dalam[ StopTimeEvent](#StopTimeEvent) ) harus sebelum keberangkatan`time` untuk perhentian yang sama jika waktu singgah atau tinggal diharapkan - jika tidak, kedatangan`time` harus sama dengan keberangkatan`time` .                        |
| `departure`     |  Waktu keberangkatan antara pemberhentian berurutan harus meningkat - tidak boleh sama atau berkurang.                                                                                                                                                                      |
|                 |  Keberangkatan`time` (ditentukan dalam[ StopTimeEvent](#StopTimeEvent) ) harus sama dengan kedatangan`time` untuk pemberhentian yang sama jika tidak ada waktu singgah atau waktu tunggu yang diharapkan - jika tidak, keberangkatan`time` harus setelah kedatangan`time` . |

### StopTimeEvent

|  Nama Bidang |  Rekomendasi                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `delay`      |  Jika hanya`delay` disediakan dalam`stop_time_update` `arrival` atau`departure` (dan tidak`time` ), makaGTFS[`stop_times.txt`](https://gtfs.org/reference/static#stopstxt) harus mengandung`arrival_times` dan/atau`departure_times` untuk pemberhentian yang sesuai ini. SEBUAH`delay` nilai dalamRealtime umpan tidak ada artinya kecuali Anda memiliki waktu untuk menambahkannya ke dalamGTFS`stop_times.txt` mengajukan. |

### Posisi Kendaraan

Berikut adalah kolom yang direkomendasikan yang harus disertakan untuk feed VehiclePostions guna menyediakan data berkualitas tinggi kepada konsumen (misalnya, untuk menghasilkan prediksi)

|  Nama bidang         |  Catatan                                                                                                                                                                                                                                                                            |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `entity.id`          |  Harus tetap stabil selama durasi perjalanan                                                                                                                                                                                                                                        |
| `vehicle.timestamp`  |  Sangat disarankan untuk memberikan stempel waktu di mana posisi kendaraan diukur. Jika tidak, konsumen harus menggunakan stempel waktu pesan, yang dapat memberikan hasil yang menyesatkan bagi pengendara ketika pesan terakhir diperbarui lebih sering daripada posisi individu. |
| `vehicle.vehicle.id` |  Harus mengidentifikasi kendaraan secara unik dan stabil selama seluruh durasi perjalanan                                                                                                                                                                                           |

### Posisi

Posisi kendaraan harus berada dalam jarak 200 meter dariGTFSshapes.txt data untuk perjalanan saat ini kecuali ada peringatan dengan efek `DETOUR` untuk initrip_id .

### Peringatan

Pedoman umum untuk lansiran:

* Kapantrip_id danstart_time berada dalam interval `exact_time=1` ,start_time harus lebih lambat dari awal interval dengan kelipatan tepat `headway_secs` .
* Saat membatalkan perjalanan selama beberapa hari, produsen harus memberikan TripUpdates yang merujuk pada `trip_ids` dan `start_dates` yang diberikan sebagai `CANCELED` serta Peringatan dengan `NO_SERVICE` yang merujuk pada `trip_ids` dan `TimeRange` yang sama yang dapat ditunjukkan kepada pengendara yang menjelaskan pembatalan (mis., jalan memutar).
* Jika lansiran memengaruhi semua perhentian pada suatu jalur, gunakan lansiran berbasis garis alih-alih lansiran berbasis berhenti. Jangan menerapkan peringatan ke setiap pemberhentian jalur.
* Meskipun tidak ada batasan karakter untuk lansiran layanan, pengendara angkutan umum akan sering melihat lansiran di perangkat seluler. Harap ringkas.

|  Nama Bidang       |  Rekomendasi                                                                  |
| ------------------ | ----------------------------------------------------------------------------- |
| `description_text` |  Gunakan jeda baris untuk membuat peringatan layanan Anda lebih mudah dibaca. |

## Rekomendasi Praktik Diorganisir oleh Use Case

### Perjalanan berbasis frekuensi

Perjalanan berbasis frekuensi tidak mengikuti perjalanan tetapSchedule tetapi mencoba untuk mempertahankan kemajuan yang telah ditentukan. Perjalanan ini dilambangkan dalam [GTFS](<https://\<glossary variable=>) [.org/reference/static/#frequenciestxt">](<https://\<glossary variable=>)GTFS [frequency.txt](<https://\<glossary variable=>) dengan menyetel `exact_times=0` atau menghilangkan bidang `exact_times` (perhatikan bahwa `exact_times=1` perjalanan *BUKAN* perjalanan berbasis frekuensi -frequencies.txt dengan `exact_times=1` hanya digunakan sebagai metode kenyamanan untuk menyimpanSchedule - perjalanan berbasis dengan cara yang lebih kompak). Ada beberapa praktik terbaik yang perlu diingat saat membangunGTFSRealtime feed untuk perjalanan berbasis frekuensi.

* Di [TripUpdate.StopTimeUpdate](#StopTimeUpdate) , [StopTimeEvent](#StopTimeEvent) untuk `arrival` dan `departure` tidak boleh berisi `delay` karena perjalanan berbasis frekuensi tidak mengikuti jadwal tetapSchedule . Sebaliknya, `time` harus disediakan untuk menunjukkan prediksi kedatangan/keberangkatan.

* Seperti yang disyaratkan oleh spesifikasi, saat menjelaskan `trip` di [TripUpdate](#TripUpdate) atau [VehiclePosition](#VehiclePosition) dengan menggunakan [TripDescriptor](#TripDescriptor) , semuatrip_id ,start_time , dan `start_date` harus disediakan. Selain itu, `schedule_relationship` harus `UNSCHEDULED` .

(misalnya, perjalanan penegakan kembali).

## Tentang Dokumen Ini

### Tujuan

Tujuan memeliharaGTFSRealtime Praktik Terbaik adalah untuk:

* Tingkatkan pengalaman pelanggan pengguna akhir di aplikasi transportasi umum
* Permudah pengembang perangkat lunak untuk menerapkan dan menskalakan aplikasi, produk, dan layanan

### Bagaimana mengusulkan atau mengubah diterbitkanGTFSRealtime Praktik terbaik

GTFS aplikasi dan praktik berkembang, sehingga dokumen ini mungkin perlu diubah dari waktu ke waktu. Untuk mengusulkan amandemen dokumen ini, buka permintaan tarik [di](https://github.com/MobilityData/GTFS_Realtime_Best-Practices)GTFSRealtime [Praktik Terbaik repositori GitHub](https://github.com/MobilityData/GTFS_Realtime_Best-Practices) dan menganjurkan perubahan.

### Menautkan ke Dokumen Ini

Silakan tautkan di sini untuk memberikan panduan kepada produsen pakan untuk pembentukan yang benarGTFSRealtime data. Setiap rekomendasi individu memiliki tautan jangkar. Klik rekomendasi untuk mendapatkan URL tautan jangkar dalam halaman.

Jika sebuahGTFSRealtime -aplikasi yang memakan membuat persyaratan atau rekomendasi untukGTFSRealtime praktik data yang tidak dijelaskan di sini, disarankan untuk menerbitkan dokumen dengan persyaratan atau rekomendasi tersebut untuk melengkapi praktik terbaik umum ini.
