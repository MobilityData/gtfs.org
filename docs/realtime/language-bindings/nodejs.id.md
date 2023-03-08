# Binding Bahasa GTFS-realtime JavaScript

[![versi npm](https://badge.fury.io/js/gtfs-realtime-bindings.svg)](http://badge.fury.io/js/gtfs-realtime-bindings)

Menyediakan kelas JavaScript dan jenis terkaitnya yang dihasilkan dari spesifikasi ProtocolBuffer [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) . Kelas ini akan memungkinkan Anda mengurai feed data GTFS-realtime biner ProtocolBuffer ke dalam objek JavaScript.

Binding ini dirancang untuk digunakan di lingkungan [Node.js](http://nodejs.org/) , tetapi dengan sedikit usaha, mereka mungkin juga dapat digunakan di lingkungan JavaScript lainnya.

Kami menggunakan perpustakaan [ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js) untuk dukungan Penyangga Protokol JavaScript.

## Tambahkan Ketergantungan

Untuk menggunakan kelas `gtfs-realtime-bindings` di proyek Anda sendiri, Anda harus menginstal [paket npm Node.js](https://www.npmjs.com/package/gtfs-realtime-bindings) kami terlebih dahulu :

    npm install gtfs-realtime-bindings

## Kode Contoh

Cuplikan kode Node.js berikut menunjukkan pengunduhan umpan data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

Agar contoh ini berfungsi, Anda harus terlebih dahulu menginstal `node-fetch` dengan NPM.

_Catatan: contoh ini menggunakan modul ES ( `import` / `export` sintaks) dan tidak kompatibel dengan CommonJS ( `require` sintaks). Anda dapat menggunakan CommonJS dengan mengonversi `import` untuk `require` dan memasang `node-fetch@2` . Pelajari lebih lanjut tentang modul ES [di sini](https://nodejs.org/api/esm.html) ._

```javascript
import GtfsRealtimeBindings from "gtfs-realtime-bindings";
import fetch from "node-fetch";

(async () => {
  try {
    const response = await fetch("<GTFS-realtime source URL>", {
      headers: {
        "x-api-key": "<redacted>",
        // replace with your GTFS-realtime source's auth token
        // e.g. x-api-key is the header value used for NY's MTA GTFS APIs
      },
    });
    if (!res.ok) {
      const error = new Error(`${res.url}: ${res.status} ${res.statusText}`);
      error.response = res;
      throw error;
      process.exit(1);
    }
    const buffer = await response.arrayBuffer();
    const feed = GtfsRealtimeBindings.transit_realtime.FeedMessage.decode(
      new Uint8Array(buffer)
    );
    feed.entity.forEach((entity) => {
      if (entity.tripUpdate) {
        console.log(entity.tripUpdate);
      }
    });
  }
  catch (error) {
    console.log(error);
    process.exit(1);
  }
})();
```

Untuk detail lebih lanjut tentang konvensi penamaan kelas JavaScript yang dihasilkan dari [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) , lihat [proyek ProtoBuf.js](https://github.com/dcodeIO/ProtoBuf.js/wiki) yang kami gunakan untuk menangani serialisasi Protocol Buffer kami.
