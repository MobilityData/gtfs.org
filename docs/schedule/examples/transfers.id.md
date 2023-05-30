# Transfer

<hr/>

## Blokir transfer

Block transfer, juga disebut in-seat transfer, tersedia ketika serangkaian perjalanan memenuhi ketentuan berikut:

1. Perjalanannya berurutan.
2. Kendaraan yang sama mengoperasikan kedua perjalanan.
3. Perjalanan disediakan dengan nilai `block_id` yang sama di [trips.txt](../../reference/#tripstxt) file di feed transit.

### Gunakan `block_id` untuk mengaktifkan transfer blokir

Transfer blok dapat dilakukan antara perjalanan berurutan pada rute yang berbeda atau pada rute yang sama jika rute tersebut merupakan jalur melingkar. Gunakan bidang `block_id` untuk menentukan perjalanan mana yang berada dalam satu blok dan di mana transfer di kursi merupakan opsi yang tersedia.

Sebagai contoh, pertimbangkan hal berikut [trips.txt](../../reference/#tripstxt) Dan [stop_times.txt](../../reference/#stoptimestxt) nilai:

[**trips.txt**](../../reference/#tripstxt)

| route_id | trip_id     | block_id |
|----------|-------------|----------|
| RouteA   | RouteATrip1 | Block1   |
| RouteB   | RouteBTrip1 | Block1   |

[**stop_times.txt**](../../reference/#stoptimestxt)

| trip_id     |  arrival_time |  departure_time | stop_id | stop_sequence |
|-------------| --------------- | -------------------- |---------| ------------- |
| RouteATrip1 |  12:00:00       |  12:01:00            | A       |  1            |
| RouteATrip1 |  12:05:00       |  12:06:00            | B       |  2            |
| RouteATrip1 |  12:15:00       |                      | C       |  3            |
| RouteBTrip1 |                 |  12:18:00            | C       |  1            |
| RouteBTrip1 |  12:22:00       |  12:23:00            | D       |  2            |
| RouteBTrip1 |  12:30:00       |                      | E       |  3            |

Dalam contoh ini:

- Seorang pengguna yang mencari rute dari perhentian A ke perhentian E diarahkan untuk berangkat di perhentian A pada pukul 12:00 di Rute A dan tetap berada di kendaraan saat mencapai perhentian C setelah `RouteATrip1` berakhir. Ini karena kendaraan yang sama melayani `RouteBTrip1` untuk Rute B.
- Penumpang di `RouteATrip1` yang ingin melanjutkan ke perhentian di `RouteBTrip1` dapat tetap berada di kendaraan untuk transfer ini.
- Penumpang perjalanan lain dengan kendaraan lain di sepanjang rute yang sama tidak memiliki opsi ini karena mereka menggunakan kendaraan berbeda untuk setiap perjalanan.

### Blokir transfer dalam garis lingkaran

Dalam sebuah loop line, perhentian pertama dan perhentian terakhir dari sebuah perjalanan adalah sama dan memiliki kesamaan `stop_id` . Asalkan perjalanan loop berturut-turut memiliki `block_id` yang sama, block atau in-seat transfer diaktifkan, yang memungkinkan penumpang perjalanan pertama tetap berada di kendaraan saat melanjutkan perjalanan loop berikutnya.
