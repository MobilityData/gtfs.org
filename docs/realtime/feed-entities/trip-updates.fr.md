# Trip Updates

Les trip updates représentent les fluctuations de l'horaire. Nous nous attendons à recevoir des trip updates pour tous les trajets que vous avez programmés et qui sont compatibles avec le temps réel. Ces mises à jour indiquent l'heure d'arrivée ou de départ prévue pour les arrêts le long de l'itinéraire. Les trip updates peuvent également prévoir des scénarios plus complexes dans lesquels des trajets sont annulés ou ajoutés au programme, ou même réacheminés.

**Rappel :** Dans [GTFS](../../schedule/reference.md), un trajet est une séquence de deux ou plusieurs arrêts se produisant à un moment précis.

Il devrait y avoir **au maximum** une mise à jour de trajet pour chaque trajet programmé. S'il n'y a pas de mise à jour pour un trajet programmé, on en conclura qu'aucune donnée en temps réel n'est disponible pour ce trajet. Le consommateur de données **ne** doit **pas** supposer que le voyage se déroule à l'heure.

Si un véhicule dessert plusieurs trajets dans le même bloc (pour plus d'informations sur les trajets et les blocs, veuillez vous référer à [GTFS trips.txt](../../schedule/reference.md#tripstxt)) :

*   le flux doit inclure un TripUpdate pour le trajet actuellement desservi par le véhicule. Les producteurs sont encouragés à inclure des TripUpdates pour un ou plusieurs trajets après le trajet actuel dans le bloc de ce véhicule si le producteur est confiant dans la qualité des prédictions pour ce(s) futur(s) trajet(s). L'inclusion de plusieurs TripUpdates pour le même véhicule permet d'éviter que les usagers ne soient confrontés à des prédictions " pop-in " lorsque le véhicule passe d'un trajet à l'autre et permet également aux usagers d'être informés à l'avance des retards qui ont un impact sur les trajets en aval (par exemple, lorsque le retard connu dépasse les temps d'attente prévus entre les trajets).
*   les entités TripUpdate respectives ne sont pas tenues d'être ajoutées au flux dans l'ordre où elles sont programmées dans le bloc. Par exemple, s'il y a des trajets avec des `trip_id` 1, 2 et 3 qui appartiennent tous à un bloc, et que le véhicule effectue le trajet 1, puis le trajet 2, puis le trajet 3, les entités `trip_update` peuvent apparaître dans n'importe quel ordre - par exemple, l'ajout du trajet 2, puis du trajet 1, puis du trajet 3 est autorisé.

## StopTimeUpdate

Une mise à jour de trajet consiste en une ou plusieurs mises à jour des heures d'arrêt des véhicules, qui sont appelées [StopTimeUpdates](../reference.md#message-stoptimeupdate). Celles-ci peuvent être fournies pour les temps d'arrêt passés et futurs. Il est permis, mais pas obligatoire, de supprimer les temps d'arrêt passés. Les producteurs ne doivent pas abandonner un `StopTimeUpdate` passé s'il se réfère à un arrêt dont l'heure d'arrivée est prévue dans le futur pour le trajet donné (c'est-à-dire que le véhicule a passé l'arrêt avant l'heure prévue), car sinon, il sera conclu qu'il n'y a pas de mise à jour pour cet arrêt.

Par exemple, si les données suivantes apparaissent dans le flux GTFS-rt :

*   Arrêt 4 - Prévu à 10h18 (prévu à 10h20 - 2 minutes d'avance)
*   Arrêt 5 - Prévue à 10h30 (prévue à 10h30 - à l'heure)

Si le `StopTimeUpdate` pour l'arrêt 4 a été supprimé de l'alimentation à 10h18 ou 10h19, et que l'heure d'arrivée prévue est 10h20, alors le consommateur doit supposer qu'aucune information en temps réel n'existe pour l'arrêt 4 à ce moment-là, et les données d'horaire de GTFS doivent être utilisées.

Chaque [StopTimeUpdate](../reference.md#message-stoptimeupdate) est lié à un arrêt. Normalement, cela peut être fait en utilisant une GTFS stop_sequence ou une GTFS stop_id. Cependant, dans le cas où vous fournissez une mise à jour pour un voyage sans trip_id GTFS, vous devez spécifier stop_id car stop_sequence n'a pas de valeur. Le stop_id doit toujours faire référence à un stop_id dans GTFS. Si le même stop_id est visité plus d'une fois dans un voyage, alors stop_sequence doit être fourni dans tous les StopTimeUpdates pour ce stop_id sur ce voyage.

La mise à jour peut fournir une heure exacte d'**arrival** et/ou de **departure** à un arrêt dans les [StopTimeUpdates](../reference.md#message-stoptimeupdate) en utilisant [StopTimeEvent](../reference.md#message-stoptimeevent). Il doit contenir soit une **time** absolue, soit un **delay** (c'est-à-dire un décalage en secondes par rapport à l'heure prévue). Le retard ne peut être utilisé que si la mise à jour du trajet fait référence à un trajet GTFS programmé, par opposition à un trajet basé sur la fréquence. Dans ce cas, le temps doit être égal au temps programmé + le retard. Vous pouvez également spécifier l'**uncertainty** de la prédiction avec [StopTimeEvent](../reference.md#message-stoptimeevent), ce qui est discuté plus en détail dans la section [Uncertainty](#uncertainty) plus bas sur la page.

Pour chaque [StopTimeUpdate](../reference.md#message-stoptimeupdate), la relation d'horaire par défaut est **scheduled**. (Notez que cela est différent de la relation d'horaire pour le voyage). Vous pouvez changer ce paramètre en **"skipped"** si l'arrêt n'est pas prévu, ou en **"no data"** si vous ne disposez de données en temps réel que pour une partie du trajet.

**Les mises à jour doivent être triées par stop_sequence** (ou par stop_ids dans l'ordre où ils apparaissent dans le trajet).

Si un ou plusieurs arrêts manquent sur le trajet, le `delay` de la mise à jour (ou, si seule `time` est fournie dans la mise à jour, un retard calculé en comparant `time` à l'heure de l'horaire GTFS) est propagé à tous les arrêts suivants. Cela signifie que la mise à jour d'une heure d'arrêt pour un certain arrêt modifiera tous les arrêts suivants en l'absence de toute autre information. Notez que les mises à jour avec une relation d'horaire `SKIPPED` n'arrêteront pas la propagation du retard, mais les mises à jour avec des relations d'horaire `SCHEDULED` (également la valeur par défaut si la relation d'horaire n'est pas fournie) ou `NO_DATA` le feront.

**Exemple 1**

Pour un trajet comportant 20 arrêts, un [StopTimeUpdate](../reference.md#message-stoptimeupdate) avec un délai d'arrivée et un délai de départ de 0[(StopTimeEvents](../reference.md#message-stoptimeevent)) pour la stop_sequence de l'arrêt actuel signifie que le trajet est exactement à l'heure.

**Exemple 2**

Pour le même exemple de trajet, trois [StopTimeUpdate](../reference.md#message-stoptimeupdate) sont fournis :

*   délai de 300 secondes pour stop_sequence 3
*   délai de 60 secondes pour la séquence d'arrêt 8
*   [ScheduleRelationship](../reference.md#enum-schedulerelationship) de `NO_DATA` pour stop_sequence 10

Ceci sera interprété comme :

*   Les stop_sequences 1,2 ont un retard inconnu.
*   Les stop_sequences 3,4,5,6,7 ont un retard de 300 secondes.
*   Les stop_sequences 8,9 ont un retard de 60 secondes.
*   Les séquences 10,..., 20 ont un retard inconnu.

## TripDescriptor

Les informations fournies par le TripDescriptor dépendent de la relation d'horaire du trajet que vous mettez à jour. Il existe un certain nombre d'options que vous pouvez définir :

| _**Valeur**_      | _**Commentaire**_                                                                                                                                                                                                              |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Scheduled**     | Ce trajet est exécuté selon un horaire GTFS, ou est suffisamment proche pour être encore associé à celui-ci.                                                                                                                   |
| **Added**        | Ce trajet n'était pas programmé et a été ajouté. Par exemple, pour faire face à la demande, ou pour remplacer un véhicule en panne.                                                                                            |
| **Unscheduled** | Ce trajet est en cours et n'est jamais associé à un horaire. Par exemple, s'il n'y a pas d'horaire et que les bus font la navette.                                                                                             |
| **Canceled**        | Ce trajet était prévu, mais il a été supprimé.                                                                                                                                                                                 |
| **Duplicated**      | Ce nouveau trajet est une copie d'un trajet existant dans le GTFS statique, sauf pour la date et l'heure de début du service. Le nouveau trajet sera exécuté à la date et à l'heure de service spécifiées dans TripProperties. |

Dans la plupart des cas, vous devez fournir le trip_id du voyage planifié dans GTFS auquel cette mise à jour se rapporte.

#### Systèmes avec des trip_ids répétés

Pour les systèmes utilisant des trip_ids répétés, par exemple les trajets modélisés à l'aide de frequencies.txt, c'est-à-dire les trajets basés sur la fréquence, le trip_id n'est pas en soi un identifiant unique d'un trajet unique, car il ne comporte pas de composante temporelle spécifique. Afin d'identifier de manière unique de tels trajets dans un TripDescriptor, un triple identifiant doit être fourni :

*   **trip_id**
*   **start_time**
*   **start_date**

start_time doit être publiée en premier, et toutes les mises à jour ultérieures du flux doivent utiliser cette même start_time lorsqu'il s'agit du même trajet. StopTimeUpdates se doit être utilisé pour indiquer les ajustements ; l'heure de départ ne doit pas nécessairement être l'heure exacte de départ de la première station, mais elle doit être assez proche de cette heure.

Par exemple, disons que nous décidons à 10:00, le 25 mai 2015, qu'un voyage avec trip_id=T commencera à start_time=10:10:00, et que nous fournissons cette information via le flux temps réel à 10:01. À 10 h 05, nous savons soudainement que le voyage ne commencera pas à 10 h 10 mais à 10 h 13. Dans notre nouveau flux en temps réel, nous pouvons toujours identifier ce voyage comme étant (T, 2015-05-25, 10:10:00) mais nous fournissons un StopTimeUpdate avec un départ du premier arrêt à 10:13:00.

#### Correspondance alternative des trajets

Les trajets qui ne sont pas basés sur la fréquence peuvent également être identifiés de manière unique par un TripDescriptor comprenant la combinaison de :

*   **route_id**
*   **direction_id**
*   **start_time**
*   **start_date**

où start_time est l'heure de départ prévue telle que définie dans l'horaire statique, pour autant que la combinaison des identifiants fournis donne lieu à un trajet unique.

## Uncertainty

L'uncertainty s'applique à la fois à l'heure et à la valeur du retard d'un [StopTimeUpdate](../reference.md#message-stoptimeupdate). L'uncertainty spécifie approximativement l'erreur attendue dans le retard réel sous la forme d'un nombre entier de secondes (mais attention, la signification statistique précise n'est pas encore définie). Il est possible que l'uncertainty soit égale à 0, par exemple pour les trains qui sont conduits sous le contrôle d'un ordinateur.

Par exemple, un bus longue distance dont le retard est estimé à 15 minutes et qui arrive à son prochain arrêt dans une fenêtre d'erreur de 4 minutes (c'est-à-dire +2 / -2 minutes) aura une valeur d'uncertainty de 240.
