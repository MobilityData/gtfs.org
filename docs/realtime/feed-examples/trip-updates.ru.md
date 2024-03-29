# Обновление Trip Update

Следующий пример представляет собой ASCII-представление полного набора данных Trip Update.

```python
# информация оheader
header {
  # версия спецификации скорость. В настоящее время "2.0". Допустимые версии: "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # определяет, является ли набор данных инкрементным или полным
  incrementality: FULL_DATASET
  # момент, когда этот набор данных был создан на сервере
  timestamp: 1284457468
}

# несколько организаций могут быть включены в фид
entity {
  # уникальный идентификатор для entity
  id: "simple-trip"

  # "тип" entity
  trip_update {
    trip {
      # выбирает, на какой entity GTFS (trip) будет оказано воздействие
      trip_id: "trip-1"
    }
    # обновление информации о расписании
    stop_time_update {
      # выбор остановки, на которую оказывается воздействие
      stop_sequence: 3
      # для время прибытия автомобиля
      arrival {
        # задерживается на 5 секунд
        delay: 5
      }
    }
    # ...delay этого транспортное средство распространяется на его последующие остановки.

    # Следующее обновление информации о графике работы транспортное средство
    stop_time_update {
      # выбранной stop_sequence. Это приведет к обновлению
      stop_sequence: 8
      # первоначальное (запланированное) время прибытия автомобиля с
      arrival {
        # delay 1 секунда.
        delay: 1
      }
    }
    # ...аналогичным образом delay распространяется на последующие остановки.

    # Следующее обновление информации о графике работы транспортное средство
    stop_time_update {
      # выбранной stop_sequence. Это обновит время прибытия автомобиля
      stop_sequence: 10
      # с delay по умолчанию 0 (вовремя) и распространить это обновление
      # для остальных остановок транспортное средство.
    }
  }
}

# вторая entity, содержащая информацию об обновлении для другой trip
entity {
  id: "3"
  trip_update {
    trip {
      # поездки на основе частоты определяются их
      # trip_id в GTFS и
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # Отрицательная delay означает, что транспортное средство опережает график на 2 секунды
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
