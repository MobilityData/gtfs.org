# Visão geral da ScheduleGTFS

<div class="landing-page">
   <a class="button" href="reference">Referência</a>
   <a class="button" href="best-practices">Melhores Práticas</a>
   <a class="button" href="examples">Exemplos</a>
   <a class="button" href="changes">Mudanças</a>
</div>

## Como Começar

Uma alimentação GTFS, que contém informações estáticas de trânsito, é composta de vários arquivos de texto (.txt) que estão contidos em um único arquivo ZIP. Cada arquivo descreve um aspecto particular das informações de trânsito: paradas, rotas, viagens, tarifas, etc. Para mais informações sobre cada arquivo, consulte a referência GTFS.

Para criar um feed GTFS, siga os passos abaixo.

1. Crie todos os arquivos necessários descritos na referência da [ScheduleGTFS](reference). Crie os arquivos opcionais se sua funcionalidade for desejada.
1. Salve todos os arquivos no formato .txt. Os valores de campo devem ser delimitados por vírgula e cada linha deve terminar com uma quebra de linha. Consulte a referência GTFS para obter informações detalhadas sobre o conteúdo do arquivo.
1. Zipar todos os arquivos de texto juntos. O arquivo zipado compreende uma versão do feed.
1. Publique o feed usando uma das opções abaixo.

## Tornando um feed de trânsito disponível publicamente

<hr/>

Os conjuntos de dados devem ser publicados em uma URL pública e permanente, incluindo o nome do arquivo zip. (por exemplo, [GTFS/GTFS.zip">GTFS](<http://www.agency.org/\<glossary variable=>). O ideal seria que a URL pudesse ser baixada diretamente sem exigir login para acessar o arquivo, para facilitar o download, consumindo aplicações de software. Embora seja recomendado (e a prática mais comum) fazer um conjunto de dados GTFS descarregar abertamente, se um provedor de dados precisar controlar o acesso ao GTFS para licenciamento ou outros motivos, é recomendado controlar o acesso ao conjunto de dados GTFS usando chaves API, o que facilitará os downloads automáticos.

O servidor web que hospeda os dados GTFS deve ser configurado para informar corretamente a data de modificação do arquivo (ver HTTP/1.1 - Request for Comments 2616, na seção 14.29).

Ver "[Melhores Práticas](best-practices/#dataset-publishing-general-practices)":[Dataset Publishing](best-practices/#dataset-publishing-general-practices)" para mais recomendações.

## Treinamento

<hr/>

O Open Learning Campus (OLC) do Banco Mundial oferece um curso online auto-instrutivo chamado "[GTFS-and-informal-transit-system-mapping">Introdução à General Transit Feed Specification (GTFS](<https://olc.worldbank.org/content/introduction-general-transit-feed-specification-\<glossary variable=>)) e Mapeamento Informal de Sistemas de Trânsito". Este curso inclui as seguintes seções:

* O que é GTFS? História & Estrutura do arquivo
* O que é GTFS? Visualização & Comunidade
* Configurando uma alimentação GTFS
* Introdução às ferramentas GitHub & Open Source
* Histórias do campo
* Como mapear dados de trânsito
* Como coletar dados para a primeira alimentação de uma cidade
* Pesquisa de aplicação
* GTFS

Veja mais [cursos on-line](../resources/other/#on-line-courses).

## Obtenção de ajuda e comunidade

<hr/>

### Listas de correio

Há uma série de listas de correio que podem ser bons recursos quando você tem dúvidas sobre dados de trânsito público, software, formatos como GTFS e GTFS, e outras questões:

* [GTFS-changes">MudançasGTFS](<https://groups.google.com/group/\<glossary variable=>): discussão de proposta para ampliar a especificação GTFS.
* [MobilityData Slack](https://mobilitydata-io.slack.com/): Slack "organização" com canais dedicados a tópicos GTFS. [Solicite um convite para mobilitydata-io.slack.com aqui](https://share.mobilitydata.org/slack).
* [Desenvolvedores de Trânsito](https://groups.google.com/group/transit-developers): discussões gerais sobre desenvolvedores de trânsito. Muitas agências de trânsito também têm suas próprias listas de discussão de desenvolvedores específicas para a agência. Por exemplo:
  * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
  * [Portland, OU](https://groups.google.com/group/transit-developers-pdx)
  * [BART - São Francisco, CA](https://groups.google.com/group/bart-developers)
  * [MassDOT](https://groups.google.com/group/massdotdevelopers)
  * [Atlanta, região GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
  * [511 Recursos para desenvolvedores da área da Baía de São Francisco](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Verifique com sua agência de trânsito local para ver se eles têm uma lista de correio própria.

Veja mais [recursos da comunidade](../resources/community).
