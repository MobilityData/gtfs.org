# Mises à jour des voyages 
 
 Les mises à jour des voyages représentent des fluctuations dans l’horaire. Nous nous attendons à recevoir des mises à jour de voyage pour tous les voyages que vous avez programmés et qui sont compatibles en temps réel. Ces mises à jour donneraient une heure d’arrivée ou de départ prévue pour les arrêts le long de l’itinéraire. Les mises à jour des voyages peuvent également prévoir des scénarios plus complexes dans lesquels les voyages sont annulés ou ajoutés au calendrier, ou même réacheminés. 
 
 **Rappel :** Dans [GTFS](../../../schedule/reference), un trajet est une séquence de deux arrêts ou plus se produisant à une heure précise. 
 
 Il devrait y avoir **au plus** une mise à jour de trajet pour chaque trajet programmé. S’il n’y a pas de mise à jour du trajet pour un trajet programmé, il sera conclu qu’aucune donnée en temps réel n’est disponible pour le trajet. Le application réutilisatrice de données ne doit **pas** supposer que le voyage se déroule à l’heure. 
 
 Si un véhicule effectue plusieurs trajets dans le même bloc (pour plus d’informations sur les trajets et les blocages, veuillez vous référer à [GTFS trips.txt](../../../schedule/reference/#tripstxt) ) : 
 
 * le flux doit inclure une TripUpdate pour le trajet actuellement desservi par le véhicule. Les producteurs sont encouragés à inclure des TripUpdates pour un ou plusieurs voyages après le voyage en cours dans le bloc de ce véhicule s’ils sont confiants dans la qualité des prévisions pour ces futurs voyages. L’inclusion de plusieurs TripUpdates pour le même véhicule évite les « pop-in » de prédiction pour les usagers lorsque le véhicule passe d’un trajet à un autre et donne également aux usagers un préavis des retards qui ont un impact sur les trajets en aval (par exemple, lorsque le retard connu dépasse les temps d’escale prévus entre les trajets). 
 * Il n’est pas nécessaire que les entités TripUpdate respectives soient ajoutées au flux dans le même ordre dans lequel elles sont planifiées dans le bloc. Par exemple, s’il y a des trajets avec les `trip_ids` 1, 2 et 3 qui appartiennent tous à un seul bloc, et que le véhicule effectue le trajet 1, puis le trajet 2, puis le trajet 3, les entités `trip_update` peuvent apparaître dans n’importe quel ordre. - par exemple, ajouter le trajet 2, puis le trajet 1, puis le trajet 3 est autorisé. 
 
## StopTimeUpdate 
 
 Une mise à jour de trajet consiste en une ou plusieurs mises à jour des horaires d’arrêts du véhicule, appelées [StopTimeUpdates](../../reference/#message-stoptimeupdate). Ceux-ci peuvent être fournis pour les horaires d’arrêts passés et futurs. Vous êtes autorisé, mais pas obligé, à dépasser les horaires d’arrêts. Les producteurs ne doivent pas supprimer un `StopTimeUpdate` passé s’il fait référence à un arrêt avec une heure d’arrivée prévue dans le futur pour le trajet donné (c’est-à-dire que le véhicule a dépassé l’arrêt plus tôt que prévu), sinon il sera conclu qu’il n’y a pas d’arrêt.mise à jour pour cet arrêt. 
 
 Par exemple, si les données suivantes apparaissent dans le flux GTFS-rt : 
 
 * Arrêt 4 – Prédit à 10h18 (programmé à 10h20 – 2 min en avance) 
 * Arrêt 5 – Prédit à 10h30 (prévu à 10h30 – à l’heure) 
 
...la prédiction pour l’arrêt 4 ne peut pas être supprimée du flux avant 10h21, même si le bus passe effectivement l’arrêt à 10h18. Si le `StopTimeUpdate` pour l’arrêt 4 a été supprimé du flux à 10 h 18 ou 10 h 19 et que l’heure d’arrivée prévue est 10 h 20, alors le application réutilisatrice doit supposer qu’aucune information en temps réel n’existe pour l’arrêt 4 à ce moment-là., et les données de planification de GTFS doivent être utilisées. 
 
 Chaque [StopTimeUpdate](../../reference/#message-stoptimeupdate) est lié à un arrêt. Habituellement, cela peut être fait en utilisant soit un stop_sequence GTFS, soit un stop_id GTFS. Cependant, dans le cas où vous fournissez une mise à jour pour un voyage sans GTFS trip_id, vous devez spécifier stop_id car stop_sequence n’a aucune valeur. Le stop_id doit toujours faire référence à un stop_id dans GTFS. Si le même stop_id est visité plus d’une fois au cours d’un trajet, alors stop_sequence doit être fourni dans toutes les StopTimeUpdates pour ce stop_id lors de ce trajet. 
 
 La mise à jour peut fournir une heure exacte pour **arrival** et/ou le **departure** à un arrêt dans [StopTimeUpdates](../../reference/#message-stoptimeupdate) en utilisant [StopTimeEvent](../../reference/#message-stoptimeevent). Celui-ci doit contenir soit une **time** absolue, soit un **delay** (c’est-à-dire un décalage par rapport à l’heure programmée en secondes). Le délai ne peut être utilisé que dans le cas où la mise à jour du trajet fait référence à un trajet GTFS programmé, par opposition à un trajet basé sur la fréquence. Dans ce cas, le temps doit être égal au temps programmé + le délai. Vous pouvez également spécifier l’**uncertainty** de la prédiction avec [StopTimeEvent](../../reference/#message-stoptimeevent), qui est abordée plus en détail dans la section [Uncertainty](#incertitude) plus loin dans le page. 
 
 Pour chaque [StopTimeUpdate](../../reference/#message-stoptimeupdate), la relation de planification par défaut est **programmée**. (Notez que ceci est différent de la relation d’horaire pour le voyage). Vous pouvez modifier ce paramètre en **ignoré** si l’arrêt ne sera pas arrêté à, ou en **pas de données** si vous ne disposez que de données en temps réel pour une partie du trajet. 
 
 **Les mises à jour doivent être triées par stop_sequence** (ou stop_ids dans l’ordre dans lequel elles se produisent dans le voyage). 
 
 Si un ou plusieurs arrêts manquent tout au long du trajet, le `delay` de la mise à jour (ou, si seul `time` est fourni dans la mise à jour, un délai calculé en comparant le `time` avec l’heure du programme GTFS) est propagé à tous les arrêts suivants. Cela signifie que la mise à jour d’une heure d’arrêt pour un certain arrêt modifiera tous les arrêts suivants en l’absence de toute autre information. Notez que les mises à jour avec une relation de planification de `SKIPPED` n’arrêteront pas la propagation du délai, mais les mises à jour avec des relations de planification de `SCHEDULED` (également la valeur par défaut si la relation de planification n’est pas fournie) ou `NO_DATA` le feront. 
 
 **Exemple 1** 
 
 Pour un trajet comportant 20 arrêts, un [StopTimeUpdate](../../reference/#message-stoptimeupdate) avec un délai d’arrivée et un délai de départ de 0 ([StopTimeEvents](../../reference/#message-stoptimeevent)) pour stop_sequence de l’arrêt en cours signifie que le trajet est exactement à l’heure. 
 
 **Exemple 2** 
 
 Pour une même instance de déclenchement, trois [StopTimeUpdates](../../reference/#message-stoptimeupdate) sont fournies : 
 
 * délai de 300 secondes pour stop_sequence 3 
 * délai de 60 secondes pour stop_sequence 8 
 * [ScheduleRelationship](../../reference/#enum-schedulerelationship) de `NO_DATA` pour stop_sequence 10 
 
 Ceci sera interprété comme : 
 
 * stop_sequences 1,2 ont un délai inconnu. 
 * stop_sequences 3,4,5,6,7 ont un délai de 300 secondes. 
 * stop_sequences 8,9 ont un retard de 60 secondes. 
 * stop_sequences 10,..,20 ont un délai inconnu. 
 
## TripDescriptor 
 
 Les informations fournies par TripDescriptor dépendent de la relation horaire du voyage que vous mettez à jour. Vous pouvez définir un certain nombre d’options : 
 
 |_**Valeur**_|_**Commentaire**_| 
 |-----------|-------------| 
 | **Planifié** | Ce voyage s’effectue selon un planning GTFS, ou est suffisamment proche pour y être encore associé. | 
 | **Ajouté** | Ce voyage n’était pas programmé et a été ajouté. Par exemple, pour faire face à la demande, ou remplacer un véhicule en panne. | 
 | **Non programmé** | Ce trajet est en cours et n’est jamais associé à un planning. Par exemple, s’il n’y a pas d’horaire et que les bus fonctionnent avec un service de navette. | 
 | **Annulé** | Ce voyage était programmé, mais est désormais supprimé. | 
 | **Dupliqué** | Ce nouveau trajet est une copie d’un trajet existant en GTFS statique à l’exception de la date et de l’heure de début du service. Le nouveau voyage s’exécutera à la date et à l’heure de service spécifiées dans TripProperties. | 
 
 Dans la plupart des cas, vous devez fournir le trip_id du voyage programmé dans GTFS auquel cette mise à jour se rapporte. 
 
#### Systèmes avec des trip_ids répétés 
 
 Pour les systèmes utilisant des trip_ids répétés, par exemple des trajets modélisés à l’aide de frequencies.txt, c’est-à-dire des trajets basés sur la fréquence, le trip_id n’est pas en soi un identifiant unique d’un seul voyage, car il lui manque une composante temporelle 
 spécifique. Afin d’identifier de manière unique de tels voyages dans un 
 TripDescriptor, un triple d’identifiants doit être fourni : 
 
*    __trip_id__
*    __start_time__
*    __start_date__ 
 
 start_time doit être d’abord publié, ainsi que toutes les mises à jour ultérieures du flux.devrait utiliser 
 la même heure de départ pour faire référence au même voyage. StopTimeUpdates 
 doit être utilisé pour indiquer les ajustements ; start_time ne doit pas nécessairement être précisément 
 l’heure de départ de la première station, même si elle doit être assez proche de 
 cette heure. 
 
 Par exemple, disons que nous décidons à 10h00, le 25 mai 2015, qu’un voyage avec 
 trip_id=T commencera à start_time=10:10:00, et fournissons cette information via 
 flux en temps réel à 10h01. Vers 10h05, nous savons soudain que le voyage ne commencera pas 
 à 10h10 mais à 10h13. Dans notre nouveau flux en temps réel, nous pouvons toujours identifier ce voyage 
 comme (T, 2015-05-25, 10:10:00) mais fournir une StopTimeUpdate avec départ du 
 premier arrêt à 10:13:00. 
 
#### Correspondance de trajets alternatifs 
 
 Les Trajets qui ne sont pas basés sur la fréquence peuvent également être identifiés de manière unique par un 
 TripDescriptor comprenant la combinaison de : 
 
 *    __route_id__
*    __direction_id__
*    __start_time__
*    __start_date__
 
 où start_time est l’heure de début prévue telle que définie dans le programme statique, à condition que la combinaison d’identifiants fournis donne lieu à un voyage unique. 
 
 
## Incertitude 
 
 L’incertitude s’applique à la fois à l’heure et à la valeur du délai d’un [StopTimeUpdate](../../reference/#message-stoptimeupdate). L’incertitude spécifie approximativement l’erreur attendue dans le délai réel sous la forme d’un nombre entier en secondes (mais notez que la signification statistique précise n’est pas encore définie). Il est possible que l’incertitude soit de 0, par exemple pour les trains circulant sous contrôle de synchronisation informatique. 
 
 À titre d’exemple, un bus longue distance qui a un retard estimé de 15 minutes arrivant à son prochain arrêt dans une fenêtre d’erreur de 4 minutes (soit +2/-2 minutes) aura une valeur d’incertitude de 240. 
