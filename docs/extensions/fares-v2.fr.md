<a class="pencil-link" href="https://github.com/MobilityData/gtfs.org/edit/main/docs/extensions/fare-extension.md" title="Edit this page" target="_blank">
    <svg class="pencil" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10 20H6V4h7v5h5v3.1l2-2V8l-6-6H6c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h4v-2m10.2-7c.1 0 .3.1.4.2l1.3 1.3c.2.2.2.6 0 .8l-1 1-2.1-2.1 1-1c.1-.1.2-.2.4-.2m0 3.9L14.1 23H12v-2.1l6.1-6.1 2.1 2.1Z"></path></svg>
  </a>

# GTFS-Fares v2

Fares v2 est un projet d'extension du calendrier GTFS qui vise à remédier aux limitations de [Fares v1](/schedule/examples/fares-v1).

Les principaux concepts que Fares v2 prévoit de représenter sont les suivants

- Produits tarifaires (par exemple, les billets et les laissez-passer)
- Catégories d'usagers (par exemple, les personnes âgées et les enfants)
- Options de paiement des tarifs (par ex. carte bancaire et carte de crédit)
- le plafonnement des tarifs.

Ces concepts permettront aux producteurs de données de modéliser les tarifs par zone, en fonction de l'heure et entre agences. Ce projet d'extension est adopté par itérations.

Actuellement, l'implémentation de base adoptée de Fares v2 fonctionne pour les cas d'utilisation suivants :

- Définition d'un tarif de transport en commun
- Décrire les lieux de service dans la même zone tarifaire
- Création de règles pour les trajets simples
- Création de règles pour les transferts

Vous pouvez voir [ici des exemples](/schedule/examples/fares-v2) qui montrent ce qui peut être modélisé en utilisant l'implémentation de base adoptée de Fares v2.

Les producteurs peuvent mettre en œuvre Fares v2 dans le même ensemble de données que Fares v1, puisqu'il n'y a pas de conflit technique entre les deux. Les consommateurs peuvent choisir la version à utiliser indépendamment de l'autre. Avec l'adoption et l'approbation suffisante de Fares v2, Fares v1 peut être déprécié à l'avenir.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/gtfs-fares-v2">Voir la proposition complète</a>

## Travail en cours sur Fares v2

La communauté GTFS travaille actuellement à la finalisation de la proposition de [conteneurs tarifaires](https://share.mobilitydata.org/fare-containers-to-fare-payment-types-proposal).

Les points actuellement en discussion incluent :

- La création d'un fichier de conteneurs tarifaires
- Alignement sur les types qui devraient être inclus dans l'énumération des options de conteneurs tarifaires.

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Rejoignez #gtfs-fares sur Slack</a> 
<a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">Voir le programme des réunions</a>
<a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">Voir les notes des réunions</a>

## Premiers adoptants

🎉 Chapeau bas aux premiers adoptants de Fares v2 ! Au moins un producteur de données et un consommateur doivent s'engager à mettre en œuvre une fonctionnalité expérimentale avant qu'un vote public ne soit ouvert pour l'ajouter à la spécification officielle. Ces organisations investissent une grande quantité de temps et d'énergie dans les changements expérimentaux pour s'assurer que GTFS continue à évoluer.

Pour l'implémentation de base adoptée, les premiers adoptants étaient

- Producteurs : [Interline](https://www.interline.io/), [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consommateur : [Transit](https://transitapp.com/)

Pour la fonctionnalité de conteneurs tarifaires actuellement en discussion, les premiers adoptants sont

- Producteur : [Interline](https://www.interline.io/)
- Consommateur : [Apple](https://www.apple.com/), [Transit](https://transitapp.com/)

<a class="button no-icon" target="_blank" href="https://docs.google.com/spreadsheets/d/1jpKjz6MbCD2XPhmIP11EDi-P2jMh7x2k-oHS-pLf2vI/edit?usp=sharing">Voir qui utilise les fichiers et les champs de Fares v2</a>

## Fonctionnalités Fares v2 en cours de discussion

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## Historique

- **2017**: Recherche industrielle et modélisation des données
- **Octobre 2021**: [Rédaction et partage de l'implémentation de base](https://github.com/google/transit/pull/286#issue-1026848880)
- **Décembre 2021**: [Vote ouvert #1 → n'a pas été adopté](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Mars 2022**: [Vote ouvert #2 → n'a pas été adopté](https://github.com/google/transit/pull/286#issuecomment-1080716109) 
- **Mai 2022**: [Vote ouvert #3 → adopté](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **Août 2022**: [Début de la discussion communautaire sur la prochaine phase de Fares v2](https://github.com/google/transit/issues/341).
- **Décembre 2022**: [la communauté identifie l'ordre de classement des fonctionnalités de la pile pour prioriser les itérations](https://github.com/google/transit/issues/341#issuecomment-1339947915).
