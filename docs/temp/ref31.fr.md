### niveaux.txt

Fichier : **Conditionnellement requis**

Clé primaire`(level_id`)

Décrit les niveaux dans une station. Utile en conjonction avec `pathways.txt`, et est nécessaire pour naviguer dans les voies avec ascenseurs`(pathway_mode=5`).

| Nom du champ  | Type      | Présence        | Description                                                                                                                                                                                                                                     |
| ------------- | --------- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `level_id`    | ID unique | **Obligatoire** | Identifie un niveau dans une station.                                                                                                                                                                                                           |
| `level_index` | Flotteur  | **Obligatoire** | Indice numérique du niveau qui indique sa position relative. <br /><br />Le niveau du sol doit avoir l'indice `0`Les niveaux au-dessus du sol sont indiqués par des indices positifs et les niveaux au-dessous du sol par des indices négatifs. |
| `level_name`  | Texte     | Facultatif      | Nom du niveau vu par le conducteur à l'intérieur du bâtiment ou de la station.<hr />_Exemple : Prenez l'ascenseur jusqu'à "Mezzanine" ou "Plate-forme" ou "-1"._                                                                                |
