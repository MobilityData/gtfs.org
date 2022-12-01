---
search:
  exclude: true
---

# atribusi set data

<hr/>

## Mengatribusikan data ke penghasil data secara agregatGTFS Himpunan data

BeberapaGTFS kumpulan data berisi data yang dikumpulkan dari berbagai sumber seperti penyedia layanan berbeda yang melayani yurisdiksi yang sama. Dalam beberapa kasus, perlu untuk mengklasifikasikan lembaga yang terdaftar [agency.txt](../../reference/#agencytxt) sebagai produsen, operator, atau otoritas.

Misalnya, Rejseplanen adalah mesin pencari untuk layanan kereta api dan bus di Denmark. Perusahaan menerbitkan aGTFS kumpulan data yang berisi data dari beberapa agensi dan penyedia seperti yang ditunjukkan di bawah ini [agency.txt](../../reference/#agencytxt).

[**agency.txt**](../../reference/#agencytxt)

    agency_id,agency_name,agency_url,agency_timezone,agency_lang
    202,Bornholms Trafik,https://bat.dk,Europe/Berlin,da
    204,FYNBUS,https://fynbus.dk,Europe/Berlin,
    206,NT,https://www.nordjyllandstrafikselskab.dk,Europe/Berlin,
    276,Rejseplanen,https://www.rejseplanen.dk,Europe/Berlin,

Untuk mengatributkan Rejseplanen sebagai penghasil data, file [attributions.txt](../../reference/#attributionstxt) digunakan, di mana atribusiid didefinisikan di samping nama danurl organisasi. Kolom `is_producer` , `is_operator` , dan `is_authority` digunakan untuk mengkategorikan Rejseplanen seperti yang ditunjukkan di bawah ini:

[**attributions.txt**](../../reference/#attributionstxt)

    attribution_id,organization_name,attribution_url,is_producer,is_operator,is_authority
    rp,Rejseplanen,https://www.rejseplanen.dk,1,,

[Contoh sumber](http://www.rejseplanen.info/labs/GTFS.zip)
