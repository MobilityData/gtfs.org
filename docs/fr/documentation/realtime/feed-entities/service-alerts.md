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
 
* **Cause inconnue** : Utilisée lorsque la cause de la perturbation n’est pas connue ou n’a pas été déterminée. À éviter si une cause plus précise peut raisonnablement être identifiée.
* **Autre cause** : Utilisée pour les causes qui ne sont représentées par aucune des options prédéfinies.
* **Problème technique** : Problèmes liés à un dysfonctionnement des véhicules ou des infrastructures. Par exemple, une panne mécanique ou des bogues du système d’information.
* **Grève** : Perturbations de service causées par une grève impliquant l’agence de transport ou l’opérateur.
* **Manifestation** : Perturbations de service causées par une manifestation publique, une protestation ou un rassemblement.
* **Accident** : Incidents tels que des collisions ou des déraillements qui perturbent les services.
* **Vacances** : Tout jour férié susceptible d’entraîner une modification du service.
* **Météo** : Perturbations causées par des conditions météorologiques telles que la neige, les tempêtes, les inondations, etc.
* **Maintenance** : Maintenance planifiée liée aux services. Par exemple, l’entretien des voies, des ascenseurs ou des véhicules.
* **Construction** : Tout chantier qui affecte le service, qu’il soit lié ou non aux services. Par exemple, la construction d’une station ou des travaux routiers qui affectent les lignes de bus.
* **Activité de police** : Perturbations dues à une intervention des forces de l’ordre ou à des incidents de sécurité. Par exemple, des enquêtes ou des menaces pour la sécurité.
* **Urgence médicale** : Incidents impliquant une urgence médicale concernant un passager ou un membre du personnel. Par exemple, un problème médical à bord qui oblige un train à s’arrêter.
* **Événement spécial** : Un événement spécial, ponctuel ou récurrent, tel qu’un défilé, un festival, un spectacle, un marché de producteurs ou un événement sportif.
 
## Effet 
 
 Quel effet ce problème a-t-il sur l’entité spécifiée ? Vous pouvez spécifier l’un des éléments suivants : 
 
* **Aucun service** : Aucun service de transport vers la ou les entités spécifiées.
  * Pour les agences, aucune des lignes de l’agence n’est en service.
  * Pour les lignes, aucun des voyages de la ligne ne sera effectué.
  * Pour les voyages, ces voyages spécifiques sont annulés.
  * Pour les stations (`location_type` = 1) ou les arrêts (`location_type` = 0), le passager ne pourra ni monter ni descendre.
* **Service réduit** : Le nombre ou la fréquence des voyages est réduit.
* **Retards importants** : La ligne circulera systématiquement en retard (les retards insignifiants ne doivent être fournis que via [Mises à jour du voyage](trip-updates.md)).
* **Détour** : La ligne modifie son tracé, ce qui peut affecter la prise en charge ou la dépose à certains arrêts.
* **Prestation supplémentaire** : Le nombre ou la fréquence des voyages est augmenté. Par exemple, davantage de bus circulent pour desservir un événement spécial.
* **Prestation modifiée** : Les opérations sont différentes de ce à quoi le passager s’attendrait normalement. Un exemple est une alerte qui rappelle aux passagers un horaire de vacances à venir différent du service normal ce jour de la semaine.
* **Arrêt déplacé** : L’emplacement d’un arrêt est modifié temporairement ou définitivement (si le changement est connu comme définitif, s’assurer que le nouvel emplacement est reflété dans les données horaires).
* **Autre effet** : Non représenté par aucune de ces options.
* **Effet inconnu** : Utilisé pour les alertes dont l’effet n’a pas encore été identifié. N’utilisez pas « Effet inconnu » si l’effet de l’alerte est connu ou peut être déduit de l’en-tête ou de la description de l’alerte.
* **Aucun effet** : L’alerte informe les usagers mais n’affecte pas les opérations. Les exemples incluent la publicité de réunions publiques et la sollicitation de commentaires via des enquêtes. Sauf si nécessaire, il est conseillé de ne pas utiliser cet effet.
* **Problème d’accessibilité** : L’alerte fournit des informations sur les problèmes d’accessibilité qui affectent l’accès de plain-pied. Par exemple, un ascenseur hors service ou des rampes mobiles, un bus qui ne peut pas s’abaisser, ou un service exceptionnel avec des trains présentant un espace important entre le quai et le train.
