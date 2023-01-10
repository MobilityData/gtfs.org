# gtfs-realtime-bindings [![Bergabunglah dengan obrolan MobilityData](https://img.shields.io/badge/chat-on%20slack-red)](https://bit.ly/mobilitydata-slack)

Binding bahasa dihasilkan dari spesifikasi buffering protokol [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) untuk bahasa populer.

## pengantar

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) adalah format data untuk mengomunikasikan informasi real-time tentang sistem angkutan umum. Data GTFS Realtime dikodekan dan didekodekan menggunakan [ProtocolBuffers](https://developers.google.com/protocol-buffers/) , representasi biner ringkas yang dirancang untuk pemrosesan yang cepat dan efisien. Skema datanya sendiri ditentukan dalam [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) .

Untuk menggunakan data GTFS-realtime, developer biasanya akan menggunakan skema `gtfs-realtime.proto` untuk membuat kelas dalam bahasa pemrograman pilihan mereka. Class ini kemudian dapat digunakan untuk membuat objek model data GTFS-realtime dan membuat serialisasinya sebagai data biner atau, dalam arah sebaliknya, mengurai data biner menjadi objek model data.

Karena membuat class model data `gtfs-realtime.proto` skema gtfs-realtime.proto adalah tugas yang umum, tetapi juga terkadang menyebabkan kebingungan bagi developer pemula, project ini bertujuan untuk menyediakan pengikatan bahasa GTFS-realtime pra-dihasilkan untuk sejumlah besar bahasa pemrograman populer. Jika memungkinkan, pengikatan bahasa ini akan dipublikasikan sebagai paket untuk memfasilitasi penggunaannya dalam proyek lain.

## Bahasa yang Didukung

* [.BERSIH](dotnet.md)
* [Jawa](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Piton](python.md)
* [Golang](golang.md)
* ~~[Rubi](ruby.md)~~ *(Tidak digunakan lagi mulai awal 2019)*
* ~~[PHP](php.md)~~ *(Tidak digunakan lagi mulai awal 2019)*

## Bahasa lainnya

Kami tidak menyediakan kode yang dihasilkan untuk C++, gunakan kompiler protoc resmi untuk itu (dari [sini](https://developers.google.com/protocol-buffers/docs/downloads) atau [sini](https://github.com/google/protobuf) )

Apakah kami kehilangan bahasa favorit Anda? Pertimbangkan untuk berkontribusi:

1. Baca [KONTRIBUSI.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md) .
2. Buka permintaan tarik dengan bahasa pilihan Anda. Harap sertakan instruksi pembaruan (idealnya, skrip). Sediakan juga kemasan yang sesuai dengan ekosistem bahasa.

## Sejarah Proyek

Proyek ini awalnya dibuat oleh Google - MobilityData mulai mempertahankan proyek tersebut pada awal 2019.

Versi pustaka binding yang lebih lama masih diterbitkan dengan nama Google. Lihat dokumentasi untuk setiap bahasa [di sini](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) untuk menemukan versi terakhir yang diterbitkan oleh Google.
