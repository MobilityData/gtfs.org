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

[La proposition relative aux supports tarifaires (anciennement conteneurs tarifaires)](https://github.com/google/transit/pull/355#issuecomment-1468326858) a été adoptée officiellement dans la spécification !

Les réunions de travail de la Fares V2 vont maintenant se concentrer sur la [modélisation et l'adoption de tarifs variables dans le temps](https://github.com/google/transit/pull/357).

<a class="button no-icon" target="_blank" href="https://share.mobilitydata.org/slack">Rejoignez #gtfs-fares sur Slack</a> 
<a class="button no-icon" target="_blank" href="https://www.eventbrite.ca/e/specifications-discussions-gtfs-fares-v2-monthly-meetings-tickets-522966225057">Voir le programme des réunions</a>
<a class="button no-icon" target="_blank" href="https://docs.google.com/document/d/1d3g5bMXupdElCKrdv6rhFNN11mrQgEk-ibA7wdqVLTU/edit">Voir les notes des réunions</a>

## Premiers adoptants

🎉 Chapeau bas aux premiers adoptants de Fares v2 ! Au moins un producteur de données et un consommateur doivent s'engager à mettre en œuvre une fonctionnalité expérimentale avant qu'un vote public ne soit ouvert pour l'ajouter à la spécification officielle. Ces organisations investissent une grande quantité de temps et d'énergie dans les changements expérimentaux pour s'assurer que GTFS continue à évoluer.

Pour l'implémentation de base adoptée, les premiers adoptants étaient

- Producteurs : [Interline](https://www.interline.io/), [Maryland Department of Transportation](https://www.mta.maryland.gov/developer-resources), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consommateur : [Transit](https://transitapp.com/)

Pour la fonctionnalité de fare media actuellement en discussion, les premiers adoptants sont

- Producteur : [Interline](https://www.interline.io/), [Cal-ITP](https://dot.ca.gov/cal-itp/cal-itp-gtfs)
- Consommateur : [Apple](https://www.apple.com/)

## Suivi des adoptions
### Actuel

<iframe class="airtable-embed" src="https://airtable.com/embed/shrZzYzPYao7iExlW?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shr8aT0K9bpncmy0V" target="_blank">Demande de modification</a><a class="button no-icon" href="https://airtable.com/shr5B6Pl1r9KH9qMX" target="_blank">Ajoutez votre organisation (consommateurs)</a><a class="button no-icon" href="https://airtable.com/shrn0Afa3TPNkOAEh" target="_blank">Ajouter votre organisation (producteurs)</a>

### L'avenir
<iframe class="airtable-embed" src="https://airtable.com/embed/shrUrgZTO1noUF66R?backgroundColor=red&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>

<a class="button no-icon" href="https://airtable.com/shrvnI40zuFXmDsQI" target="_blank">Ajoutez vos projets d'avenir</a>

## Fonctionnalités Fares v2 en cours de discussion

<iframe src="https://portal.productboard.com/rhk8dbtic1iqakfznucry448" frameborder="0" width="100%", style="min-height:1060px"></iframe>

## Historique

- **2017**: Recherche industrielle et modélisation des données
- **Octobre 2021**: [Rédaction et partage de l'implémentation de base](https://github.com/google/transit/pull/286#issue-1026848880)
- **Décembre 2021**: [Vote ouvert #1 → n'a pas été adopté](https://github.com/google/transit/pull/286#issuecomment-990258396)
- **Mars 2022**: [Vote ouvert #2 → n'a pas été adopté](https://github.com/google/transit/pull/286#issuecomment-1080716109) 
- **Mai 2022**: [Vote ouvert #3 → adopté](https://github.com/google/transit/pull/286#issuecomment-1121392932)
- **Août 2022**: [Début de la discussion communautaire sur la prochaine phase de Fares v2](https://github.com/google/transit/issues/341).
- **Novembre 2022**: <a href="https://github.com/google/transit/pull/355" target="_blank">Ouverture d'une demande de pull request pour le projet Fare media</a>
- **Décembre 2022**: [La communauté identifie l'ordre de classement des fonctionnalités de la pile pour prioriser les itérations](https://github.com/google/transit/issues/341#issuecomment-1339947915).
- **Mars 2023**: <a href="https://github.com/google/transit/pull/355#issuecomment-1468326858" target="_blank">Le vote sur les médias tarifaires est adopté</a>