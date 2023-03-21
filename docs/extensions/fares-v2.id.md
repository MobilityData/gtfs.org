<svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>

# GTFS-Fares v2

Fares v2 adalah proyek perpanjangan Jadwal GTFS yang bertujuan untuk mengatasi keterbatasan [Fares v1](/schedule/examples/fares-v1) .

Konsep utama yang ingin diwakili oleh Fares v2 adalah

- Produk tarif (misalnya tiket dan pass)
- Kategori pengendara (misalnya manula dan anak-anak)
- Opsi pembayaran ongkos (misalnya kartu bank dan kartu kredit)
- Pembatasan tarif

Konsep-konsep ini akan memungkinkan produsen data untuk memodelkan tarif berbasis zona, tergantung waktu, dan antar-lembaga. Proyek ekstensi ini diadopsi dalam iterasi.

Saat ini, implementasi dasar yang diadopsi dari Fares v2 berfungsi untuk kasus penggunaan berikut:

- Menentukan tarif transit
- Menggambarkan lokasi layanan di zona tarif yang sama
- Membuat aturan untuk perjalanan satu kaki
- Membuat aturan untuk transfer

Anda dapat melihat [contoh di sini](/schedule/examples/fares-v2) yang menunjukkan apa yang dapat dimodelkan menggunakan penerapan basis Fares v2 yang diadopsi.

Produsen dapat mengimplementasikan Fares v2 dalam kumpulan data yang sama dengan Fares v1, karena tidak ada konflik teknis antara keduanya. Konsumen dapat memilih versi mana yang akan digunakan secara independen dari yang lain. Dengan adopsi dan pengesahan yang memadai untuk Fares v2, Fares v1 mungkin tidak digunakan lagi di masa mendatang.

<a class="button no-icon" href="https://share.mobilitydata.org/gtfs-fares-v2" target="_blank">Lihat proposal selengkapnya</a>

## Sedang Berlangsung Fares v2 Kerja

[Proposal media tarif (sebelumnya wadah tarif) telah disahkan](https://github.com/google/transit/pull/355#issuecomment-1468326858) dan secara resmi diadopsi dalam spesifikasi!

ItuFares V2 rapat kerja sekarang akan fokus pada [pemodelan dan penerapan tarif variabel waktu.](https://github.com/google/transit/pull/357)

<a class="button no-icon" href="https://share.mobilitydata.org/slack" target="_blank">Bergabunglah dengan #gtfs-fares di Slack</a> <a class="button no-icon" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057" target="_blank">Lihat jadwal</a> <a class="button no-icon" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit" target="_blank">rapat Lihat catatan rapat</a>

## Pengadopsi Pertama

🎉 Shoutout to Fares v2 pengadopsi pertama! Setidaknya 1 produsen data dan 1 konsumen harus berkomitmen untuk mengimplementasikan fitur eksperimental sebelum pemungutan suara publik dibuka untuk menambahkannya ke spesifikasi resmi. Organisasi ini menginvestasikan banyak waktu dan energi ke dalam perubahan eksperimental untuk memastikan GTFS terus berkembang.

Untuk implementasi dasar yang diadopsi, pengadopsi pertama adalah

- Produser: [Interline](https://www.interline.io/) , [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources) , [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Konsumen: [Transit](https://transitapp.com/)

Untuk fitur fare media yang saat ini sedang dibahas, pengadopsi pertama adalah

- Produser: [Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Konsumen: [Apple](https://www.apple.com/)

## Pelacak adopsi
### Saat ini

<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shr8aT0K9bpncmy0V" target="_blank">Minta perubahan</a><a class="button no-icon" href="https://airtable.com/shr5B6Pl1r9KH9qMX" target="_blank">Tambahkan organisasi Anda (konsumen)</a><a class="button no-icon" href="https://airtable.com/shrn0Afa3TPNkOAEh" target="_blank">Tambahkan organisasi Anda (produsen)</a>

### Masa depan
<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrvnI40zuFXmDsQI" target="_blank">Tambahkan rencana masa depan Anda</a>

## Fitur Fares v2 Dalam Diskusi

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px;"></iframe>

## Sejarah

- **2017** : Riset industri dan pemodelan data
- **Oktober 2021** : [Implementasi dasar disusun dan dibagikan](https://github.com/google/transit/pull/286#issue-1026848880)
- **Desember 2021** : [Pemungutan suara terbuka #1 → tidak lolos](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Maret 2022** : [Pemungutan suara terbuka #2 → tidak lolos](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **Mei 2022** : [Open voting #3 → lolos](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **Agustus 2022** : [Diskusi komunitas tentang fase selanjutnya dari Fares v2 dimulai](https://github.com/google/transit/issues/341)
- **November 2022**: <a href="https://github.com/google/transit/pull/355" target="_blank">Permintaan tarik draf media tarif dibuka untuk umpan balik</a>
- **Desember 2022** : [Komunitas mengidentifikasi urutan tumpukan fitur untuk memprioritaskan iterasi](https://github.com/google/transit/issues/341#issuecomment-1339947915)
- **Maret 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Tarif suara media berlalu</a>