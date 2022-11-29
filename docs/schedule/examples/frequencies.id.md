---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

# Frekuensi

<hr/>

## Jelaskan layanan berbasis frekuensi

Société de Transport de Montréal mengoperasikan layanan transit di Montréal dan menjalankan layanan berbasis frekuensi untuk jalur métronya. Oleh karena itu, alih-alih memberikan jadwal denganarrival dandeparture kali dalam aGTFS kumpulan data, file[frequencies.txt](../../reference/#frequenciestxt) digunakan untuk menggambarkan frekuensi layanan di seluruh rentang layanan.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Di atas, atrip pada garis Hijau dengan `trip_id=22M-GLOBAUX-00-S_1_2` digunakan sebagai contoh. Untuk itutrip , rekor pertama menunjukkan bahwa antara pukul 16:01:25 dan 16:19:25, kereta beroperasi setiap 180 detik (atau 3 menit). Demikian pula, catatan kedua menunjukkan bahwa antara 16:19:25 dan 17:03:25, kereta berjalan setiap 165 detik.

[Contoh sumber](https://www.stm.info/en/about/developers)
