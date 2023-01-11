# Adição de novos campos ao GTFS em tempo real

Quando um produtor ou consumidor estiver interessado em adicionar um novo campo à especificação do GTFS Realtime, eles devem abrir um novo número no [repositório GTFS Realtime GitHub](https://github.com/google/transit) descrevendo o campo proposto e anunciar este novo campo (incluindo um link para o número) na [lista de discussão do GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime).

## Processo de alteração das especificações

1. Criar uma filial de git com atualização de todas as partes relevantes da definição do protocolo, especificação e arquivos de documentação (exceto para traduções).
1. Criar solicitação de puxar em <https://github.com/google/transit>. A solicitação de puxar deve conter uma descrição estendida do remendo. O criador do pedido de puxar torna-se o *defensor*.
1. Uma vez registrado, o pedido deve ser anunciado por seu defensor na [lista de discussão do GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). Uma vez anunciada, a solicitação pull é considerada uma proposta.
   - Como o defensor é um contribuinte, ele deve assinar o [Acordo de Licença de Contribuinte](https://github.com/google/transit/blob/master/CONTRIBUTING.md) antes que a solicitação pull possa ser aceita.
1. A discussão da proposta é a seguinte. Os comentários de solicitação devem ser usados como o único fórum de discussão.
   - A discussão dura o tempo que o defensor julgar necessário, mas deve ser de pelo menos 7 dias corridos.
   - O defensor é responsável pela atualização oportuna da proposta (ou seja, solicitação de retirada) com base nos comentários com os quais concorda.
   - A qualquer time, o defensor pode alegar o abandono da proposta.
1. O defensor pode convocar uma votação sobre uma versão da proposta a qualquer momento após o intervalo inicial de 7 dias necessário para a discussão.
   - Antes de convocar uma votação, pelo menos um produtor em tempo real GTFS e um consumidor em tempo real GTFS devem implementar a mudança proposta. Espera-se que o(s) produtor(es) GTFS-realtime inclua(m) a mudança em uma alimentação GTFS-realtime voltada para o público e forneça(m) um link para esses dados nos comentários da solicitação pull, e que o(s) consumidor(es) GTFS-realtime forneça(m) um link nos comentários da solicitação pull para uma aplicação que esteja utilizando a mudança de forma não trivial (ou seja, que esteja suportando funcionalidades novas ou melhoradas).
   - Ao solicitar uma votação, o defensor deve declarar claramente se a votação é para a adoção oficial do campo na especificação ou para um campo experimental.
1. A votação dura o período mínimo suficiente para cobrir 7 dias completos de calendário e 5 dias úteis suíços completos. A votação termina às 23:59:59 UTC.
   - O defensor deve anunciar o horário específico de término no início da votação.
   - Durante o período de votação somente são permitidas mudanças editoriais na proposta (erros de digitação, a redação pode mudar desde que não altere o significado).
   - Qualquer pessoa pode votar sim/não em uma forma de comentário ao pedido de puxar, e os votos podem ser mudados até o final do período de votação.
   Se um eleitor muda seu voto, é recomendável fazê-lo atualizando o comentário de voto original, marcando a votação e escrevendo o novo voto.
   - Votos antes do início do período de votação não são considerados.
1. A proposta é aceita se houver um consenso unânime sim com pelo menos 3 votos.
   - O voto do proponente não conta para o total de 3 votos. Por exemplo, se o Proponente X criar uma solicitação de puxar e votar sim, e os Usuários Y e Z votarem sim, isso é contado como 2 votos totais de sim.
   - Os votos contra devem ser motivados e, idealmente, fornecer um feedback acionável.
   - Se a votação falhar, então o defensor pode optar por continuar o trabalho na proposta, ou abandonar a proposta.
   Qualquer decisão do defensor deve ser anunciada na lista de discussão.
   - Se o defensor continuar o trabalho sobre a proposta, então uma nova votação pode ser convocada a qualquer momento.
1. Qualquer solicitação pull que permaneça inativa por 30 dias corridos será encerrada. Quando uma solicitação pull é encerrada, a proposta correspondente é considerada abandonada. O defensor pode reabrir a solicitação pull a qualquer momento se desejar continuar ou manter a conversa.
   - Note que o defensor pode optar por implementar o recurso como uma [extensão personalizada](#extensions) em vez de parte da especificação oficial.
1. Se a proposta for aceita:
   - O Google se compromete a fundir a versão votada da solicitação pull (desde que os colaboradores tenham assinado o [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md), e realizem a solicitação pull dentro de 5 dias úteis.
   - O Google está comprometido com a atualização oportuna do repositório <https://github.com/google/gtfs-realtime-bindings>. Compromissos com gtfs-realtime-bindigs que são resultado de uma proposta, devem fazer referência à solicitação pull da proposta.
   - Traduções não devem ser incluídas na solicitação original de puxar.
   O Google é responsável por eventualmente atualizar as traduções relevantes nos idiomas suportados, mas os pedidos de tradução pura da comunidade são bem-vindos e serão aceitos assim que todos os comentários editoriais forem abordados.

## Campos*experimentais*

1. Se a comunidade puder chegar a um consenso (a) que o campo proposto parece útil e (b) sobre o tipo do campo`(optional` vs `repeated`, `string` vs `int` vs `bool`), então um número de campo será alocado na mensagem GTFS Realtime e uma nota será feita no [arquivo .proto](../proto) e documentação de que este é um campo *experimental* que pode mudar no futuro.
   - O consenso é alcançado através de um processo de discussão e votação que é o mesmo que o [processo de emenda de especificações](#specification-amendment-process) abaixo, mas ao invés de consentimento unânime, apenas 80% dos votos sim são necessários para aprovação.
   - Os produtores e consumidores do GTFS Realtime que desejarem usar o novo campo *experimental* irão regenerar sua biblioteca usando o arquivo .proto com o novo campo (por exemplo, o Google irá atualizar a [biblioteca gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)), e começar a preencher e analisar o campo com dados ao vivo.
   - Quando estivermos satisfeitos que o campo *experimental* vale a pena e tanto produtores quanto consumidores estiverem usando o campo, então seguiremos o [processo de emenda das especificações](#specification-amendment-process) abaixo para adicionar oficialmente o campo à especificação.
   - Se o campo *experimental* não for adotado através do [processo de emenda de especificação](#specification-amendment-process) dentro de 2 anos após ter sido aprovado como campo *experimental*, ele será depreciado adicionando `[deprecated=true]` ao lado do valor do campo no [arquivo .proto.](../proto) Ao usar `[deprecated=true]` (ao invés de `RESERVADO`), os produtores e consumidores que já adotaram o campo não têm que removê-lo do uso. Além disso, o campo pode ser "não depreciado" no futuro se for aprovado em uma votação subseqüente após o [processo de emenda da Especificação](#specification-amendment-process) (por exemplo, quando produtores e/ou consumidores adicionais começarem a usar o campo).
1. Se o novo campo for considerado específico para um único produtor ou houver disputa sobre o tipo de dados, então atribuiremos uma [extensão personalizada](../extensions) ao produtor para que ele possa usar o campo em sua própria alimentação. Quando possível, devemos evitar extensões e acrescentar campos úteis a muitas agências à especificação principal para evitar fragmentação e trabalho extra para que os consumidores possam suportar várias extensões à especificação.

## Princípios Orientadores

A fim de preservar a visão original do GTFS Realtime, vários princípios orientadores foram estabelecidos para levar em consideração ao ampliar as especificações:

<br/>**As rações devem ser eficientes para produzir e consumir em tempo real.**

A informação em tempo real é um fluxo contínuo e dinâmico de dados que requer necessariamente um processamento eficiente. Escolhemos Protocol Buffers como base para a especificação porque eles oferecem um bom trade-off em termos de facilidade de uso para os desenvolvedores e em termos de eficiência na transmissão de dados. Ao contrário do GTFS, não imaginamos que muitas agências estarão editando o GTFS em tempo real à mão. A escolha de Protocol Buffers reflete a conclusão de que a maior parte dos fluxos GTFS em Tempo Real será produzida e consumida programticamente.

<br/>**A especificação é sobre informações de passageiros.**

Assim como o GTFS antes dele, o GTFS Realtime se preocupa principalmente com a informação dos passageiros. Ou seja, as especificações devem incluir informações que podem ajudar a impulsionar ferramentas para os cavaleiros, em primeiro lugar e acima de tudo. Há potencialmente uma grande quantidade de informações orientadas a operações que as agências de trânsito podem querer transmitir internamente entre sistemas. O GTFS Realtime não se destina a essa finalidade e há outras normas de dados potencialmente mais apropriadas para as operações.

<br/>**As mudanças nas especificações devem ser compatíveis com o passado.**

Ao acrescentar características à especificação, queremos evitar fazer alterações que tornem inválidas as alimentações existentes. Não queremos criar mais trabalho para os editores de rações existentes até que eles queiram adicionar capacidades às suas rações. Além disso, sempre que possível, queremos que os analisadores existentes possam continuar a ler as partes mais antigas dos feeds mais recentes. As convenções para estender os Buffers de Protocolo reforçarão a retrocompatibilidade até certo ponto. Entretanto, desejamos evitar mudanças semânticas em campos existentes que também possam quebrar a compatibilidade com o passado.

<br/>**As características especulativas são desencorajadas.**

Cada nova característica adiciona complexidade à criação e leitura de feeds. Portanto, queremos ter o cuidado de acrescentar apenas características que sabemos serem úteis. Idealmente, qualquer proposta terá sido testada através da geração de dados para um sistema de trânsito real que utilize o novo recurso e software de escrita para lê-lo e exibi-lo.

## Histórico de revisão

**12 de março de 2020**

- Atualizada a descrição `TripDescriptor` na página de referência do GTFS em tempo real.

**26 de fevereiro de 2015**

- Adicionado o campo experimental de `direção_id` ao `TripDescriptor`[(discussão](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)).

**30 de janeiro de 2015**

- Adicionado o espaço de nomes de extensão do Protocolo Buffer a todas as mensagens GTFS-realtime restantes que ainda não tinham um (como `FeedMessage` e `FeedEntity`).

**28 de janeiro de 2015**

- Adicionado o `atraso do` campo experimental ao `TripUpdate`[(discussão](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)).

**16 de janeiro de 2015**

- Atualizar descrição do `TripDescriptor.start_time`.

**8 de janeiro de 2015**

- Definido o `estado de ocupação do` enum experimental.
- Adicionado `ocupação_de_campo` experimental ao `VehiclePosition`[(discussão](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM)).

**22 de maio de 2014**

- Descrição atualizada do enumero `ScheduleRelationship` na mensagem `StopTimeUpdate`[(discussão](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)).
- Removido o REPLACEMENT do enumero de valores do `ScheduleRelationship` enum na mensagem `TripDescriptor`[(discussão](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)).

**12 de outubro de 2012**

- Adicionado o campo de carimbo da hora à mensagem `TripUpdate`.

**30 de maio de 2012**

- Acrescentei detalhes específicos sobre as extensões à especificação.

**30 de novembro de 2011**

- Acrescentei o espaço de nomes de extensão de buffer de protocolo às principais mensagens em tempo real do GTFS para facilitar a escrita de extensões para as especificações.

**25 de outubro de 2011**

- Documentação atualizada para esclarecer que `alerta`, `header_text` e `description_text` são ambos valores de texto simples.

**20 de agosto de 2011**

- Documentação atualizada para esclarecer a semântica da mensagem `TimeRange`.

**22 de agosto de 2011**

- Versão inicial.
