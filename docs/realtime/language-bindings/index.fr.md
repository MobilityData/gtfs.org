# gtfs-realtime-bindings [![Join the MobilityData chat](https://img.shields.io/badge/chat-on%20slack-red)](https://share.mobilitydata.org/slack)

Liaisons linguistiques générées à partir de la spécification du tampon de protocole [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) pour les langues les plus courantes.

## Introduction

[GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) est un format de données permettant de communiquer des informations en temps réel sur les systèmes de transport public. Les données GTFS Realtime sont codées et décodées à l'aide de [Protocol Buffers](https://developers.google.com/protocol-buffers/), une représentation binaire compacte conçue pour un traitement rapide et efficace. Le schéma de données lui-même est défini dans le fichier [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto).

Pour travailler avec les données GTFS Realtime, un développeur utilise généralement le schéma `gtfs-realtime.proto` pour générer des classes dans le langage de programmation de son choix. Ces classes peuvent ensuite être utilisées pour construire des objets de modèle de données GTFS-realtimedata et les sérialiser sous forme de données binaires ou, dans le sens inverse, analyser les données binaires en objets de modèle de données.

Comme la génération de classes de modèles de données GTFS Realtime à partir du schéma `gtfs-realtime.proto` est une tâche courante, mais aussi une tâche qui est parfois source de confusion pour les développeurs débutants, ce projet vise à fournir des liaisons de langage GTFS Realtime pré-générées pour un certain nombre des langages de programmation les plus populaires. Dans la mesure du possible, ces liaisons de langage seront publiées sous forme de paquets pour faciliter leur utilisation dans d'autres projets.

## Langues prises en charge

* [.NET](dotnet.md)
* [Java](java.md)
* [JavaScript / TypeScript / Node.js](nodejs.md)
* [Python](python.md)
* [Golang](golang.md)
* ~~[Ruby](ruby.md)~~ *(déprécié au début de 2019)*
* ~~[PHP](php.md)~~ *(Déprécié depuis début 2019)*

## Autres langues

Nous ne fournissons pas de code généré pour C++, utilisez le compilateur officiel de protoc pour cela (d'[ici](https://developers.google.com/protocol-buffers/docs/downloads) ou d'[ici](https://github.com/google/protobuf)).

Votre langue préférée nous échappe-t-elle ? Pensez à contribuer :

1. Lisez [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md).
2. Ouvrez un pull request avec la langue de votre choix. Veuillez inclure des instructions de mise à jour (idéalement, des scripts). Fournissez également un packaging adapté à l'écosystème de la langue.

## Historique du projet

Ce projet a été créé à l'origine par Google - MobilityData a commencé à maintenir le projet au début de 2019.

Les anciennes versions des bibliothèques de bindings sont toujours publiées sous le nom de Google. Consultez la documentation pour chaque langue [ici](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) pour trouver la dernière version publiée par Google.
