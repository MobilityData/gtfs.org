# Binding Bahasa Ruby GTFS-realtime

[![Versi Permata](https://badge.fury.io/rb/gtfs-realtime-bindings.svg)](https://badge.fury.io/rb/gtfs-realtime-bindings)

Memberikan kelas Ruby yang dihasilkan dari [spesifikasi GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) ProtocolBuffer. Kelas ini akan memungkinkan Anda mengurai feed data GTFS-realtime biner ProtocolBuffer ke objek Ruby.

!!! fail "Usang"

    *Mulai Februari 2019, alat protoc Google resmi `google-protobuf` [tidak mendukung ekstensi](https://github.com/protocolbuffers/protobuf/issues/1198) dalam file proto2. Alat pihak ke-3, [ruby-protocol-buffers](https://github.com/codekitchen/ruby-protocol-buffers), dapat diinstal menggunakan `gem install ruby-protocol-buffers`, tetapi tampaknya tidak cocok dengan struktur yang ada Ruby GTFS-rt binding, karena unit test gagal. Akibatnya, kami tidak lagi menggunakan Ruby binding hingga dukungan resmi untuk file proto2 diterapkan di alat penyangga protokol Google.*

## Tambahkan Ketergantungan

Untuk menggunakan kelas `gtfs-realtime-bindings` di proyek Anda sendiri, Anda harus menginstal [permata Ruby terlebih dahulu](https://rubygems.org/gems/gtfs-realtime-bindings) :

    gem install gtfs-realtime-bindings

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan umpan data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

```ruby
require 'protobuf'
require 'google/transit/gtfs-realtime.pb'
require 'net/http'
require 'uri'

data = Net::HTTP.get(URI.parse("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE"))
feed = Transit_realtime::FeedMessage.decode(data)
for entity in feed.entity do
  if entity.field?(:trip_update)
    p entity.trip_update
  end
end
```

Untuk detail lebih lanjut tentang konvensi penamaan kelas Ruby yang dihasilkan dari [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) , lihat [file sumber gtfs-realtime.pb.rb](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/ruby/lib/google/transit/gtfs-realtime.pb.rb) .
