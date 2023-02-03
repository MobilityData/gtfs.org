---
search:
  exclude: true
---

# Frekuensi

<hr/>

## Jelaskan layanan berbasis frekuensi

Société de Transport de Montréal mengoperasikan layanan transit di Montréal dan menjalankan layanan berbasis frekuensi untuk jalur métronya. Oleh karena itu, alih-alih memberikan jadwal denganarrival dandeparture kali dalam a GTFS kumpulan data, file [frequencies.txt](../../reference/#frequenciestxt) digunakan untuk menggambarkan frekuensi layanan di seluruh rentang layanan.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Di atas, atrip pada garis Hijau dengan `trip_id=22M-GLOBAUX-00-S_1_2` digunakan sebagai contoh. Untuk itutrip , rekor pertama menunjukkan bahwa antara pukul 16:01:25 dan 16:19:25, kereta beroperasi setiap 180 detik (atau 3 menit). Demikian pula, catatan kedua menunjukkan bahwa antara 16:19:25 dan 17:03:25, kereta berjalan setiap 165 detik.

[Contoh sumber](https://www.stm.info/en/about/developers)
