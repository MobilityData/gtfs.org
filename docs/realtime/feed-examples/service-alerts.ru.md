# Сервисное оповещение

Следующий пример представляет собой ASCII-представление подачи оповещений.

```python
# информация оheader
header {
  # версия спецификации speed. В настоящее время "2.0". Допустимые версии: "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # определяет, является ли набор данных инкрементным или full
  incrementality: FULL_DATASET

  # time, когда этот набор данных был создан на сервере
  # для определения последовательности подачи Alert
  timestamp: 1284457468
}
# несколько организаций могут быть включены в фид
entity {
  # уникальный идентификатор для entity
  id: "0"

  # "тип" entity
    alert {
    # можно определить несколько периодов, когда Alert активно
    active_period {
      # timestart в формате эпохи POSIX
      start: 1284457468
      # timeend в формате эпохи POSIX
      end: 1284468072
    }
    # выбирает, какие объекты GTFS будут затронуты
    informed_entity {
      # допустимые параметры:
      # agency_id, route_id, route_type, stop_id, trip (см. TripDescriptor)
      route_id: "219"
    }
    # несколько селекторовinformed_entity) могут быть включены в один entity Alert
    informed_entity {
      stop_id: "16230"
    }
    # несколько полей могут быть включены в один informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # Данный пример означает маршрут 100 на остановке 16299.
      # Это не относится к любой другой остановке маршрута 100 и к любому другому маршруту на остановке 16299.
    }

    # Cause Alert - допустимые значения см. в файле gtfs-realtime.proto
    cause: CONSTRUCTION
    # Effect Alert - допустимые значения см. в файле gtfs-realtime.proto
    effect: DETOUR

    # указанный url предоставляет дополнительную информацию
    url {
      # поддержка нескольких языков/переводов
      translation {
        # страница, размещенная вне Google (у провайдера/агентства и т.д.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header для Alert будет выделен
    header_text {
      # поддержка нескольких языков/переводов
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # описаниеAlert. Дополнительная INFO к text header
    description_text {
      # поддержка нескольких языков/переводов
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
