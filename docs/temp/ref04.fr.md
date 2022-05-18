### Définitions des termes

Cette section définit les termes utilisés dans ce document.

* **Ensemble de données** - Un ensemble complet de fichiers définis par cette référence de spécification. La modification de l'ensemble de données crée une nouvelle version de l'ensemble de données. Les ensembles de données doivent être publiés à une URL publique et permanente, incluant le nom du fichier zip. (par exemple, [https://www.agency.org/gtfs/gtfs.zip)](https://www.agency.org/gtfs/gtfs.zip).
* **Enregistrement** - Structure de données de base composée d'un certain nombre de valeurs de champs différents décrivant une seule entité (par exemple, une agence de transport, un arrêt, un itinéraire, etc.) Représenté, dans un tableau, par une ligne.
* **Champ** - Propriété d'un objet ou d'une entité. Représenté, dans un tableau, par une colonne.
* **Valeur de champ** - Une entrée individuelle dans un champ. Représentée, dans un tableau, par une seule cellule.
* **Jour de service** - Un jour de service est une période de temps utilisée pour indiquer l'ordonnancement des itinéraires. La définition exacte d'un jour de service varie d'une agence à l'autre, mais les jours de service ne correspondent souvent pas aux jours civils. Un jour de service peut dépasser 24:00:00 si le service commence un jour et se termine le jour suivant. Par exemple, un service qui fonctionne de 08:00:00 le vendredi à 02:00:00 le samedi, pourrait être désigné comme fonctionnant de 08:00:00 à 26:00:00 sur un seul jour de service.
* **Champ de synthèse vocale** - Le champ doit contenir les mêmes informations que son champ parent (sur lequel il se rabat s'il est vide). Il est destiné à être lu en synthèse vocale, par conséquent, les abréviations doivent être soit supprimées ("St" doit être lu comme "Street" ou "Saint" ; "Elizabeth I" doit être "Elizabeth the first"), soit conservées pour être lues telles quelles ("JFK Airport" est dit abrégé).
* **Étape** - Voyage au cours duquel un passager monte et descend entre deux endroits successifs au cours d'un voyage.
* **Voyage** - Voyage global de l'origine à la destination, y compris tous les segments et transferts intermédiaires.
* **Sous-voyage** - Deux ou plusieurs étapes qui constituent un sous-ensemble d'un voyage.
* **Produit tarifaire** - Produits tarifaires achetables qui peuvent être utilisés pour payer ou valider un voyage.
