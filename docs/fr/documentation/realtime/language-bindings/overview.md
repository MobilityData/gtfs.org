# GTFS Realtime Bindings

## Introduction 
 
 [GTFS Realtime](https://github.com/google/transit/tree/master/gtfs-realtime) est un format de données permettant de communiquer des informations en temps réel sur les systèmes de transport en commun. Les données GTFS Realtime sont codées et décodées à l’aide de [Protocol Buffers](https://developers.google.com/protocol-buffers/), une représentation binaire compacte conçue pour un traitement rapide et efficace. Le schéma de données lui-même est défini dans [gtfs-realtime.proto](https://github.com/google/transit/blob/master/gtfs-realtime/proto/gtfs-realtime.proto). 
 
 Pour travailler avec des données GTFS Realtime, un développeur·euse utilise généralement le schéma `gtfs-realtime.proto` pour générer des classes dans le langage de programmation de son choix. Ces classes peuvent ensuite être utilisées pour construire des objets de modèle de données en temps réel GTFS et les sérialiser sous forme de données binaires ou, dans le sens inverse, pour analyser des données binaires en objets de modèle de données. 
 
 Parce que la génération de classes de modèles de données GTFS Realtime à partir du schéma `gtfs-realtime.proto` est une tâche très courante, mais qui parfois provoque une confusion chez les développeurs débutants, ce projet vise à fournir Liaisons de langage GTFS Realtime pré-générées pour un certain nombre des langages de programmation les plus populaires. Dans la mesure du possible, ces liaisons linguistiques seront publiées sous forme de packages pour faciliter leur utilisation dans d’autres projets. 
 
## Langues prises en charge 
 
 * [.NET](dotnet.md) 
 * [Java](java.md) 
 * [JavaScript/TypeScript/Node.js](nodejs.md) 
 * [Python](python.md) 
 * [Golang](golang.md) 
 * ~~[Ruby](ruby.md)~~ *(Obsolète depuis début 2019)* 
 * ~~[PHP](php.md)~~  *(Obsolète depuis début 2019)* 
 
## Autres langages 
 
 Nous ne fournissons pas de code généré pour C++, utilisez le compilateur de protocole officiel pour cela ( à partir de [ici](https://developers.google.com/protocol-buffers/docs/downloads) ou [ici](https://github.com/google/protobuf)) 
 
 Manquons-nous votre favori langue? Pensez à contribuer : 
 
 1. Lisez [CONTRIBUTING.md](https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/CONTRIBUTING.md). 
 2. Ouvrez une pull request avec la langue de votre choix. Veuillez inclure des instructions de mise à jour (idéalement, des scripts). Fournissez également un packaging adapté à l’écosystème linguistique. 
 
## Historique du projet 
 
 Ce projet a été créé à l’origine par Google- MobilityData a commencé à maintenir le projet début 2019. 
 
 Les anciennes versions des bibliothèques de liaisons sont toujours publiées sous le nom de Google. Consultez la documentation de chaque langue [ici](https://github.com/MobilityData/gtfs-realtime-bindings/tree/final-google-version) pour trouver la dernière version publiée par Google. 
