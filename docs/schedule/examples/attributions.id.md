<a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">GTFS</a> <a class="pencil-link" href="https://github.com/MobilityData/<glossary variable=" GTFS"="">.org/edit/main/docs/schedule/examples/attributions.md&quot; title=&quot;Edit halaman ini&quot; target=&quot;_blank&quot;&gt;</a> <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"/></svg>

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
