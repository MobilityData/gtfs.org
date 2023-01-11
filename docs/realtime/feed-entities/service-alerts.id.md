# Peringatan Layanan

Peringatan layanan memungkinkan Anda memberikan pembaruan setiap kali ada gangguan pada jaringan. Penundaan dan pembatalan masing-masing perjalanan biasanya harus dikomunikasikan menggunakan [Pembaruan perjalanan](trip-updates.md) .

Anda memiliki opsi untuk memberikan yang berikut ini:

*   URL - tautan ke situs Anda yang menjelaskan lebih lanjut tentang lansiran
*   Teks tajuk - ringkasan lansiran
*   Deskripsi - deskripsi lengkap peringatan, yang akan selalu ditampilkan di samping tajuk (jadi jangan ulangi informasi ini).

## TimeRange

Lansiran akan ditampilkan jika sesuai dalam rentang waktu yang diberikan. Kisaran ini harus mencakup seluruh waktu peringatan berguna untuk dilihat penumpang.

Jika tidak ada waktu yang diberikan, kami akan menampilkan peringatan selama itu ada di feed. Jika beberapa rentang diberikan, kami akan menampilkan semuanya.

## EntitySelector

Pemilih entitas memungkinkan Anda menentukan dengan tepat bagian mana dari jaringan yang dipengaruhi oleh lansiran ini, sehingga kami hanya dapat menampilkan lansiran yang paling tepat kepada pengguna. Anda dapat menyertakan beberapa pemilih entitas untuk peringatan yang memengaruhi banyak entitas.

Entitas dipilih menggunakan pengenal GTFS mereka, dan Anda dapat memilih salah satu dari yang berikut:

*   Agensi - memengaruhi seluruh jaringan
*   Rute - memengaruhi seluruh rute
*   Jenis rute - memengaruhi rute apa pun dari jenis ini. misalnya semua kereta bawah tanah.
*   Perjalanan - memengaruhi perjalanan tertentu
*   Berhenti - memengaruhi perhentian tertentu

Anda dapat menyertakan lebih dari satu kolom yang tercantum di atas dalam satu `informed_entity` . Saat beberapa kolom disertakan dalam satu `informed_entity` , kolom tersebut harus ditafsirkan sebagai digabungkan oleh operator logika `AND` . Dengan kata lain, lansiran hanya boleh diterapkan dalam konteks yang memenuhi semua kolom yang disediakan dalam `informed_entity` . Misalnya, jika `route_id: "1"` dan `stop_id: "5"` keduanya disertakan dalam satu `informed_entity` , maka lansiran harus diterapkan hanya ke rute 1 di perhentian 5. Seharusnya TIDAK diterapkan ke perhentian lain di rute 1, dan itu TIDAK boleh diterapkan ke rute lain di halte 5.

Jika Anda ingin mewakili lansiran yang memengaruhi lebih dari satu entitas (misalnya, lansiran untuk rute 1 dan perhentian 5), Anda harus menambahkan beberapa `informed_entity` ke `alert` Anda, dengan masing-masing diterapkan ke entitas yang terpengaruh (mis. satu `informed_entity` yang termasuk rute 1 dan `informed_entity` lain yang mencakup perhentian 5).

## Cause

Apa penyebab peringatan ini? Anda dapat menentukan salah satu dari berikut ini:

*   Penyebab tidak diketahui
*   Penyebab lain (tidak diwakili oleh salah satu opsi ini)
*   Masalah teknis
*   Memukul
*   Demonstrasi
*   Kecelakaan
*   Hari libur
*   Cuaca
*   Pemeliharaan
*   Konstruksi
*   aktivitas polisi
*   Darurat medis

## Effect

Apa pengaruh masalah ini terhadap entitas yang ditentukan? Anda dapat menentukan salah satu dari berikut ini:

*   Tidak ada layanan
*   Layanan berkurang
*   Penundaan yang signifikan (penundaan yang tidak signifikan hanya boleh diberikan melalui [pembaruan Perjalanan](trip-updates.md) ).
*   Jalan memutar
*   Layanan tambahan
*   Servis yang dimodifikasi: Operasi berbeda dari apa yang biasanya diharapkan pengendara. Contohnya adalah peringatan yang mengingatkan pengendara tentang jadwal liburan yang akan datang yang berbeda dari layanan normal pada hari tersebut.
*   Berhenti pindah
*   Efek lain (tidak diwakili oleh salah satu opsi ini)
*   Efek tidak diketahui
*   Tidak berpengaruh: Peringatan memberikan informasi kepada pengendara tetapi tidak memengaruhi pengoperasian. Contohnya termasuk mengiklankan pertemuan publik dan meminta umpan balik melalui survei.
*   Masalah aksesibilitas: Lansiran memberikan informasi tentang masalah aksesibilitas yang memengaruhi akses bebas langkah. Contohnya termasuk lift yang tidak berfungsi atau landai yang dapat dipindahkan.
