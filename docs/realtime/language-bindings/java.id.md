# Binding Bahasa Java GTFS-realtime

![Versi Pusat Maven](https://img.shields.io/maven-central/v/org.mobilitydata/gtfs-realtime-bindings.svg)

Menyediakan kelas Java yang dihasilkan dari spesifikasi Buffer Protokol [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime) . Kelas-kelas ini akan memungkinkan Anda mengurai umpan data  Protokol Buffer real-time GTFS biner ke objek Java.

## Tambahkan Ketergantungan

Untuk menggunakan `gtfs-realtime-bindings` di project Anda sendiri, Anda perlu menambahkan dependensi yang sesuai. Kami memublikasikan modul kami ke [Maven Central Repository](http://search.maven.org/) sehingga dapat dengan mudah direferensikan oleh alat build Java seperti Maven, Ivy, dan Gradle.

Untuk [Maven](http://maven.apache.org/) , tambahkan kode berikut ke bagian dependensi `pom.xml` Anda:

```xml
<dependency>
  <groupId>org.mobilitydata</groupId>
  <artifactId>gtfs-realtime-bindings</artifactId>
  <version>0.0.8</version>
</dependency>
```

Untuk [Gradle](https://www.gradle.org/) , tambahkan kode berikut ke bagian dependensi `build.gradle` Anda:

    compile group: 'org.mobilitydata', name: 'gtfs-realtime-bindings', version: '0.0.8'

Pastikan repositori pusat Maven direferensikan oleh proyek Anda.

## Kode Contoh

Cuplikan kode berikut menunjukkan pengunduhan feed data GTFS-realtime dari URL tertentu, menguraikannya sebagai FeedMessage (jenis root dari skema GTFS-realtime), dan mengulangi hasilnya.

```java
import java.net.URL;

import com.google.transit.realtime.GtfsRealtime.FeedEntity;
import com.google.transit.realtime.GtfsRealtime.FeedMessage;

public class GtfsRealtimeExample {
  public static void main(String[] args) throws Exception {
    URL url = new URL("URL OF YOUR GTFS-REALTIME SOURCE GOES HERE");
    FeedMessage feed = FeedMessage.parseFrom(url.openStream());
    for (FeedEntity entity : feed.getEntityList()) {
      if (entity.hasTripUpdate()) {
        System.out.println(entity.getTripUpdate());
      }
    }
  }
}
```

Untuk detail lebih lanjut tentang konvensi penamaan untuk kelas Java yang dihasilkan dari [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto) , lihat bagian [Java Generated Code](https://developers.google.com/protocol-buffers/docs/reference/java-generated) di situs developer Protocol Buffers.

## Sejarah Proyek

### `0.0.4` dan lebih rendah

Proyek ini awalnya dibuat oleh Google. Anda dapat mengunduh versi `0.0.4` dan yang lebih lama di bawah ID Grup `com.google.transit` [di sini di Maven Central](https://search.maven.org/search?q=g:com.google.transit%20AND%20a:gtfs-realtime-bindings) .

### `0.0.5`

MobilityData mulai mempertahankan proyek pada awal 2019 dan awalnya menerbitkan artefak rilis melalui JCenter. Anda dapat mengunduh versi `0.0.5` di bawah ID Grup `io.mobilitydata.transit` [di sini di Maven Central](https://search.maven.org/artifact/io.mobilitydata.transit/gtfs-realtime-bindings) .

### `0.0.6` dan `0.0.7`

JCenter [ditutup](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/) pada tahun 2021. Sebelum penonaktifan, masalah sinkronisasi mencegah versi `0.0.6` dan `0.0.7` disinkronkan dari JCenter ke Maven Central, jadi pengunduhan artefak langsung saat ini tidak tersedia untuk versi ini. Namun, Anda dapat mengompilasinya sendiri dari [tag](https://github.com/MobilityData/gtfs-realtime-bindings/tags) menggunakan perintah `mvn package` .

### `0.0.8` dan lebih tinggi

Pada tahun 2022, MobilityData beralih ke penerbitan artefak langsung ke Maven Central di bawah ID Grup `org.mobilitydata` , di mana versi 0.0.8 dan lebih tinggi diterbitkan.
