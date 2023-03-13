# GTFS Realtime Mudanças 

A Especificação GTFS Realtime não é definida em pedra. Ao invés disso, é uma especificação aberta desenvolvida e mantida pela comunidade de agências de trânsito, desenvolvedores e outras partes interessadas que utilizam o GTFS Realtime. Espera-se que esta comunidade de produtores e consumidores de dados do GTFS Realtime tenha propostas para ampliar as especificações de modo a permitir novas capacidades.

Para contribuir com o GTFS realtime, leia o [Processo de Emenda de Especificações](../process) e siga as discussões nas [questões](https://github.com/google/transit/issues) em aberto e [faça solicitações](https://github.com/google/transit/pulls) no repositório Transit Github do Google[(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

!!! note ""

    A especificação oficial, referência e documentação são escritas em inglês. Se uma tradução para um idioma diferente do original em inglês, esta última tem precedência. Toda a comunicação é feita em inglês.

<!-- <br><div class="landing-page">
    <a class="button" href="../process">Processo de Alteração de Especificações</a><a class="button" href="../guiding-principles">Princípios Orientadores</a><a class="button" href="../revision-history">Histórico de revisão</a><a class="button" href="../extensions">Extensões em tempo real</a>
</div> -->

## Propostas ativas &ensp;<img src="../../assets/pr-active.svg" style="height:1em;"/>

<!-- Propostas ativas para novas funcionalidades no GTFS Realtime.  -->

Participe das discussões sobre [o Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/332" target="_blank">Adicionar cause_detail e effect_detail aos alertas</a></h3>
        <p class="maintainer">#332 aberta em 31 de maio de 2022 por <a class="no-icon" href="https://github.com/mckenzie-maidl-ibigroup" target="_blank">mckenzie-maidl-ibigroup</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">Atualmente não há propostas ativas para o GTFS Realtime.</h3>
        <p class="prompt">Tem uma proposta? &ensp;➜&ensp; Abra um <a href="https://github.com/google/transit/pulls" target="_blank">solicitação de puxar</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propostas fundidas recentemente &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recentemente foram fundidas propostas que agora são características da [especificação oficial do GTFS Realtime](../reference). Veja o [Histórico de Revisões](../process#revision-history) completo para mais informações.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/332" class="no-icon" target="_blank">Adicionar cause_detail e effect_detail aos alertas</a></h3>
        <p class="maintainer">#332 por <a href="https://github.com/mckenzie-maidl-ibigroup" class="no-icon" target="_blank">mckenzie-maidl-ibigroup</a> foi fundido em 26 de junho de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adiciona descrições para causar e efeitos de Alertas</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/340" class="no-icon" target="_blank">GTFS-rt : atualização do acesso de cadeira de rodas</a></h3>
        <p class="maintainer">#340 por <a href="https://github.com/flaktack" class="no-icon" target="_blank">flaktack</a> foi fundido em 25 de julho de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adiciona informações em tempo real sobre a acessibilidade da viagem</li>
            <li>Se fornecido, sobrescreve <code>trips.wheelchair_accessible</code> no conjunto de dados da GTFS Schedule</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/283" class="no-icon" target="_blank">Característica/imagem em alertas</a></h3>
        <p class="maintainer">#283 pela <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> foi fundida em 26 de novembro de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adiciona um campo de um link URL para uma imagem (ex. foto ou mapa) a ser exibido nos alertas de serviço dos aplicativos, a fim de melhorar a compreensão do alerta</li>
            <li>As mudanças incluem: limite imposto de tamanho de imagem, uma imagem por alerta, e garantir que a URL mude se o conteúdo ou idioma das imagens mudar</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/272" class="no-icon" target="_blank">Adicionar GTFS-NewShapes como experimental</a></h3>
        <p class="maintainer">#272 por <a href="https://github.com/ericouyang" class="no-icon" target="_blank">ericouyang</a> foi fundida em 30 de agosto de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Capacidade de atualizar formas de rotas em tempo real para refletir desvios</li>
            <li>As atualizações de rota são refletidas referenciando uma <code>shape_id</code> existente ou definindo em tempo real uma nova forma como uma polilinha codificada</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/260" class="no-icon" target="_blank">Adicionar departure_occupancy_status ao TripUpdate</a></h3>
        <p class="maintainer">#260 por <a href="https://github.com/jakehoare" class="no-icon" target="_blank">jakehoare</a> foi fundido em 14 de abril de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Fornecer a ocupação prevista de veículos em trânsito em futuras paradas, com base em dados atuais ou históricos</li>
        </ul>
    </div>
</div>

<div class="row"/>
