---
search:
  exclude: true
---

# Processo de alteração das especificações

A Especificação GTFS não é definida em pedra. Ao invés disso, é uma especificação aberta desenvolvida e mantida pela comunidade de agências de trânsito, desenvolvedores e outras partes interessadas que utilizam GTFS. Espera-se que esta comunidade de produtores e consumidores de dados GTFS tenha propostas para ampliar as especificações a fim de permitir novas capacidades. Para ajudar a gerenciar esse processo, foram estabelecidos os seguintes procedimentos e diretrizes.

!!!note ""

    A especificação oficial, referência e documentação são escritas em inglês. Se uma Translation para um idioma diferente do original em inglês, esta última tem precedência. Toda a comunicação é feita em inglês.

1. Criar uma filial de git com atualização de todas as partes relevantes da definição do protocolo, especificação e arquivos de documentação (exceto para traduções).
1. Criar solicitação de puxar em <https://github.com/google/transit>. A solicitação de puxar deve conter uma descrição estendida do remendo. O criador do pedido de puxar torna-se o _defensor_.
1. Uma vez registrada a solicitação pull, ela deve ser anunciada por seu defensor na [lista de discussão GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes), incluindo um link para a solicitação pull. Uma vez anunciada, a solicitação pull é considerada uma proposta. A solicitação pull também deve ser editada para conter um link para o anúncio do Google Groups para que possam ser facilmente referenciados.
   * Como o defensor é um contribuinte, eles devem assinar o [Acordo de Licença de Contribuinte](../CONTRIBUTING.md) antes que a solicitação pull possa ser aceita.
1. A discussão da proposta é a seguinte. Os comentários de solicitação devem ser usados como o único fórum de discussão.
   * A discussão dura o tempo que o defensor julgar necessário, mas deve ser de pelo menos 7 dias corridos.
   * O defensor é responsável pela atualização oportuna da proposta (ou seja, solicitação de retirada) com base nos comentários com os quais concorda.
   * A qualquer time, o defensor pode alegar o abandono da proposta.
1. O defensor pode solicitar a votação de uma versão da proposta em qualquer time após o intervalo inicial de 7 dias necessário para a discussão.
   * Antes de solicitar uma votação, pelo menos um produtor e um consumidor GTFS GTFS devem implementar a mudança proposta. Espera-se que o(s) produtor(es) de GTFS inclua(m) a mudança em uma alimentação GTFS voltada para o público e forneça(m) um link para esses dados nos comentários de solicitação pull, e que o(s) consumidor(es) GTFS forneça(m) um link nos comentários de solicitação pull para uma aplicação que esteja utilizando a mudança de forma não trivial (ou seja, que esteja apoiando funcionalidades novas ou melhoradas).
1. A votação dura o período mínimo suficiente para cobrir 7 dias de calendário e 5 dias úteis Suíços FULL. A votação termina às 23:59:59 UTC.
   * O defensor deve anunciar o time específico time end no start da votação.
   * Durante o período de votação somente são permitidas mudanças editoriais na proposta (erros de digitação, a redação pode mudar desde que não altere o significado).
   * Qualquer pessoa pode votar sim/não em uma forma de comentário ao pedido de puxar, e os votos podem ser mudados até o end do período de votação.
   Se um eleitor muda seu voto, é recomendável fazê-lo atualizando o comentário de voto original, marcando o voto e escrevendo o novo voto.
   * Votos antes do start do período de votação não são considerados.
   * A abertura e o encerramento das votações devem ser anunciados na [lista de correspondência](https://groups.google.com/forum/#!forum/gtfs-changes).
1. A proposta é aceita se houver um consenso unânime sim com pelo menos 3 votos.
   * O voto do proponente não conta para o total de 3 votos. Por exemplo, se o Proponente X criar uma solicitação de puxar e votar sim, e os Usuários Y e Z votarem sim, isso será contado como 2 votos totais de sim.
   * Os votos contra devem ser motivados e, idealmente, fornecer um feedback acionável.
   * Se a votação falhar, então o defensor pode optar por continuar o trabalho na proposta, ou abandonar a proposta.
   Qualquer decisão do defensor deve ser anunciada na [lista de discussão](https://groups.google.com/forum/#!forum/gtfs-changes).
   * Se o defensor continuar o trabalho sobre a proposta, então uma nova votação pode ser convocada a qualquer time.
1. Qualquer solicitação pull que permaneça inativa por 30 dias corridos será encerrada. Quando uma solicitação pull é fechada, a proposta correspondente é considerada abandonada. O defensor pode reabrir o pedido de puxar a qualquer time se desejar continuar ou manter a conversa.
1. Se a proposta for aceita:
   * O Google se compromete a fundir a versão votada da solicitação pull (desde que os colaboradores tenham assinado o [ALC](../CONTRIBUTING.md)), e realizar a solicitação pull dentro de 5 dias úteis.
   * As traduções não devem ser incluídas na solicitação original de pull.
   O Google é responsável por eventualmente atualizar as traduções relevantes para os idiomas suportados, mas os pedidos de Translation pura da comunidade são bem-vindos e serão aceitos assim que todos os comentários editoriais forem endereçados.
1. O resultado final da solicitação de retirada (aceita ou abandonada) deve ser anunciado no mesmo tópico do Google Groups onde a solicitação de retirada foi originalmente anunciada.

<hr/>

## Princípios Orientadores

A fim de preservar a visão original do GTFS, alguns princípios orientadores foram estabelecidos para levar em consideração ao ampliar as especificações:

**Feeds devem ser fáceis de criar e editar**<br/>Escolhemos o CSV como base para a especificação porque é fácil de visualizar e editar usando programas de planilhas e editores de text, o que é útil para agências menores. Também é simples de gerar a partir da maioria das linguagens de programação e bancos de dados, o que é bom para editores de feeds maiores.<br/>

**Os feeds devem ser fáceis de analisar**<br/>os leitores devem ser capazes de extrair as informações que estão procurando com o mínimo de trabalho possível. As mudanças e adições ao feed devem ser o mais amplamente útil possível, para minimizar o número de caminhos de código que os leitores do feed precisam implementar. (Entretanto, deve ser dada precedência à criação, uma vez que no final haverá mais editores de rações do que leitores de rações).<br/>

**A especificação é sobre informação aos passageiros**<br/>GTFS sepreocupa principalmente com a informação aos passageiros. Ou seja, as especificações devem incluir informações que possam ajudar a impulsionar ferramentas para os cavaleiros, em primeiro lugar e acima de tudo. Há potencialmente uma grande quantidade de informações orientadas a operações que as agências de trânsito podem querer transmitir internamente entre sistemas. GTFS não se destina a essa finalidade e há outras normas de dados potencialmente mais apropriadas para as operações.<br/>

**As mudanças nas especificações devem ser compatíveis com o passado**<br/>Ao acrescentar características à especificação queremos evitar fazer alterações que tornem inválidas as alimentações existentes. Não queremos criar mais trabalho para os editores de feeds existentes até que eles queiram adicionar capacidades a seus feeds. Além disso, sempre que possível, queremos que os analisadores existentes possam continuar a ler as partes mais antigas dos feeds mais recentes.<br/>

**As características especulativas são desencorajadas**<br/>Tudo o novo recurso adiciona complexidade à criação e leitura dos feeds. Portanto, queremos ter o cuidado de acrescentar apenas recursos que sabemos serem úteis. Idealmente, qualquer proposta terá sido testada através da geração de dados para um sistema de trânsito real que usa o novo recurso e software de escrita para lê-lo e exibi-lo. Note que o GTFS permite prontamente extensões para o formato através da adição de colunas e arquivos extras que são ignorados pelos analisadores e validadores oficiais, de modo que as propostas podem ser facilmente prototipadas e testadas em feeds existentes.<br/>

<hr/>

## Histórico de revisão

**15 de setembro de 2021**<br/>

* Os portões tarifários permitidos (pathway_mode=6) serão bidirecionais. Veja a [discussão](https://github.com/google/transit/pull/276).

**13 de setembro de 2021**<br/>

* Melhores práticas de `stop_name` atualizadas. Veja a [discussão](https://github.com/google/transit/pull/282).

**27 de agosto de 2021**<br/>

* GTFS Schedule atualizada GTFS Schedule para [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119). Veja a [discussão](https://github.com/google/transit/pull/277).

**4 de janeiro de 2021**<br/>

* Descrição esclarecida de `stop_times.stop_id`. Veja a [discussão](https://github.com/google/transit/pull/258).
* Sinais de campo definidos positivos e não-zero. Veja a [discussão](https://github.com/google/transit/pull/251).

**2 de outubro de 2020**<br/>

* Mudou o tipo de campo de `freqüências.headway_secs` de não-negativo para inteiro positivo. Ver [discussão](https://github.com/google/transit/pull/249).

**25 de maio de 2020**<br/>

* Definidos `pathways.txt`, `levels.txt` e `attributions.txt` como tabelas traduzíveis. Acrescentadas recomendações para a tradução de `signposted_as` multilíngues. Ver [discussão](https://github.com/google/transit/pull/220).

**13 de maio de 2020**<br/>

* Acrescentadas `continuous_pickup` e `continuous_drop_off` às `routes.txt` e `stop_times.txt`. Mudado o `shape_id` de "Optional" para "Conditionally required". Veja a [discussão](https://github.com/google/transit/pull/208).

**24 de março de 2020**<br/>

* Definido campo text e adicionado `tts_stop_name` para `stops.txt`. Veja a [discussão](https://github.com/google/transit/pull/49).

**5 de fevereiro de 2020**<br/>

* Adicionados os `route_types` de tróleis e monotrilho. Veja a [discussão](https://github.com/google/transit/pull/174).

**9 de janeiro de 2020**<br/>

* Acrescentado `translations.txt`. Ver [discussão](https://github.com/google/transit/pull/180).

**26 de dezembro de 2019**<br/>

* Definições atualizadas para o bonde-cabo e o elevador aéreo no `route_type`. Ver [discussão](https://github.com/google/transit/pull/186).

**20 de dezembro de 2019**<br/>

* `attributions.txt` adicionadas. Veja a [discussão](https://github.com/google/transit/pull/192).

**26 de agosto de 2019**<br/>

* Especificou que o `stop_lat` e o `stop_lon` sejam posicionados onde os passageiros esperam para embarcar no vehicle. Ver [discussão](https://github.com/google/transit/pull/179).

**9 de julho de 2019**<br/>

* Adicionadas as melhores práticas de chegada e partida. Ver [discussão](https://github.com/google/transit/pull/165).
* Acrescentadas as melhores práticas de sinalização. Ver [discussão](https://github.com/google/transit/pull/167).
* Adicionadas as melhores práticas de `stop_id`. Ver [discussão](https://github.com/google/transit/pull/169).

**25 de junho de 2019**<br/>

* Relação esclarecida de pontos de Shape e stops. Ver [discussão](https://github.com/google/transit/pull/39).

**4 de abril de 2019**<br/>

* Adicionado o campo `platform_code` em `stops.txt` Ver [discussão](https://github.com/google/transit/pull/146).

**27 de março de 2019**<br/>

* Adicionados `pathways.txt` e `levels.txt`. Ver [discussão](https://github.com/google/transit/pull/143).

**6 de fevereiro de 2019**<br/>

* Mudanças editoriais e de formatação para maior clareza. Ver [discussão](https://github.com/google/transit/pull/120).

**2 de outubro de 2018**<br/>

* Tipos de campos factorizados. Ver [discussão](https://github.com/google/transit/pull/104).

**14 de setembro de 2018**<br/>

* Adicionado o conceito "Conditionally required". Ver [discussão](https://github.com/google/transit/pull/100).

**4 de setembro de 2018**<br/>

* Unificou as definições de `agency_lang` e `feed_lang`. Ver [discussão](https://github.com/google/transit/pull/98).

**27 de agosto de 2018**<br/>

* Atualização de `CHANGES.md` e última data revisada. Ver [discussão](https://github.com/google/transit/pull/99).

**22 de agosto de 2018**<br/>

* Adicionados campos `feed_contact_email` e `feed_contact_url` no arquivo `feed_info.txt`. Veja a [discussão](https://github.com/google/transit/pull/31).

**11 de dezembro de 2017**<br/>

* Adicionado `route_sort_order` ao arquivo `routes.txt`. Veja a [discussão](https://github.com/google/transit/pull/83).

**15 de março de 2017**<br/>

* Esclarecido que o voto de um proponente não conta para o total. Ver [discussão](https://github.com/google/transit/pull/50).
* Especificou que, antes de chamar uma votação, pelo menos um produtor e um consumidor GTFS devem implementar a mudança proposta. Ver [discussão](https://github.com/google/transit/pull/46).

**7 de fevereiro de 2017**<br/>

* Esclareceu a relação de `block_id` e `service_id`. Ver [discussão](https://github.com/google/transit/pull/44).
* Esclareceu que o serviço baseado na freqüência começa na departure vehicle. Veja a [discussão](https://github.com/google/transit/pull/42).
* Descrição esclarecida do `stop_id` e do `stop_code`. Veja a [discussão](https://github.com/google/transit/pull/40).

**11 de dezembro de 2017**<br/>

* Adicionado o campo `route_sort_order` no arquivo `routes.txt` Veja a [discussão](https://github.com/google/transit/pull/83).

**27 de novembro de 2016**<br/>

* Acrescentado entrada da estação como um `stop.location_type`. Veja a [discussão](https://github.com/google/transit/pull/30).

**2 de setembro de 2016**<br/>

* Documentação atualizada para adicionar `agency_id` em `fare_attributes.txt`. Veja a [discussão](https://github.com/google/transit/pull/27).

**16 de março de 2016**<br/>

* Transição da documentação do GTFS para Github em <https://github.com/google/transit>

**3 de fevereiro de 2016**<br/>

* Adicionado `agency_email` à proposta `agency.txt` para spec: [discussão](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2 de fevereiro de 2015**<br/>

* Adicionada a proposta stop_times.txt 'timepoint' à especificação: [discussão](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**17 de fevereiro de 2014**<br/>

* Acrescentou trips.txt 'bikes_allowed' proposta a spec: [discussão](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**15 de outubro de 2012**<br/>

* Acrescentou trips.txtwheelchair_accessible' proposta para spec: [discussão](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**20 de junho de 2012**<br/>

* Adicionada proposta 'wheelchair_boarding' à especificação: [discussão](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2 de fevereiro de 2012**<br/>

* Adicionada proposta 'stop_timezone' à especificação: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**18 de janeiro de 2012**<br/>

* Migrou a documentação do antigo code.google.com para sua nova localização em developers.google.com.

**26 de setembro de 2011**<br/>

* Adicionada proposta 'feed_info' à especificação: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**6 de setembro de 2011**<br/>

* Adicionada a proposta 'agency_fare_url' à especificação: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* Adicionada proposta de 'exact_times' à especificação: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**30 de março de 2009**<br/>

* Uma nova seção sobre como tornar uma ração de trânsito disponível ao público. Isto não foi discutido anteriormente no grupo, porque não foi estritamente uma mudança na forma como os dados são interpretados ou escritos. Entretanto, algumas pessoas no Google pensaram que seria informativo incluir a discussão de usos não-Google do GTFS, uma vez que há um número crescente de aplicações que podem fazer uso de dados GTFS.
* Esclarecimentos sobre o formato CSV: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk).
* Orientação adicional sobre como escolher cores contrastantes nas descrições dos campos route_color e route_text_color.
* trip_short_name, como proposto e testado nestes tópicos: a e b.
* Uma correção para um erro menor nos dados da amostra incluídos no end do documento (dando à parada S7 a parent_station S8).
* Acrescentou informações "agency_lang" aos dados da amostra no end do documento, como sugerido por Marcy durante o período de comentários: [discussão](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0).
* Atualizado o link para a alimentação GTFS da OCTA na barra lateral
* Ver [resumo original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw).

**26 de fevereiro de 2009**<br/>

* Removida a maioria das instruções de envio de rações específicas do Google, já que há muitas outras aplicações que consomem dados GTFS neste ponto.
* Corrigido um link quebrado na barra lateral para a alimentação pública do Orange County OCTA.

**7 de agosto de 2008**<br/>

* Restaurou o campo stop_url, que foi omitido acidentalmente na versão de 6 de agosto
* Adicionado agency_phone aos dados de amostra
* Acrescentou uma menção do acordo de uso de dados ao enviar um feed ao Google

**6 de agosto de 2008**<br/>

* Acrescentado o arquivo transfers.txt, permitindo que os editores de feeds dêem dicas sobre o comportamento de transferência preferido[(proposta original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw))
* Adicionados campos do tipo location_type e parent_station aos stops.txt, permitindo que os pontos de parada sejam agrupados em estações[(proposta original](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw))
* Adicionado campo agency_phone para fornecer número de telefone de voz para uma agência[(proposta original](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* Acrescentada a seção "Testando seus Feeds", mencionando ferramentas de teste de código aberto
* Esclarecimentos adicionais sobre o formato CSV, agency_timezone, agency_lang, route_color, route_text_color, arrival_time, departure_time, calendar.txt vs. calendar_dates.txt, tabelas de tarifas e frequencies.txt
* Adicionado link para documento de histórico de alimentação, e corrigido alguns links de alimentação pública
* Imagens de exemplo atualizadas para retratar a atual interface de usuário do Google Maps
* Dados de amostra atualizados/fixados no documento

**29 de fevereiro de 2008**<br/>

* Adicionado o campo stop_code em stops.txt para permitir a especificação de códigos de parada virados para o cavaleiro[(proposta original](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc))
* Esclareceu as descrições de route_short_name e route_long_name em routes.txt
* Esclareceu as descrições de arrival_time e departure_time em stop_times.txt
* Digitação fixa na seção Amostra de dados

**20 de novembro de 2007**<br/>

* Descrição esclarecida do block_id
* Mudou a linguagem para desfatizar o Google Transit (já que aplicações não-Google estão usando GTFS, e o roteamento de trânsito é agora uma característica integrada do Google Maps), e para corrigir diversos erros tipográficos
* Telas de exemplo atualizadas para refletir a apresentação dos campos GTFS na atual UI do Google Maps
* Atualizado o endereço de e-mail de contato do Google para provedores de dados de trânsito
* Formatação atualizada

**5 de outubro de 2007**<br/>

* Mudança de stop_sequence e shape_pt_sequence para permitir qualquer número inteiro não-negativo crescente
* Descrições esclarecidas e tipologias fixas

**31 de maio de 2007**<br/>

* Estilo de página atualizado, tornando o HTML mais limpo e mais acessível
* Adicionados links para exemplos de alimentação pública e outros sites úteis
* Removidos exemplos de descrições de campo individuais

**9 de abril de 2007**<br/>

* Adicionada seção sobre a [apresentação de um alimento](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle).
* Acrescentado o [exemplo de feed da Agência de Trânsito](https://developers.google.com/transit/gtfs/examples/gtfs-feed).
* Acrescente-se que o calendar.txt pode ser omitido se todas as datas de serviço estiverem definidas no calendar_dates.txt.
* Tornou o campo agency_id opcional em feeds contendo apenas uma agência. Isto permite que os feeds existentes sem o agency_id permaneçam válidos.
* Adicionada especificação mais completa de agency_url, stop_url, e route_url, e valores de exemplo adicionais para esses campos.
* Adicionados 6 (Gôndola) e 7 (Funicular) como valores válidos do route_type.

**8 de março de 2007**<br/>

* Pequena edição para mover o campo stop_url do stop_times.txt, onde foi incorretamente especificado na atualização de 28 de fevereiro, para stops.txt, onde ele pertence.

**5 de março de 2007**<br/>

* Pequena edição para esclarecer a descrição do campo route_long_name.

**28 de fevereiro de 2007**<br/>

* Adição de frequencies.txt para suporte de cronograma baseado no progresso.
* Múltiplas agências agora permitidas na mesma alimentação. Também foi adicionado um novo campo agency_id em ambas agências.txt e routes.txt que permite especificar qual rota é operada por qual agência.
* Adição de URLs por rota e por parada.
* Adição de campo direction_id em trips.txt
* Suporte para mudanças de sinal de cabeçalho de viagem com adição de campo stop_headsign em stop_times.txt.
* Suporte para cores de rota com adição de route_color opcional e route_text_color em routes.txt.
* Removida a capacidade de especificar paradas usando endereços de rua. A versão anterior da especificação permitia dar a localização de uma parada de trânsito usando um endereço de rua nos campos stop_street, stop_city, stop_region, stop_postcode, e stop_country. Agora os locais de parada devem ser dados usando stop_lat para latitude e stop_lon para longitude, que são mais úteis para a maioria das aplicações.
* Adição do tipo de vehicle de teleférico para o campo route_type em routes.txt
* Veja o resumo das mudanças no [blog original do Headway](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/).

**29 de novembro de 2006**<br/>

* Adicionado suporte para informações de Shape trip via shapes.txt
* Esclareceu a definição de stop_sequence
* Tipo de pickup_type e drop_off_type marcados como opcionais

**31 de outubro de 2006**<br/>

* Suporte adicional para informações tarifárias
* Removidas datas de nomes de arquivos individuais
* Mudou as definições de valor do route_type
* Permitir que múltiplos arquivos de alimentação sejam postados ao mesmo time, desde que seus períodos de serviço não se sobreponham
* Block_id fixo em trips.txt para que estivesse corretamente marcado Opcional
* Notado que os cabeçalhos das colunas devem ser incluídos

**29 de setembro de 2006**<br/>

* Pequena edição para corrigir alguns erros nos exemplos.

**25 de setembro de 2006**<br/>

* Versão inicial.
