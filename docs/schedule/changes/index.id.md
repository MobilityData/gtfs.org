---
search:
  exclude: true
---

# GTFS Schedule Perubahan

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

Itu GTFS Spesifikasi tidak diatur dalam batu. Sebaliknya, ini adalah spesifikasi terbuka yang dikembangkan dan dikelola oleh komunitas agen transit, pengembang, dan pemangku kepentingan lain yang menggunakannya GTFS . Diharapkan komunitas produsen dan konsumen ini GTFS data akan memiliki proposal untuk memperluas spesifikasi guna mengaktifkan kemampuan baru.

Untuk berkontribusi pada GTFS , baca [Proses Amendemen Spesifikasi](../process) dan ikuti diskusi dalam [masalah](https://github.com/google/transit/issues) terbuka dan [tarik permintaan](https://github.com/google/transit/pulls) di repositori Transit Github Google ( [google/transit](https://github.com/google/transit) ).![](../../assets/mark-github.svg)

!!! catatan ""

    Spesifikasi resmi, referensi dan dokumentasi ditulis dalam bahasa Inggris. Jika sebuahTranslation ke bahasa yang berbeda berbeda dari aslinya bahasa Inggris, yang terakhir diutamakan. Semua komunikasi dilakukan dalam bahasa Inggris.

## Proposal Aktif ![](../../assets/pr-active.svg)

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

Bergabunglah dengan diskusi di [Github](https://github.com/google/transit/pulls) !

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Proposal yang Baru Digabung![](../../assets/pr-merged.svg)

Baru-baru ini menggabungkan proposal yang sekarang menjadi fitur [resmi](../reference) GTFS Schedule [spesifikasi](../reference) . Lihat [Riwayat Revisi](../process#revision-history) lengkap untuk lebih lanjut.

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank"> Menambahkan-trip-ke-trip transfer dengan opsi di kursi</a></h3><p class="maintainer"> #303 oleh <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> digabungkan pada 26 Juni 2022</p></div><div class="featurelist"><ul><li> Menambahkan <code>transfer_type</code> `s baru untuktrip ketrip transfer untuk menentukan apakah pengguna dapat melakukan &quot;transfer di kursi&quot; pada saat yang samavehicle mengoperasikan dua perjalanan berturut-turut dan pengguna dapat tetap berada di pesawat</li><li> Dapat menentukan kapan transfer di kursi tidak diizinkan tetapi dapat menghubungkan dua perjalanan berbeda secara operasional </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank"> GTFS Fares V2 implementasi basis</a></h3><p class="maintainer"> #286 oleh <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> digabungkan pada 17 Mei 2022</p></div><div class="featurelist"><ul><li> Tarif transit dan tiket</li><li> Pemodelan biaya untuk tarif dan transfer yang kompleks (multi-jaringan,time -berbasis, dan transfer berbasis hitungan)</li><li> Model untuk mengaitkan perhentian ke area tarif </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">trip-ke-trip</a> <a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">dan transfer rute-ke-rute</a></h3><p class="maintainer"> #284 oleh <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> telah digabungkan pada 5 Okt 2021</p></div><div class="featurelist"><ul><li> Tentukan aturan untuk transfer antara halte,trip atau pasangan rute ditransfers.txt</li><li> Peringkat spesifisitas aturan transfer berdasarkan pengaturan pasangan yang berbeda </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3><p class="maintainer"> #208 oleh <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> digabungkan pada 13 Mei 2020</p></div><div class="featurelist"><ul><li> Mengizinkan penjemputan atau pengantaran pengendara di mana saja sepanjang avehicle jalur perjalanan </li></ul></div></div>

<div class="row"><div class="leftcontainer"><h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3><p class="maintainer"> #180 oleh <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> digabungkan pada 9 Jan 2020</p></div><div class="featurelist"><ul><li> Terjemahan untuktext bidang, URL yang dilokalkan, dan informasi kontak </li></ul></div></div>

<div class="row"/>
