---
search:
  exclude: true
---


# GTFS: rendre les données sur le transport public universellement accessibles

<div class="landing-page">
   <a class="button" href="schedule">GTFS Schedule</a><a class="button" href="realtime">GTFS Realtime</a><a class="button" href="resources">Ressources</a><a class="button" href="extensions">Extensions</a>
</div>

La General Transit Feed Specification (GTFS) est une [norme ouverte](https://www.interoperablemobility.org/definitions/#open_standard) utilisée pour distribuer aux usagers des informations pertinentes sur les systèmes de transport en commun. Elle permet aux agences de transport public de publier leurs données dans un format qui peut être utilisé par une grande variété d'applications logicielles. Aujourd'hui, le format de données GTFS est utilisé par des milliers de fournisseurs de transports publics.

GTFS se compose de deux parties principales : GTFS Schedule GTFS Schedule et GTFS Realtime. GTFS Schedule GTFS Schedule contient des informations sur les itinéraires, les horaires, les tarifs et les détails géographiques des transports publics, et se présente sous la forme de simples fichiers texte. Ce format simple permet une création et une MAINTENANCE aisées sans avoir recours à des logiciels complexes ou propriétaires.

GTFS Realtime contient les mises à jour des trajets, les positions des véhicules et les alertes de service. Il est basé sur des tampons de protocole, qui sont un mécanisme neutre en termes de langage (et de plate-forme) pour sérialiser des données structurées.

GTFS est supporté dans le monde entier et son utilisation, son importance et sa portée ne cessent de croître. Il est probable qu'une agence que vous connaissez utilise déjà GTFS pour représenter les itinéraires, les Schedule, les emplacements des arrêts et d'autres informations, et que les usagers l'utilisent déjà via diverses applications.

[En savoir plus sur l'histoire de GTFS](background.md)

## Pourquoi utiliser GTFS?

GTFS est utilisé par plus de 10 000 agences de transport dans plus de 100 pays. La plupart des agences de transport ont entendu parler de GTFS, qui est rapidement devenu une norme industrielle. Certaines agences produisent elles-mêmes ces données, tandis que d'autres font appel à un fournisseur pour créer et maintenir les données pour elles. Et comme il s'agit d'une norme ouverte simple, basée sur du texte, de nombreux fournisseurs de technologies de transport peuvent déjà lire et écrire dans des fichiers GTFS. En comprenant mieux le GTFS, les agences peuvent faire de meilleurs choix en matière de données. Les choix qu'elles font en matière de maintenance et de distribution des GTFS peuvent avoir un impact considérable sur la qualité du service.

### Des données ouvertes, c'est plus d'opportunités et de choix

GTFS est une norme ouverte. Cela signifie que les agences peuvent mettre des informations à disposition en utilisant n'importe lequel des nombreux outils qui supportent déjà GTFS (y compris une simple édition de texte à l'aide d'un éditeur de texte ou d'une feuille de calcul). Les normes ouvertes permettent de créer des données qui peuvent être facilement partagées. Un flux est simplement une collection de fichiers texte décrivant un service, hébergé en ligne sur un lien permanent accessible au public. Le même flux peut être utilisé par Google, Apple, Transit App, Open Trip Planner et même les applications créées par les usagers. Toute personne souhaitant fournir des informations précises et actualisées sur les transports en commun peut utiliser un flux GTFS pour ce faire.

Certains usagers préfèrent utiliser différentes applications en fonction de leurs besoins. Grâce à GTFS, les usagers peuvent choisir l'application de planification de voyage qui leur convient le mieux. Certaines applications peuvent être plus accessibles ou mieux fournir des informations aux personnes handicapées, d'autres peuvent être plus simples et plus faciles à utiliser, et parfois les usagers veulent simplement l'application la plus récente.

### GTFS peut probablement faire plus que vous ne le pensez

GTFS est surtout connu pour ses informations sur la planification des trajets, en particulier dans les zones métropolitaines dotées d'un service de lignes fixes. Cependant, il existe une variété de fonctionnalités optionnelles au-delà des spécifications de base de GTFS Schedule qui rendent GTFS plus largement applicable, y compris Fares pour montrer les coûts et les structures tarifaires, Flex (en développement) pour les options de transport à la demande, telles que les services de transport à la demande et les services de transport adapté, et Pathways pour afficher les informations d'accessibilité qui sont vitales pour les usagers utilisant des dispositifs de mobilité ou ayant besoin d'aménagements supplémentaires. GTFS Realtime s'appuie sur GTFS Schedule et sur les systèmes GPS embarqués pour fournir des mises à jour en temps réel sur la localisation des véhicules.

### GTFS est plus qu'une simple planification de voyage

Les donnéesGTFS sont désormais utilisées par un grand nombre d'applications logicielles à des fins diverses, notamment la visualisation des données et les outils d'analyse pour la planification. Le fait de disposer de données actualisées et de grande qualité permet de fournir des informations précises sur les transports en commun, non seulement aux usagers, mais aussi aux planificateurs et aux décideurs politiques, qui peuvent ainsi mieux comprendre comment les transports en commun sont utilisés au sein de leurs communautés. À partir de 2023, la Federal Transit Administration des États-Unis exigera que les [agences de transport soumettent des données GTFS valides](https://www.federalregister.gov/documents/2023/03/03/2023-04379/national-transit-database-reporting-changes-and-clarifications) avec leur rapport annuel sur la base de données nationale des transports en commun.

## Qu'est-ce qu'un GTFSFS de haute qualité ?

Le GTFS de haute qualité est complet, précis et à jour. Cela signifie qu'il représente le fonctionnement actuel des services et qu'il fournit autant d'informations que possible.

### Données complètes

Un GTFS de qualité comprend des détails importants sur les services, tels que les changements d'Schedule vacances et l'été, l'emplacement exact des arrêts, les noms des itinéraires et les panneaux de signalisation qui correspondent aux autres documents destinés aux usagers. Même si une agence travaille avec un fournisseur pour produire le GTFS, c'est en fin de compte à elle de s'assurer que les informations présentées sur papier, à bord et en ligne sont cohérentes.

Pour plus d'informations sur la création de données de haute qualité, consultez les [Lignes directrices relatives aux données sur les transports en commun en Californie](https://dot.ca.gov/cal-itp/california-transit-data-guidelines) et les [Meilleures pratiques GTFS](schedule/best-practices).

### Mise à jour

Avoir des données périmées est presque pire que de ne pas avoir de flux du tout. Il ne suffit pas de publier des informations, il faut qu'elles correspondent à ce que l'usager voit et expérimente. Certaines des plus grandes agences de transport mettent à jour leur GTFS toutes les semaines, voire tous les jours, mais la plupart des agences devront mettre à jour leur GTFS tous les quelques mois, ou plusieurs fois par an lorsque le service change. Il peut s'agir de nouvelles lignes ou de nouveaux arrêts, de changements d'horaires ou de mises à jour de la structure tarifaire.

De nombreuses agences font appel à un fournisseur pour créer et gérer leur GTFS. Certains fournisseurs peuvent être proactifs en s'informant des changements de service, mais il est important que les agences communiquent avec les fournisseurs sur les changements de service à venir. Il est possible de publier à l'avance des GTFS contenant des changements de service, afin que la transition se fasse en douceur pour tout le monde - agences, fournisseurs, planificateurs de trajets et usagers !

