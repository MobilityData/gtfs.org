---
search:
  exclude: true
---

# Terjemahan

<hr/>

## Terjemahkan nama stasiun

Beberapa penyedia transit menawarkan layanan dalam berbagai bahasa - salah satunya adalah National Railway Company of Belgium (secara lokal dikenal sebagai NMBS/SNCB, untuk Nationale Maatschappij der Belgische Spoorwegen dalam bahasa Belanda atau Société nationale des chemins de fer belges dalam bahasa Prancis). Perusahaan menyediakan nama stasiun dalam berbagai bahasa dan ditampilkan tergantung pada pengaturan bahasa dan lokasi pengguna.

NMBS/SNCB menerbitkan GTFS data dalam bahasa Prancis seperti yang ditunjukkan pada file di bawah ini:

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    NMBS/SNCB,NMBS/SNCB,http://www.belgiantrain.be/,Europe/Brussels,fr

Karena bahasa agensi disetel ke bahasa Prancis, nama stasiun dicantumkan dalam bahasa Prancis di [stops.txt](../../reference/#stopstxt) .

[**stops.txt**](../../reference/#stopstxt)

    stop_id,stop_code,stop_name,stop_desc,stop_lat,stop_lon,zone_id,stop_url,location_type,parent_station,platform_code
    S8815040,,Bruxelles-Ouest,,50.8485600,4.32104000,,,1,,
    S8821006,,Anvers-Central,,51.2172000,4.42109800,,,1,,

Berkas [translations.txt](../../reference/#translationstxt) kemudian digunakan untuk menerjemahkan nama stasiun dari bahasa agensi default (Prancis dalam hal ini) ke Belanda.

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,record_id,language,translation
    stops,stop_name,S8815040,nl,Brussel-West

- Dalam contoh ini, nama stasiun dari [stops.txt](../../reference/#stopstxt) diterjemahkan, dan dicatat dalam [stops.txt](../../reference/#stopstxt) diidentifikasi oleh a `stop_id` . Karena itu:
  - `stops` terdaftar di bawah nama tabel (mengacu pada [stops.txt](../../reference/#stopstxt) )
  - `stop_name` terdaftar di bawah`field_name` (karena nama stasiun akan diterjemahkan)
  - Itu`stop_id` untuk nama stasiun yang akan diterjemahkan dari bahasa Prancis tercantum di bawah`record_id` (dalam hal ini,`stop_id` untuk Bruxelles-Ouest)
- Nama diterjemahkan ke dalam bahasa Belanda (nl)
- Terakhir, nama yang diterjemahkan tercantum di bawah Translation

Ada cara lain untuk menerjemahkan nama GTFS menggunakan berkas [translations.txt](../../reference/#translationstxt) , lapangan mana`field_value` digunakan sebagai gantinya`record_id` . Dalam hal ini, nama stasiun digunakan untuk menemukan rekaman yang akan diterjemahkan [stops.txt](../../reference/#stopstxt) .

[**translations.txt**](../../reference/#translationstxt)

    table_name,field_name,field_value,language,translation`
    stops,stop_name,Bruxelles-Ouest,nl,Brussel-West

[Contoh sumber](http://gtfs.irail.be/mivb/mivb-gtfs.zip)
