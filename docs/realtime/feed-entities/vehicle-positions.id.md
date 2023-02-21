# Vehicle Positions

Vehicle position digunakan untuk memberikan informasi yang dibuat secara otomatis tentang lokasi kendaraan, seperti dari perangkat GPS di atas kapal. Vehicle position tunggal harus disediakan untuk setiap kendaraan yang mampu menyediakannya.

Perjalanan yang saat ini dilayani oleh kendaraan harus dilakukan melalui [TripDescriptor](../reference.md#message-tripdescriptor) . Anda juga dapat memberikan [VehicleDescriptor](../reference.md#message-vehicledescriptor) , yang menentukan kendaraan fisik yang tepat yang Anda berikan pembaruannya. Dokumentasi disediakan di bawah ini.

**Time stamp** yang menunjukkan waktu saat pembacaan posisi dilakukan dapat disediakan. Perhatikan bahwa ini berbeda dengan stempel waktu di header feed, yaitu waktu pesan ini dibuat oleh server.

**Current passage** ini juga dapat disediakan (baik sebagai `stop_sequence` atau `stop_id` ). Ini adalah referensi ke halte yang sedang dilalui kendaraan, atau sudah berhenti.

## Position

Posisi berisi data lokasi dalam Vehicle Position. Latitude dan longitude wajib diisi, kolom lainnya bersifat opsional. Jenis data ini adalah:

*   **Latitude** - derajat Utara, dalam sistem koordinat WGS-84
*   **Longitude** - derajat Timur, dalam sistem koordinat WGS-84
*   **Bearing** - arah yang dihadapi kendaraan
*   **Odometer** - jarak yang ditempuh kendaraan
*   **Speed** - kecepatan sesaat yang diukur oleh kendaraan, dalam meter per detik

## CongestionLevel

Vehicle position juga memungkinkan instansi untuk menentukan tingkat kemacetan yang dialami kendaraan saat ini. Kemacetan dapat digolongkan dalam kategori berikut:

*   Unknown congestion level
*   Running smoothly
*   Stop and go
*   Congestion
*   Severe congestion

Terserah agensi untuk mengklasifikasikan apa yang Anda kelaskan sebagai setiap jenis kemacetan. Panduan kami adalah bahwa kemacetan parah hanya digunakan dalam situasi di mana lalu lintas sangat padat sehingga orang meninggalkan mobilnya.

## OccupancyStatus

Vehicle position juga memungkinkan agen menentukan tingkat hunian penumpang untuk kendaraan tersebut. Status hunian dapat digolongkan dalam kategori berikut:

*   Empty
*   Many seats available
*   Few seats available
*   Standing room only
*   Crushed standing room only
*   Full
*   Not accepting passengers

Bidang ini masih **percobaan** , dan dapat berubah. Ini mungkin diadopsi secara formal di masa depan.

## VehicleStopStatus

Vehicle stop status memberi arti lebih pada status kendaraan sehubungan dengan perhentian yang sedang mendekat atau berada. Itu dapat diatur ke salah satu dari nilai-nilai ini.

*   **Incoming at** - kendaraan akan tiba di halte yang dirujuk
*   **Stopped at** - kendaraan berhenti di halte yang dirujuk
*   **In transit to** - perhentian yang dirujuk adalah perhentian berikutnya untuk kendaraan - **bawaan**

## VehicleDescriptor

VehicleDescriptor menggambarkan kendaraan fisik yang tepat dan dapat berisi salah satu dari atribut berikut:

*   **ID** - sistem identifikasi internal untuk kendaraan. Harus unik untuk kendaraan
*   **Label** - label yang terlihat pengguna - misalnya nama kereta api
*   **License plate** - plat nomor kendaraan yang sebenarnya
