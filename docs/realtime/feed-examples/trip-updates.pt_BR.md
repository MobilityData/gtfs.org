# Atualização de viagem

O exemplo a seguir é uma representação ASCII de um feed de Atualização de Viagem com dados completos.

```python
# informações deheader
header {
  # versão da especificação de speed. Atualmente "2.0". As versões válidas são "2.0", "1.0".
  gtfs_realtime_version: "2.0"
  # determina se o conjunto de dados é incremental ou completo
  incrementality: FULL_DATASET
  # o momento em que este conjunto de dados foi gerado no servidor
  timestamp: 1284457468
}

# múltiplas entidades podem ser incluídas na alimentação
entity {
  # identificador único para a entity
  id: "simple-trip"

  # "tipo" da entity
  trip_update {
    trip {
      # seleciona qual entity GTFS (trip) será afetada
      trip_id: "trip-1"
    }
    # atualização de informações de programação
    stop_time_update {
      # selecionando qual parada é afetada
      stop_sequence: 3
      # para a time arrival do vehicle
      arrival {
        # a ser adiado com 5 segundos
        delay: 5
      }
    }
    # ...o delay deste vehicle é propagado até suas paradas subseqüentes.

    # Próxima atualização de informações sobre a programação do vehicle
    stop_time_update {
      # selecionado por stop_sequence. Ele irá atualizar
      stop_sequence: 8
      # o time original (programado) time arrival do vehicle com um
      arrival {
        # 1 segundo de delay.
        delay: 1
      }
    }
    # ...Da mesma forma, o delay é propagado para as paradas subseqüentes.

    # Próxima atualização de informações sobre a programação do vehicle
    stop_time_update {
      # selecionado por stop_sequence. Ele atualizará a time arrival do vehicle
      stop_sequence: 10
      # com o delay padrão de 0 (dentro do time) e propagar esta atualização
      # para o resto das paradas do vehicle.
    }
  }
}

# segunda entity contendo informações de atualização para outra trip
entity {
  id: "3"
  trip_update {
    trip {
      # viagens baseadas em freqüência são definidas por seus
      # trip_id em GTFS e
      trip_id: "frequency-expanded-trip"
      # start_time
      start_time: "11:15:35"
    }
    stop_time_update {
      stop_sequence: 1
      arrival {
        # delay negativo significa que vehicle está 2 segundos antes do previsto
        delay: -2
      }
    }
    stop_time_update {
      stop_sequence: 9
    }
  }
}
```
