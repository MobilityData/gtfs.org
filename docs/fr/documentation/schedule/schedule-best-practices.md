# Bonnes pratiques de GTFS Schedule 
 
 Il s’agit de pratiques recommandées pour décrire les services de transport public dans la [General Transit Feed Specification (GTFS)](../reference). Ces pratiques ont été synthétisées à partir de l’expérience des membres du [groupe de travail sur les bonnes pratiques GTFS](#groupe-de-travail-sur-les-bonnes-pratiques-gtfs) et des [bonnes pratiques GTFS pour les applications réutilisatrices](http://www.transitwiki.org/TransitWiki/index.php/Best_practices_for_creating_GTFS). 
 
 Pour plus d’informations, consultez la [Foire aux questions](#foire-aux-questions-faq). 
 
## Structure du document 
 
 Les pratiques sont organisées en quatre sections principales : 
 
 * __[Publication des jeux de données et pratiques générales](#publication-des-jeux-de-donnees-et-pratiques-generales) :__ Ces pratiques concernent la structure globale du jeu de données GTFS et à la manière dont les jeux de données GTFS sont publiés. 
 * __[Bonnes pratiques organisées par fichier](#bonnes-pratiques-organisees-par-fichier) :__ Les recommandations sont organisées par fichier et par champ dans le GTFS pour faciliter la correspondance des pratiques avec la référence officielle du GTFS. 
 * __[Bonnes pratiques organisées par cas](#bonnes-pratiques-organisees-par-cas) :__ Dans des cas particuliers, tels que les itinéraires en boucle, les pratiques peuvent devoir être appliquées à plusieurs fichiers et champs. Ces recommandations sont regroupées dans cette section. 
 
## Publication des jeux de données et pratiques générales 
 
 * Les jeux de données doivent être publiés sur une URL publique et permanente, y compris le nom du fichier zip. (par exemple, www.agence.org/gtfs/gtfs.zip). Idéalement, l’URL devrait être directement téléchargeable sans nécessiter de connexion pour accéder au fichier, afin de faciliter le téléchargement par les applications réutilisatrices. Bien qu’il soit recommandé (et constitue la pratique la plus courante) de rendre un ensemble de données GTFS librement téléchargeable, si un fournisseur de données doit contrôler l’accès à GTFS pour des raisons de licence ou pour d’autres raisons, il est recommandé de contrôler l’accès au jeu de données GTFS à l’aide de clés API. ce qui facilitera les téléchargements automatiques. 
 * Les données GTFS sont publiées par itérations afin qu’un seul fichier situé à un emplacement stable contienne toujours la dernière description officielle du service d’une ou plusieurs agences de transport en commun. 
 * Conserver des identifiants persistants (champs 'id') pour `stop_id`, `route_id` et `agency_id` à travers les itérations de données chaque fois que possible. 
 * Un ensemble de données GTFS doit contenir le service actuel et à venir (parfois appelé ensemble de données « fusionné »). La [fonction de fusion](https://github.com/google/transitfeed/wiki/Merge) peut être utilisée pour créer un ensemble de données fusionné à partir de deux flux GTFS différents. 
    * À tout moment, le jeu de données GTFS publié doit être valide pendant au moins les 7 prochains jours, et idéalement aussi longtemps que l’opérateur est convaincu que l’horaire continuera à être exploité. 
    * Si possible, le jeu de données GTFS doit couvrir au moins les 30 prochains jours de service. 
 * Supprimez les anciens services (calendriers expirés) du flux. 
 * Si une modification de service entre en vigueur dans 7 jours ou moins, exprimez cette modification de service via un flux [GTFS Realtime](../../realtime/reference) (avis de service ou mises à jour de trajet) plutôt qu'un jeu de données GTFS Schedule. 
 * Le serveur Web hébergeant les données GTFS doit être configuré pour signaler correctement la date de modification du fichier (voir [HTTP/1.1- Request for Comments 2616](https://tools.ietf.org/html/rfc2616#section-14.29), en vertu de l’article 14.29). 
 
## Bonnes pratiques organisées par fichier 
 
 Cette section présente les bonnes pratiques organisées par fichier et par champ, en s’alignant sur la [référence GTFS](../reference). 
 
### Tous les fichiers 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Cas mixte | Toutes les chaînes de texte destinées aux clients (y compris les noms d’arrêts, les noms d’itinéraires et les panneaux de signalisation) doivent utiliser une casse mixte (et non en MAJUSCULES), en suivant les conventions locales pour la mise en majuscule des noms de lieux sur les écrans capables d’afficher des caractères minuscules. | 
 | | Exemples : | 
 | | Place Brighton Churchill | 
 | | Villiers-sur-Marne | 
 | | Boulevard du marché | 
 | Abréviations | Évitez d’utiliser des abréviations dans tout le flux pour les noms et autres textes (par exemple, bd pour boulevard), à moins qu’un emplacement ne soit appelé par son nom abrégé (par exemple « Aéroport JFK »). Les abréviations peuvent poser problème en termes d’accessibilité par les logiciels de lecture d’écran et les interfaces utilisateur vocales. Une application réutilisatrice peut être conçue pour convertir de manière fiable des mots complets en abréviations à afficher, mais la conversion d’abréviations en mots complets est sujette à un plus grand risque d’erreur. | 
 
### agency.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `agency_phone` | Doit être inclus à moins qu’aucun numéro de téléphone pour le service client n’existe. | 
 | `agency_email` | Doit être inclus, sauf si aucun e-mail pour le service client n’existe. | 
 | `agency_fare_url` | Doit être inclus, sauf si les services de l'agence sont totalement gratuits. | 
 
 __Exemples :__ 
 
 - Les services de bus sont gérés par plusieurs petites agences de bus. Mais il existe une grande agence qui est responsable de la planification et de la billetterie et, du point de vue de l’utilisateur, est responsable des services de bus. La grande agence doit être définie comme une agence au sein du flux. Même si les données sont réparties en interne par différents petits opérateurs de bus, une seule agence doit être définie dans le flux. 
 
 - Le fournisseur de flux gère le portail de billetterie, mais il existe différentes agences qui exploitent réellement les services et dont les utilisateurs savent qu’elles en sont responsables. Les agences qui exploitent réellement les services doivent être définies comme des agences au sein du flux. 
 
### stops.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `stop_name` | Lorsqu’aucun nom d’arrêt n’est publié, suivez des conventions de dénomination d’arrêt cohérentes dans tout le flux. | | 
 | | Par défaut, `stop_name` ne doit pas contenir de mots génériques ou redondants comme « Station » ou « Arrêt », mais certains cas extrêmes sont autorisés.<ul><li> Lorsqu’il fait réellement partie du nom (Union Station, Central Station)<li> Lorsque le `stop_name` est trop générique (par exemple s’il s’agit du nom de la ville). « Station », « Terminal » ou d’autres termes clarifient le nom de l'arrêt.</ul> | 
 | `stop_lat` et `stop_lon` | Les emplacements des arrêts doivent être aussi précis que possible. Une marge d'erreur de  __pas plus__ de quatre mètres est permise par rapport à la position d’arrêt réelle. | 
 | | Les arrêts doivent être placés au plus près de l'endroit où les passagers embarqueront (c’est-à-dire du bon côté de la rue). | 
 | | Si l’emplacement d’un arrêt est partagé entre des flux de données distincts (c’est-à-dire que deux agences utilisent exactement le même arrêt/installation d’embarquement), indiquez que l’arrêt est partagé en utilisant exactement les mêmes `stop_lat` et `stop_lon` pour les deux arrêts. | 
 | `parent_station` &amp; `location_type` | De nombreuses gares ou terminaux disposent de plusieurs installations d’embarquement (selon le mode, elles peuvent être appelées quai de bus, quai, porte ou autre terme). Dans de tels cas, les producteurs de flux doivent décrire les gares, les installations d’embarquement (également appelées sous-arrêts) et leurs relations.<ul><li> La station ou le terminal doit être défini comme une entrée dans `stops.txt` avec `location_type = 1`.</li><li> Chaque installation d’embarquement doit être définie comme un arrêt avec `location_type = 0`. Le champ `parent_station` doit faire référence au `stop_id` de la gare dans laquelle se trouve l’établissement d’embarquement.</li></ul> |
| | Lorsque vous nommez la gare et les sous-arrêts, définissez des noms bien reconnus par les usagers et qui peuvent aider les usagers à identifier la gare et l’installation d’embarquement (quai de bus, quai, quai, porte, etc.).<table class='example'><thead><tr><th>Nom de la station principale</th><th>Nom du sous-arrêt</th></tr></thead><tbody><tr><td>Gare Union de Chicago</td><td>Quai 19 de la gare Union de Chicago</td></tr><tr><td>Terminal du ferry de San Francisco</td><td>Porte E du terminal du ferry de San Francisco</td></tr><tr><td>Centre de transport en commun du centre-ville</td><td>Centre de transport en commun du centre-ville, baie B</td></tr></tbody></table> | 
 
### routes.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `route_long_name` | La définition de la référence: <q>Ce nom est généralement plus descriptif que « `route_short_name` » et inclut souvent la destination ou l’arrêt de l’itinéraire</q>. Au moins l’un des <code>route_short_name</code> ou <code>route_long_name</code> doit être spécifié, ou potentiellement les deux, le cas échéant. Si la route n’a pas de nom long, veuillez spécifier un <code>route_short_name</code> et utiliser une string vide comme valeur pour ce champ.<br>Exemples de types de noms longs :<table class='example'><thead><tr><th>Nom de l’itinéraire</th><th> Format</th><th>Agence</th></tr></thead><tbody><tr><td> <a href='https://www.sfmta.com/getting-around/transit/routes-stops/n-judah'>«N»/«Judah»</a></td><td><code>route_short_name</code>/<br> <code>route_long_name</code></td><td><a href='https://www.sfmta.com/'>Muni</a>, à San Francisco</td></tr><tr><td><a href='https://trimet.org/schedules/r006.htm'>«6»/«Boulevard ML King Jr»</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='https://trimet.org/'>TriMet</a>, à Portland, Oregon.</td></tr><tr><td><a href='http://www.ratp.fr/informer/pdf/orienter/f_plan.php?nompdf=m6'>«6»/«Nation-Étoile»</a></td><td><code>route_short_name</code>/<br><code>route_long_name</code></td><td><a href='http://www.ratp.fr/'>RATP</a>, à Paris France.</td></tr><tr><td><a href='http://www.bvg.de/images/content/linienverlaeufe/LinienverlaufU2.pdf'>«U2»-«Pankow–Ruhleben»</a></td><td><code>route_short_name</code>-<br><code>route_long_name</code></td><td> <a href='http://www.bvg.de/'>BVG</a>, à Berlin, Allemagne</td></tr></tbody></table><table class='example'><thead><tr><th>Description du service</th></tr></thead><tbody><tr><td><a href='https://128bc.org/schedules/rev-bus-hartwell-area/'>«Navette de la région de Hartwell»</a></td></tr></tbody></table> 
 | | `route_long_name` ne doit pas contenir le `route_short_name`. | 
 | | Incluez la désignation complète, y compris une identité de service, lors du remplissage de `route_long_name`. Exemples:<table class='example'><thead><tr><th>Identité du service</th><th> Recommandation</th><th>Exemples</th></tr></thead><tbody><tr><td> «MAX Light Rail»<br>TriMet, à Portland, Oregon</td><td>Le <code>route_long_name</code> doit inclure la marque (MAX) et la désignation spécifique de l’itinéraire</td><td>"Ligne rouge MAX" "Ligne bleue MAX"</td></tr><tr><td>"Rapid Ride"<br>ABQ Ride, à Albuquerque, Nouveau-Mexique</td><td>Le <code>route_long_name</code> doit inclure la marque (Rapid Ride) et la désignation spécifique de l’itinéraire</td><td>"Ligne rouge Rapid Ride"<br> "Ligne bleue Rapid Ride"</td></tr></tbody></table> 
 | `route_id` | Tous les trajets sur un itinéraire nommé donné doivent faire référence au même `route_id`.<li> Les différentes directions d’un itinéraire ne doivent pas être séparées en différentes valeurs `route_id` .</li><li> Les différentes périodes d’exploitation d’une route ne doivent pas être séparées en différentes valeurs `route_id` (c’est-à-dire ne créez pas d’entrées différentes dans `routes.txt` pour les services « Centre-ville matin » et « Centre-ville après-midi »).</li> | 
 | | Si un groupe de routes comprend des branches nommées distinctement (par exemple 1A et 1B), suivez les recommandations dans le cas route [branches](#branches) pour déterminer `route_short_name` et `route_long_name`. | 
 | `route_color` &amp; `route_text_color` | Doit être cohérent avec la signalisation et les informations client imprimées et en ligne (et donc non incluses si elles n’existent pas ailleurs). | 
 
### trips.txt 
 
 * __Voir cas particulier pour les itinéraires en boucle :__ Les itinéraires en boucle sont des cas où les trajets commencent et se terminent au même arrêt, par opposition aux itinéraires linéaires, qui ont deux terminus distincts. Les itinéraires en boucle doivent être décrits selon des pratiques spécifiques. [Voir Cas d’itinéraire en boucle.](#lignes-en-boucle) 
 * __Voir cas particulier pour les itinéraires en lasso :__ Les itinéraires en lasso sont un hybride de géométries linéaires et en boucle, dans lesquelles les véhicules circulent en boucle sur une partie seulement de l’itinéraire. Les itinéraires du lasso doivent être décrits selon des pratiques spécifiques. [Voir le cas de la route Lasso.](#lignes-lasso) 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `trip_headsign` | Ne fournissez pas de noms d’itinéraire (correspondant à `route_short_name` et `route_long_name`) dans les champs `trip_headsign` ou `stop_headsign`. | 
 | | Doit contenir la destination, la direction et/ou tout autre texte de désignation de voyage indiqué sur la girouette du véhicule qui peut être utilisé pour distinguer les voyages sur un itinéraire. La cohérence avec les informations de direction affichées sur le véhicule est l’objectif principal et primordial pour déterminer les valeurs fournies dans les jeux de données GTFS. D’autres informations ne doivent être incluses que si elles ne compromettent pas cet objectif principal. Si les girouettes changent au cours d’un voyage, remplacez `trip_headsign` par `stop_times.stop_headsign`. Vous trouverez ci-dessous des recommandations pour certains cas possibles : | 
 | |<table class="example"><thead><tr><th> Description de l’itinéraire</th><th> Recommandation</th></tr></thead><tbody><tr><td> 2A. Destination uniquement</td><td> Indiquez la destination du terminus, par exemple "Transit Center", "Portland City Center" ou "Jantzen Beach".</td></tr><tr><td> 2B. Destinations avec points de passage</td><td> &lt;destination> via &lt;point de passage>, par exemple « Highgate via Charing Cross ». Si des points de passage sont supprimés de la girouette affichée aux passagers une fois que le véhicule a dépassé ces points de passage, utilisez <code>stop_times.stop_headsign</code> pour définir une girouette mise à jour.</td></tr><tr><td> 2C. Nom de lieu régional avec arrêts locaux</td><td> S’il y a plusieurs arrêts dans la ville ou l’arrondissement de destination, utilisez <code>stop_times.stop_headsign</code> une fois la ville de destination atteinte.</td></tr><tr><td> 2D. Direction uniquement</td><td> Indiquez-le en utilisant des termes tels que « vers le nord », « entrant », « dans le sens des aiguilles d’une montre » ou des directions similaires.</td></tr><tr><td> 2E. Direction avec destination</td><td> &lt;direction> vers &lt;destination>, par exemple « En direction sud vers San Jose ».</td></tr><tr><td> 2F. Direction avec destination et points de passage</td><td> &lt;direction> via &lt;point de passage> jusqu’à &lt;destination>, par exemple « En direction nord via Charing Cross jusqu’à Highgate ».</td></tr></tbody></table> | 
 | | Ne commencez pas un bandeau par les mots « Vers » ou « Vers ». | 
 | `direction_id` | Utilisez les valeurs 0 et 1 de manière cohérente dans tout le jeu de données, c’est à dire :<ul><li> Si 1 = sortant sur l’itinéraire rouge, alors 1 = sortant sur l’itinéraire vert</li><li> Si 1 = en direction nord sur la route X, alors 1 = en direction nord sur la route Y</li><li> Si 1 = dans le sens des aiguilles d’une montre sur la route X alors 1 = dans le sens des aiguilles d’une montre sur la route Y</li></ul> | 
 | `bikes_allowed` | Pour les voyages en ferry, soyez explicite sur le fait que les vélos sont autorisés (ou non), car éviter les voyages en ferry en raison de données manquantes entraîne généralement de grands détours. | 
 
### stop_times.txt 
 
 Itinéraires en boucle : les itinéraires en boucle nécessitent des considérations spéciales en matière de `stop_times`. (Voir : [Cas d’itinéraire en boucle](#lignes-en-boucle)) 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `pickup_type` et `drop_off_type` | Les trajets "sans voyageur" qui ne fournissent pas de service aux passagers doivent être marqués avec `pickup_type` et `drop_off_type` d’une valeur de `1` pour toutes les lignes `stop_times`. 
 | | Pour les trajets qui prennent des passagers, les « points de synchronisation » internes qui servent à assurer le passage à l'heure prévue et d’autres endroits tels que les garages dans lesquels un passager ne peut pas monter à bord doivent être marqués avec `pickup_type = 1` (pas de prise en charge disponible) et `drop_off_type = 1` (pas de dépôt disponible). | 
 | `arrival_time` et `departure_time` | Les champs `arrival_time` et `departure_time` doivent spécifier des valeurs de temps dans la mesure du possible, y compris des temps estimés ou interpolés non dépendants. | 
 | `stop_headsign` | En général, les valeurs des girouettes doivent également correspondre aux panneaux présents dans les gares.<br><br> Dans les cas ci-dessous, « Southbound » induirait les clients en erreur car il n’est pas utilisé dans les panneaux des gares. 
 | |<table class="example"><thead><tr><th colspan="2"> À New York, pour les 2 en direction sud :</th></tr><tr><th> Pour les entrées <code>stop_times.txt</code> :</th><th> Utilisez la valeur <code>stop_headsign</code> :</th></tr></thead><tbody><tr><td> Jusqu’à ce que Manhattan soit atteint</td><td> <code>Manhattan &amp; Brooklyn</code></td></tr><tr><td> Jusqu’à ce que le centre-ville soit atteint</td><td> <code>Downtown &amp; Brooklyn</code></td></tr><tr><td> Jusqu’à ce que Brooklyn soit atteint</td><td> <code>Brooklyn</code></td></tr><tr><td> Une fois Brooklyn atteint</td><td> <code>Brooklyn (New Lots Av)</code></td></tr></tbody></table> | 
 | |<table class="example"><thead><tr><th colspan="2"> À Boston, pour la ligne rouge en direction sud, pour l’agence Braintree :</th></tr><tr><th> Pour les entrées <code>stop_times.txt</code> :</th><th> Utilisez la valeur <code>stop_headsign</code> :</th></tr></thead><tbody><tr><td> Jusqu’à ce que le centre-ville soit atteint</td><td> <code>Inbound to Braintree</code></td></tr><tr><td> Une fois le centre-ville atteint</td><td> <code>Braintree</code></td></tr><tr><td> Après le centre-ville</td><td> <code>Outbound to Braintree</code></td></tr></tbody></table> | 
 
### calendar.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | `calendar.service_name` peut augmenter la lisibilité humaine de GTFS, bien que cela ne soit pas adopté dans la spécification. | 
 
### calendar_dates.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | `calendar.service_name` peut augmenter la lisibilité humaine de GTFS, bien que cela ne soit pas adopté dans la spécification.| 
 
### fare_attributes.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | | Si un système tarifaire ne peut pas être modélisé avec précision, évitez toute confusion supplémentaire et laissez ce champ vide. | 
 | | Incluez les tarifs (`fare_attributes.txt` et `fare_rules.txt`) et modélisez-les aussi précisément que possible. Dans les cas extrêmes où les tarifs ne peuvent pas être modélisés avec précision, le tarif doit être représenté comme plus cher plutôt que moins cher afin que les clients ne tentent pas d’embarquer avec un tarif insuffisant. Si la grande majorité des tarifs ne peuvent pas être modélisés correctement, n’incluez pas d’informations tarifaires dans le flux. | 
 
### fare_rules.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | Si un système tarifaire ne peut pas être modélisé avec précision, évitez toute confusion supplémentaire et laissez ce champ vide. | 
 | | Incluez les tarifs (`fare_attributes.txt` et `fare_rules.txt`) et modélisez-les aussi précisément que possible. Dans les cas extrêmes où les tarifs ne peuvent pas être modélisés avec précision, le tarif doit être représenté comme plus cher plutôt que moins cher afin que les clients ne tentent pas d’embarquer avec un tarif insuffisant. Si la grande majorité des tarifs ne peuvent pas être modélisés correctement, n’incluez pas d’informations tarifaires dans le flux. | 
 
### shapes.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | Idéalement, pour les tracés partagés (c’est-à-dire dans le cas où les Lignes 1 et 2 fonctionnent sur le même segment de route ou de voie), la partie partagée du tracé devrait correspondre exactement. Cela contribue à faciliter une cartographie des transports en commun de haute qualité.<!-- (77) --> 
 | | Les tracés partagés doivent suivre la ligne médiane de la route sur laquelle circule le véhicule. Il peut s’agir soit de la ligne centrale de la rue s’il n’y a pas de voies désignées, soit de la ligne centrale du côté de la chaussée qui se déplace dans la direction où se déplace le véhicule.<br><br> Les tracés partagés ne doivent pas « s’éloigner » d’un arrêt de trottoir, d’un quai ou d’un emplacement d’embarquement. | 
 | `shape_dist_traveled` | Le champ `shape_dist_traveled` permet à l’agence de préciser exactement comment les arrêts du fichier `stop_times.txt` s’inscrivent dans leur forme respective. Une valeur courante à utiliser pour le champ `shape_dist_traveled` est la distance depuis le début de la forme parcourue par le véhicule (pensez à quelque chose comme une lecture d’un compteur kilométrique).<li> Les tracés d’itinéraires (dans `shapes.txt`) doivent se trouver à moins de 100 mètres des emplacements d’arrêt desservis par un trajet.</li><li> Simplifiez les alignements afin que <code>shapes.txt</code> ne contienne pas de points superflus (c’est-à-dire, supprimez les points supplémentaires sur les segments de ligne droite ; voir la discussion sur le problème de simplification des lignes).</li> 
 
### frequencies.txt 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | Les horaires d’arrêts réels sont ignorés pour les trajets référencés par `frequencies.txt`; seuls les intervalles de temps de trajet entre les arrêts sont significatifs pour les déplacements basés sur la fréquence. Pour plus de clarté et de lisibilité humaine, il est recommandé que la première heure d’arrêt d’un trajet référencé dans `frequencies.txt` commence à 00:00:00 (première valeur `arrival_time` de 00:00:00). | 
 | `block_id` | Peut être fourni pour des déplacements basés sur la fréquence. | 
 
### transfers.txt 
 
 `transfers.transfer_type` peut être l’une des quatre valeurs [définies dans le GTFS](../reference/#transferstxt). Ces définitions de `transfer_type` sont tirées de la spécification GTFS ci-dessous, avec des bonnes pratiques supplémentaires. 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `transfer_type` | <q>0 ou (vide) : Il s’agit d’un point de transfert recommandé entre les itinéraires.</q><br> S’il existe plusieurs possibilités de transfert incluant une option supérieure (c’est-à-dire un centre de transit doté de commodités supplémentaires ou une gare avec des installations/plateformes d’embarquement adjacentes ou connectées), précisez un point de transfert recommandé. | 
 | | <q>1 : Il s’agit d’un point de transfert chronométré entre deux itinéraires. Le véhicule au départ doit attendre celui qui arrive, en laissant suffisamment de temps au passager pour effectuer le transfert entre les itinéraires.</q><br> Ce type de transfert remplace un intervalle requis pour effectuer des transferts de manière fiable. À titre d’exemple, Google Maps suppose que les passagers ont besoin de 3 minutes pour effectuer un transfert en toute sécurité. D’autres applications peuvent adopter d’autres valeurs par défaut. | 
 | | <q>2 : Ce transfert nécessite un minimum de temps entre l’arrivée et le départ pour assurer une correspondance. Le temps requis pour le transfert est spécifié par <code>min_transfer_time</code> .</q><br> Spécifiez le temps de transfert minimum s’il y a des obstacles ou d’autres facteurs qui augmentent le temps de trajet entre les arrêts. | 
 | | <q>3 : Les transferts ne sont pas possibles entre les itinéraires à cet endroit.</q><br> Précisez cette valeur si les transferts ne sont pas possibles en raison d’obstacles physiques, ou s’ils sont rendus dangereux ou compliqués par des passages à niveau difficiles ou des lacunes dans le réseau piétonnier. | 
 | | Si les transferts à bord (en bloc) sont autorisés entre les voyages, le dernier arrêt du voyage à l’arrivée doit être le même que le premier arrêt du voyage au départ. | 
 
 
## Bonnes pratiques organisées par cas 
 
 Cette section couvre des cas particuliers ayant des implications dans plusieurs fichiers et champs. 
 
### Lignes en boucle 
 
 Sur les itinéraires en boucle, les trajets des véhicules commencent et se terminent au même endroit (parfois un centre de transit ou de transfert). Les véhicules fonctionnent généralement en continu et permettent aux passagers de rester à bord pendant que le véhicule poursuit sa boucle. 

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/loop-route.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"> 
 
 Les recommandations des girouettes doivent donc être appliquées afin d’indiquer aux usagers la direction dans laquelle va le véhicule. 
 
 Pour indiquer le changement de direction de déplacement, fournissez `stop_headsigns` dans le fichier `stop_times.txt`. Le `stop_headsign` décrit la direction des trajets au départ de l’arrêt pour lequel il est défini. L’ajout de `stop_headsigns` à chaque arrêt d’un voyage vous permet de modifier les informations de la girouette tout au long du voyage. 
 
 Ne définissez pas un seul trajet circulaire dans le fichier stop_times.txt pour un itinéraire qui fonctionne entre deux points d’arrivée (par exemple lorsque le même bus fait l’aller et le retour). Au lieu de cela, divisez le voyage en deux directions distinctes. 
 
 __Exemples de modélisation de trajet circulaire :__ 
 
 - Trajet circulaire avec changement de girouette à chaque arrêt 
 
| trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "B"           |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "C"           |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "D"           |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "E"           |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "A"           |
| trip_1  | 06:35:00     | 06:35:00       | stop_A  | 6             | ""            |
 
 - Voyage circulaire avec deux girouettes 
 
 | trip_id | arrival_time | departure_time | stop_id | stop_sequence | stop_headsign |
|---------|--------------|----------------|---------|---------------|---------------|
| trip_1  | 06:10:00     | 06:10:00       | stop_A  | 1             | "sortant"    |
| trip_1  | 06:15:00     | 06:15:00       | stop_B  | 2             | "sortant"    |
| trip_1  | 06:20:00     | 06:20:00       | stop_C  | 3             | "sortant"    |
| trip_1  | 06:25:00     | 06:25:00       | stop_D  | 4             | "entrant"     |
| trip_1  | 06:30:00     | 06:30:00       | stop_E  | 5             | "entrant"     |
| trip_1  | 06:35:00     | 06:35:00       | stop_F  | 6             | "entrant"     |
| trip_1  | 06:40:00     | 06:40:00       | stop_A  | 7             | ""            |
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `voyages.trip_id `| Modélisez l’aller-retour complet de la boucle avec un seul trajet. | 
 | `stop_times.stop_id` | Incluez le premier/dernier arrêt deux fois dans `stop_times.txt` pour le trajet qui est une boucle. Exemple ci-dessous. Souvent, un itinéraire en boucle peut inclure un premier et un dernier trajet qui ne parcourent pas la totalité de la boucle. Incluez également ces voyages.<table class="example"><thead><tr><th> <code>trip_id</code></th><th> <code>stop_id</code></th><th> <code>stop_sequence</code></th></tr></thead><tbody><tr><td> 9000</td><td> 101</td><td> 1</td></tr><tr><td> 9000</td><td> 102</td><td> 2</td></tr><tr><td> 9000</td><td> 103</td><td> 3</td></tr><tr><td> 9000</td><td> 101</td><td> 4</td></tr></tbody></table> | 
 | `trips.direction_id` | Si la boucle fonctionne dans des directions opposées (c’est-à-dire dans le sens horaire et antihoraire), alors désignez `direction_id` comme `0` ou `1`. | 
 | `trips.block_id` | Indiquez les déplacements en boucle continue avec le même `block_id`. | 
 
### Lignes Lasso 
 
 Les itinéraires Lasso combinent les aspects d’un itinéraire en boucle et d’un itinéraire directionnel. 

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/lasso-route.svg" width=140px style="display: block; margin-left: auto; margin-right: auto;"> 
 
 | Exemples : | 
 |--------| 
 | Lignes de métro ([Chicago](https://www.transitchicago.com/assets/1/6/ctamap_Lsystem.pdf)) | 
 | Lignes de bus de la banlieue au centre-ville ([St. Albert](https://stalbert.ca/uploads/PDF-infosheets/RideGuide-201-207_Revised_Oct_2017.pdf) ou [Edmonton](http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf)) | 
 | Ligne marron du CTA ([Site Web du CTA](http://www.transitchicago.com/brownline/) et [TransitFeeds](https://transitfeeds.com/p/chicago-transit-authority/165/latest/route/Brn )) | 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | `trips.trip_id` | L’étendue complète d’un « aller-retour de véhicule » (voir l’illustration [ci-dessus](#lignes-lasso)) consiste en un voyage de A à B à B et retour à A. Un aller-retour complet de véhicule peut être exprimé par :<li> __Une seule__ valeur/entrée `trip_id` dans `trips.txt`</li><li> __Plusieurs__ valeurs/entrées `trip_id` dans `trips.txt`, avec un déplacement continu indiqué par `block_id`.</li> | 
 | `stop_times.stop_headsign` | Les arrêts le long du tronçon AB seront traversés dans les deux sens. `stop_headsign` facilite la distinction de la direction du déplacement. Par conséquent, il est recommandé de fournir `stop_headsign` pour ces trajets.<table class="example"><thead><tr><th> Exemples:</th></tr></thead><tbody><tr><td> "A via B"</td></tr><tr><td> "A"</td></tr></tbody></table><table class="example"><thead><tr><th> <a href="http://www.transitchicago.com/purpleline/">Ligne violette</a> de la Chicago Transit Authority</th></tr></thead><tbody><tr><td> "En direction sud vers la boucle"</td></tr><tr><td> "En direction nord via la boucle"</td></tr><tr><td> "En direction nord vers Linden"</td></tr></tbody></table><table class="example"><thead><tr><th> Lignes de bus du service de transport en commun d’Edmonton, ici <a href="http://webdocs.edmonton.ca/transit/route_schedules_and_maps/future/RT039.pdf">le 39</a></th></tr></thead><tbody><tr><td> "Rutherford"</td></tr><tr><td> "Century Park"</td></tr></tbody></table> 
 | `trip.trip_headsign` | Le `trip_headsign` doit être une description globale du voyage, telle qu’elle apparaît dans les horaires. Cela pourrait être « Linden to Linden via Loop » (exemple de Chicago) ou « A to A via B » (exemple générique). | 
 
### Branches 
 
 Certains itinéraires peuvent inclure des branches. Les tracés et les arrêts sont partagés entre ces branches, mais chacune dessert également des arrêts et des sections de tracé distinctes. La relation entre les branches peut être indiquée par le(s) nom(s) d’itinéraire, les girouettes et le nom abrégé du trajet en utilisant les directives supplémentaires ci-dessous. 

 <img src="https://raw.githubusercontent.com/MobilityData/GTFS_Schedule_Best-Practices/master/en/branching.svg" width=250px style="display: block; margin-left: auto; margin-right: auto;"> 
 
 | Nom du champ | Recommandation | 
 |---|---| 
 | Tous les champs | Lors de la dénomination des itinéraires secondaires, il est recommandé de suivre d’autres documents d’information pour les passagers. Vous trouverez ci-dessous des descriptions et des exemples de deux cas : | 
 | | Si les horaires et la signalisation sur rue représentent deux itinéraires nommés distinctement (par exemple 1A et 1B), présentez-les comme tels dans le GTFS, en utilisant le `route_short_name` et/ou champs `route_long_name`. Exemple : GoDurham Transit [itinéraires 2, 2A et 2B](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) partagent un tracé commun sur la majorité de l’itinéraire, mais ils varient sous plusieurs aspects différents.<ul><li> La route 2 est un service de base, fonctionnant la plupart des heures.</li><li> L’itinéraire 2 comprend une déviation la nuit, les dimanches et les jours fériés de la rue Principale.</li><li> Les Lignes 2A et 2B fonctionnent pendant la journée du lundi au samedi.</li><li> La route 2B dessert des arrêts supplémentaires dans une déviation du tracé partagé.</li></ul> | 
 | | Si les informations fournies par l’agence décrivent les branches avec le même nom d'itinéraire, utilisez les champs `trips.trip_headsign`, `stop_times.stop_headsign` et/ou `trips.trip_short_name`. Exemple : GoTriangle [route 300](https://gotriangle.org/sites/default/files/brochure/godurham-route2-2a-2b_1.pdf) se déplace vers différents endroits en fonction de l’heure de la journée. Pendant les heures de pointe, des trajets supplémentaires sont ajoutés à l’itinéraire standard pour accueillir les travailleurs entrant et sortant de la ville. | 
 
## Foire aux questions (FAQ) 
 
### Pourquoi ces bonnes pratiques GTFS sont-elles importantes ? 
 
 Les objectifs des bonnes pratiques GTFS sont : 
 
 * Améliorer l’expérience client de l’utilisateur final dans les applications de transports publics 
 * Prendre en charge une large interopérabilité des données pour permettre aux développeurs de logiciels de déployer et de faire évoluer plus facilement des applications, des produits, et services 
 * Faciliter l’utilisation de GTFS dans diverses catégories d’applications (au-delà de son objectif initial sur la planification de voyage) 
 
 Sans bonnes pratiques GTFS coordonnées, diverses applications consommatrices de GTFS peuvent établir des exigences et des attentes de manière non coordonnée, ce qui conduit à des exigences divergentes et à des jeux de données spécifiques aux applications et à une interopérabilité moindre. Avant la publication des bonnes pratiques, il y avait une plus grande ambiguïté et un plus grand désaccord sur ce qui constitue des données GTFS correctement formées. 
 
### Comment ont-elles été élaborées ? Qui les a développées ? 
 
 Ces bonnes pratiques ont été développées par un groupe de travail de 17 organisations impliquées dans GTFS, y compris des fournisseurs d’applications et des consommateurs de données, des fournisseurs de transport en commun et des consultants largement impliqués dans GTFS. Le groupe de travail a été convoqué et animé par le [Rocky Mountain Institute](http://www.rmi.org/mobility). 
 
 Les membres du groupe de travail ont voté sur chaque bonne pratique. La plupart des bonnes pratiques ont été approuvées à l’unanimité. Dans une minorité de cas, les bonnes pratiques ont été approuvées par une grande majorité d’organisations. 
 
### Pourquoi ne pas simplement changer la référence GTFS ? 
 
 Bonne question ! Le processus d’examen de la spécification, de l’utilisation des données et des besoins a en effet déclenché certaines modifications de la spécification (voir [Pull Requests fermées dans GitHub](https://github.com/google/transit/pulls?q=is%3Apr+is%3Aclosed)). 
 Les modifications de la référence GTFS sont soumises à un niveau d’examen et de commentaires plus élevé que les bonnes pratiques. Certaines bonnes pratiques sont mergées dans la spécification en fonction de leur niveau d’adoption et du consensus communautaire. À terme, toutes les bonnes pratiques GTFS pourraient faire partie de la référence principale GTFS. 
 
### Comment vérifier la conformité à ces bonnes pratiques ? 
 
 Le validateur de GTFS Schedule canonique vérifie la conformité par rapport à ces bonnes pratiques. Vous pouvez en savoir plus sur cet outil de validation sur la [page de validation](../../../getting_started/validate). 
 
### Je représente une agence de transport. Quelles mesures puis-je prendre pour que nos fournisseurs de services logiciels suivent ces bonnes pratiques ? 
 
 Référez votre fournisseur de services logiciels à ces bonnes pratiques. Nous vous recommandons de référencer l’URL des bonnes pratiques GTFS, ainsi que la référence de GTFS de base lors de l’achat de logiciels produisant du GTFS. 
 
### Que dois-je faire si je remarque qu’un flux de données GTFS n’est pas conforme à ces bonnes pratiques ? 
 
Cherchez le point de contact du flux dans les champs [feed_contact_email ou feed_contact_url](https://github.com/google/transit/pull/31/files) dans * feed_info.txt* s’ils existent, ou en recherchant les coordonnées sur le site Web de l’agence de transport ou du producteur de flux. Lorsque vous communiquez le problème au producteur de flux, fournissez le lien vers la bonne pratique GTFS spécifique. (Voir ["Lien vers ce document"](#lien-vers-ce-document)). 
 
### Comment m’impliquer ? 
 
 E-mail [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org). 
 
## À propos de ce document

### Objectifs 
 
 Les objectifs du maintien des bonnes pratiques GTFS sont les suivants : 
 
 * Prendre en charge une plus grande interopérabilité des données de transit 
 * Améliorer l'expérience cliente dans les applications de transports publics 
 * Faciliter le déploiement et la mise à l’échelle des applications, des produits et des services pour les développeurs de logiciels 
 * Faciliter l’utilisation de GTFS dans diverses catégories d’applications (au-delà de son objectif initial sur la planification de voyage) 
 
# Comment proposer ou modifier les bonnes pratiques GTFS publiées 
 
 Les bonnes pratiques sont en cours de merge dans la spécification. Si vous souhaitez suggérer une nouvelle bonne pratique, veuillez accéder au [répertoire GitHub de référence GTFS](https://github.com/google/transit/) pour ouvrir une issue ou créer une Pull Request, ou contacter [specifications@mobilitydata.org](mailto:specifications@mobilitydata.org). 
 
### Lien vers ce document 
 
 Veuillez créer un lien vers cette page afin de fournir aux producteurs de flux des conseils pour la production correcte des données GTFS. Chaque recommandation individuelle a un lien d’ancrage. Cliquez sur la recommandation pour obtenir l’URL du lien d’ancrage dans la page. 
 
 Si une application consommant du GTFS formule des exigences ou des recommandations concernant les pratiques en matière de données GTFS qui ne sont pas décrites ici, il est recommandé de publier un document contenant ces exigences ou recommandations pour compléter ces bonnes pratiques communes. 
 
### Groupe de travail sur les bonnes pratiques GTFS 
 
 Le groupe de travail sur les bonnes pratiques GTFS a été convoqué par le [Rocky Mountain Institute](http://rmi.org/) en 2016-2017, composé de fournisseurs de transports publics, développeurs d’applications consommant du GTFS, consultants et organisations universitaires pour définir des pratiques et des attentes communes concernant les données GTFS. 
 Les membres de ce groupe de travail comprenaient : 
 
 * [Cambridge Systematics](https://www.camsys.com/) 
 * [Capital Metro](https://www.capmetro.org/)
 * [Centre de recherche sur les transports urbains de l’Université de Floride du Sud](https://www.cutr.usf.edu/) 
 * [Conveyal](http://conveyal.com/) 
 * [Google](https://www.google.com/) 
 * [Groupe IBI](http://www.ibigroup.com/) 
 * [Mapzen](https://mapzen.com/) 
 * [Microsoft](https://www.microsoft.com/) 
 * [Moovel](https://www.moovel.com/) 
 * [Département des transports de l’Oregon](http://www.oregon.gov/odot/) 
 * [Swiftly](https://goswift.ly/) 
 * [Transit](https://transitapp.com/) 
 * [Trillium](http://trilliumtransit.com/) 
 * [TriMet](https://trimet.org/) 
 * [Banque mondiale](http://www.worldbank.org/) 
 
 Aujourd’hui, ce document est maintenu par [MobilityData](http://mobilitydata.org/). 
 