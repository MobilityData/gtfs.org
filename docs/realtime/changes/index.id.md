# Perubahan GTFS Realtime

Spesifikasi GTFS Realtime tidak ditetapkan secara pasti. Sebaliknya, ini adalah spesifikasi terbuka yang dikembangkan dan dikelola oleh komunitas agen transit, developer, dan pemangku kepentingan lainnya yang menggunakan GTFS-realtime. Komunitas produsen dan konsumen data GTFS-realtime ini diharapkan memiliki proposal untuk memperluas spesifikasi guna mengaktifkan kemampuan baru.

Untuk berkontribusi pada GTFS Realtime, baca [Proses Amendemen Spesifikasi](../process) dan ikuti diskusi dalam [masalah](https://github.com/google/transit/issues) terbuka dan [permintaan penarikan](https://github.com/google/transit/pulls) di repositori Transit Github Google ( [google/transit](https://github.com/google/transit) ). ![](../../assets/mark-github.svg)

!!! note ""

    Spesifikasi resmi, referensi dan dokumentasi ditulis dalam bahasa Inggris. Jika sebuah terjemahan ke bahasa yang berbeda berbeda dari aslinya bahasa Inggris, yang terakhir diutamakan. Semua komunikasi dilakukan dalam bahasa Inggris.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Proses Perubahan Spesifikasi</a><a class="button" href="../guiding-principles">Prinsip Panduan</a><a class="button" href="../revision-history">Riwayat Revisi</a><a class="button" href="../extensions">Ekstensi Waktu Nyata</a>
</div> -->

## Proposal Aktif &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Proposal aktif untuk fitur baru diGTFS Realtime .  -->

Bergabunglah dengan diskusi di [Github](https://github.com/google/transit/pulls) !

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Menambahkancause_detail daneffect_detail ke Peringatan</a></h3>
        <p class="maintainer">#332 dibuka pada 31 Mei 2022 oleh <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">Saat ini tidak ada proposal aktif untukGTFS Realtime .</h3>
        <p class="prompt">Punya proposal? &ensp;➜&ensp; Buka sebuah <a href="https://github.com/google/transit/pulls" target="_blank">tarik permintaan</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Proposal yang Baru Digabung &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Proposal yang baru saja digabungkan yang kini menjadi fitur [spesifikasi GTFS-realtime resmi](../reference) . Lihat [Riwayat Revisi](../process#revision-history) lengkap untuk lebih lanjut.

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Tambahkan cause_detail dan effect_detail ke Alerts</a></h3><p class="maintainer"> #332 oleh <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> telah digabungkan pada 26 Jun 2022</p></div><div class="featurelist"><ul><li> Menambahkan deskripsi ke sebab dan akibat Alerts </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : pembaruan akses kursi roda</a></h3><p class="maintainer"> #340 oleh <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> digabungkan pada 25 Juli 2022</p></div><div class="featurelist"><ul><li> Menambahkan informasi waktu nyata tentang aksesibilitas perjalanan</li><li> Jika tersedia, timpa <code>trips.wheelchair_accessible</code> di set data Jadwal GTFS </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Fitur/gambar dalam peringatan</a></h3><p class="maintainer"> #283 oleh <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> digabungkan pada 26 November 2021</p></div><div class="featurelist"><ul><li> Menambahkan bidang tautan URL ke gambar (mis. foto atau peta) untuk ditampilkan di peringatan layanan aplikasi, untuk meningkatkan pemahaman peringatan</li><li> Perubahan meliputi: batas ukuran gambar yang diberlakukan, satu gambar per lansiran, dan memastikan URL berubah jika konten atau bahasa gambar berubah </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Tambahkan GTFS-NewShapes sebagai eksperimental</a></h3><p class="maintainer"> #272 oleh <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> telah digabungkan pada 30 Agustus 2021</p></div><div class="featurelist"><ul><li> Kemampuan untuk memperbarui bentuk rute secara real time untuk mencerminkan jalan memutar</li><li> Pembaruan rute direfleksikan dengan mereferensikan <code>shape_id</code> yang ada atau dengan mendefinisikan secara real time bentuk baru sebagai polyline yang disandikan </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"> <a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Tambahkan departure_occupancy_status ke TripUpdate</a></h3><p class="maintainer"> #260 oleh <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> digabungkan pada 14 Apr 2021</p></div><div class="featurelist"><ul><li> Berikan prediksi hunian kendaraan transit di perhentian mendatang berdasarkan data saat ini atau historis</li></ul></div></div>

<div class="row"/>
