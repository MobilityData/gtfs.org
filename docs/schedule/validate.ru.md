# Валидатор GTFS Schedule

Этот бесплатный и открытый валидатор канонических GTFS Schedule поддерживается [MobilityData](https://mobilitydata.org) с помощью сообщества GTFS. Используйте его для оценки вашего набора данных на соответствие официальному [справочникуGTFS](reference.md) и [лучшим практикам](best-practices.md). Он предоставляет простой в использовании отчет о проверке в формате HTML, который можно открыть в браузере и поделиться им с другими сторонами.

<!-- <img class="center" src="../../assets/validator_animation.gif" width="150"> -->

<br/>

<div class="usage-buttons">
   <a class="button" href="https://share.mobilitydata.org/validator-installer-mac">Скачать для Mac <img class="icon" src="../../assets/apple.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-windows">Скачать для Windows <img class="icon" src="../../assets/windows.svg" width="20"/></a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu">Скачать для Ubuntu</a><a class="button" href="https://share.mobilitydata.org/validator-installer-ubuntu"> <img class="icon" src="../../assets/ubuntu.svg" width="20"/>
</a></div>

**ВЕРСИЯ v4.0.0** / [Прочитать примечания к выпуску](https://github.com/MobilityData/gtfs-validator/releases/latest)

<hr/>

## Использование

<div class="usage">
    <div class="usage-list">
        <ol>
            <li>Загрузите последнюю версию проекта на основе нашей операционной системы.</li>
            <li>После установки запустите приложение, появится окно.</li>
            <li>Загрузите ваш набор данных GTFS: вы можете указать url, ZIP-файл или каталог, содержащий отдельные .txt-файлы фида.</li>
            <li>Выберите выходной каталог: Это каталог, в который будут записаны отчеты о валидации.</li>
            <li>После завершения валидации результаты автоматически откроются в вашем браузере. Если вы не можете их увидеть, просто откройте файл report.html, созданный в выходном каталоге.</li>
            <li>Вы увидите, обнаружил ли валидатор проблемы с данными, а также ссылки на нашу документацию о том, как их устранить. Отчет о валидации будет сохранен в виде HTML-файла, поэтому его можно легко сохранить и поделиться им с другими.</li>
        </ol>
    </div>
    <div class="usage-video">
        <video class="center" width="560" height="315" controls="">
            <source src="../../assets/validator_demo_large.mp4" type="video/mp4">
        </source></video>
    </div>
</div>

## Используйте этот валидатор как часть вашего конвейера данных

Для получения дополнительных инструкций по использованию этого инструмента в вашем конвейере данных, пожалуйста, посетите [репозиторий GitHub](https://github.com/MobilityData/gtfs-validator).

## Вклад

Этот проект является проектом сообщества, и каждый, кто заинтересован в этом проекте, может присоединиться к сообществу, участвовать в принятии решений и помогать его развитию различными способами. Существует множество различных способов внести свой вклад: поделиться идеей новой функции, сообщить о проблеме, улучшить документацию, научить других, как использовать этот проект и т.д.

Хотите внести свой вклад в этот проект? Посетите [репозиторий GitHub](https://github.com/MobilityData/gtfs-validator) и ознакомьтесь с нашими [рекомендациями по внесению](https://github.com/MobilityData/gtfs-validator/blob/master/docs/CONTRIBUTING.md).
