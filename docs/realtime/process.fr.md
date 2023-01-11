# Ajout de nouveaux champs à GTFS Realtime

Lorsqu'un producteur ou un consommateur souhaite ajouter un nouveau champ à la spécification GTFS Realtime, il doit ouvrir une nouvelle question sur le [dépôt GitHub GTFS Realtime](https://github.com/google/transit) décrivant le champ proposé et annoncer ce nouveau champ (y compris un lien vers la question) sur la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime).

## Processus de modification de la spécification

1. Créer une branche git avec la mise à jour de toutes les parties pertinentes des fichiers de définition, de spécification et de documentation du protocole (à l'exception des traductions).
1. Créer une demande de retrait sur [https://github.com/google/transit.](https://github.com/google/transit) La demande de retrait ne doit pas contenir une description détaillée du correctif. Le créateur de la demande de retrait devient l'*avocat*.
1. Une fois la pull request enregistrée, elle doit être annoncée par son défenseur dans la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). Une fois annoncée, la pull request est considérée comme une proposition.
   - Comme le défenseur est un contributeur, il doit signer l'[accord de licence de contributeur](https://github.com/google/transit/blob/master/CONTRIBUTING.md) avant que la demande ne soit acceptée.
1. La discussion de la proposition suit. Les commentaires de la demande de tirage devraient être utilisés comme seul forum de discussion.
   - La discussion dure aussi longtemps que le défenseur le juge nécessaire, mais doit être au moins de 7 jours civils.
   - L'avocat est responsable de la mise à jour en temps voulu de la proposition (c'est-à-dire de la pull request) sur la base des commentaires qu'il accepte.
   - À tout moment time le défenseur peut déclarer la proposition abandonnée.
1. L'avocat peut demander un vote sur une version de la proposition à tout moment après l'intervalle initial de 7 jours requis pour la discussion.
   - Avant de demander un vote, au moins un producteur de temps réel GTFS et un consommateur de temps réel GTFS doivent mettre en œuvre le changement proposé. On s'attend à ce que le(s) producteur(s) de temps réel GTFS inclue(nt) le changement dans un flux de temps réel GTFS public et fournisse(nt) un lien vers ces données dans les commentaires de la demande de tirage, et que le(s) consommateur(s) de temps réel GTFS fournisse(nt) un lien dans les commentaires de la demande de tirage vers une application qui utilise le changement d'une manière non triviale (c'est-à-dire qu'elle prend en charge une fonctionnalité nouvelle ou améliorée).
   - Lorsqu'il demande un vote, le défenseur doit clairement indiquer si le vote porte sur l'adoption officielle du champ dans la spécification ou sur un champ expérimental.
1. Le vote dure la période minimale suffisante pour couvrir 7 jours calendaires complets et 5 jours ouvrables suisses complets. Le vote se termine à 23:59:59 UTC.
   - Le défenseur doit annoncer l'heure de fin spécifique au début du vote.
   - Pendant la période de vote, seules les modifications rédactionnelles de la proposition sont autorisées (fautes de frappe, changement de formulation tant que cela ne change pas le sens).
   - Tout le monde est autorisé à voter oui/non sous forme de commentaire à la pull request, et les votes peuvent être modifiés jusqu'à la fin de la période de vote.
   Si un votant change son vote, il est recommandé de le faire en mettant à jour le commentaire du vote original en biffant le vote et en écrivant le nouveau vote.
   - Les votes effectués avant le début de la période de vote ne sont pas pris en compte.
1. La proposition est acceptée s'il y a un consensus unanime de oui avec au moins 3 votes.
   - Le vote du proposant ne compte pas dans le total des 3 votes. Par exemple, si le proposant X crée une pull request et vote oui, et que les utilisateurs Y et Z votent oui, cela compte pour un total de 2 votes oui.
   - Les votes contre doivent être motivés et, idéalement, fournir un retour d'information exploitable.
   - Si le vote a échoué, l'avocat peut choisir de continuer à travailler sur la proposition ou de l'abandonner.
   L'une ou l'autre décision de l'avocat doit être annoncée dans la liste de diffusion.
   - Si le défenseur continue à travailler sur la proposition, un nouveau vote peut être demandé à tout moment.
1. Toute demande de retrait demeurant inactive pendant 30 jours civils sera fermée. Lorsqu'une demande de retrait est fermée, la proposition correspondante est considérée comme abandonnée. Le défenseur peut rouvrir la demande à tout moment s'il souhaite poursuivre ou maintenir la conversation.
   - Notez que le défenseur peut choisir d'implémenter la fonctionnalité en tant qu'[extension personnalisée](#extensions) au lieu de faire partie de la spécification officielle.
1. Si la proposition est acceptée :
   - Google s'engage à fusionner la version votée de la demande de retrait (à condition que les contributeurs aient signé la [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)) et à exécuter la demande de retrait dans les 5 jours ouvrables.
   - Google s'engage à mettre à jour le dépôt <https://github.com/google/gtfs-realtime-bindings> en temps voulu. Les commits vers gtfs-realtime-bindigs qui sont le résultat d'une proposition, doivent faire référence à la pull request de la proposition.
   - Les traductions ne doivent pas être incluses dans la pull request originale.
   Google est responsable de la mise à jour éventuelle des traductions pertinentes dans les langues prises en charge, mais les demandes de traduction pure de la communauté sont les bienvenues et seront acceptées dès que tous les commentaires éditoriaux auront été traités.

## Domaines*expérimentaux*

1. Si la communauté parvient à un consensus (a) sur le fait que le champ proposé semble utile et (b) sur le type de champ`(optional` ou `repeated`, `string` ou `int` ou `bool`), un numéro de champ sera attribué dans le message GTFS Realtime et il sera indiqué dans le [fichier .proto](../proto) et dans la documentation qu'il s'agit d'un champ *expérimental* susceptible de changer à l'avenir.
   - Le consensus est atteint par le biais d'un processus de discussion et de vote qui est le même que le [processus de modification des spécifications](#specification-amendment-process) ci-dessous, mais au lieu d'un consentement unanime, seuls 80 % de votes positifs sont requis pour l'approbation.
   - Les producteurs et les consommateurs GTFS Realtime qui souhaitent utiliser le nouveau champ *expérimental* devront générer à nouveau leur bibliothèque en utilisant le fichier .proto avec le nouveau champ (par exemple, Google mettra à jour la [bibliothèque gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)), et commencer à remplir et à analyser le champ avec des données réelles.
   - Une fois que nous sommes convaincus que le champ *expérimental* est valable et que les producteurs et les consommateurs l'utilisent, nous suivrons le [processus de modification de la spécification](#specification-amendment-process) ci-dessous pour ajouter officiellement le champ à la spécification.
   - Si le champ *expérimental* n'est pas adopté via le [processus de modification des spécifications](#specification-amendment-process) dans les deux ans suivant son approbation en tant que champ *expérimental*, il sera déprécié en ajoutant `[deprecated=true]` à côté de la valeur du champ dans le [fichier .proto](../proto). En utilisant `[deprecated=true]` (au lieu de `RESERVED`), les producteurs et les consommateurs qui ont déjà adopté le champ ne doivent pas le supprimer. En outre, le champ peut être "déprécié" à l'avenir s'il est approuvé lors d'un vote ultérieur suivant le [processus de modification des spécifications](#specification-amendment-process) (par exemple, lorsque d'autres producteurs et/ou consommateurs commencent à utiliser le champ).
1. Si le nouveau champ est considéré comme spécifique à un seul producteur ou si le type de données est contesté, nous attribuerons une [extension personnalisée](../extensions) au producteur afin qu'il puisse utiliser le champ dans son propre flux. Dans la mesure du possible, nous devons éviter les extensions et ajouter les champs utiles à de nombreuses agences à la spécification principale afin d'éviter la fragmentation et le travail supplémentaire pour les consommateurs afin de prendre en charge diverses extensions de la spécification.

## Principes directeurs

Afin de préserver la vision originale de GTFS Realtime, un certain nombre de principes directeurs ont été établis pour être pris en considération lors de l'extension de la spécification :

<br/>**Les flux doivent être efficaces à produire et à consommer en temps réel.**

L'information en temps réel est un flux continu et dynamique de données qui nécessite nécessairement un traitement efficace. Nous avons choisi les Protocol Buffers comme base de la spécification car ils offrent un bon compromis en termes de facilité d'utilisation pour les développeurs et en termes d'efficacité pour la transmission des données. Contrairement à GTFS, nous n'imaginons pas que de nombreuses agences modifieront à la main les flux GTFS Realtime. Le choix des tampons de protocole reflète la conclusion que la plupart des flux GTFS Realtime seront produits et consommés de manière programmatique.

<br/>**La spécification concerne les informations sur les passagers.**

Comme GTFS avant lui, GTFS Realtime est principalement concerné par l'information des passagers. En d'autres termes, la spécification doit inclure des informations qui peuvent aider à alimenter les outils des usagers, avant tout. Il existe potentiellement une grande quantité d'informations orientées vers les opérations que les agences de transport peuvent vouloir transmettre en interne entre les systèmes. GTFS Realtime n'est pas destiné à cette fin et il existe potentiellement d'autres normes de données orientées opérations qui pourraient être plus appropriées.

<br/>**Les modifications apportées à la spécification doivent être rétrocompatibles.**

Lorsque nous ajoutons des fonctionnalités à la spécification, nous voulons éviter de faire des changements qui rendront les flux existants invalides. Nous ne voulons pas créer plus de travail pour les éditeurs de flux existants jusqu'à ce qu'ils souhaitent ajouter des fonctionnalités à leurs flux. De plus, dans la mesure du possible, nous voulons que les analyseurs existants puissent continuer à lire les anciennes parties des flux plus récents. Les conventions pour l'extension des tampons de protocole renforceront la compatibilité ascendante dans une certaine mesure. Cependant, nous souhaitons éviter les modifications sémantiques des champs existants qui pourraient également rompre la rétrocompatibilité.

<br/>**Les fonctionnalités spéculatives sont découragées.**

Chaque nouvelle fonctionnalité ajoute de la complexité à la création et à la lecture des flux. Par conséquent, nous voulons prendre soin de n'ajouter que des fonctionnalités dont nous savons qu'elles sont utiles. Idéalement, toute proposition aura été testée en générant des données pour un système de transport réel qui utilise la nouvelle fonctionnalité et en écrivant un logiciel pour les lire et les afficher.

## Historique des révisions

**12 mars 2020**

- Mise à jour de la description de `TripDescriptor` sur la page de référence de GTFS Realtime.

**26 février 2015**

- Ajout du champ expérimental `direction_id` au `TripDescriptor`[(discussion](https://groups.google.com/d/msg/gtfs-realtime/b8N2GGd2TBs/0fJ1IOMTjJ0J)).

**30 janvier 2015**

- Ajout d'un espace de nom d'extension Protocol Buffer à tous les messages GTFS-realtime restants qui n'en avaient pas déjà un (comme `FeedMessage` et `FeedEntity`).

**28 janvier 2015**

- Ajout du champ expérimental `delay` à `TripUpdate`[(discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/NsTIRQdMNN8)).

**16 janvier 2015**

- Mise à jour de la description de `TripDescriptor.start_time`.

**8 Janvier 2015**

- Définition de l'enum expérimental `OccupancyStatus`.
- Ajout du champ expérimental `occupancy_status` à `VehiclePosition (`[discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/\_HtNTGp5LxM)).

**22 mai 2014**

- Mise à jour de la description de l'enum `ScheduleRelationship` dans le message `StopTimeUpdate` ([discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)).
- Suppression de REPLACEMENT des valeurs de l'enum `ScheduleRelationship` dans le message `TripDescriptor (`[discussion](https://groups.google.com/forum/#!topic/gtfs-realtime/77c3WZrGBnI)).

**12 oct. 2012**

- Ajout du champ timestamp au message `TripUpdate`.

**30 mai 2012**

- Ajouté des détails spécifiques sur les Extensions à la spécification.

**30 novembre 2011**

- Ajout d'un espace de nom d'extension Protocol Buffer aux messages clés GTFS-realtime pour faciliter l'écriture d'extensions à la spécification.

**25 octobre 2011**

- Mise à jour de la documentation pour préciser que l'`alerte`, le `header_text` et le `description_text` sont tous deux des valeurs en texte brut.

**20 août 2011**

- Mise à jour de la documentation pour clarifier la sémantique du message `TimeRange`.

**22 août 2011**

- Version initiale.
