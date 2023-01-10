# Peringatan layanan

Contoh berikut adalah representasi ASCII dari feed Peringatan.

```python
# header informasi
header {
  # versi darispeed spesifikasi. Saat ini "2.0". Versi yang valid adalah "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # menentukan apakah dataset inkremental atau full
  incrementality: FULL_DATASET

  # itutime tempat dataset ini dibuat di server
  # untuk menentukan urutan dari Alert feed
  timestamp: 1284457468
}
# beberapa entitas dapat disertakan dalam feed
entity {
  # pengidentifikasi unik untukentity
  id: "0"

  # "jenis" darientity
  alert {
    # beberapa periode dapat ditentukan kapanAlert aktif
    active_period {
      # starttime dalam format zaman POSIX
      start: 1284457468
      # endtime dalam format zaman POSIX
      end: 1284468072
    }
    # memilih yang manaGTFS entitas akan terpengaruh
    informed_entity {
      # parameter yang valid:
      # agency_id, route_id, route_type, stop_id, trip (LihatTripDescriptor )
      route_id: "219"
    }
    # beberapa pemilih (informed_entity ) dapat dimasukkan dalam satuAlertentity
    informed_entity {
      stop_id: "16230"
    }
    # beberapa bidang dapat dimasukkan dalam satuinformed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # Contoh ini berarti rute 100 di halte 16299.
      # Ini tidak berlaku untuk perhentian lain di rute 100 dan rute lain di perhentian 16299.
    }

    # Cause dariAlert - Lihat gtfs-realtime.proto untuk nilai yang valid
    cause: CONSTRUCTION
    # Effect dariAlert - Lihat gtfs-realtime.proto untuk nilai yang valid
    effect: DETOUR

    # pemberianurl memberikan informasi tambahan
    url {
      # beberapa bahasa/terjemahan didukung
      translation {
        # halaman yang dihosting di luar Google (di penyedia/agen, dll.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header UntukAlert akan disorot
    header_text {
      # beberapa bahasa/terjemahan didukung
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # Alert keterangan. Tambahan info keheadertext
    description_text {
      # beberapa bahasa/terjemahan didukung
    translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
