### fare_leg_rules.txt

Fichier : **facultatif**

Clé primaire`(network_id, from_area_id, to_area_id, fare_product_id`)

Règles tarifaires pour les étapes individuelles du voyage.

Les tarifs contenus dans le fichier [`fare_leg_rules.txt`](#fare_leg_rulestxt) doivent être interrogés en filtrant tous les enregistrements du fichier pour trouver les règles qui correspondent au segment à parcourir par le voyageur.

Pour traiter le coût d'un segment :

1. Le fichier `fare_leg_rules.txt` doit être filtré par les champs qui définissent les caractéristiques du voyage, ces champs sont :
   - `fare_leg_rules.network_id`
   - `fare_leg_rules.from_area_id`
   - `fare_leg_rules.to_area_id`<br/>

<br />

2. Si le segment correspond exactement à un enregistrement dans `fare_leg_rules.txt` en fonction des caractéristiques du voyage, cet enregistrement doit être traité pour déterminer le coût du segment.
3. Si aucune correspondance exacte n'est trouvée, les entrées vides dans `fare_leg_rules.network_id`, `fare_leg_rules.from_area_id` et `fare_leg_rules.to_area_id` doivent être vérifiées pour traiter le coût du segment :
   - Une entrée vide dans `fare_leg_rules.network_id` correspond à tous les réseaux définis dans `routes.txt`, à l'exception de ceux énumérés dans `fare_leg_rules.network_id`.
   - Une entrée vide dans `fare_leg_rules.from_area_id` correspond à toutes les zones définies dans `areas.area_id`, à l'exception de celles énumérées dans `fare_leg_rules.from_area_id`.
   - Une entrée vide dans `fare_leg_rules.to_area_id` correspond à toutes les zones définies dans `areas.area_id`, à l'exception de celles énumérées dans `fare_leg_rules.to_area_id`.<br/>

<br />

4. Si le segment ne correspond à aucune des règles décrites ci-dessus, le tarif est inconnu.

<br />

| Nom du champ      | Type                                                                   | Présence        | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| ----------------- | ---------------------------------------------------------------------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `leg_group_id`    | ID                                                                     | Facultatif      | Identifie un groupe d'entrées dans [fare_leg_rules.txt](#fare_leg_rulestxt).<br /><br /> Utilisé pour décrire les règles de transfert de tarifs entre `fare_transfer_rules.from_leg_group_id` et `fare_transfer_rules.to_leg_group_id`.<br /><br />Plusieurs entrées dans [fare_leg_rules.txt](#fare_leg_rulestxt) peuvent appartenir à la même `fare_leg_rules.leg_group_id`.<br /><br />La même entrée dans [fare_leg_rules.txt](#fare_leg_rulestxt) (n'incluant pas `fare_leg_rules.leg_group_id`) ne doit pas appartenir à plusieurs `fare_leg_rules.leg_group_id`. |
| `network_id`      | Référencement d'identifiants étrangers `routes.network_id`             | Facultatif      | Identifie un réseau de routes qui s'applique à la règle du segment tarifaire.<br /><br />Si aucune valeur ne correspond `fare_leg_rules.network_id` correspondant à l'élément `network_id` en cours de filtrage, des valeurs vides `fare_leg_rules.network_id` sera trouvée par défaut.<br /><br /> Une entrée vide dans `fare_leg_rules.network_id` correspond à tous les réseaux définis dans `routes.txt` à l'exclusion de ceux énumérés sous `fare_leg_rules.network_id`                                                                                            |
| `from_area_id`    | Référencement d'identifiants étrangers `areas.area_id`                 | Facultatif      | Identifie une zone de départ.<br /><br />Si aucune valeur ne correspond `fare_leg_rules.from_area_id` correspondant à l'élément `area_id` en cours de filtrage, des valeurs vides `fare_leg_rules.from_area_id` sera utilisé par défaut. <br /><br />Une entrée vide dans `fare_leg_rules.from_area_id` correspond à toutes les zones définies dans `areas.area_id` à l'exclusion de ceux énumérés sous `fare_leg_rules.from_area_id`                                                                                                                                   |
| `to_area_id`      | Référencement d'identifiants étrangers `areas.area_id`                 | Facultatif      | Identifie une zone d'arrivée.<br /><br />Si aucune valeur ne correspond `fare_leg_rules.to_area_id` correspondant à l'élément `area_id` en cours de filtrage, des valeurs vides `fare_leg_rules.to_area_id` sera trouvée par défaut.<br /><br /> Une entrée vide dans `fare_leg_rules.to_area_id` correspond à toutes les zones définies dans `areas.area_id` à l'exclusion de ceux énumérés sous `fare_leg_rules.to_area_id`                                                                                                                                           |
| `fare_product_id` | Référencement d'identifiants étrangers `fare_products.fare_product_id` | **Obligatoire** | Le produit tarifaire requis pour parcourir le segment.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
