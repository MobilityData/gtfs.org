# Service alerts

Les service alerts vous permettent de fournir des mises à jour lorsqu'il y a une perturbation sur le réseau. Les retards et les annulations de trajets individuels doivent généralement être communiqués au moyen de [trip updates](trip-updates.md).

Vous avez la possibilité de fournir les éléments suivants :

*   URL - lien vers votre site expliquant plus en détail l'alerte.
*   Header text - résumé de l'alerte
*   Description - description complète de l'alerte, qui sera toujours affichée à côté de l'en-tête (il ne faut donc pas répéter ces informations).

## TimeRange

L'alerte sera affichée, le cas échéant, dans la plage de temps indiquée. Cette plage doit couvrir la totalité de la période pendant laquelle il est utile pour le passager de voir l'alerte.

Si aucune durée n'est indiquée, nous afficherons l'alerte aussi longtemps qu'elle se trouvera dans le flux. Si plusieurs plages sont indiquées, nous afficherons l'alerte pendant toutes ces plages.

## EntitySelector

Le sélecteur d'entité vous permet de spécifier exactement quelles parties du réseau sont concernées par cette alerte, afin que nous puissions afficher uniquement les alertes les plus appropriées pour l'utilisateur. Vous pouvez inclure plusieurs sélecteurs d'entité pour les alertes qui affectent plusieurs entités.

Les entités sont sélectionnées à l'aide de leurs identifiants GTFS, et vous pouvez choisir l'une des options suivantes :

*   Agency - affecte l'ensemble du réseau
*   Route - affecte l'ensemble de la route
*   Route type - affecte tout itinéraire de ce type, par exemple tous les métros.
*   Trip - affecte un voyage particulier
*   Stop - affecte un arrêt particulier

Vous pouvez inclure plus d'un des champs énumérés ci-dessus dans une `informed_entity`. Lorsque plusieurs champs sont inclus dans une même `informed_entity`, ils doivent être interprétés comme étant reliés par l'opérateur logique `AND`. En d'autres termes, l'alerte ne doit être appliquée que dans un contexte qui répond à tous les champs fournis dans une `informed_entity`. Par exemple, si `route_id : "1"` et `stop_id : "5"` sont tous deux inclus dans une `informed_entity`, l'alerte ne doit s'appliquer qu'à l'itinéraire 1 à l'arrêt 5. Elle ne doit PAS être appliquée à un autre arrêt de la ligne 1, ni à une autre ligne à l'arrêt 5.

Si vous souhaitez représenter une alerte qui concerne plusieurs entités (par exemple, une alerte pour la ligne 1 et l'arrêt 5), vous devez ajouter plusieurs `informed_entity` à votre `alert`, chacune d'entre elles s'appliquant à l'entité concernée (par exemple, une `informed_entity` qui inclut la ligne 1 et une autre `informed_entity` qui inclut l'arrêt 5).

## Cause

Quelle est la cause de cette alerte ? Vous pouvez indiquer l'une des causes suivantes :

*   Unknown cause
*   Other cause (non représentée par l'une de ces options)
*   Technical problem
*   Strike
*   Demonstration
*   Accident
*   Holiday
*   Weather
*   Maintenance
*   Construction
*   Police activity
*   Medical emergency

## Effect

Quel effet ce problème a-t-il sur l'entité spécifiée ? Vous pouvez spécifier l'un des éléments suivants :

*   No service
*   Reduced service
*   Significant delays (les retards insignifiants ne doivent être fournis que par des [trip updates](trip-updates.md)).
*   Detour
*   Additional service
*   Modified service : Les opérations sont différentes de ce que l'usager attend normalement. Par exemple, une alerte qui rappelle aux usagers l'horaire d'un jour férié à venir, différent du service normal ce jour-là.
*   Stop moved
*   Other effect (non représenté par l'une de ces options)
*   Unknown effect
*   No effect : L'alerte fournit des informations aux usagers mais n'affecte pas les opérations. Il peut s'agir, par exemple, d'annoncer des réunions publiques ou de solliciter des commentaires par le biais d'enquêtes.
*   Accessibility issue : L'alerte fournit des informations sur les problèmes d'accessibilité qui affectent l'accès sans marche. Par exemple, un ascenseur hors service ou des rampes mobiles.
