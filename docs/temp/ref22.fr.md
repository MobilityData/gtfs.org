### fare_products.txt

Fichier : **facultatif**

Clé primaire`(fare_product_id`)

Décrire les différents types de billets ou de tarifs qui peuvent être achetés par les usagers.

| Nom du champ        | Type              | Présence        | Description                                                                                                                                                        |
| ------------------- | ----------------- | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `fare_product_id`   | ID                | **Obligatoire** | Identifie un produit tarifaire.                                                                                                                                    |
| `fare_product_name` | Texte             | Facultatif      | Le nom du produit tarifaire tel qu'il est affiché aux usagers.                                                                                                     |
| `amount`            | Montant en devise | **Obligatoire** | Le coût du produit tarifaire. Peut être négatif pour représenter des réductions de transfert. Peut être égal à zéro pour représenter un produit tarifaire gratuit. |
| `currency`          | Code devise       | **Obligatoire** | La devise du coût du produit tarifaire.                                                                                                                            |
