# Fares V2

<hr/>

Fares V2 est un projet d'extension du GTFS qui vise à remédier aux limites de Fares V1. Ce projet d'extension est adopté par itérations. Les exemples ci-dessous montrent comment modéliser les concepts de base, y compris les produits tarifaires et la façon dont les usagers peuvent utiliser leur tarif pour les correspondances. Pour plus d'informations sur le [projet d'extension de Fares V2, cliquez ici](/extensions/fares-v2/).

Dans l'intervalle, les producteurs peuvent mettre en œuvre Fares V2 parallèlement à Fares V1 dans le même ensemble de données, car il n'y a pas de conflit technique entre les deux. Les consommateurs auront le choix de la mise en œuvre à utiliser indépendamment de l'autre. Les consommateurs auront le choix de l'implémentation à consommer indépendamment de l'autre. Avec l'adoption et l'approbation suffisante de Fares V2, Fares V1 peut être déprécié dans le futur.

## Définir un tarif de transport en commun

Il y a plusieurs façons de payer les tarifs pour utiliser le système de la Maryland Transit Administration. [Il existe quatre types d'options tarifaires: le tarif normal complet:](https://www.mta.maryland.gov/regular-fares)

- Billet aller simple coûtant 2,00 USD
- Carte journalière au prix de 4,60 USD
- Un abonnement hebdomadaire qui coûte 22 USD
- Une carte mensuelle qui coûte 77 USD

Les billets de transport en commun ou les tarifs sont appelés produits tarifaires dans GTFS. Ils peuvent être décrits dans le fichier [fare_products.txt](../../reference/#fare_productstxt) Chaque entrée correspond à un tarif spécifique.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id        | fare_product_name                  | amount | currency |
| ---------------------- | ------------------------------- |--------|----------|
| core_local_oneway_fare | One Way Full Fare         | 2.00   | USD      |
| core_local_1_day_fare  | 1-Day Pass - Core Service   | 4.60   | USD      |
| core_local_31_day_fare | 31-Day Pass - Core Service | 77.00  | USD      |
| core_local_7_day_fare  | 7-Day Pass - Core Service  | 22.00  | USD      |

<sup>[Télécharger le flux GTFS des bus locaux de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Créer des règles pour les trajets à trajet unique

Dans le GTFS, un tronçon tarifaire correspond à un voyage qu'un usager effectue sans transfert entre différents modes, itinéraires, réseaux ou agences. Dans le flux de la Maryland Transit Administration, un tarif unique permet aux usagers de voyager à l'intérieur de n'importe quelle paire d'arrêts et de stations de métro au sein du réseau `core` des bus BaltimoreLink, Light RailLink et Metro SubwayLink.

Les groupes d'étapes définissent les trajets au sein d'un réseau d'une origine à une destination (ou d'un ensemble d'origines à un ensemble de destinations si les identifiants de zone correspondent à des arrêts groupés). Le fichier ci-dessous décrit les règles pour voyager n'importe où dans le réseau principal de la Maryland Transit Administration. Chaque règle correspond à l'un des produits tarifaires réguliers de l'[exemple Définir un tarif de transport en commun](#definir-un-tarif-de-transport-en-commun).

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id            | network_id | fare_product_id        |
| ----------------------- | ---------- | ---------------------- |
| core_local_one_way_trip | core       | core_local_oneway_fare |
| core_local_one_way_trip | core       | core_local_1_day_fare  |
| core_local_one_way_trip | core       | core_local_31_day_fare |
| core_local_one_way_trip | core       | core_local_7_day_fare  |

<sup>[Télécharger le flux GTFS des bus locaux de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

<hr/>

## Créer des règles pour les transferts

Les usagers qui achètent un aller simple pour prendre les bus locaux BaltimoreLink, Metro SubwayLink ou Light RailLink bénéficient d'un transfert de 90 minutes. Cela signifie qu'ils peuvent effectuer un nombre illimité de transferts entre les bus locaux, le métro et le métro léger dans un délai de 90 minutes.

[**fare_transfer_rules.txt**](../../reference/#fare_transfer_rulestxt)

| from_leg_group_id       | to_leg_group_id         | duration_limit | duration_limit_type | fare_transfer_type | transfer_count |
| ----------------------- | ----------------------- | -------------- | ------------------- | -------------------------- | -------------- |
| core_local_one_way_trip | core_local_one_way_trip | 5400           | 1                   | 0                          | -1             |

Le fichier ci-dessus représente cela en GTFS avec les champs suivants :

- Un transfert est possible vers et depuis les étapes qui sont un voyage aller simple`(core_local_one_way_trip`).
- Le `transfer_count` est fixé à `-1` car il n'y a pas de limite au nombre de transferts autorisés.
- La `duration_limit` est fixée à `5400` secondes, ce qui équivaut à 90 minutes.
- Le `duration_limit_type` est fixé à `1` puisque le temps de transfert commence lorsque le voyageur part sur n'importe quel itinéraire du segment tarifaire `core_local_one_way_trip` et se termine lorsqu'il part sur un autre segment tarifaire.
- Le `fare_transfer_type` est fixé à `0` car les usagers ne paient que le premier tarif. Il n'y a pas de frais de transfert ni de deuxième tarif pour un transfert dans la fenêtre de 90 minutes. Par conséquent, le coût peut être modélisé comme la somme du premier tarif et la somme des frais de transfert.
- Le `transfer_count` transferts est fixé à `-1` car l'usager peut effectuer un nombre illimité de transferts dans la fenêtre de `duration_limit` 90 minutes.

Après avoir défini le tarif, créé la `fare_leg_rule` appropriée et défini la `fare_transfer_rule,` vous pouvez voir le `core_local_oneway_fare` 2,00 USD apparaître dans les planificateurs de trajets. Voici un exemple de Transit :

<div class="flex-photos">
    <img src="../../../assets/transit-fares-mdot.png" alt="fare of $2 USD">
</img></div>

<sup>[Télécharger le flux GTFS des bus locaux de la Maryland Transit Administration](https://feeds.mta.maryland.gov/gtfs/local-bus)</sup>

## Décrire les lieux de service dans la même zone tarifaire.

Certaines agences de transport en commun utilisent une structure tarifaire basée sur des zones. Les zones tarifaires sont des zones géographiques divisées associées à des tarifs différents. Dans le système BART de la Bay Area, les tarifs varient en fonction de l'origine et de la destination [(BART fare differences)](https://www.bart.gov/sites/default/files/docs/BART%20Clipper%20Fares%20Triangle%20Chart%20July%202022.pdf), et les usagers doivent connaître le bon tarif. Les zones tarifaires peuvent être décrites à l'aide du fichier [stops_areas.t](../../reference/#stops_areastxt) xt, qui affecte les arrêts du [stops.txt](../../reference/#stopstxt) aux fichiers [areas.txt](../../reference/#areastxt).

Tout d'abord, identifiez la zone dans le fichier [areas.txt](../../reference/#areastxt). Il est acceptable de laisser `area_name` vide s'il n'y a pas de nom de zone. Dans le tableau ci-dessous, il y a trois `area_id` - `ASHB`, `GLEN` et `OAKL`.

[**areas.txt**](../../reference/#areastxt)

| area_id | nom_zone |
| ------- | -------- |
| ASHB    |          |
| GLEN    |          |
| OAKL    |          |

Ensuite, à l'aide de l'`stop_id` du fichier [stops.txt](../../reference/#stopstxt), les arrêts sont regroupés dans la zone identifiée respective (zone tarifaire).

Ensuite, regroupez les `stop_id` avec chaque `area_id`. Dans l'exemple de BART, chaque zone ne contient qu'un seul `stop_id`. Par exemple, seul l'arrêt `ASHB` (Ashby Station) est inclus dans la zone `ASHB`. Cependant, si une zone comprend plusieurs arrêts, plusieurs `stop_id` devraient être listés.

[**stops_areas.txt**](../../reference/#stops_areastxt)

| area_id | stop_id |
| ------- | ------- |
| ASHB    | ASHB    |
| GLEN    | GLEN    |
| OAKL    | OAKL    |

Dans le fichier `fare_leg_rules.txt`, différents produits tarifaires peuvent être identifiés en fonction des différentes zones de départ et d'arrivée. Par exemple, la première entrée indique :

- La zone de départ est `ASHB`
- La zone d'arrivée est `GLEN`
- Le produit tarifaire pour la zone de départ/arrivée est `BA:matrix:ASHB-GLEN`

[**fare_leg_rules.txt**](../../reference/#fare_leg_rulestxt)

| leg_group_id | from_area_id | to_area_id | fare_product_id     |
| ------------ | ------------ | ---------- |---------------------|
| BA           | ASHB         | GLEN       | BA:matrix:ASHB-GLEN |
| BA           | ASKB         | OAKL       | BA:matrix:ASHB-OAKL |

Le tarif est identifié dans `fare_products.txt`.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id     | fare_product_name | amount | currency |
|---------------------| -------------- |--------|----------|
| BA:matrix:ASHB-GLEN | generated         | 4.75   | USD      |
| BA:matrix:ASHB-OAKL | generated         | 9.45   | USD      |

<sup><a href="https://511.org/open-data/transit" target="_blank">Voir le flux régional de la baie de San Francisco</a></sup>

<hr/>

## Décrire les moyens de paiement acceptés

Les usagers de San Francisco Muni peuvent utiliser différents types de supports pour payer leur voyage et valider leur tarif :

- Utiliser une <a href="https://www.clippercard.com/ClipperWeb/" target="_blank">carte Clipper</a>, la carte de transport en commun de la région de la Baie.
- Utiliser <a href="https://www.sfmta.com/getting-around/muni/fares/munimobile" target="_blank">l'application Munimobile</a>
- Payer son trajet en espèces

Ces méthodes de validation sont appelées `fare_media` dans GTFS-Fares V2 et peuvent être décrites à l'aide du fichier `fare_media.txt`.

Vous trouverez ci-dessous un exemple d'extrait du <a href="https://511.org/open-data/transit" target="_blank">flux régional de la baie de San Francisco</a> auquel il est possible d'accéder à l'aide de l'API 511 SF Bay.

`Clipper` est décrit comme une carte de transport physique avec `fare_media_type=2`. `SFMTA Munimobile` est décrit comme une application mobile avec `fare_media_type=2`. `Cash` n'a pas de support tarifaire, puisqu'il est remis directement au conducteur sans billet. Par conséquent, `Cash` est `fare_media_type=0`.

Les producteurs qui souhaitent décrire un ticket physique en tant que type de support tarifaire peuvent utiliser l'option expérimentale `fare_media_type=1` qui figure dans la <a href="https://docs.google.com/document/d/19j-f-wZ5C_kYXmkLBye1g42U-kvfSVgYLkkG5oyBauY/edit#heading=h.za3q5ta4cnyd" target="_blank">proposition complet Fares V2</a>.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | nom_du_faire_média | type_media_de_faire |
| ------------- |--------------------| ------------------- |
| clipper       | Clipper            | 2                   |
| munimobile    | SFMTA MuniMobile   | 4                   |
| cash   | Cash               | 0                   |

<sup><a href="https://511.org/open-data/transit" target="_blank">Voir le flux régional de la baie de San Francisco</a></sup>

## Définir les différences de prix en fonction du support tarifaire

Le prix du billet de Muni est différent selon le support utilisé par l'usager. Cet exemple montre comment le prix du tarif local adulte change lorsque l'on utilise de l'argent liquide ou une carte Clipper. Un tarif local adulte payé en espèces coûte 3 USD et le même tarif payé avec la carte Clipper coûte 2,50, soit 50 cents de moins.

Chaque entrée ci-dessous décrit un support tarifaire.

[**fare_media.txt**](../../reference/#fare_mediatxt)

| fare_media_id | fare_media_name | fare_media_type |
| ------------- |-----------------| ------------------- |
| clipper       | Clipper         | 2                   |
| cash     | Cash               | 0                   |

L'extrait du fichier `fare_products.txt` ci-dessous montre comment le montant du produit `Muni single local fare` varie en fonction du support utilisé par l'usager.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name          | amount | currency | fare_media_id |
| --------------- | ----------------------- | ------- |----------| ------------- |
| SF:local:single | Muni single local fare | 3       | USD      | cash    |
| SF:local:single | Muni single local fare | 2.5     | USD      | clipper       |

Dans Apple Maps, les usagers peuvent voir l'évolution du prix de leur billet. Vous pouvez comparer les prix des billets en suivant les instructions "Board the Muni J Church train" :

<div class="flex-photos">
    <img src="../../../assets/apple-muni-cash.jpg" alt="cash fare of $3 USD">
    <img src="../../../assets/apple-muni-clipper.jpg" alt="Clipper card fare of $2.50 USD">
</div>

<sup><a href="https://511.org/open-data/transit" target="_blank">Voir le flux régional de la baie de San Francisco</a></sup>

## Décrire une option de support tarifaire sans contact

<a href="https://vimeo.com/539436401" target="_blank">Le Clean Air Express dans le nord du comté de Santa Barbara accepte les paiements sans contact</a> par carte bancaire, Google Pay et Apple Pay.

Dans le flux Clean Air Express, il y a un moyen de transport `tap_to_ride` avec un `fare_media_type=3`, puisqu'il s'agit d'une option cEMV (contactless Europay, Mastercard and Visa).

| fare_media_id | fare_media_name | fare_media_type |
| ------------- | ------------------ | ------------------- |
| tap_to_ride   | Tap to Ride        | 3                   |

Le produit tarifaire pour un trajet unique illustré ci-dessous comporte à la fois des options de paiement `cash` et des options de tarification `tap to ride`. Lorsque le trajet simple est payé avec l'option `tap-to-ride`, il est moins cher d'un dollar US.

[**fare_products.txt**](../../reference/#fare_productstxt)

| fare_product_id | fare_product_name | fare_media_id | amount | currency |
| --------------- | -------------- | ------------- |--------|----------|
| trajet unique   | Trajet simple  | tap_to_ride   | 6      | USD      |
| trajet unique   | Trajet simple  |               | 7      | USD      |

<sup><a href="https://gtfs.calitp.org/production/CleanAirExpressFaresv2.zip" target="_blank">Télécharger le flux Clean Air Express</a></sup>
