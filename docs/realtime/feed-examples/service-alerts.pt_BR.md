# Alerta de serviço

O exemplo a seguir é uma representação ASCII de um Alert Feed.

```python
# informações deheader
header {
  # versão da especificação de speed. Atualmente "2.0". As versões válidas são "2.0", "1.0".
  gtfs_realtime_version: "2.0"

  # determina se o conjunto de dados é incremental ou full
  incrementality: FULL_DATASET

  # o time em que este conjunto de dados foi gerado no servidor
  # para determinar a seqüência de alimentação de Alert
  timestamp: 1284457468
}
# múltiplas entidades podem ser incluídas na alimentação
entity {
  # identificador único para a entity
  id: "0"

  # "tipo" da entity
  alert {
    # múltiplos períodos podem ser definidos quando o Alert está ativo
    active_period {
      # timestart no formato POSIX epoch
      start: 1284457468
      # timeend no formato POSIX epoch
      end: 1284468072
    }
    # seleciona quais entidades GTFS serão afetadas
    informed_entity {
      # parâmetros válidos:
      # agency_id, route_id, route_type, stop_id, trip (ver TripDescriptor)
      route_id: "219"
    }
    # seletores múltiplos (informed_entity) podem ser incluídos em uma entity Alert
    informed_entity {
      stop_id: "16230"
    }
    # múltiplos campos podem ser incluídos em uma informed_entity
    informed_entity {
      stop_id: "16299"
      route_id: "100"
      # Este exemplo significa a rota 100 na parada 16299.
      # Isto não se aplica a qualquer outra parada na rota 100 e a qualquer outra rota na parada 16299.
    }

    # Cause do Alert - ver gtfs-realtime.proto para valores válidos
    cause: CONSTRUCTION
    # Effect do Alert - ver gtfs-realtime.proto para valores válidos
    effect: DETOUR

    # a url em questão fornece informações adicionais
    url {
      # suporte a múltiplos idiomas/traduções
      translation {
        # página hospedada fora do Google (no provedor/agência, etc.)
        text: "http://www.sometransitagency/alerts"
        language: "en"
      }
    }

    # header para o Alert será destacado
    header_text {
      # suporte a múltiplos idiomas/traduções
      translation {
        text: "Stop at Elm street is closed, temporary stop at Oak street"
        language: "en"
      }
    }

    # descrição doAlert. Info adicional ao text do header
    description_text {
      # suporte a múltiplos idiomas/traduções
      translation {
        text: "Due to construction at Elm street the stop is closed. The temporary stop can be found 300 meters north at Oak street"
        language: "en"
      }
    }
  }
}
```
