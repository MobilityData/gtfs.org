---
search:
  exclude: true
---


# GTFS : Membuat Data Transportasi Umum Dapat Diakses Secara Universal

<div class="landing-page"><a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="extensions">Ekstensi</a> <a class="button" href="resources">Sumber Daya</a></div>

Itu General Transit Feed Specification (GTFS ) adalah [Standar Terbuka](https://www.interoperablemobility.org/definitions/#open_standard) yang digunakan untuk mendistribusikan informasi relevan tentang sistem transportasi umum kepada penumpang. Hal ini memungkinkan lembaga angkutan umum untuk mempublikasikan data angkutan umum mereka dalam format yang dapat digunakan oleh berbagai macam aplikasi perangkat lunak. Hari ini, ituGTFS format data digunakan oleh ribuan penyedia transportasi umum.

GTFS terdiri dari dua bagian utama:GTFS Schedule DanGTFS Realtime .GTFS Schedule berisi informasi tentang rute, jadwal, tarif, dan detail transit geografis, dan disajikan dalam file teks sederhana. Format sederhana ini memungkinkan pembuatan danMAINTENANCE tanpa bergantung pada perangkat lunak yang rumit atau berpemilik.

GTFS Realtime berisi pembaruan perjalanan, posisi kendaraan, dan peringatan layanan. Hal ini didasarkan pada Protocol Buffer, yang merupakan mekanisme netral bahasa (dan platform) untuk membuat serial data terstruktur.

GTFS didukung di seluruh dunia dan penggunaan, kepentingan, dan cakupannya semakin meningkat. Kemungkinan besar agensi yang Anda kenal sudah menggunakannyaGTFS untuk mewakili rute, jadwal, lokasi perhentian, dan informasi lainnya, dan pengendara sudah menggunakannya melalui berbagai aplikasi.

[Pelajari lebih lanjut tentang sejarah GTFS](background.md)

## Mengapa Menggunakan GTFS ?

GTFS digunakan oleh lebih dari 10.000 agen transit di lebih dari 100 negara. Sebagian besar agen transit pernah mendengarnya GTFS , dan dengan cepat menjadi standar industri. Beberapa lembaga menghasilkan data ini sendiri, sementara lembaga lainnya mempekerjakan vendor untuk membuat dan memelihara data bagi mereka. Dan karena ini adalah Standar Terbuka yang sederhana dan berbasis teks, banyak vendor teknologi transit sudah dapat membaca dan menulisGTFS file. Dengan pemahaman yang lebih baik GTFS , lembaga dapat membuat pilihan yang lebih baik terkait data. Pilihan yang diambil lembaga mengenai cara memelihara dan mendistribusikan GTFS dapat memberikan dampak besar terhadap kualitas layanan.

### Data Terbuka berarti lebih banyak peluang dan pilihan

GTFS adalah Standar Terbuka. Ini berarti bahwa lembaga-lembaga dapat menyediakan informasi dengan menggunakan salah satu dari banyak alat yang telah mendukungnya GTFS (termasuk pengeditan teks sederhana menggunakan editor teks atau spreadsheet). Standar terbuka mengarah pada penciptaan data yang dapat dibagikan dengan mudah. Umpan hanyalah kumpulan file teks yang menjelaskan suatu layanan, yang dihosting secara online pada tautan permanen yang tersedia untuk umum. Umpan yang sama dapat digunakan oleh Google, Apple, Aplikasi Transit, Open Trip Planner, dan bahkan aplikasi yang dibuat oleh penumpang. Siapapun yang ingin memberikan informasi transit yang akurat dan terkini dapat menggunakan a GTFS pakan untuk melakukannya.

Beberapa pengendara suka menggunakan aplikasi yang berbeda tergantung pada kebutuhannya—memiliki GTFS memungkinkan pengendara memilih aplikasi perencanaan perjalanan yang paling cocok untuk mereka. Beberapa aplikasi mungkin lebih mudah diakses atau lebih baik dalam memberikan informasi bagi pengendara penyandang disabilitas, beberapa aplikasi mungkin lebih sederhana dan mudah digunakan, dan terkadang pengendara hanya menginginkan aplikasi terbaru.

### GTFS mungkin dapat melakukan lebih dari yang Anda pikirkan

GTFS paling dikenal luas untuk informasi perencanaan perjalanan, khususnya di wilayah metro dengan layanan rute tetap. Namun, ada berbagai fitur opsional di luar fitur dasarGTFS Schedule spesifikasi yang dibuatGTFS lebih dapat diterapkan secara luas, termasuk Tarif untuk menunjukkan biaya dan struktur tarif, Fleksibel (dalam pengembangan) untuk opsi transit yang responsif terhadap permintaan, seperti layanan dial-a-ride dan paratransit, dan Jalur untuk menampilkan informasi aksesibilitas yang penting bagi penumpang yang menggunakan perangkat mobilitas atau membutuhkan akomodasi tambahan.GTFS Realtime dibangun di atasGTFS Schedule dan sistem GPS pada kendaraan untuk memberikan pembaruan real-time pada lokasi kendaraan.

### GTFS lebih dari sekedar perencanaan perjalanan

GTFS data sekarang digunakan oleh berbagai aplikasi perangkat lunak untuk berbagai tujuan, termasuk visualisasi data dan alat analisis untuk perencanaan. Memiliki data terkini dan berkualitas tinggi akan memberikan informasi transportasi umum yang akurat tidak hanya bagi pengendara, namun juga bagi para perencana dan pembuat kebijakan yang dapat lebih memahami bagaimana transportasi umum digunakan di komunitas mereka. Mulai tahun 2023, Administrasi Transit Federal Amerika Serikat akan mewajibkan [lembaga transit di sana untuk menyerahkan dokumen yang valid GTFS data](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) dengan laporan tahunan Basis Data Transit Nasional mereka.

## Apa itu Kualitas Tinggi GTFS ?

Kualitas tinggi GTFS lengkap, akurat, dan terkini. Artinya, ini mewakili bagaimana layanan saat ini beroperasi dan memberikan informasi sebanyak mungkin.

### Data Lengkap

Kualitas GTFS mencakup detail layanan penting seperti hari libur dan perubahan jadwal musim panas, lokasi perhentian yang akurat, dan nama rute serta rambu depan yang cocok dengan material lain yang dapat dilihat pengendara. Sekalipun sebuah agensi bekerja sama dengan vendor untuk memproduksinyaGTFS , pada akhirnya bergantung pada badan tersebut untuk memastikan bahwa informasi yang disajikan di media cetak, di pesawat, dan online adalah konsisten.

Untuk informasi tentang cara membuat data berkualitas tinggi, lihat [Pedoman Data Transit California](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) dan [GTFS Praktik terbaik](schedule/best-practices/)

### Terkini

Memiliki data yang kedaluwarsa hampir lebih buruk daripada tidak memiliki feed sama sekali. Tidak cukup hanya sekedar mempublikasikan informasi—informasi harus sesuai dengan apa yang dilihat dan dialami pengendara. Beberapa agen transit terbesar memperbaruinyaGTFS mingguan, atau bahkan setiap hari, namun sebagian besar lembaga perlu memperbarui laporan merekaGTFS setiap beberapa bulan, atau beberapa kali dalam setahun ketika layanan berubah. Hal ini mencakup hal-hal seperti rute atau perhentian baru, perubahan jadwal, atau pembaruan struktur tarif.

Banyak agensi menyewa vendor untuk membuat dan mengelola agensi mereka GTFS untuk mereka. Beberapa vendor mungkin proaktif dalam menanyakan perubahan layanan, namun penting bagi agensi untuk berkomunikasi dengan vendor tentang perubahan layanan yang akan datang. Dimungkinkan untuk mempublikasikanGTFS dengan perubahan layanan terlebih dahulu, memastikan transisi berjalan lancar untuk semua orang—agensi, vendor, perencana perjalanan, dan penumpang!
