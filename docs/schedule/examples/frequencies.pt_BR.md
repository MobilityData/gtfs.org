---
search:
  exclude: true
---
<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/schedule/examples/frequencies.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
</a>

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
