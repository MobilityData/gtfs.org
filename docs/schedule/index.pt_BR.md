---
search:
  exclude: true
---

# Visão geral da GTFS Schedule

<div class="landing-page">
   <a class="button" href="reference">Referência</a>
   <a class="button" href="best-practices">Melhores Práticas</a>
   <a class="button" href="examples">Exemplos</a>
   <a class="button" href="changes">Mudanças</a>
</div>

## Como Começar

Uma alimentação GTFS, que contém informações estáticas de trânsito, é composta de vários arquivos de texto (.txt) que estão contidos em um único arquivo ZIP. Cada arquivo descreve um aspecto particular das informações de trânsito: paradas, rotas, viagens, tarifas, etc. Para mais informações sobre cada arquivo, consulte a referência GTFS.

Para criar um feed GTFS, siga os passos abaixo.

1. Crie todos os arquivos necessários descritos na referência da [GTFS Schedule](reference). Crie os arquivos opcionais se sua funcionalidade for desejada.
1. Salve todos os arquivos no formato .txt. Os valores de campo devem ser delimitados por vírgula e cada linha deve terminar com uma quebra de linha. Consulte a referência GTFS para obter informações detalhadas sobre o conteúdo do arquivo.
1. Zipar todos os arquivos de texto juntos. O arquivo zipado compreende uma versão do feed.
1. Publique o feed usando uma das opções abaixo.

## Tornando um feed de trânsito disponível publicamente

<hr/>

Os conjuntos de dados devem ser publicados em uma URL pública e permanente, incluindo o nome do arquivo zip. (por exemplo, www.agency.org/gtfs/gtfs.zip). O ideal seria que a URL pudesse ser baixada diretamente sem exigir login para acessar o arquivo, para facilitar o download, consumindo aplicações de software. Embora seja recomendado (e a prática mais comum) fazer um conjunto de dados GTFS descarregar abertamente, se um provedor de dados precisar controlar o acesso ao GTFS para licenciamento ou outros motivos, é recomendado controlar o acesso ao conjunto de dados GTFS usando chaves API, o que facilitará os downloads automáticos.

O servidor web que hospeda os dados GTFS deve ser configurado para informar corretamente a data de modificação do arquivo (ver HTTP/1.1 - Request for Comments 2616, na seção 14.29).

Ver "[Melhores Práticas](best-practices/#dataset-publishing-general-practices)":[Dataset Publishing](best-practices/#dataset-publishing-general-practices)" para mais recomendações.

## Treinamento

<hr/>

O Open Learning Campus (OLC) do Banco Mundial oferece um curso online auto-instrutivo chamado “[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)”. Este curso inclui as seguintes seções:

* O que é GTFS? História & Estrutura do arquivo
* O que é GTFS? Visualização & Comunidade
* Configurando uma alimentação GTFS
* Introdução às ferramentas GitHub & Open Source
* Histórias do campo
* Como mapear dados de trânsito
* Como coletar dados para a primeira alimentação de uma cidade
* Pesquisa de aplicação
* GTFS-Realtime

Veja mais [cursos on-line](../resources/other/#on-line-courses).

## Obtenção de ajuda e comunidade

<hr/>

### Listas de correio

Há uma série de listas de correio que podem ser bons recursos quando você tem dúvidas sobre dados de trânsito público, software, formatos como GTFS e GTFS, e outras questões:

* [GTFS Changes](https://groups.google.com/group/gtfs-changes): discussão da proposta de extensão da especificação GTFS, conforme descrito no [GTFS Changes document](https://github.com/google/transit/blob/master/gtfs/CHANGES.md).
* [GTFS Realtime](https://groups.google.com/group/gtfs-realtime): discussão da especificação [GTFS-realtime](https://github.com/google/transit/tree/master/gtfs-realtime).
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack "organização" com canais dedicados aos tópicos do GTFS. [Solicite um convite para mobilitydata-io.slack.com aqui](https://share.mobilitydata.org/slack).
* [transitfeed](https://groups.google.com/group/transitfeed): discussão do projeto open-source [transitfeed](https://groups.google.com/group/transitfeed), assim como discussão da especificação GTFS e ferramentas associadas.
* [transit-developers](https://groups.google.com/group/transit-developers): discussões gerais do desenvolvedor do projeto transit-developers. Muitas agências de trânsito também têm suas próprias listas de discussão de desenvolvedores específicas para a agência. Por exemplo:
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - São Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Atlanta, região GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 San Francisco Bay Area Developer Resources](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)

Verifique com sua agência de trânsito local para ver se eles têm uma lista de correio própria.


Veja mais [recursos da comunidade](../resources/community).
