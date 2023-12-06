---
search:
  exclude: true
---

# GTFS: tornando os dados de trânsito público universalmente acessíveis

<div class="landing-page">
    <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Recursos</a><a class="button" href="extensions">Extensões</a>
</div>

O General General Transit Feed Specification (GTFS) é um [padrão aberto](https://www.interoperablemobility.org/definitions/#open_standard) usado para distribuir informações relevantes sobre sistemas de trânsito para os usuários. Ele permite que as agências de transporte público publiquem seus dados de trânsito em um formato que pode ser consumido por uma ampla variedade de aplicativos de software. Atualmente, o formato de dados GTFS é usado por milhares de provedores de transporte público.

GTFS consiste em duas partes principais: GTFS Schedule GTFS Schedule e GTFS Realtime. O GTFS Schedule GTFS Schedule contém informações sobre rotas, horários, tarifas e detalhes geográficos de trânsito, e é apresentado em arquivos de texto simples. Esse formato simples permite a criação e MAINTENANCE fáceis, sem depender de softwares complexos ou proprietários.

GTFS Realtime contém atualizações de viagens, posições de veículos e alertas de serviço. Ele se baseia em Protocol Buffers, que são um mecanismo neutro de linguagem (e plataforma) para serializar dados estruturados.

GTFS é suportado em todo o mundo e seu uso, importância e escopo têm aumentado. É provável que uma agência que você conheça já use GTFS para representar rotas, horários, locais de parada e outras informações, e que os usuários já estejam consumindo esses dados por meio de vários aplicativos.

[Saiba mais sobre a história do GTFS](background.md)

## Por que usar GTFS?

GTFS é usada por mais de 10.000 agências de trânsito em mais de 100 países. A maioria dos órgãos de trânsito já ouviu falar do GTFS, e ele se tornou rapidamente um padrão do setor. Alguns órgãos produzem esses dados por conta própria, enquanto outros contratam um fornecedor para criar e manter os dados para eles. E como se trata de um padrão aberto simples, baseado em texto, muitos fornecedores de tecnologia de trânsito já podem ler e gravar em arquivos GTFS. Ao entender melhor GTFS, as agências podem fazer escolhas melhores quando se trata de dados. As escolhas que as agências fazem em relação a como manter e distribuir GTFS podem ter um grande impacto na qualidade do serviço.

### Dados abertos significam mais oportunidades e escolhas

GTFS é um padrão aberto. Isso significa que as agências podem disponibilizar informações usando qualquer uma das muitas ferramentas que já suportam GTFS (incluindo a simples edição de texto usando um editor de texto ou uma planilha eletrônica). Os padrões abertos levam à criação de dados que podem ser facilmente compartilhados. Um feed é simplesmente a coleção de arquivos de texto que descrevem um serviço, hospedado on-line em um link permanente disponível publicamente. O mesmo feed pode ser usado pelo Google, Apple, Transit App, Open Trip Planner e até mesmo aplicativos criados por usuários. Qualquer pessoa que queira fornecer informações de trânsito precisas e atualizadas pode usar um feed GTFS para fazer isso.

Alguns usuários gostam de usar aplicativos diferentes, dependendo de suas necessidades - ter GTFS permite que os usuários escolham o aplicativo de planejamento de viagem mais adequado para eles. Alguns aplicativos podem ser mais acessíveis ou melhores no fornecimento de informações para usuários com deficiência, outros podem ser mais simples e fáceis de usar e, às vezes, os usuários querem apenas o aplicativo mais novo.

### GTFS provavelmente pode fazer mais do que você pensa

GTFS é mais conhecido pelas informações de planejamento de viagem, especialmente em áreas metropolitanas com serviço de rota fixa. No entanto, há uma variedade de recursos opcionais acima e além da especificação básica GTFS Schedule que tornam GTFS mais amplamente aplicável, incluindo Fares (Tarifas) para mostrar custos e estruturas de tarifas, Flex (em desenvolvimento) para opções de trânsito que atendem à demanda, como serviços de discagem e paratransit, e Pathways (Caminhos) para exibir informações de acessibilidade que são vitais para os usuários que utilizam dispositivos de mobilidade ou precisam de acomodações adicionais. GTFS Realtime GTFS Realtime se baseia no GTFS Schedule e nos sistemas de GPS dos veículos para fornecer atualizações em tempo real sobre a localização dos veículos.

### GTFS é mais do que apenas planejamento de viagens

Os dadosGTFS agora estão sendo usados por vários aplicativos de software para muitas finalidades diferentes, incluindo visualização de dados e ferramentas de análise para planejamento. Ter dados atualizados e de alta qualidade fornece informações precisas sobre o trânsito não apenas para os usuários, mas também para os planejadores e formuladores de políticas, que podem entender melhor como o trânsito está sendo usado em suas comunidades. A partir de 2023, a Administração Federal de Trânsito dos Estados Unidos exigirá que [as agências de trânsito enviem dados GTFS válidos](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) com seu relatório anual do Banco de Dados Nacional de Trânsito.

## O que é GTFS de alta qualidade?

GTFS de alta qualidade é completo, preciso e atualizado. Isso significa que ele representa como os serviços estão operando atualmente e fornece o máximo de informações possível.

### Dados completos

GTFS de qualidade inclui detalhes importantes do serviço, como alterações de horários de HOLIDAY e de verão, locais de parada precisos e nomes de rotas e sinais de cabeça que correspondem a outros materiais voltados para o usuário. Mesmo que uma agência trabalhe com um fornecedor para produzir GTFS, cabe a ela garantir que as informações apresentadas na versão impressa, a bordo e on-line sejam consistentes.

Para obter informações sobre como criar dados de alta qualidade, consulte as [Diretrizes de dados de trânsito da Califórnia](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) e as [Práticas recomendadas GTFS](schedule/best-practices)

### Atualizados

Ter dados desatualizados é quase pior do que não ter feed algum. Não basta simplesmente publicar informações - elas precisam corresponder ao que o usuário vê e experimenta. Algumas das maiores agências de trânsito atualizam seus GTFS semanalmente, ou até mesmo diariamente, mas a maioria das agências precisará atualizar seus GTFS a cada poucos meses, ou algumas vezes por ano, quando houver mudanças no serviço. Isso inclui coisas como novas rotas ou paradas, alterações de horários ou atualizações na estrutura tarifária.

Muitas agências contratam um fornecedor para criar e gerenciar seus GTFS para elas. Alguns fornecedores podem ser proativos ao perguntar sobre mudanças no serviço, mas é importante que as agências se comuniquem com os fornecedores sobre as próximas mudanças no serviço. É possível publicar GTFS com alterações de serviço com antecedência, garantindo que a transição ocorra sem problemas para todos - agências, fornecedores, planejadores de viagem e usuários!

