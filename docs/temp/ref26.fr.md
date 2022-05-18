### stop_areas.txt

Fichier : **facultatif**

Clé primaire`(*`)

Affecte les arrêts du fichier [stops.txt](#stopstxt) aux zones.

| Nom du champ | Type                                                   | Présence        | Description                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------ | ------------------------------------------------------ | --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `area_id`    | Référencement d'identifiants étrangers `areas.area_id` | **Obligatoire** | Identifie une zone à laquelle un ou plusieurs `stop_id`appartiennent. Le même `stop_id` peut être défini dans plusieurs `area_id`s.                                                                                                                                                                                                                                                                    |
| `stop_id`    | Référencement d'identifiants étrangers `stops.stop_id` | **Obligatoire** | Identifie un arrêt. Si une station (c'est-à-dire un arrêt avec `stops.location_type=1`) est définie dans ce champ, on suppose que toutes ses plates-formes (c'est-à-dire tous les arrêts avec `stops.location_type=0` qui ont cette station définie comme `stops.parent_station`) font partie de la même zone. Ce comportement peut être remplacé par l'affectation de plates-formes à d'autres zones. |
