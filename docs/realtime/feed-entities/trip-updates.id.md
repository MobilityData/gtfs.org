# Trip Updates

Trip updates menunjukkan fluktuasi dalam jadwal. Kami berharap dapat menerima trip updates untuk semua perjalanan yang telah Anda jadwalkan yang dapat dilakukan secara waktu nyata. Pembaruan ini akan memberikan perkiraan waktu kedatangan atau keberangkatan untuk perhentian di sepanjang rute. Trip updates juga dapat menyediakan skenario yang lebih kompleks di mana perjalanan dibatalkan atau ditambahkan ke jadwal, atau bahkan dialihkan.

**Pengingat:** Di [GTFS](../../schedule/reference.md) , perjalanan adalah rangkaian dari dua atau lebih perhentian yang terjadi pada waktu tertentu.

Harus ada **paling banyak** satu trip updates untuk setiap perjalanan terjadwal. Jika tidak ada trip updates untuk perjalanan terjadwal, maka akan disimpulkan bahwa tidak ada data waktu nyata untuk perjalanan tersebut. Konsumen data **tidak** boleh berasumsi bahwa perjalanan berjalan tepat waktu.

Jika kendaraan melayani beberapa perjalanan dalam blok yang sama (untuk informasi lebih lanjut tentang perjalanan dan pemblokiran, harap lihat perjalanan [GTFS.txt](../../schedule/reference.md#tripstxt) ):

*   pakan harus menyertakan a TripUpdate Untuktrip saat ini dilayani olehvehicle . Produsen didorong untuk menyertakan TripUpdates untuk satu atau lebih perjalanan setelah saat ini trip di dalamvehicle 's block jika produsen yakin dengan kualitas prediksi untuk masa depan ini trip(s). Termasuk beberapa TripUpdates untuk hal yang samavehicle menghindari prediksi "pop-in" untuk pengendara sebagaivehicle transisi dari satutrip ke yang lain dan juga memberi pengendara pemberitahuan sebelumnya tentang penundaan yang berdampak pada perjalanan hilir (misalnya, ketika diketahuidelay melebihi waktu singgah yang direncanakan antara perjalanan).
*   yang bersangkutan TripUpdate entitas tidak diharuskan untuk menjadi ditambahkan ke umpan dalam urutan yang sama dengan mereka dijadwalkan di blok. Misalnya, jika ada perjalanan dengan `trip_ids` 1, 2, dan 3 yang semuanya termasuk dalam satu blok, danvehicle perjalanantrip 1, makatrip 2, dan kemudiantrip 3, itu `trip_update` entitas dapat muncul dalam urutan apa pun - misalnya, menambahkantrip 2, makatrip 1, dan kemudiantrip 3 diperbolehkan.

## StopTimeUpdate

Trip updates terdiri dari satu atau beberapa pembaruan waktu berhenti kendaraan, yang disebut sebagai [StopTimeUpdates](../reference.md#message-stoptimeupdate) . Ini dapat disediakan untuk waktu berhenti di masa lalu dan masa depan. Anda diperbolehkan, tetapi tidak diharuskan, untuk melewati waktu perhentian. Produser tidak boleh membatalkan `StopTimeUpdate` yang lalu jika mengacu pada perhentian dengan waktu kedatangan terjadwal di masa mendatang untuk perjalanan tertentu (yaitu kendaraan telah melewati perhentian lebih cepat dari jadwal), karena jika tidak maka akan disimpulkan bahwa tidak ada pembaruan untuk perhentian ini.

Misalnya, jika data berikut muncul di feed GTFS-rt:

*   Perhentian 4 – Diperkirakan pada 10:18 (dijadwalkan pada 10:20 – 2 menit lebih awal)
*   Halte 5 – Diperkirakan pada 10:30 (dijadwalkan pada 10:30 – tepat waktu)

... prediksi untuk Halte 4 tidak dapat dibatalkan dari feed hingga pukul 10:21, bahkan jika bus benar-benar melewati halte tersebut pada pukul 10:18. Jika `StopTimeUpdate` untuk Perhentian 4 dibatalkan dari umpan pada pukul 10:18 atau 10:19, dan waktu kedatangan yang dijadwalkan adalah pukul 10:20, konsumen harus berasumsi bahwa tidak ada informasi waktu nyata untuk Perhentian 4 pada waktu itu, dan data jadwal dari GTFS harus digunakan.

Setiap [StopTimeUpdate](../reference.md#message-stoptimeupdate) ditautkan ke perhentian. Biasanya hal ini dapat dilakukan menggunakan stop_sequence GTFS atau stop_id GTFS. Namun, jika Anda memberikan pembaruan untuk perjalanan tanpa trip_id GTFS, Anda harus menentukan stop_id karena stop_sequence tidak memiliki nilai. stop_id masih harus mereferensikan stop_id di GTFS. Jika stop_id yang sama dikunjungi lebih dari sekali dalam satu perjalanan, maka stop_sequence harus disediakan di semua StopTimeUpdates untuk stop_id tersebut pada perjalanan tersebut.

Pembaruan dapat memberikan waktu yang tepat untuk **arrival** dan/atau **departure** di perhentian di [StopTimeUpdates](../reference.md#message-stoptimeupdate) menggunakan [StopTimeEvent](../reference.md#message-stoptimeevent) . Ini harus berisi **time** absolut atau **delay** (yaitu, offset dari waktu yang dijadwalkan dalam detik). Penundaan hanya dapat digunakan jika trip updates mengacu pada perjalanan GTFS terjadwal, bukan perjalanan berbasis frekuensi. Dalam hal ini, waktu harus sama dengan waktu yang dijadwalkan + penundaan. Anda juga dapat menentukan **uncertainty** prediksi bersama dengan [StopTimeEvent](../reference.md#message-stoptimeevent) , yang dibahas lebih detail di bagian [Ketakpastian](#ketakpastian) di bagian bawah halaman.

Untuk setiap [StopTimeUpdate](../reference.md#message-stoptimeupdate) , hubungan jadwal default **scheduled** . (Perhatikan bahwa ini berbeda dari hubungan jadwal perjalanan). Anda dapat mengubahnya menjadi **skipped** jika perhentian tidak akan dihentikan, atau **no data** jika Anda hanya memiliki data waktu nyata untuk beberapa perjalanan.

**Pembaruan harus diurutkan berdasarkan stop_sequence** (atau stop_ids sesuai urutan kemunculannya dalam perjalanan).

Jika satu atau beberapa perhentian hilang di sepanjang perjalanan, `delay` dari pembaruan (atau, jika hanya `time` yang diberikan dalam pembaruan, penundaan yang dihitung dengan membandingkan `time` dengan waktu jadwal GTFS) diterapkan ke semua perhentian berikutnya. Ini berarti memperbarui waktu perhentian untuk perhentian tertentu akan mengubah semua perhentian berikutnya jika tidak ada informasi lain. Perhatikan bahwa pembaruan dengan hubungan jadwal `SKIPPED` tidak akan menghentikan propagasi penundaan, tetapi pembaruan dengan hubungan jadwal `SCHEDULED` (juga nilai default jika hubungan jadwal tidak disediakan) atau `NO_DATA` akan melakukannya.

**Contoh 1**

Untuk perjalanan dengan 20 perhentian, [StopTimeUpdate](../reference.md#message-stoptimeupdate) dengan delay kedatangan dan delay keberangkatan 0 ( [StopTimeEvents](../reference.md#message-stoptimeevent) ) untuk stop_sequence dari perhentian saat ini berarti perjalanan tepat waktu.

**Contoh 2**

Untuk contoh perjalanan yang sama, tiga [StopTimeUpdates](../reference.md#message-stoptimeupdate) disediakan:

*   penundaan 300 detik untuk stop_sequence 3
*   penundaan 60 detik untuk stop_sequence 8
*   [ScheduleRelationship](../reference.md#enum-schedulerelationship) dari `NO_DATA` untuk stop_sequence 10

Ini akan ditafsirkan sebagai:

*   stop_sequences 1,2 memiliki penundaan yang tidak diketahui.
*   stop_sequences 3,4,5,6,7 memiliki delay 300 detik.
*   stop_sequences 8,9 memiliki delay 60 detik.
*   stop_sequences 10,..,20 memiliki penundaan yang tidak diketahui.

## TripDescriptor

Informasi yang diberikan oleh TripDescriptor bergantung pada hubungan jadwal perjalanan yang Anda perbarui. Ada beberapa opsi untuk Anda atur:

| _** Nilai**_         | _** Komentar**_                                                                                                                                                                                                                  |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ** Scheduled**     |  Perjalanan ini berjalan sesuai jadwal GTFS, atau cukup dekat untuk tetap dikaitkan dengannya.                                                                                                                                   |
| ** Added**     |  Perjalanan ini tidak dijadwalkan dan telah ditambahkan. Misalnya untuk mengatasi permintaan, atau mengganti kendaraan yang mogok.                                                                                               |
| ** Unscheduled** |  Perjalanan ini berjalan dan tidak pernah dikaitkan dengan jadwal. Misalnya, jika tidak ada jadwal dan bus beroperasi dengan layanan antar-jemput.                                                                               |
| ** Canceled**      |  Perjalanan ini dijadwalkan, tetapi sekarang dihapus.                                                                                                                                                                            |
| ** Duplicated**      |  Perjalanan baru ini adalah salinan dari perjalanan yang sudah ada di GTFS statis kecuali untuk tanggal dan waktu mulai layanan. Perjalanan baru akan berjalan pada tanggal dan waktu layanan yang ditentukan di TripProperties. |

Biasanya, Anda harus memberikan trip_id dari perjalanan terjadwal di GTFS yang terkait dengan pembaruan ini.

#### Sistem dengan trip_id berulang

Untuk sistem yang menggunakan trip_id berulang, misalnya perjalanan yang dimodelkan menggunakan frequencies.txt, yaitu perjalanan berbasis frekuensi, trip_id itu sendiri bukanlah pengidentifikasi unik dari satu perjalanan, karena tidak memiliki komponen waktu tertentu. Untuk mengidentifikasi perjalanan tersebut secara unik dalam a TripDescriptor, tiga pengidentifikasi harus disediakan:

*   **trip_id**
*   **start_time**
*   **start_date**

start_time harus dipublikasikan pertama kali, dan setiap pembaruan feed berikutnya harus menggunakan start_time yang sama saat merujuk ke perjalanan yang sama. StopTimeUpdates harus digunakan untuk menunjukkan penyesuaian; start_time tidak harus tepat waktu keberangkatan dari stasiun pertama, meskipun harus cukup dekat dengan waktu tersebut.

Misalnya, kita memutuskan pada pukul 10:00, 25 Mei 2015, bahwa perjalanan dengan trip_id=T akan dimulai pada start_time=10:10:00, dan memberikan informasi ini melalui umpan waktu nyata pada pukul 10:01. Pada pukul 10:05 kami tiba-tiba mengetahui bahwa perjalanan akan dimulai bukan pada pukul 10:10 tetapi pada pukul 10:13. Dalam feed realtime baru kami, kami masih dapat mengidentifikasi tripas ini (T, 25-05-2015, 10:10:00) tetapi memberikan StopTimeUpdate dengan keberangkatan dariperhentian pertama pada 10:13:00.

#### Pencocokan perjalanan alternatif

Perjalanan yang bukan berdasarkan frekuensi juga dapat diidentifikasi secara unik oleh a TripDescriptor termasuk kombinasi dari:

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

di mana start_time adalah waktu mulai terjadwal seperti yang ditentukan dalam jadwal statis, selama kombinasi id yang diberikan menghasilkan perjalanan unik.

## Ketakpastian

Ketidakpastian berlaku untuk waktu dan nilai penundaan dari [StopTimeUpdate](../reference.md#message-stoptimeupdate) . Ketidakpastian secara kasar menentukan kesalahan yang diharapkan dalam penundaan yang sebenarnya sebagai bilangan bulat dalam hitungan detik (tetapi perhatikan, arti statistik yang tepat belum ditentukan). Ketidakpastian bisa menjadi 0, misalnya untuk kereta api yang digerakkan di bawah kontrol waktu komputer.

Sebagai contoh sebuah bus jarak jauh yang memiliki perkiraan keterlambatan 15 menit tiba di halte berikutnya dalam jendela kesalahan 4 menit (yaitu +2 / -2 menit) akan memiliki nilai Ketidakpastian 240.
