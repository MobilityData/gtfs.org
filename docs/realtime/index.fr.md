# Aperçu du GTFS Realtime

<div class=landing-page>
    <a class=button href=reference>Référence</a>
    <a class=button href=best-practices>Meilleures pratiques</a>
    <a class=button href=feed-examples>Exemples</a>
    <a class=button href=changes>Changements</a>
</div>

## Mise en route

Fournir aux usagers des données actualisées en temps réel sur les transports en commun améliore considérablement leur expérience de vos services de transport. Fournir des informations actualisées sur les heures d'arrivée et de départ actuelles permet aux usagers de planifier leurs déplacements en douceur. Ainsi, en cas de retard malencontreux, un usager sera soulagé de savoir qu'il peut rester chez lui un peu plus longtemps.

GTFS Realtime est une spécification de flux qui permet aux agences de transport public de fournir des mises à jour en temps réel de leur flotte aux développeurs d'applications. Il s'agit d'une extension de [GTFS](../schedule/reference) (General Transit Feed Specification), un format de données ouvert pour les horaires des transports publics et les informations géographiques associées. GTFS Realtime a été conçu pour faciliter la mise en œuvre, assurer une bonne interopérabilité avec GTFS et mettre l'accent sur l'information des passagers.

La spécification a été conçue grâce à un partenariat entre les agences partenaires initiales de [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), un certain nombre de développeurs de transport en commun et Google. La spécification est publiée sous la [Licence Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

## Comment commencer ?

1.  Continuez à lire l'aperçu ci-dessous.
2.  Décidez quelles [entités de flux](feed-entities) vous allez fournir.
3.  Jetez un coup d'oeil à [exemples de flux](feed-examples).
4.  Créez vos propres flux en utilisant la [référence](reference).
5.  [Publiez votre flux](best-practices/#feed-publishing-general-practices).

## Aperçu des flux GTFS Realtime

La spécification supporte actuellement les types d'informations suivants :

* **Mises à jour des trajets** - retards, annulations, itinéraires modifiés.
* **Alertes de service** - arrêts déplacés, événements imprévus affectant une station, un itinéraire ou l'ensemble du réseau.
* **Positions des véhicules** - informations sur les véhicules, notamment leur emplacement et le niveau de congestion.

Un flux peut, mais ne doit pas nécessairement, combiner des entités de différents types. Les flux sont servis via HTTP et mis à jour fréquemment. Le fichier lui-même est un fichier binaire ordinaire, de sorte que tout type de serveur web peut héberger et servir le fichier (d'autres protocoles de transfert peuvent également être utilisés). Il est également possible d'utiliser des serveurs d'applications Web qui, en réponse à une demande GET HTTP valide, renverront le flux. Il n'y a pas de contraintes sur la fréquence ni sur la méthode exacte de mise à jour ou de récupération du flux.

Étant donné que GTFS Realtime vous permet de présenter le statut _réel_ de votre flotte, le flux doit être mis à jour régulièrement, de préférence à chaque fois que de nouvelles données sont reçues de votre système de localisation automatique des véhicules.

[En savoir plus sur les entités de flux...](feed-entities)

## Format des données

Le format d'échange de données en GTFS Realtime est basé sur des [tampons de protocole](https://developers.google.com/protocol-buffers/).

Les tampons de protocole sont un mécanisme indépendant du langage et de la plate-forme pour sérialiser des données structurées (pensez à XML, mais en plus petit, plus rapide et plus simple). La structure des données est définie dans un fichier [gtfs-realtime.proto](proto), qui est ensuite utilisé pour générer du code source afin de lire et d'écrire facilement vos données structurées à partir de et vers une variété de flux de données, en utilisant une variété de langages - par exemple Java, C++ ou Python.

[En savoir plus sur les tampons de protocole...](https://developers.google.com/protocol-buffers/).

## Structure des données

La hiérarchie des éléments et leurs définitions de type sont spécifiées dans le fichier [gtfs-realtime.proto](proto).

Ce fichier texte est utilisé pour générer les bibliothèques nécessaires dans le langage de programmation de votre choix. Ces bibliothèques fournissent les classes et les fonctions nécessaires pour générer des flux GTFS Realtime valides. Non seulement les bibliothèques facilitent la création de flux, mais elles garantissent également que seuls des flux valides sont produits.

[En savoir plus sur la structure de données...](reference)

## Obtenir de l'aide

Pour participer aux discussions sur GTFS Realtime et suggérer des modifications et des ajouts à la spécification, rejoignez la [liste de diffusion GTFS Realtime](https://groups.google.com/group/gtfs-realtime) et suivez les conversations sur le [dépôt GitHub google/transit](https://github.com/google/transit).

## Google Maps et les mises à jour en direct des transports en commun

L'une des applications possibles de GTFS Realtime est [Live Transit Updates](https://developers.google.com/transit/google-transit#LiveTransitUpdates), une fonctionnalité de Google Maps qui fournit aux utilisateurs des informations sur les transports en commun en temps réel. Si vous travaillez pour une agence de transport public qui souhaite fournir des mises à jour en temps réel à Google Maps, veuillez consulter la [Page des partenaires de Google Transit](https://maps.google.com/help/maps/transit/partners/live-updates.html).
