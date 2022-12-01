---
search:
  exclude: true
---

# Freqüências

<hr/>

## Descrever um serviço baseado em freqüência

A Société de Transport de Montréal opera serviços de trânsito em Montréal e executa um serviço baseado em freqüência para suas linhas métricas. Assim, em vez de fornecer um horário com horários de arrival e departure em um conjunto de dados GTFS, o arquivo de [frequencies.txt](../../reference/#frequenciestxt) é usado para descrever a freqüência do serviço em toda a extensão do serviço.

[**frequencies.txt**](../../reference/#frequenciestxt)

    trip_id,start_time,end_time,headway_secs
    22M-GLOBAUX-00-S_1_2,16:01:25,16:19:25,180
    22M-GLOBAUX-00-S_1_2,16:19:25,17:03:25,165

Acima, uma trip na linha Verde com um `trip_id=22M-GLOBAUX-00-S_1_2` é usada como exemplo. Para essa trip, o primeiro registro indica que entre 16:01:25 e 16:19:25, os trens circulam a cada 180 segundos (ou 3 minutos). Da mesma forma, o segundo registro indica que entre 16:19:25 e 17:03:25, os trens circulam a cada 165 segundos.

[Exemplo de fonte](https://www.stm.info/en/about/developers)
