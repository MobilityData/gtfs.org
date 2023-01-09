# Validador de GTFS Schedule

Este validador de GTFS Schedule gratuito e de código aberto é mantido pela [MobilityData](https://mobilitydata.org) com a ajuda da comunidade GTFS. Use-o para avaliar seu conjunto de dados em relação à [Referência](reference.md) oficial do [GTFS](reference.md) e às [Melhores Práticas](best-practices.md). Ele fornece um relatório de validação fácil de usar em um formato HTML que pode ser aberto no navegador e compartilhado com outras partes.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->

<br/>

<div class="usage-buttons">
   <a class="button" href="https://share.mobilitydata.org/validator-installer-mac">Download para Mac <img class="icon" src="../../assets/apple.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-windows">Download para Windows <img class="icon" src="../../assets/windows.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu">Download para Ubuntu</a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu"> <img class="icon" src="../../assets/ubuntu.svg" width="20"/>
</a></div>

**VERSÃO v4.0.0** / [Leia as notas de lançamento](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr/>

## Utilização

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Baixe a versão mais recente do projeto com base em nosso sistema operacional.</li>
            <li>Uma vez instalado, execute o aplicativo e aparecerá uma janela.</li>
            <li>Carregue seu conjunto de dados GTFS: você pode especificar uma url, arquivo ZIP ou diretório contendo os arquivos .txt individuais de um feed.</li>
            <li>Escolha um diretório de saída: Este é o diretório onde os relatórios de validação serão escritos.</li>
            <li>Quando a validação for concluída, os resultados serão automaticamente abertos em seu navegador. Se você não conseguir vê-los, basta abrir o arquivo report.html que foi criado no caminho de saída.</li>
            <li>Você verá se o validador encontrou problemas com os dados, e links para nossa documentação sobre como corrigi-los. O relatório de validação será salvo como um arquivo HTML, para que possa ser facilmente salvo e compartilhado com outras pessoas.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls="">
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </source></video>
    </div>
</div>

## Use este validador como parte de seu pipeline de dados

Para ver mais instruções sobre como usar esta ferramenta em seu pipeline de dados, por favor visite o [repositório GitHub](https://github.com/MobilityData/gtfs-validator).

## Contribuindo

Este projeto é um esforço comunitário, e qualquer pessoa interessada neste projeto pode se juntar à comunidade, participar da tomada de decisões e ajudar a avançar de diferentes maneiras. Há muitas maneiras diferentes de contribuir: compartilhar sua idéia para um novo recurso, relatar um problema, melhorar a documentação, ensinar a outros como utilizá-la, etc.

Interessado em contribuir para este projeto? Por favor, visite o [repositório GitHub](https://github.com/MobilityData/gtfs-validator) e leia nossas [diretrizes de contribuição](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).
