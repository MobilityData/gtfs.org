# Trip Modifications 
 
 Un message `TripModifications` identifie une liste de `trip_ids` similaires du (CSV) GTFS qui sont tous affectés par des modifications particulières, comme un détour. 

<br><br> **Attention :**cette entité est encore **expérimentale** et sujette à changement. Il pourrait être formellement adopté à l’avenir. 
 
## SLO : objectif de niveau de service 
 
 La fréquence de mise à jour des données devrait être d’environ toutes les heures (~ 24 fois/jour). Le temps d’ingestion peut dépendre du nombre total de déplacements concernés. Les consommateurs sont censés ingérer un seul TripModification en 5 minutes et un flux comportant des centaines de détours en 20 minutes. 
 
## TripModifications 
 
 Les `TripModifications` sont en vigueur à toutes les dates de service répertoriées, jusqu’à ce qu’elles soient supprimées du flux. À une date de service donnée, un voyage NE DOIT PAS être attribué à plus d’un objet `TripModifications`. 
 
 Il PEUT y avoir plusieurs `TripModifications` pour un modèle d’arrêt donné. Il peut être souhaitable de diviser les trajets en plusieurs modifications, par exemple si le « propagated_modification_delay » change de manière significative au cours du détour. 
 
 Les voyages créés via GTFS- TripModifications modifient et remplacent chaque `trip_id` spécifié, et ne créent pas de copie ou d’exécution supplémentaire. Les modifications sont appliquées sur les informations de planning, comme si un GTFS (CSV) statique était modifié. 
 
 Les horaires d’arrêts programmées de chaque trajet de remplacement sont créées à partir de celles du trajet concerné, en effectuant les changements listés dans les modifications. `stop_sequence` pour tous les horaires d’arrêts sont remplacés par une nouvelle valeur de 1 à n, commençant par 1 lors du premier stop_time et augmentant de 1 pour chaque arrêt du trajet. Un message `TripUpdate` doit être fourni pour publier les heures d’arrivée/départ en temps réel pour le voyage de remplacement. 
 
 
## Lien vers TripUpdates 
 
 * Une TripUpdate DEVRAIT être fournie en utilisant un `ModifiedTripSelector` à l’intérieur du `TripDescriptor` de TripUpdate. 
     * Lorsque TripUpdate fait référence au voyage de remplacement, le application réutilisatrice doit se comporter comme si le GTFS statique aurait été modifié avec les TripModifications (par exemple `arrival_time`, `departure_time`, `stop_sequence`, `stop_id` sur les arrêts de remplacement). 
    * Lorsque vous fournissez un `ModifiedTripSelector`, les autres champs du `TripDescriptor` DOIT être laissés vides, pour éviter toute confusion chez les consommateurs qui ne recherchent pas la valeur `ModifiedTripSelector`. 
    * Les flux TripUpdate fournissant des mises à jour avec `ModifiedTripSelector` DEVRAIT également inclure un TripUpdate ciblant les clients qui ne prennent pas en charge TripModifications. En d’autres termes, il devrait y avoir deux TripUpdates : une pour les clients avec des voyages modifiés (avec `TripModifications`) et une pour les clients avec le GTFS d’origine non modifié (sans `TripModifications`). 
    * Fournir un TripUpdate avec un `ModifiedTripSelector` est le seul moyen de créer des prédictions aux arrêts de remplacement. 
 * Si aucun TripUpdate de ce type n’est trouvé, les TripUpdates pour le `trip_id` d’origine s’appliqueront au voyage modifié. 
    * Dans ce cas, les informations GTFS statiques utilisées doivent provenir du GTFS statique avant l’application de toute TripModifications. 
     * Des informations en temps réel peuvent être disponibles sur les arrêts communs entre le trajet précédent et le nouveau trajet modifié ; cependant, aucune ETA ne serait disponible aux arrêts de remplacement. 
 
## Modification 
 
 Un message ` Modification` décrit les modifications apportées à chaque trajet concerné à partir de `start_stop_selector`. Il peut y avoir zéro, un ou plusieurs temps d’arrêt remplacés par une « Modification». Les étendues des modifications DOIT pas se chevaucher. Les travées ne peuvent pas être contiguës ; dans ce cas, les deux modifications DOIT être fusionnées en une seule. Ces horaires d’arrêts sont remplacés par un nouveau temps d’arrêt pour chaque arrêt de remplacement décrit par `replacement_stops`. 
 
 La séquence de `replacement_stops` peut être de longueur arbitraire. Par exemple, 3 arrêts pourraient être remplacés par 2, 4 ou 0 arrêts selon la situation. 
 
 ![](/../assets/trip_modification.png) 
 
 _Un exemple montrant l’effet d’une modification sur un voyage particulier. Cette modification peut également s’appliquer à plusieurs autres trajets._ 
 
 ![](/../assets/propagated_delay.png) 
 
 _Les délais de détour propagés affectent tous les arrêts suivant la fin d’une modification. Si un trajet a plusieurs modifications, les retards sont accumulés._ 
 
## ReplacementStop 
 
 Chaque message `ReplacementStop` définit un arrêt qui sera désormais visité par le voyage, et spécifie éventuellement le temps de trajet estimé jusqu’au arrêt. Le message `ReplacementStop` est utilisé pour construire le `stop_time` planifié pour l’arrêt. 
 
 Lorsque `travel_time_to_stop` est spécifié, le `arrival_time` est calculé à partir d’un arrêt de référence dans le trajet d’origine, plus le décalage dans `travel_time_to_stop`. Sinon, le `arrival_time` peut être interpolé en fonction de la durée totale de la modification dans le voyage d’origine. 
 
 Le `departure_time` est toujours égal au `arrival_time`. 
 
 Les champs facultatifs de [`stop_times.txt`](../../../schedule/reference/#stop_timestxt) dans la spécification (CSV) GTFS sont tous définis sur leurs valeurs par défaut. 
 
 ![](/../assets/first_stop_reference.png) 
 
 _Si une modification affecte le premier arrêt du trajet, cet arrêt sert également d’arrêt de référence de la modification._ 
