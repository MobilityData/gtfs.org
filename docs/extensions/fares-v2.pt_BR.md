<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

O Fares v2 é um projeto de extensão da Programação GTFS que tem como objetivo abordar as limitações do [Fares v1](/schedule/examples/fares-v1).

Os principais conceitos que a Fares v2 planeja representar são

- Produtos tarifários (por exemplo, ingressos e passes)
- Categorias de cavaleiro (por exemplo, idosos e crianças)
- Opções de pagamento de tarifas (por exemplo, cartão bancário e cartão de crédito)
- Limites tarifários

Estes conceitos permitirão aos produtores de dados modelar tarifas baseadas em zonas, dependentes do tempo e inter-agências. Este projeto de extensão está sendo adotado em iterações.

Atualmente, a implementação básica adotada de Fares v2 funciona para os seguintes casos de uso:

- Definição de uma tarifa de trânsito
- Descrição de locais de serviço na mesma zona tarifária
- Criando regras para viagens de uma só perna
- Criando regras para transferências

Você pode ver [aqui exemplos](/schedule/examples/fares-v2) que mostram o que pode ser modelado utilizando a implementação da base Fares v2 adotada.

Os produtores podem implementar Fares v2 no mesmo conjunto de dados com Fares v1, já que não há conflito técnico entre os dois. Os consumidores podem escolher a versão a ser utilizada independentemente da outra. Com a adoção e endosso suficiente das Fares v2, as Fares v1 podem ser depreciadas no futuro.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">Veja a proposta completa</a>

## Fares em andamento v2 Trabalho

[A proposta da mídia de tarifas (anteriormente contêineres tarifários) foi aprovada](https://github.com/google/transit/pull/355#issuecomment-1468326858) e adotada oficialmente nas especificações!

As reuniões de trabalho do Fares V2 agora se concentrarão na [modelagem e adoção de tarifas de tempo variável](https://github.com/google/transit/pull/357).

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Junte-se à #gtfs-fares no Slack</a><a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">See a programação da reunião</a><a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">Veja as notas da reunião</a>

## Os Primeiros Adotantes

🎉 Gritar para os primeiros adotantes do Fares v2! Pelo menos 1 produtor de dados e 1 consumidor devem se comprometer a implementar um recurso experimental antes de uma votação pública ser aberta para adicioná-lo à especificação oficial. Estas organizações investem uma grande quantidade de tempo e energia em mudanças experimentais para garantir que o GTFS continue a evoluir.

Para a implementação da base adotada, os primeiros adotantes foram

- Produtores: [Interline](https://www.interline.io/), [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consumidor: [Transit](https://transitapp.com/)

Para os fare media atualmente em discussão, os primeiros adotantes são

- Produtor: [Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consumidor: [Apple](https://www.apple.com/)

## Rastreador de adoção
### Atual

<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shr8aT0K9bpncmy0V" target="_blank">Solicite uma mudança</a><a class="button no-icon" href="https://airtable.com/shr5B6Pl1r9KH9qMX" target="_blank">Adicione sua organização (consumidores)</a><a class="button no-icon" href="https://airtable.com/shrn0Afa3TPNkOAEh" target="_blank">Adicione sua organização (produtores)</a>

### Futuro
<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrvnI40zuFXmDsQI" target="_blank">Adicione seus planos futuros</a>

## Características Fares v2 em discussão

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## História

- **2017**: Pesquisa da indústria e modelagem de dados
- **Outubro de 2021**: [Implementação básica esboçada e compartilhada](https://github.com/google/transit/pull/286#issue-1026848880)
- **Dezembro de 2021**: [Votação aberta #1 → não passou](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Março de 2022**: [votação aberta #2 → não passou](https://github.com/google/transit/pull/286#issuecomment-1080716109)
- **Maio de 2022**: [Votação aberta #3 → aprovado](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **Agosto de 2022**: [começa a discussão comunitária sobre a próxima fase das Fares v2](https://github.com/google/transit/issues/341)
- **Novembro de 2022**: <a href="https://github.com/google/transit/pull/355" target="_blank">Abertura de solicitação de retorno para a mídia de tarifas</a>
- **Dezembro de 2022**: [Comunidade identifica a ordem de classificação das pilhas de características para priorizar iterações](https://github.com/google/transit/issues/341#issuecomment-1339947915)
- **Março de 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Passes de voto para a mídia de tarifas</a>