# Pembaruan Perjalanan

Contoh berikut adalah representasi ASCII dari umpan Pembaruan Perjalanan set data lengkap.

```python
# header informasi
header {
  # versi darispeed spesifikasi. Saat ini "2.0". Versi yang valid adalah "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # menentukan apakah dataset inkremental atau penuh
  incrementality: FULL_DATASET
  # saat di mana kumpulan data ini dibuat di server
  timestamp: 1284457468
}

# beberapa entitas dapat disertakan dalam feed
entity {
  # pengidentifikasi unik untukentity
    id: "simple-trip"

    # "jenis" darientity
    trip_update {
      trip {
      # memilih yang mana GTFS entity (trip ) akan terpengaruh
        trip_id: "trip-1"
      }
      # pembaruan informasi jadwal
      stop_time_update {
      # memilih perhentian mana yang terpengaruh
       stop_sequence: 3
       # Untuk vehicle's arrival time
       arrival {
        # tertunda dengan 5 detik
        delay: 5
      }
    }
    # ...ini vehicle's delay disebarkan ke perhentian berikutnya.

    # Update informasi selanjutnya divehicle jadwal
    stop_time_update {
      # dipilih olehstop_sequence . Ini akan diperbarui
      stop_sequence: 8
      # itu vehicle asli (terjadwal) arrival time dengan
        arrival {
        # 1 detikdelay .
        delay: 1
      }
    }
    # ...demikian jugadelay disebarkan ke perhentian berikutnya.

    # Update informasi selanjutnya divehicle jadwal
    stop_time_update {
      # dipilih olehstop_sequence . Ini akan memperbarui vehicle 's arrival time
      stop_sequence: 10
      # dengan defaultdelay dari 0 (padatime ) dan sebarkan pembaruan ini
      # untuk sisavehicle berhenti.
    }
  }
}

# keduaentity berisi informasi update untuk yang laintrip
entity {
  id: "3"
  trip_update {
    trip {
      # perjalanan berbasis frekuensi ditentukan oleh mereka
      # trip_id di dalamGTFS dan
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # negatifdelay caravehicle adalah 2 detik lebih cepat dari jadwal
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
