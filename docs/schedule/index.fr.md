# Aperçu du GTFS Schedule

<div class="landing-page">
   <a class="button" href="reference">Référence</a>
   <a class="button" href="best-practices">Meilleures pratiques</a>
   <a class="button" href="examples">Exemples</a>
   <a class="button" href="changes">Changements</a>
</div>

## Mise en route

Un flux GTFS, qui contient des informations statiques sur les transports en commun, est composé d'un certain nombre de fichiers texte (.txt) contenus dans un seul fichier ZIP. Chaque fichier décrit un aspect particulier de l'information sur le transport en commun : arrêts, itinéraires, trajets, tarifs, etc. Pour plus d'informations sur chaque fichier, consultez la référence GTFS.

Pour créer un flux GTFS, suivez les étapes ci-dessous.

1. Créez tous les fichiers obligatoires décrits dans la référence [GTFS Schedule](reference) Schedule. Créer les fichiers optionnels si leur fonctionnalité est souhaitée.
1. Enregistrez tous les fichiers au format .txt. Les valeurs des champs devraient être délimitées par des virgules et chaque ligne devrait se terminer par un saut de ligne. Voir la référence GTFS pour des informations détaillées sur le contenu des fichiers.
1. Zippez tous les fichiers texte ensemble. Le fichier zippé comprend une version du flux.
1. Publiez le flux en utilisant l'une des options ci-dessous.

## Mise à disposition publique d'un flux de transit

<hr/>

Les ensembles de données devraient être publiés à une URL publique et permanente, incluant le nom du fichier zip. (par exemple, www.agency.org/gtfs/gtfs.zip). Idéalement, l'URL devrait être directement téléchargeable sans nécessiter de connexion pour accéder au fichier, afin de faciliter le téléchargement par les applications logicielles consommatrices. Bien qu'il soit recommandé (et la pratique la plus courante) de rendre un jeu de données GTFS librement téléchargeable, si un fournisseur de données doit contrôler l'accès à GTFS pour des raisons de licence ou autres, il est recommandé de contrôler l'accès au jeu de données GTFS en utilisant des clés API, ce qui facilitera les téléchargements automatiques.

Le serveur web qui héberge les données GTFS devrait être configuré pour signaler correctement la date de modification du fichier (voir HTTP/1.1 - Request for Comments 2616, sous la section 14.29).

Voir "[Meilleures pratiques : Publication de jeux de données](best-practices/#dataset-publishing-general-practices)" pour d'autres recommandations.

## Formation

<hr/>

L'Open Learning Campus (OLC) de la Banque mondiale propose un cours en ligne autodidacte intitulé “[Introduction to the General Transit Feed Specification (GTFS) and Informal Transit System Mapping](https://olc.worldbank.org/content/introduction-general-transit-feed-specification-gtfs-and-informal-transit-system-mapping)”. Ce cours comprend les sections suivantes :

* Qu'est-ce que GTFS? Historique et structure du fichier
* Qu'est-ce que le GTFS? Visualisation et communauté
* Configuration d'un flux GTFS
* Introduction à GitHub et aux outils Open Source
* Histoires du terrain
* Comment cartographier les données sur les transports en commun
* Comment collecter des données pour le premier flux d'une ville ?
* Enquête sur les applications
* GTFS-Realtime

Voir plus de [cours en ligne](../resources/other/#on-line-courses).

## Obtenir de l'aide et la communauté

<hr/>

### Listes de diffusion

Il existe un certain nombre de listes de diffusion qui peuvent être de bonnes ressources lorsque vous avez des questions sur les données du transport public, les logiciels, les formats comme GTFS et GTFS, et d'autres sujets :

* [GTFS Changes](https://groups.google.com/group/gtfs-changes) : discussion de la proposition d'extension de la spécification GTFS.
* [MobilityData Slack](https://mobilitydata-io.slack.com/) : Une "organisation" Slack avec des canaux consacrés aux thèmes du GTFS. [Demandez une invitation à mobilitydata-io.slack.com ici](https://share.mobilitydata.org/slack).
* [Transit Developers](https://groups.google.com/group/transit-developers): discussions générales sur les développeurs de transport en commun. De nombreuses agences de transport ont également leurs propres listes de diffusion spécifiques aux développeurs. Par exemple :
    * [NYC MTA](https://groups.google.com/group/mtadeveloperresources)
    * [Portland, OR](https://groups.google.com/group/transit-developers-pdx)
    * [BART - San Francisco, CA](https://groups.google.com/group/bart-developers)
    * [MassDOT](https://groups.google.com/group/massdotdevelopers)
    * [Région d'Atlanta, GA](https://groups.google.com/forum/#!forum/atl-transit-developers)
    * [511 Ressources pour les développeurs de la région de la baie de San Francisco](https://groups.google.com/forum/#!forum/511sfbaydeveloperresources)
* Vérifiez auprès de votre agence de transport locale si elle dispose de sa propre liste de diffusion.

Voir d'autres [ressources communautaires](../resources/community).
