---
search:
  exclude: true
---

# Mudanças GTFS Schedule

<!-- <div class=landing-page>
    <a class=button href=../process>Specification Amendment Process</a><a class=button href=../guiding-principles>Guiding Principles</a><a class=button href=../revision-history>Revision History</a>
</div> -->

A Especificação GTFS não é definida em pedra. Ao invés disso, é uma especificação aberta desenvolvida e mantida pela comunidade de agências de trânsito, desenvolvedores e outras partes interessadas que utilizam GTFS. Espera-se que esta comunidade de produtores e consumidores de dados GTFS tenha propostas para ampliar as especificações a fim de permitir novas capacidades.

Para contribuir com o GTFS, leia o [Processo de Emenda de Especificações](../process) e siga as discussões nas [questões](https://github.com/google/transit/issues) em aberto e [faça solicitações](https://github.com/google/transit/pulls) no repositório Transit Github do Google [(google/transit](https://github.com/google/transit)). ![](../../assets/mark-github.svg)

<div class="admonition note"> <p> A especificação oficial, referência e documentação são escritas em inglês. Se uma tradução para um idioma diferente do original em inglês, esta última tem precedência. Toda a comunicação é feita em inglês.</p> </div>


## Propostas ativas &ensp; <img src="../../assets/pr-active.svg" style="height:1em;"/>

<!--
Active proposals for new features in <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.  -->

Participe das discussões sobre [o Github](https://github.com/google/transit/pulls)!

<!-- <div class="row">
    <div class="active-container">
        <h3 class="title"><a class="no-icon" href="https://github.com/google/transit/pull/303" target="_blank">Add <glossary variable="trip">trip</glossary>-to-<glossary variable="trip">trip</glossary> transfers with in-seat option</a></h3>
        <p class="maintainer">#303 opened on Jan 26, 2022 by <a class="no-icon" href="https://github.com/gcamp" target="_blank">gcamp</a></p>
    </div>
</div>
<div class="row"></div> -->

<!-- <div class="row no-active">
    <div class="no-active-container">
        <h3 class="title">There are currently no active proposals for <glossary variable="GTFS Schedule"><glossary variable="GTFS">GTFS</glossary> Schedule</glossary>.</h3>
        <p class="prompt">Have a proposal? &ensp;➜&ensp; Open a <a href="https://github.com/google/transit/pulls" target="_blank">pull request</a>.</p>
    </div>
</div>
<div class="row"></div> -->

## Propostas fundidas recentemente &ensp;<img src="../../assets/pr-merged.svg" style="height:1em;"/>

Recentemente foram fundidas propostas que agora são características da [especificação oficial da GTFS Schedule](../reference). Veja o [Histórico de Revisões](../process#revision-history) completo para mais informações.

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/355" class="no-icon" target="_blank">Acrescentar mídia tarifária</a></h3>
        <p class="maintainer">#355 por <a href="https://github.com/isabelle-dr" class="no-icon" target="_blank">isabelle-dr</a> foi fundida em 14 de março de 2023</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>O Mídia Tarifária é um elemento chave na <a href="../../extensions/fares-v2">proposta de extensão do GTFS Fares-v2</a></li>
            <li>Representa o que um cavaleiro pode usar para validar sua viagem (por exemplo, um cartão de trânsito, um aplicativo móvel ou um cartão bancário "tap-to-pay" usando um cartão bancário sem contato)</li>
            <li>Um produto tarifário pode ser associado a uma mídia tarifária específica (por exemplo, um passe mensal só está disponível em um cartão de trânsito)</li>
            <li>O preço de um produto tarifário pode ser definido com base na Mídia Tarifária (por exemplo, o bilhete é mais barato se comprado através de um aplicativo móvel)</li>
        </ul>
    </div>
</div>


<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/303" class="no-icon" target="_blank">Adicionar transferências de trip com opção in-seat</a></h3>
        <p class="maintainer">#303 por <a href="https://github.com/gcamp" class="no-icon" target="_blank">gcamp</a> foi fundido em 26 de junho de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Adiciona novos <code>transfer_type</code> de trip para trip para definir se um usuário pode fazer uma "transferência de assento" quando o mesmo vehicle está operando duas viagens consecutivas e o usuário pode ficar a bordo</li>
            <li>Pode definir quando as transferências dentro do assento não são permitidas, mas pode ligar operacionalmente duas viagens diferentes
            </li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/286" class="no-icon" target="_blank">Implementação da base GTFS-Fares V2</a></h3>
        <p class="maintainer">#286 por <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> foi fundido em 17 de maio de 2022</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Tarifas de trânsito e bilhetes</li>
            <li>Modelagem de custos para tarifas e transferências complexas (transferências multi-rede, time e na contagem)</li>
            <li>Modelo para associar paradas a áreas tarifárias</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/284" class="no-icon" target="_blank">Transferências de trip e de rota para rota</a></h3>
        <p class="maintainer">#284 por <a href="https://github.com/scmcca" class="no-icon" target="_blank">scmcca</a> foi fundido em 5 de outubro de 2021</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Especificar regras para transferências entre paradas, trip ou pares de rotas em transfers.txt</li>
             <li>Especificidade das regras de transferência com base em diferentes arranjos de pares</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/208" class="no-icon" target="_blank">GTFS-ContinuousStops</a></h3>
        <p class="maintainer">#208 por <a href="https://github.com/timMillet" class="no-icon" target="_blank">timMillet</a> foi fundida em 13 de maio de 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Permite a retirada do passageiro ou dropoff em qualquer lugar ao longo do percurso de um vehicle</li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="leftcontainer">
        <h3 class="title"><a href="https://github.com/google/transit/pull/180" class="no-icon" target="_blank">GTFS-Translations</a></h3>
        <p class="maintainer">#180 por <a href="https://github.com/LeoFrachet" class="no-icon" target="_blank">LeoFrachet</a> foi fundida em 9 de janeiro de 2020</p>
    </div>
    <div class="featurelist">
        <ul>
            <li>Traduções para campos de text, URLs localizadas e informações de contato</li>
        </ul>
    </div>
</div>

<div class="row"/>
