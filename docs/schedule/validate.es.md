# Validador de GTFS Schedule

Este validador canónico GTFS Schedule gratuito y de código abierto es mantenido por [MobilityData](https://mobilitydata.org) con la ayuda de la comunidad GTFS. Utilícelo para evaluar su conjunto de datos frente a la [Referencia GTFS](reference.md) oficial y las [Mejores Prácticas](best-practices.md). Proporciona un informe de validación fácil de usar en formato HTML que se puede abrir en el navegador y compartir con otras partes.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->

<br/>

<div class="usage-buttons">
    Descarga para <a class="button" href="https://share.mobilitydata.org/validator-installer-mac">Mac <img class="icon" src="../../assets/apple.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-windows">Descarga para Windows <img class="icon" src="../../assets/windows.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu">Descarga para Ubuntu</a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu"> <img class="icon" src="../../assets/ubuntu.svg" width="20"/>
</a></div>

**VERSION v4.0.0** / [Lea las notas de la versión](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr/>

## Uso

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Descargue la última versión del proyecto basada en nuestro sistema operativo.</li>
            <li>Una vez instalada, ejecute la aplicación y aparecerá una ventana.</li>
            <li>Cargue su conjunto de datos GTFS: puede especificar una url, un archivo ZIP o un directorio que contenga los archivos .txt individuales de un feed.</li>
            <li>Elija un directorio de salida: Este es el directorio donde se escribirán los informes de validación.</li>
            <li>Cuando finalice la validación, los resultados se abrirán automáticamente en su navegador. Si no puedes verlos, abre el archivo report.html que se creó en la ruta de salida.</li>
            <li>Verás si el validador encontró problemas con los datos, y enlaces a nuestra documentación para saber cómo solucionarlos. El informe de validación se guardará como un archivo HTML, por lo que puede ser fácilmente guardado y compartido con otros.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls="">
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </source></video>
    </div>
</div>

## Utilice este validador como parte de su canal de datos

Para ver más instrucciones sobre cómo utilizar esta herramienta en su canalización de datos, visite el [repositorio de GitHub](https://github.com/MobilityData/gtfs-validator).

## Contribución

Este proyecto es un esfuerzo comunitario, y cualquier persona interesada en él puede unirse a la comunidad, participar en la toma de decisiones y ayudar a que avance de diferentes maneras. Hay muchas formas diferentes de contribuir: compartiendo tu idea para una nueva función, informando de un problema, mejorando la documentación, enseñando a otros cómo utilizarlo, etc.

¿Le interesa contribuir a este proyecto? Visite el repositorio de [GitHub](https://github.com/MobilityData/gtfs-validator) y lea nuestras [directrices de contribución](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).
