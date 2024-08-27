# Alertes de service 
 
 Les alertes de service vous permettent de fournir des mises à jour en cas de perturbation sur le réseau. Les retards et les annulations de voyages individuels doivent généralement être communiqués à l’aide de [Mises à jour de voyage](../trip-updates). 
 
 Vous avez la possibilité de fournir les éléments suivants : 
 
 * URL - lien vers votre site expliquant plus en détail l’alerte 
 * Texte d’en-tête - un résumé de l’alerte 
 * Description - une description complète de l’alerte alerte, qui sera toujours affichée à côté de l’en-tête (il ne faut donc pas répéter cette information). 
 
## TimeRange 
 
 L’alerte sera affichée le cas échéant dans la plage horaire donnée. Cette plage doit couvrir toute la durée pendant laquelle l’alerte est utile au passager. 
 
 Si aucune heure n’est indiquée, nous afficherons l’alerte aussi longtemps qu’elle sera dans le flux. Si plusieurs plages sont données, nous les afficherons pendant chacune d’elles. 
 
## EntitySelector 
 
 Le sélecteur d’entité vous permet de spécifier exactement quelles parties du réseau cette alerte affecte, afin que nous puissions afficher uniquement les alertes les plus appropriées à l'utilisateur. Vous pouvez inclure plusieurs sélecteurs d’entités pour les alertes qui affectent plusieurs entités. 
 
 Les entités sont sélectionnées à l’aide de leurs identifiants GTFS, et vous pouvez sélectionner l’un des éléments suivants : 
 
 * Agence - affecte l’ensemble du réseau 
 * Route - affecte l’ensemble de la route 
 * Type de route - affecte n’importe quelle route de ce type.par exemple tous les métros. 
 * Trajet - affecte un trajet particulier 
 * Arrêt - affecte un arrêt particulier 
 
 Vous pouvez inclure plus d’un des champs répertoriés ci-dessus dans une seule `informed_entity`. Lorsque plusieurs champs sont inclus dans une seule `informed_entity`, ils doivent être interprétés comme étant joints par l’opérateur logique « ET ». En d’autres termes, l’alerte ne doit être appliquée que dans un contexte qui répond à tous les champs fournis dans une `informed_entity`. Par exemple, si `route_id: "1"` et `stop_id: "5"` sont tous deux inclus dans une seule `informed_entity`, alors l’alerte ne doit s’appliquer qu’à l’itinéraire 1 à l’arrêt 5. Elle ne doit PAS être appliquée à un autre arrêt.sur l’itinéraire 1, et il ne doit PAS être appliqué à un autre itinéraire à l’arrêt 5. 
 
 Si vous souhaitez représenter une alerte qui affecte plus d’une entité (par exemple une alerte pour l’itinéraire 1 et l’arrêt 5), vous devrait ajouter plusieurs « `informed_entity` » à votre « `alert` », chacune d’elles s’appliquant à l’entité affectée (par exemple une « `informed_entity` » qui inclut la route 1 et une autre « `informed_entity` » qui inclut l’arrêt 5). 
 
## Cause 
 
 Quelle est la cause de cette alerte ? Vous pouvez préciser l’une des options suivantes : 
 
 * Cause inconnue 
 * Autre cause (non représentée par aucune de ces options) 
 * Problème technique 
 * Grève 
 * Manifestation 
 * Accident 
 * Vacances 
 * Météo 
 * Maintenance 
 * Construction 
 * Activité de police 
 * Urgence médicale
 
## Effet 
 
 Quel effet ce problème a-t-il sur l’entité spécifiée ? Vous pouvez spécifier l’un des éléments suivants : 
 
 * Aucun service 
 * Service réduit 
 * Retards importants (les retards insignifiants ne doivent être fournis que via [Mises à jour du voyage](../trip-updates)). 
 * Détour 
 * Prestation supplémentaire 
 * Prestation modifiée : Les opérations sont différentes de ce à quoi le passager s’attendrait normalement. Un exemple est une alerte qui rappelle aux passagers un horaire de vacances à venir différent du service normal ce jour de la semaine. 
 * Arrêt déplacé 
 * Autre effet (non représenté par aucune de ces options) 
 * Effet inconnu 
 * Aucun effet : L’alerte informe les usagers mais n’affecte pas les opérations. Les exemples incluent la publicité de réunions publiques et la sollicitation de commentaires via des enquêtes. 
 * Problème Accessibilité : l’alerte fournit des informations sur les problèmes d’accessibilité qui affectent l’accès sans étape. Les exemples incluent un ascenseur hors service ou des rampes mobiles. 
