## Référence de General Transit Feed Specification 
 
 **Révisé le 16 août 2024. Voir [Historique des révisions](../change_history/revision_history) pour plus de détails.** 
 
 Ce document définit le format et la structure de les fichiers qui composent un jeu de données GTFS. 
 
## Table des matières 
 
 1. [Conventions du document](#conventions-du-document) 
 2. [Fichiers du jeu de données](#fichiers-du-jeu-de-donnees) 
 3. [Exigences relatives aux fichiers](#exigences-relatives-aux-fichiers) 
 4. [Publication des jeux de données et pratiques générales](#publication-des-jeux-de-donnees-et-pratiques-generales) 
 5. [Définitions des champs](#definitions-des-champs) 
 - [agency.txt](#agencytxt) 
 - [stops.txt](#stopstxt) 
 - [routes.txt](#routestxt) 
 - [trips.txt](#tripstxt) 
 - [stop\_times.txt](#stop_timestxt) 
 - [calendar.txt](#calendartxt) 
 - [calendar\_dates.txt](#calendar_datestxt) 
 - [fare\_attributes.txt](#fare_attributestxt) 
 - [fare\_rules.txt](#fare_rulestxt) 
 - [timeframes.txt](#timeframestxt) 
 - [fare\_media.txt](#fare_mediatxt) 
 - [fare\_products.txt](#fare_productstxt) 
 - [tarif\ _leg\_rules.txt](#fare_leg_rulestxt) 
 - [fare\_transfer\_rules.txt](#fare_transfer_rulestxt) 
 - [areas.txt](#areastxt) 
 - [stop_areas.txt](#stop_areastxt) 
 - [networks.txt](#networkstxt) 
 - [route_networks.txt](#route_networkstxt) 
 - [shapes.txt](#shapestxt) 
 - [frequencies.txt](#frequenciestxt) 
 - [transfers.txt](#transferstxt) 
 - [pathways.txt](#pathwaystxt) 
 - [levels.txt](#levelstxt) 
 - [location_groups.txt](#location_groupstxt) 
 - [location_group_stops.txt](#location_group_stopstxt) 
 - [locations.geojson](#locationsgeojson) 
 - [booking_rules.txt](#booking_rulestxt) 
 - [translations.txt](#translationstxt) 
 - [flux\ _info.txt](#feed_infotxt) 
 - [attributions.txt](#attributionstxt) 
 
## Conventions du document 
 Les mots clés "DOIT", "NE DOIT PAS", "OBLIGATOIRE", "DEVRA", "NE DEVRA PAS", "DEVRAIT", "NE DEVRAIT PAS", "RECOMMANDÉ", "PEUT" et "OPTIONNELLE" dans ce document doivent être interprétés comme décrit dans la [RFC 2119](https://tools.ietf.org/html/rfc2119). 
 
 
### Définitions des termes 
 
 Cette section définit les termes utilisés tout au long de ce document. 
 
 * **Jeu de données** - Un ensemble complet de fichiers définis par cette référence de spécification. La modification du jeu de données crée une nouvelle version du jeu de données. Les jeux de données doivent être publiés à une URL publique et permanente, incluant le nom du fichier zip. (par exemple, https://www.agence.org/gtfs/gtfs.zip). 
 * **Entrée** - Une structure de données de base composée d’un certain nombre de valeurs de champs décrivant une seule entité (par exemple, agence de transport en commun, arrêt, itinéraire, etc.). Représenté, dans un tableau, sous forme de ligne. 
 * **Champ** - Une propriété d’un objet ou d’une entité. Représenté, dans un tableau, sous forme de colonne. Le champ existe s’il est ajouté dans un fichier en tant qu’en-tête. Il peut ou non avoir des valeurs de champ définies. 
 * **Valeur du champ** - Une entrée individuelle dans un champ. Représenté, dans un tableau, comme une seule cellule. 
 * **Jour de service** - Un jour de service est une période de temps utilisée pour indiquer la planification des itinéraires. La définition exacte du jour de service varie d’une agence à l’autre, mais les jours de service ne correspondent souvent pas aux jours calendaires. Une journée de service peut dépasser 24h00 si le service commence un jour et se termine un jour suivant. Par exemple, un service qui fonctionne de 08:00:00 le vendredi à 02:00:00 le samedi pourrait être indiqué comme fonctionnant de 08:00:00 à 26:00:00 un seul jour de service. 
 * **Champ de synthèse vocale** - Le champ doit contenir les mêmes informations que son champ parent (sur lequel il se rabat s’il est vide). Il est destiné à être lu comme une synthèse vocale, par conséquent, l’abréviation doit être soit supprimée (« St » doit être lu comme « Rue » ou « Saint » ; « Elizabeth I » doit être « Elizabeth la première ») ou conservé pour être lu tel quel ("JFK Airport" est dit en abrégé). 
 * **Tronçon** - Voyage au cours duquel un passager embarque et descend entre deux emplacements au cours d’un voyage. 
 * **Voyage** - Voyage global de l’origine à la destination, y compris tous les tronçons et transferts intermédiaires. 
 * **Sous-voyage** - Deux tronçons ou plus qui constituent un sous-ensemble d’un voyage. 
 * **Produit tarifaire** - Produits tarifaires achetables qui peuvent être utilisés pour payer ou valider un voyage. 
 
### Présence 
 Conditions de présence applicables aux champs et fichiers : 
 
 * **Requis** - Le champ ou le fichier doit être inclus dans le jeu de données et contenir une valeur valide pour chaque entrée. 
 * **Optionnel** - Le champ ou le fichier peut être omis du jeu de données. 
 * **Requis sous condition** - Le champ ou le fichier doit être inclus dans les conditions décrites dans la description du champ ou du fichier. 
 * **Interdit sous condition** - Le champ ou le fichier ne doit pas être inclus dans les conditions décrites dans la description du champ ou du fichier. 
 * **Recommandé** - Le champ ou le fichier peut être omis du jeu de données, mais il est recommandé de l’inclure. Avant d’omettre ce champ ou ce fichier, les bonnes pratiques doivent être soigneusement évaluées et toutes les implications d’une omission doivent être comprises. 
 
### Types de champs

- **Couleur** - Une couleur codée sous la forme d’un nombre hexadécimal à six chiffres. Reportez-vous à [https://htmlcolorcodes.com](https://htmlcolorcodes.com) pour générer une valeur valide (le «# » initial ne doit pas être inclus).<br> *Exemple : `FFFFFF` pour le blanc, `000000` pour le noir ou `0039A6` pour les lignes A,C,E dans NYMTA.* 
 - **Code de devise** - Un code de devise alphabétique ISO 4217. Pour la liste des devises actuelles, reportez-vous à [https://en.wikipedia.org/wiki/ISO_4217#Active\_codes](https://en.wikipedia.org/wiki/ISO_4217#Active_codes).<br> *Exemple : « `CAD` » pour les dollars canadiens, « `EUR` » pour les euros ou « `JPY` » pour le yen japonais.* 
 - **Montant en devise** - Une valeur décimale indiquant un montant en devise. Le nombre de décimales est spécifié par [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217#Active_codes) pour le code monétaire associé. Tous les calculs financiers doivent être traités sous forme décimale, monétaire ou tout autre type équivalent adapté aux calculs financiers en fonction du langage de programmation utilisé pour consommer les données. Le traitement des montants en devises sous forme de float est découragé en raison des gains ou des pertes d’argent lors des calculs. 
 - **Date** - Jour de service au format AAAAMMJJ. Étant donné que l’heure d’une journée de service peut être supérieure à 24:00:00, une journée de service peut contenir des informations pour le(s) jour(s) suivant(s).<br> *Exemple : « 20180913 » pour le 13 septembre 2018.* 
 - **E-mail** - Une adresse e-mail.<br> *Exemple : `example@example.com`* 
 - **Enum** - Une option parmi un ensemble de constantes prédéfinies définies dans la colonne "Description".<br> *Exemple : Le champ `route_type` contient un `0` pour le tramway, un `1` pour le métro...* 
 - **ID** - Une valeur de champ ID est un identifiant interne, non destiné à être montré aux passagers, et est une séquence de n’importe quel caractère UTF-8. Il est recommandé d’utiliser uniquement des caractères ASCII imprimables. Un identifiant est appelé "Clé primaire" lorsqu’il doit être unique au sein d’un fichier. Les identifiants définis dans un fichier.txt sont souvent référencés dans un autre fichier.txt. Les identifiants qui font référence à un identifiant dans une autre table sont étiquetés "Clé étrangère".<br> *Exemple : Le champ `stop_id` dans [stops.txt](#stopstxt) est une "Clé primaire". Le champ `parent_station` dans [stops.txt](#stopstxt) est une "Clé étrangère faisant référence à `stops.stop_id`".* 
 - **Code de langue** - Un code de langue IETF BCP 47. Pour une introduction à l’IETF BCP 47, reportez-vous à [http://www.rfc-editor.org/rfc/bcp/bcp47 .txt](http://www.rfc-editor.org/rfc/bcp/bcp47 .txt) et [http://www.w3.org/International/articles/langage-tags/](http:).<br> *Exemple : `en` pour l’anglais, `en-US` pour l’anglais américain ou `de` pour l’allemand.* 
 - **Latitude** - Latitude WGS84 en degrés décimaux. La valeur doit être supérieure ou égale à -90,0 et inférieure ou égale à 90,0. *<br> Exemple : « 41.890169 » pour le Colisée de Rome.* 
 - **Longitude** - Longitude WGS84 en degrés décimaux. La valeur doit être supérieure ou égale à -180,0 et inférieure ou égale à 180,0.<br> *Exemple : `12.492269` pour le Colisée de Rome.* 
 - **Float** - Un nombre à virgule flottante. 
 - **Entier** - Un entier. 
 - **Numéro de téléphone** - Un numéro de téléphone. 
 - **Heure** - Heure au format HH:MM:SS (H:MM:SS est également accepté). L’heure est mesurée à partir de « midi moins 12h » du jour de service (en fait minuit sauf les jours où se produisent des changements d’heure d’été). Pour les heures se produisant après minuit le jour du service, entrez l’heure sous la forme d’une valeur supérieure à 24:00:00 en HH:MM:SS.<br> *Exemple : `14:30:00` pour 14h30 ou `25:35:00` pour 1h35 du matin le lendemain.* 
 - **Text** - Une string de caractères UTF-8, qui est destiné à être affiché et doit donc être lisible par l’homme. 
 - **Timezone** - Fuseau horaire TZ du [https://www.iana.org/time-zones](https://www.iana.org/time-zones). Les noms de fuseau horaire ne contiennent jamais de caractère espace mais peuvent contenir un trait de soulignement. Reportez-vous à [http://en.wikipedia.org/wiki/List\_of\_tz\_zones](http://en.wikipedia.org/wiki/List\_of\_tz\_zones) pour une liste de valeurs valides .<br> *Exemple : `Asia/Tokyo`, `America/Los_Angeles` ou `Africa/Cairo`.* 
 - **URL** - Une URL complète qui inclut http://ou https://, et tout élément spécial les caractères de l’URL doivent être correctement échappés. Voir ce qui suit [http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html](http://www.w3.org/Addressing/URL/4\_URI\_Recommentations.html) pour une description de la façon de créer des valeurs d’URL complètes. 
 
### Signes de champ 
 Signes applicables aux types de champ Float ou Integer : 
 
 * **Non négatif** - Supérieur ou égal à 0. 
 * **Différent de zéro** - Différent de 0. 
 * **Positif** - Supérieur à 0. 
 
 _Exemple : **float non négatif ** - Un nombre à virgule flottante supérieur ou égal à 0._ 
 
### Attributs du jeu de données 
 La **clé primaire** d’un jeu de données est le champ ou la combinaison de champs qui identifient de manière unique une ligne. La «Primary key (*)» est utilisée lorsque tous les champs fournis pour un fichier sont utilisés pour identifier de manière unique une ligne. `y` key (none)` signifie que le fichier n’autorise qu’une seule ligne. 
 
 _Exemple : les champs `trip_id` et `stop_sequence` constituent la clé primaire de [stop_times.txt](#stop_timestxt)._ 
 
## Fichiers du jeu de données 
 
 Cette spécification définit les fichiers suivants : 
 
 | Nom du fichier | Présence | Descriptif | 
 |------|------|------| 
 | [agency.txt](#agencytxt) | **Requis** | Agences de transport en commun dont le service est représenté dans ce jeu de données. | 
 | [stops.txt](#stopstxt) | **Requis sous condition** | Arrêts où les véhicules prennent ou déposent les passagers. Définit également les gares et les entrées des gares. <br><br>Requis sous condition :<br> - Optionnel si des zones à la demande sont définies dans [locations.geojson](#locationsgeojson). <br>- **Obligatoire** sinon. | 
 | [routes.txt](#routestxt) | **Requis** | Itinéraires de transit. Un itinéraire est un groupe de trajets présentés aux passagers comme un service unique. | 
 | [trips.txt](#tripstxt) | **Requis** | Trajets pour chaque itinéraire. Un trajet est une séquence de deux arrêts ou plus qui se produisent pendant une période de temps spécifique. | 
 | [stop_times.txt](#stop_timestxt) | **Requis** | Heures d’arrivée et de départ d’un véhicule pour chaque trajet. | 
 | [calendar.txt](#calendartxt) | **Requis sous condition** | Dates de Service spécifiées à l’aide d’un planning hebdomadaire avec des dates de début et de fin.<br><br> Requis sous condition:<br> - **Requis** sauf si toutes les dates de service sont définies dans [calendar_dates.txt](#calendar_datestxt).<br> - Optionnel sinon. | 
 | [calendar_dates.txt](#calendar_datestxt) | **Requis sous condition** | Exceptions pour les services définis dans le [calendar.txt](#calendartxt).<br><br> Requis sous condition:<br> - **Requis** si [calendar.txt](#calendartxt) est omis. Dans ce cas, [calendar_dates.txt](#calendar_datestxt) doit contenir toutes les dates de service.<br> - Optionnel sinon. | 
 | [fare_attributes.txt](#fare_attributestxt) | Optionnel | Informations tarifaires pour les itinéraires d’une agence de transport en commun. | 
 | [fare_rules.txt](#fare_rulestxt) | Optionnel | Règles d’application des tarifs pour les itinéraires. | 
 | [timeframes.txt](#timeframestxt) | Optionnel | Périodes de date et d’heure à utiliser dans les règles tarifaires pour les tarifs qui dépendent de facteurs de date et d’heure. | 
 | [fare_media.txt](#fare_mediatxt) | Optionnel | Décrire les supports tarifaires qui peuvent être utilisés pour utiliser les produits tarifaires.<br><br> Le fichier [fare_media.txt](#fare_mediatxt) décrit les concepts qui ne sont pas représentés dans [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). En tant que tel, l’utilisation de [fare_media.txt](#fare_mediatxt) est entièrement distincte des fichiers [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). | 
 | [fare_products.txt](#fare_productstxt) | Optionnel | Décrire les différents types de billets ou de tarifs pouvant être achetés par les passagers.<br><br> Le fichier [fare_products.txt](#fare_productstxt) décrit les produits tarifaires qui ne sont pas représentés dans [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). En tant que tel, l’utilisation de [fare_products.txt](#fare_productstxt) est entièrement distincte des fichiers [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). | 
 | [fare_leg_rules.txt](#fare_leg_rulestxt) | Optionnel | Règles tarifaires pour les différents tronçons du voyage.<br><br> Le fichier [fare_leg_rules.txt](#fare_leg_rulestxt) fournit une méthode plus détaillée pour modéliser les structures tarifaires. En tant que tel, l’utilisation de [fare_leg_rules.txt](#fare_leg_rulestxt) est entièrement distincte des fichiers [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). | 
 | [fare_transfer_rules.txt](#fare_transfer_rulestxt) | Optionnel | Règles tarifaires pour les transferts entre les tronçons du voyage.<br><br> Avec [fare_leg_rules.txt](#fare_leg_rulestxt), le fichier [fare_transfer_rules.txt](#fare_transfer_rulestxt) fournit une méthode plus détaillée pour modéliser les structures tarifaires. En tant que tel, l’utilisation de [fare_transfer_rules.txt](#fare_transfer_rulestxt) est entièrement distincte des fichiers [fare_attributes.txt](#fare_attributestxt) et [fare_rules.txt](#fare_rulestxt). | 
 | [areas.txt](#areastxt) | Optionnel | Regroupement de zones d’emplacements. | 
 | [stop_areas.txt](#stop_areastxt) | Optionnel | Règles pour attribuer des arrêts aux zones. | 
 | [networks.txt](#networkstxt) | **Interdit sous condition** | Regroupement en réseau d’itinéraires.<br><br> Interdit sous condition:<br> - **Interdit** si `network_id` existe dans [routes.txt](#routestxt).<br> - Optionnel sinon. | 
 | [route_networks.txt](#route_networkstxt) | **Interdit sous condition** | Règles pour attribuer des itinéraires aux réseaux.<br><br> Interdit sous condition:<br> - **Interdit** si `network_id` existe dans [routes.txt](#routestxt).<br> - Optionnel sinon. | 
 | [shapes.txt](#shapestxt) | Optionnel | Règles de cartographie des trajets des véhicules, parfois appelées tracés d’itinéraires. | 
 | [frequencies.txt](#frequenciestxt) | Optionnel | Avancement (temps entre les trajets) pour un service basé sur l’avancée ou une représentation compressée d’un service à horaire fixe. | 
 | [transfers.txt](#transferstxt) | Optionnel | Règles d’établissement des correspondances aux points de transfert entre les itinéraires. | 
 | [pathways.txt](#pathwaystxt) | Optionnel | Parcours reliant les emplacements au sein des gares. | 
 | [levels.txt](#levelstxt) | **Requis sous condition** | Niveaux au sein des stations.<br><br> Requis sous condition:<br> - **Requis** lors de la description de chemins avec ascenseurs (`pathway_mode=5`).<br> - Optionnel sinon. | 
 | [location_groups.txt](#location_groupstxt) | Optionnel | Un groupe d’arrêts qui, ensemble, indiquent les emplacements où un passager peut demander une prise en charge ou un retour. | 
 | [location_group_stops.txt](#location_group_stopstxt) | Optionnel | Règles pour attribuer des arrêts aux groupes d’emplacements. | 
 | [locations.geojson](#locationsgeojson) | Optionnel | Zones pour les demandes de prise en charge ou de dépôt des passagers par les services à la demande, représentées sous forme de polygones GeoJSON. | 
 | [booking_rules.txt](#booking_rulestxt) | Optionnel | Informations de réservation pour les services demandés par le passager. | 
 | [translations.txt](#translationstxt) | Optionnel | Traductions des valeurs des jeux de données destinés aux clients. | 
 | [feed_info.txt](#feed_infotxt) | **Requis sous condition** | Métadonnées du jeu de données, y compris les informations sur l’éditeur, la version et l’expiration. <br><br>Requis sous condition :<br>- **Requis** si [translations.txt](#translationstxt) est fourni.<br>- Recommandé sinon.| 
 | [attributions.txt](#attributionstxt) | Optionnel | Attributions des jeux de données. | 
 
## Exigences relatives aux fichiers 
 
 Les exigences suivantes s’appliquent au format et au contenu des fichiers du jeu de données : 
 
 * Tous les fichiers doivent être enregistrés sous forme de texte délimité par des virgules. 
 * La première ligne de chaque fichier doit contenir des noms de champs. Chaque sous-section de la section [Définitions des champs](#definitions-des-champs) correspond à l’un des fichiers d’un jeu de données GTFS et répertorie les noms de champs qui peuvent être utilisés dans ce fichier. 
 * Tous les noms de fichiers et de champs sont sensibles à la casse. 
 * Les valeurs des champs ne doivent pas contenir de tabulations, de retours chariot ou de nouvelles lignes. 
 * Les valeurs de champ contenant des guillemets ou des virgules doivent être placées entre guillemets. De plus, chaque guillemet dans le champ valeur doit être précédé d’un guillemet. Ceci est cohérent avec la manière dont Microsoft Excel génère des fichiers CSV (délimités par des virgules). Pour plus d’informations sur le format de fichier CSV, voir [http://tools.ietf.org/html/rfc4180](http://tools.ietf.org/html/rfc4180). 
 L’exemple suivant montre comment une valeur de champ apparaîtrait dans un fichier délimité par des virgules : 
 * **Valeur de champ d’origine :** `t` des "guillemets", des virgules et du texte` 
 * **Valeur de champ dans le fichier CSV :** `"Contient ""citations"", virgules et texte"` 
 * Les valeurs des champs ne doivent pas contenir de balises HTML, de commentaires ou de séquences d’échappement. 
 * Les espaces supplémentaires entre les champs ou les noms de champs doivent être supprimés. De nombreux analyseurs considèrent les espaces comme faisant partie de la valeur, ce qui peut provoquer des erreurs. 
 * Chaque ligne doit se terminer par un caractère de saut de ligne CRLF ou LF. 
 * Les fichiers doivent être codés en UTF-8 pour prendre en charge tous les caractères Unicode. Les fichiers qui incluent le caractère de marque d’ordre d’octet (BOM) Unicode sont acceptables. Voir [http://unicode.org/faq/utf_bom.html#BOM](http://unicode.org/faq/utf_bom.html#BOM) pour plus d’informations sur le caractère BOM et UTF-8. 
 * Tous les fichiers du jeu de données doivent être compressés ensemble. Les fichiers doivent résider directement au niveau racine, et non dans un sous-dossier. 
 * Toutes les chaînes de texte destinées aux clients (y compris les noms d’arrêts, les noms d’itinéraires et les panneaux de direction) doivent utiliser une casse mixte (et non TOUTES LES MAJUSCULES), en suivant les conventions locales pour la mise en majuscule des noms de lieux sur les écrans capables d’afficher des caractères minuscules (par exemple « Brighton, Place Churchill », « Villiers-sur-Marne », « Rue du Marché »). 
 * L’utilisation d’abréviations doit être évitée tout au long du flux pour les noms et autres textes (par exemple St.pour Street), à moins qu’un emplacement ne soit appelé par son nom abrégé (par exemple « Aéroport JFK »). Les abréviations peuvent poser problème en termes d’accessibilité par les logiciels de lecture d’écran et les interfaces utilisateur vocales. Un logiciel consommateur peut être conçu pour convertir de manière fiable des mots complets en abréviations à afficher, mais la conversion d’abréviations en mots complets est sujette à un plus grand risque d’erreur. 
 
## Publication des jeux de données et pratiques générales 
 
 * Les jeux de données doivent être publiés sur une URL publique et permanente, y compris le nom du fichier zip. (par exemple, www.agence.org/gtfs/gtfs.zip). Idéalement, l’URL devrait être directement téléchargeable sans nécessiter de connexion pour accéder au fichier, afin de faciliter le téléchargement en consommant des applications logicielles. Bien qu’il soit recommandé (et constitue la pratique la plus courante) de rendre un jeu de données GTFS librement téléchargeable, si un fournisseur de données doit contrôler l’accès à GTFS pour des raisons de licence ou pour d’autres raisons, il est recommandé de contrôler l’accès au jeu de données GTFS à l’aide de clés API. ce qui facilitera les téléchargements automatiques. 
 * Les données GTFS doivent être publiées par itérations afin qu’un seul fichier situé à un emplacement stable contienne toujours la dernière description officielle du service d’une ou plusieurs agences de transport en commun. 
 * Les jeux de données doivent conserver des identifiants persistants (champs d’identification) pour `stop_id`, `route_id` et `agency_id` à travers les itérations de données dans la mesure du possible. 
 * Un jeu de données GTFS doit contenir le service actuel et à venir (parfois appelé jeu de données « fusionné »). Il existe plusieurs [outils de fusion](../../../resources/gtfs/#gtfs-merge-tools) disponibles qui peuvent être utilisés pour créer un jeu de données fusionné à partir de deux flux GTFS différents. 
    * À tout moment, le jeu de données GTFS publié doit être valide pendant au moins les 7 prochains jours, et idéalement aussi longtemps que l’opérateur est convaincu que l’horaire continuera à être exploité. 
    * Si possible, le jeu de données GTFS doit couvrir au moins les 30 prochains jours de service. 
 * Les anciens services (calendriers expirés) doivent être supprimés du flux. 
 * Si une modification de service entre en vigueur dans 7 jours ou moins, cette modification de service doit être exprimée via un flux GTFS en temps réel (avis de service ou mises à jour de voyage) plutôt que par un jeu de données GTFS statiques. 
 * Le serveur Web hébergeant les données GTFS doit être configuré pour signaler correctement la date de modification du fichier (voir [HTTP/1.1- Request for Comments 2616, sous la section 14.29](https://tools.ietf.org/html/rfc2616#section-14.29)). 
 
## Définitions des champs

### agency.txt 
 
 Fichier : **Requis** 
 
 Clé primaire (`agency_id`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `agency_id` | Identifiant unique | **Requis sous condition** | Identifie une marque de transport en commun qui est souvent synonyme d’agence de transport en commun. Notez que dans certains cas, par exemple lorsqu’une seule agence gère plusieurs services distincts, les agences et les marques sont distinctes. Ce document utilise le terme « agence » à la place de « marque ». Un jeu de données peut contenir des données provenant de plusieurs agences.<br><br> Requis sous condition:<br> - **Requis** lorsque le jeu de données contient des données pour plusieurs agences de transport en commun.<br> - Recommandé autrement. | 
 | `agency_name` | Text | **Requis** | Nom complet de l’agence de transport. | 
 | `agency_url` | URL | **Requis** | URL de l’agence de transport en commun. | 
 | `agency_timezone` | Fuseau horaire | **Requis** | Fuseau horaire où se trouve l’agence de transport en commun. Si plusieurs agences sont spécifiées dans le jeu de données, chacune doit avoir le même `agency_timezone`. | 
 | `agency_lang` | Code de langue | Optionnel | Langue principale utilisée par cette agence de transport en commun. Doit être fourni pour aider les consommateurs GTFS à choisir les règles de capitalisation et d’autres paramètres spécifiques à la langue pour le jeu de données. | 
 | `agency_phone` | Numéro de téléphone | Optionnel | Un numéro de téléphone vocal pour l’agence spécifiée. Ce champ est une valeur de string qui présente le numéro de téléphone comme étant typique de la zone de service de l’agence. Il peut contenir des signes de ponctuation pour regrouper les chiffres du numéro. Le texte composable (par exemple, « 503-238-RIDE » de TriMet) est autorisé, mais le champ ne doit contenir aucun autre texte descriptif. | 
 | `agency_fare_url` | URL | Optionnel | URL d’une page Web qui permet à un passager d’acheter en ligne des billets ou d’autres instruments tarifaires pour cette agence. | 
 | `agency_email` | Courriel | Optionnel | Adresse e-mail activement surveillée par le service client de l’agence. Cette adresse e-mail doit être un point de contact direct où les usagers des transports en commun peuvent joindre un représentant du service client de l’agence. | 
 
### stops.txt 
 
 Fichier : **Requis sous condition** 
 
 Clé primaire (`stop_id`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `stop_id` | Identifiant unique | **Requis** | Identifie un emplacement : arrêt/quai, station, entrée/sortie, nœud générique ou zone d’embarquement (voir `location_type`).<br><br> L’ID doit être unique parmi toutes les valeurs `stops.stop_id`, locations.geojson `id` et `location_groups.location_group_id` .<br><br> Plusieurs routes peuvent utiliser le même `stop_id`. | 
 | `stop_code` | Text | Optionnel | Un texte court ou un numéro qui identifie l’emplacement pour les passagers. Ces codes sont souvent utilisés dans les systèmes d’information sur les transports en commun par téléphone ou imprimés sur la signalisation pour permettre aux usagers d’obtenir plus facilement des informations sur un emplacement particulier. Le « `stop_code` » peut être le même que « `stop_id` » s’il est public. Ce champ doit être laissé vide pour les emplacements sans code présenté aux passagers. | 
 | `stop_name` | Text | **Requis sous condition** | Nom de l’emplacement. Le « `stop_name` » doit correspondre au nom de l’agence destiné aux usagers de l’emplacement, tel qu’imprimé sur un horaire, publié en ligne ou représenté sur la signalisation. Pour les traductions dans d’autres langues, utilisez [translations.txt](#translationstxt).<br><br> Lorsque l’emplacement est une zone d’embarquement (`location_type=4`), le `stop_name` doit contenir le nom de la zone d’embarquement tel qu’affiché par l’agence. Il peut s’agir d’une simple lettre (comme dans certaines gares ferroviaires interurbaines européennes) ou d’un texte comme « Zone d’embarquement pour fauteuils roulants » (métro de New York) ou « Chef des trains courts » (RER de Paris).<br><br> Requis sous condition:<br> - **Requis** pour les emplacements qui sont des arrêts (`location_type=0`), des gares (`location_type=1`) ou des entrées/sorties (`location_type=2`).<br> - Optionnel pour les emplacements qui sont des nœuds génériques (`location_type=3`) ou des zones d’embarquement (`location_type=4`).| 
 | `tts_stop_name` | Text | Optionnel | Version lisible du `stop_name`. Voir « Champ de synthèse vocale » dans les [Définitions des termes](#definitions-des-termes) pour en savoir plus. | 
 | `stop_desc` | Text | Optionnel | Description du lieu qui fournit des informations utiles et de qualité. Ne doit pas être un double de `stop_name`.| 
 | `stop_lat` | Latitudes | **Requis sous condition** | Latitude du lieu.<br><br> Pour les arrêts/quais (`location_type=0`) et la zone d’embarquement (`location_type=4`), les coordonnées doivent être celles du poteau de bus — s’il existe — et sinon de l’endroit où les voyageurs montent à bord du véhicule (sur le trottoir ou le quai, et non sur la chaussée ou la piste où le véhicule s’arrête).<br><br> Requis sous condition:<br> - **Requis** pour les emplacements qui sont des arrêts (`location_type=0`), des gares (`location_type=1`) ou des entrées/sorties (`location_type=2`).<br> - Optionnel pour les emplacements qui sont des nœuds génériques (`location_type=3`) ou des zones d’embarquement (`location_type=4`).| 
 | `stop_lon` | Longitude | **Requis sous condition** | Longitude du lieu.<br><br> Pour les arrêts/quais (`location_type=0`) et la zone d’embarquement (`location_type=4`), les coordonnées doivent être celles du poteau de bus — s’il existe — et sinon de l’endroit où les voyageurs montent à bord du véhicule (sur le trottoir ou le quai, et non sur la chaussée ou la piste où le véhicule s’arrête).<br><br> Requis sous condition:<br> - **Requis** pour les emplacements qui sont des arrêts (`location_type=0`), des gares (`location_type=1`) ou des entrées/sorties (`location_type=2`).<br> - Optionnel pour les emplacements qui sont des nœuds génériques (`location_type=3`) ou des zones d’embarquement (`location_type=4`). | 
 | `zone_id` | ID | Optionnel | Identifie la zone tarifaire pour un arrêt. Si cette entrée représente une station ou une entrée de station, le `zone_id` est ignoré.| 
 | `stop_url` | URL | Optionnel | URL d’une page Web sur l’emplacement. Cela doit être différent des valeurs des champs `agency.agency_url` et `routes.route_url`. | 
 | `location_type` | Énumération | Optionnel | Type de lieu. Les options valides sont :<br><br> `0` (ou vide) - **Stop** (ou **Plateforme**). Un endroit où les passagers montent ou descendent d’un véhicule de transport en commun. Est appelée une plate-forme lorsqu’elle est définie dans un `parent_station`.<br> `1` - **Gare**. Une structure physique ou une zone qui contient une ou plusieurs plates-formes.<br> `2` - **Entrée/Sortie**. Un endroit où les passagers peuvent entrer ou sortir d’une gare depuis la rue. Si une entrée/sortie appartient à plusieurs stations, elle peut être reliée par des chemins aux deux, mais le fournisseur de données doit en choisir une comme parent.<br> `3` - **Nœud générique**. Un emplacement au sein d’une station, ne correspondant à aucun autre `location_type`, qui peut être utilisé pour relier les chemins définis dans [pathways.txt](#pathwaystxt).<br> `4` - **Zone d’embarquement**. Un emplacement spécifique sur une plate-forme, où les passagers peuvent monter et/ou descendre des véhicules.| 
 | `parent_station` | Clé étrangère faisant référence à `stops.stop_id` | **Requis sous condition** | Définit la hiérarchie entre les différents emplacements définis dans [stops.txt](#stopstxt). Il contient l’ID de l’emplacement parent, comme suit :<br><br> - **Arrêt/plateforme** (`location_type=0`) : le champ `parent_station` contient l’ID d’une station.<br> - **Station** (`location_type=1`) : ce champ doit être vide.<br> - **Entrée/sortie** (`location_type=2`) ou **nœud générique** (`location_type=3`) : le champ `parent_station` contient l’ID d’une station (`location_type=1`)<br> - **Boarding Area** (`location_type=4`) : le champ `parent_station` contient l’ID d’une plateforme.<br><br> Requis sous condition:<br> - **Requis** pour les emplacements qui sont des entrées (`location_type=2`), des nœuds génériques (`location_type=3`) ou des zones d’embarquement (`location_type=4`).<br> - Optionnel pour les arrêts/plates-formes (`location_type=0`).<br> - Interdit aux stations (`location_type=1`).| 
 | `stop_timezone` | Fuseau horaire | Optionnel | Fuseau horaire du lieu. Si l’emplacement possède une station parent, il hérite du fuseau horaire de la station parent au lieu d’appliquer le sien. Les stations et les arrêts sans parents avec `stop_timezone` vide héritent du fuseau horaire spécifié par `agency.agency_timezone`. Les heures fournies dans [stop_times.txt](#stop_timestxt) sont dans le fuseau horaire spécifié par `agency.agency_timezone`, et non dans `stop_timezone`. Cela garantit que les valeurs temporelles d’un trajet augmentent toujours au cours du trajet, indépendamment du quels fuseaux horaires le voyage traverse. | 
 | `wheelchair_boarding` | Énumération | Optionnel | Indique si l’embarquement des fauteuils roulants est possible depuis l’emplacement. Les options valides sont :<br><br> Pour les arrêts sans parents :<br> `0` ou vide- Aucune information d’accessibilité pour l’arrêt.<br> `1` - Certains véhicules à cet arrêt peuvent être embarqués par un passager en fauteuil roulant.<br> `2` - L’embarquement en fauteuil roulant n’est pas possible à cet arrêt.<br><br> Pour les arrêts enfant :<br> `0` ou vide- Stop héritera de son comportement `wheelchair_boarding` de la station parent, si spécifié dans le parent.<br> `1` - Il existe un chemin accessible depuis l’extérieur de la gare jusqu’à l’arrêt/le quai spécifique.<br> `2` - Il n’existe aucun chemin accessible depuis l’extérieur de la gare vers l’arrêt/le quai spécifique.<br><br> Pour les entrées/sorties de gare :<br> `0` ou vide- L’entrée de la station héritera de son comportement `wheelchair_boarding` de la station parent, si spécifié pour le parent.<br> `1` - L’entrée de la gare est accessible aux personnes en fauteuil roulant.<br> `2` - Aucun chemin accessible depuis l’entrée de la gare jusqu’aux arrêts/quais. | 
 | `level_id` | Clé étrangère faisant référence à `levels.level_id` | Optionnel | Niveau de l’emplacement. Le même niveau peut être utilisé par plusieurs stations non liées.| 
 | `platform_code` | Text | Optionnel | Identifiant de quai pour un arrêt de quai (un arrêt appartenant à une gare). Il doit s’agir uniquement de l’identifiant de la plate-forme (par exemple "G" ou "3"). Les mots tels que « plateforme » ou « piste » (ou l’équivalent spécifique à la langue du flux) ne doivent pas être inclus. Cela permet aux consommateurs de flux d’internationaliser et de localiser plus facilement l’identifiant de la plateforme dans d’autres langues. | 
 
 
### routes.txt 
 
 Fichier : **Requis** 
 
 Clé primaire (`route_id`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `route_id` | Identifiant unique | **Requis** | Identifie un itinéraire. | 
 | `agency_id` | Clé étrangère faisant référence à `agency.agency_id` | **Requis sous condition** | Agence pour l’itinéraire spécifié.<br><br> Requis sous condition:<br> - **Requis** si plusieurs agences sont définies dans [agency.txt](#agencytxt).<br> - Recommandé autrement. | 
 | `route_short_name` | Text | **Requis sous condition** | Nom court d’un itinéraire. Il s’agit souvent d’un identifiant court et abstrait (par exemple, « 32 », « 100X », « Green ») que les usagers utilisent pour identifier un itinéraire. `route_short_name` et `route_long_name` peuvent être définis.<br><br> Requis sous condition:<br> - **Requis** si `routes.route_long_name` est vide.<br> - Recommandé s’il existe une brève désignation de service. Il doit s’agir du nom communément connu du passager du service et ne doit pas dépasser 12 caractères. | 
 | `route_long_name` | Text | **Requis sous condition** | Nom complet d’un itinéraire. Ce nom est généralement plus descriptif que « `route_short_name` » et inclut souvent la destination ou l’arrêt de l’itinéraire. `route_short_name` et `route_long_name` peuvent être définis.<br><br> Requis sous condition:<br> - **Requis** si `routes.route_short_name` est vide.<br> - Optionnel sinon. | 
 | `route_desc` | Text | Optionnel | Description d’un itinéraire fournissant des informations utiles et de qualité. Ne doit pas être un double de `route_short_name` ou `route_long_name`.<hr> _Exemple : les trains « A » circulent à tout moment entre Inwood-207 St, Manhattan et Far Rockaway-Mott Avenue, Queens. Également d’environ 6 heures du matin jusqu’à environ minuit, des trains « A » supplémentaires circulent entre Inwood-207 St et Lefferts Boulevard (les trains alternent généralement entre Lefferts Blvd et Far Rockaway)._ | 
 | `route_type` | Énumération | **Requis** | Indique le type de transport utilisé sur un itinéraire. Les options valides sont :<br><br> `0` - Tramway, Tramway, Train léger sur rail. Tout système de train léger sur rail ou au niveau de la rue dans une zone métropolitaine.<br> `1` - Métro, Métro. Tout système ferroviaire souterrain au sein d’une zone métropolitaine.<br> `2` - Rail. Utilisé pour les voyages interurbains ou longue distance.<br> `3` - Autobus. Utilisé pour les lignes de bus courtes et longues distances.<br> `4` - Traversier. Utilisé pour le service de bateaux sur courte et longue distance.<br> `5` - Téléphérique. Utilisé pour les wagons au niveau de la rue où le câble passe sous le véhicule (par exemple, téléphérique à San Francisco).<br> `6` - Téléphérique, téléphérique suspendu (par exemple télécabine, téléphérique). Transport par câble où des cabines, des voitures, des gondoles ou des chaises ouvertes sont suspendues au moyen d’un ou plusieurs câbles.<br> `7` - Funiculaire. Tout système ferroviaire conçu pour les pentes raides.<br> `11` - Chariotbus. Bus électriques alimentés par des lignes aériennes à l’aide de poteaux.<br> `12` - Monorail. Chemin de fer dont la voie est constituée d’un seul rail ou d’une poutre. | 
 | `route_url` | URL | Optionnel | URL d’une page Web sur l’itinéraire particulier. Doit être différent de la valeur `agency.agency_url`. | 
 | `route_color` | Couleur | Optionnel | Désignation de couleur de l’itinéraire qui correspond au matériel destiné au public. La valeur par défaut est blanc (`FFFFFF`) lorsqu’elle est omise ou laissée vide. La différence de couleur entre « `route_color` » et « `route_text_color` » devrait fournir un contraste suffisant lorsqu’elle est visualisée sur un écran noir et blanc. | 
 | `route_text_color` | Couleur | Optionnel | Couleur lisible à utiliser pour le texte dessiné sur un fond de `route_color`. La valeur par défaut est noire (`000000`) lorsqu’elle est omise ou laissée vide. La différence de couleur entre « `route_color` » et « `route_text_color` » devrait fournir un contraste suffisant lorsqu’elle est visualisée sur un écran noir et blanc. | 
 | `route_sort_order` | Entier non négatif | Optionnel | Ordonne les itinéraires d’une manière idéale pour la présentation aux clients. Les Lignes avec des valeurs `route_sort_order` plus petites doivent être affichés en premier. | 
 | `continuous_pickup` | Énumération | **Interdit sous condition** | Indique que l’usager peut monter à bord du véhicule de transport en commun à tout moment le long du trajet du véhicule, tel que décrit par [shapes.txt](#shapestxt), à chaque trajet de l’itinéraire. Les options valides sont :<br><br> `0` - Arrêt continu du ramassage.<br> `1` ou vide- Pas de collecte d’arrêt continu.<br>  `2` - Doit téléphoner à l’agence pour organiser un ramassage avec arrêt continu.<br> `3` - Doit se coordonner avec le conducteur pour organiser le ramassage avec arrêt continu.<br><br> Les valeurs de « `routes.continuous_pickup` » peuvent être remplacées en définissant des valeurs dans « `stop_times.continuous_pickup` » pour des « `stop_time`» spécifiques le long de l’itinéraire.<br><br> **Interdit sous condition** :<br> - **Interdit** si `stop_times.start_pickup_drop_off_window` ou `stop_times.end_pickup_drop_off_window` sont définis pour tout trajet de cet itinéraire.<br> - Optionnel sinon. | 
 | `continuous_drop_off` | Énumération | **Interdit sous condition** | Indique que l’usager peut descendre du véhicule de transport en commun à tout moment le long du trajet du véhicule, tel que décrit par [shapes.txt](#shapestxt), à chaque trajet de l’itinéraire. Les options valides sont :<br><br> `0` - Arrêt continu du dépôt.<br> `1` ou vide- Pas de chute d’arrêt continue.<br> `2` - Doit téléphoner à l’agence pour organiser un dépôt en continu.<br> `3` - Doit se coordonner avec le conducteur pour organiser un arrêt continu du dépôt.<br><br> Les valeurs de « `routes.continuous_drop_off` » peuvent être remplacées en définissant des valeurs dans « `stop_times.continuous_drop_off` » pour des « `stop_time` » spécifiques le long de l’itinéraire.<br><br> **Interdit sous condition** :<br> - **Interdit** si `stop_times.start_pickup_drop_off_window` ou `stop_times.end_pickup_drop_off_window` sont définis pour tout trajet de cet itinéraire.<br> - Optionnel sinon. | 
 | `network_id` | ID | **Interdit sous condition** | Identifie un groupe d’itinéraires. Plusieurs lignes dans [routes.txt](#routestxt) peuvent avoir le même `network_id`.<br><br> Interdit sous condition:<br> - **Interdit** si le fichier [route_networks.txt](#route_networkstxt) existe.<br> - Optionnel sinon. 
 
### trips.txt 
 
 Fichier : **Requis** 
 
 Clé primaire (`trip_id`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `route_id` | Clé étrangère faisant référence à `routes.route_id` | **Requis** | Identifie un itinéraire. | 
 | `service_id` | Clé étrangère faisant référence à `calendar.service_id` ou `calendar_dates.service_id` | **Requis** | Identifie un ensemble de dates auxquelles le service est disponible pour un ou plusieurs itinéraires. | 
 | `trip_id` | Identifiant unique | **Requis** | Identifie un voyage. | 
 | `trip_headsign` | Text | Optionnel | Text qui apparaît sur la signalisation identifiant la destination du voyage aux passagers. Ce champ est recommandé pour tous les services avec une Girouette affichée sur le véhicule qui peut être utilisé pour distinguer les trajets d'un itinéraire.<br><br> Si le signe change pendant un voyage, les valeurs de `trip_headsign` peuvent être remplacées en définissant des valeurs dans `stop_times.stop_headsign` pour des `stop_time` spécifiques tout au long du voyage. | 
 | `trip_short_name` | Text | Optionnel | Texte destiné au public utilisé pour identifier le trajet des usagers, par exemple, pour identifier les numéros de train pour les trajets en train de banlieue. Si les passagers ne s’appuient pas généralement sur les noms de voyage, `trip_short_name` doit être vide. Une valeur `trip_short_name`, si elle est fournie, doit identifier de manière unique un voyage au cours d’une journée de service ; il ne doit pas être utilisé pour les noms de destination ou les désignations limitées/expresses. | 
 | `direction_id` | Énumération | Optionnel | Indique la direction du voyage pour un voyage. Ce champ ne doit pas être utilisé dans le routage ; il permet de séparer les trajets par direction lors de la publication des horaires. Les options valides sont :<br><br> `0` - Voyage dans une direction (par exemple, voyage aller).<br> `1` - Voyage dans la direction opposée (par exemple voyage entrant).<hr> *Exemple : Les champs `trip_headsign` et `direction_id` peuvent être utilisés ensemble pour attribuer un nom pour voyager dans chaque direction pour un ensemble de trajets. Un fichier [trips.txt](#tripstxt) peut contenir ces entrées à utiliser dans les horaires :*<br> `trip_id,...,trip_headsign,direction_id`<br> `1234,...,Aéroport,0`<br> `1505,...,Centre-ville,1` | 
 | `block_id` | ID | Optionnel | Identifie le bloc auquel appartient le voyage. Un bloc se compose d’un seul trajet ou de plusieurs trajets séquentiels effectués à l’aide du même véhicule, définis par des jours de service partagés et `block_id`. Un `block_id` peut avoir des trajets avec des jours de service différents, créant ainsi des blocs distincts. Voir l’[exemple ci-dessous](#exemple-blocs-et-jour-de-service). Pour fournir des informations sur les transferts à bord, [transfers](#transferstxt) de `transfer_type` `4` doit être fourni à la place. | 
 | `shape_id` | Clé étrangère faisant référence à `shapes.shape_id` | **Requis sous condition** | Identifie une forme géospatiale décrivant le trajet du véhicule pour un voyage.<br><br> Requis sous condition:<br> - **Requis** si le trajet a un comportement de prise en charge ou de dépose continu défini soit dans [routes.txt](#routestxt) soit dans [stop_times.txt](#stop_timestxt).<br> - Optionnel sinon. | 
 | `wheelchair_accessible` | Énumération | Optionnel | Indique l’accessibilité en fauteuil roulant. Les options valides sont :<br><br> `0` ou vide- Aucune information d’accessibilité pour le voyage.<br> `1` - Le véhicule utilisé lors de ce voyage particulier peut accueillir au moins un passager en fauteuil roulant.<br> `2` - Aucun passager en fauteuil roulant ne peut être accueilli lors de ce voyage. | 
 | `bikes_allowed` | Énumération | Optionnel | Indique si les vélos sont autorisés. Les options valides sont :<br><br> `0` ou vide- Aucune information sur le vélo pour le trajet.<br> `1` - Le véhicule utilisé lors de ce voyage particulier peut accueillir au moins un vélo.<br> `2` - Aucun vélo n’est autorisé lors de ce voyage. | 
 
#### Exemple : Blocs et jour de service 
 
 L’exemple ci-dessous est valable, avec des blocs distincts chaque jour de la semaine. 
 
 | route_id | trip_id | service_id | block_id | <span style="font-weight:normal">*(heure du premier arrêt)*</span> | <span style="font-weight:normal">*(heure du dernier arrêt)*</span> | 
 |----------|---------|------------------------------------------|--------------|-----------------------------------------|------------------------------| 
 | rouge | voyage_1 | lun-mar-mer-jeudi-ven-sam-dim | boucle_rouge | 22:00:00 | 22:55:00 | 
 | rouge | voyage_2 | ven-sam-dim | boucle_rouge | 23:00:00 | 23:55:00 | 
 | rouge | voyage_3 | vendredi-samedi | boucle_rouge | 24:00:00 | 24:55:00 | 
 | rouge | voyage_4 | lundi-mardi-mercredi | boucle_rouge | 20:00:00 | 20:50:00 | 
 | rouge | voyage_5 | lundi-mardi-mercredi | boucle_rouge | 21:00:00 | 21:50:00 | 
 
 Remarques sur le tableau ci-dessus : 
 
 * Du vendredi au samedi matin, par exemple, un seul véhicule exploite `trip_1`, `trip_2` et `trip_3` (22h00 jusqu’à 00h55). Notez que le dernier trajet a lieu le samedi, de 00h00 à 00h55, mais fait partie du « jour de service » du vendredi car les horaires sont de 24h00 à 24h55. 
 * Le lundi, mardi, mercredi et jeudi, un seul véhicule circule `trip_1`, `trip_4` et `trip_5` dans un bloc de 20h00 à 22h55. 
 
### stop_times.txt 
 
 Fichier : **Requis** 
 
 Clé primaire (`trip_id`, `stop_sequence`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `trip_id` | Clé étrangère faisant référence à `trips.trip_id` | **Requis** | Identifie un voyage. | 
 | `arrival_time` | Temps | **Requis sous condition** | Heure d’arrivée à l’arrêt (défini par `stop_times.stop_id`) pour un trajet spécifique (défini par `stop_times.trip_id`) dans le fuseau horaire spécifié par `agency.agency_timezone`, et non `stops.stop_timezone`.<br><br> S’il n’y a pas d’heures distinctes pour l’arrivée et le départ à un arrêt, `arrival_time` et `departure_time` doivent être les mêmes.<br><br> Pour les heures se produisant après minuit le jour du service, entrez l’heure sous la forme d’une valeur supérieure à 24:00:00 en HH:MM:SS.<br><br> Si les heures exactes d’arrivée et de départ (`timepoint=1`) ne sont pas disponibles, les heures d’arrivée et de départ estimées ou interpolées (`timepoint=0`) doivent être fournies.<br><br> Requis sous condition:<br> - **Requis** pour le premier et le dernier arrêt d’un trajet (défini par `stop_times.stop_sequence`).<br> - **Requis** pour `timepoint=1`.<br> - **Interdit** lorsque `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon.| 
 | `departure_time` | Temps | **Requis sous condition** | Heure de départ de l’arrêt (défini par `stop_times.stop_id`) pour un trajet spécifique (défini par `stop_times.trip_id`) dans le fuseau horaire spécifié par `agency.agency_timezone`, et non `stops.stop_timezone`.<br><br> S’il n’y a pas d’heures distinctes pour l’arrivée et le départ à un arrêt, `arrival_time` et `departure_time` doivent être les mêmes.<br><br> Pour les heures se produisant après minuit le jour du service, entrez l’heure sous la forme d’une valeur supérieure à 24:00:00 en HH:MM:SS.<br><br> Si les heures exactes d’arrivée et de départ (`timepoint=1`) ne sont pas disponibles, les heures d’arrivée et de départ estimées ou interpolées (`timepoint=0`) doivent être fournies.<br><br> Requis sous condition:<br> - **Requis** pour `timepoint=1`.<br> - **Interdit** lorsque `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon. | 
 | `stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis sous condition** | Identifie l’arrêt desservi. Tous les arrêts desservis au cours d’un trajet doivent avoir une entrée dans [stop_times.txt](#stop_timestxt). Les emplacements référencés doivent être des arrêts/plates-formes, c’est-à-dire que leur valeur `stops.location_type` doit être `0` ou vide. Un arrêt peut être desservi plusieurs fois au cours d’un même trajet, et plusieurs trajets et itinéraires peuvent desservir le même arrêt.<br><br> Le service à la demande utilisant les arrêts doit être référencé dans l’ordre dans lequel le service est disponible à ces arrêts. Un application réutilisatrice de données doit supposer que le voyage est possible d’un arrêt ou d’un lieu à n’importe quel arrêt ou lieu plus tard dans le voyage, à condition que le `pickup/drop_off_type` de chaque stop_time et les contraintes de temps de chaque `start/end_pickup_drop_off_window` ne l’interdisent pas..<br><br> Requis sous condition:<br> - **Requis** si `s`. location_group_id` ET `s`. location_id` ne sont PAS définis.<br> - **Interdit** si `s`. location_group_id` ou `s`. location_id` sont définis. | 
 | `location_group_id` | Clé étrangère faisant référence à `location_groups.location_group_id` | **Interdit sous condition** | Identifie le groupe d’emplacements desservis qui indique les groupes d’arrêts où les passagers peuvent demander une prise en charge ou un retour. Tous les groupes d’emplacements desservis pendant un trajet doivent avoir une entrée dans [stop_times.txt](#stop_timestxt). Plusieurs trajets et itinéraires peuvent desservir le même groupe d’emplacements.<br><br> Le service à la demande utilisant des groupes d’emplacements doit être référencé dans l’ordre dans lequel le service est disponible dans ces groupes d’emplacements. Un application réutilisatrice de données doit supposer que le voyage est possible d’un arrêt ou d’un lieu à n’importe quel arrêt ou lieu plus tard dans le voyage, à condition que le `pickup/drop_off_type` de chaque stop_time et les contraintes de temps de chaque `start/end_pickup_drop_off_window` ne l’interdisent pas..<br><br> **Interdit sous condition** :<br> - **Interdit** si `stop_times.stop_id` ou `s`. location_id` sont définis. | 
 | `location_id` | Clé étrangère faisant référence à « `id` » à partir de « `locations.geojson` » | **Interdit sous condition** | Identifie l’emplacement GeoJSON qui correspond à la zone desservie où les passagers peuvent demander une prise en charge ou un retour. Tous les emplacements GeoJSON desservis lors d’un voyage doivent avoir une entrée dans [stop_times.txt](#stop_timestxt). Plusieurs trajets et itinéraires peuvent desservir le même emplacement GeoJSON.<br><br> Le service à la demande dans les emplacements doit être référencé dans l’ordre dans lequel le service est disponible dans ces emplacements. Un application réutilisatrice de données doit supposer que le voyage est possible d’un arrêt ou d’un lieu à n’importe quel arrêt ou lieu plus tard dans le voyage, à condition que le `pickup/drop_off_type` de chaque stop_time et les contraintes de temps de chaque `start/end_pickup_drop_off_window` ne l’interdisent pas..<br><br> **Interdit sous condition** :<br> - **Interdit** si `stop_times.stop_id` ou `s`. location_group_id` sont définis. | 
 | `stop_sequence` | Entier non négatif | **Requis** | Ordre des arrêts, groupes de lieux ou emplacements GeoJSON pour un trajet particulier. Les valeurs doivent augmenter tout au long du trajet mais ne doivent pas nécessairement être consécutives.<hr> *Exemple : Le premier emplacement du voyage pourrait avoir une `stop_sequence`= `1`, le deuxième emplacement du voyage pourrait avoir une `stop_sequence`=`23`, le troisième emplacement pourrait avoir une `stop_sequence`=`40`, et ainsi de suite.*<br><br> Voyager au sein du même groupe d’emplacements ou emplacement GeoJSON nécessite deux entrées dans [stop_times.txt](#stop_timestxt) avec le même `location_group_id` ou `location_id`. | 
 | `stop_headsign` | Text | Optionnel | Text qui apparaît sur la signalisation identifiant la destination du voyage aux passagers. Ce champ remplace le « `trips.trip_headsign` » par défaut lorsque le panneau change entre les arrêts. Si le headsign est affiché pour un voyage entier, « `trips.trip_headsign` » doit être utilisé à la place.<br><br> Une valeur `stop_headsign` spécifiée pour un `stop_time` ne s’applique pas aux `stop_time` suivants dans le même trajet. Si vous souhaitez remplacer le `trip_headsign` pour plusieurs `stop_time` dans le même trajet, la valeur `stop_headsign` doit être répétée dans chaque ligne `stop_time`. | 
 | `start_pickup_drop_off_window` | Temps | **Requis sous condition** | Heure à laquelle le service à la demande devient disponible dans un emplacement GeoJSON, un groupe d’emplacements ou un arrêt.<br><br> **Requis sous condition** :<br> - **Requis** si `s`. location_group_id` ou `s`. location_id` est défini.<br> - **Requis** si `end_pickup_drop_off_window` est défini.<br> - **Interdit** si `arrival_time` ou `departure_time` est défini.<br> - Optionnel sinon. | 
 | `end_pickup_drop_off_window` | Temps | **Requis sous condition** | Heure à laquelle le service à la demande se termine dans un emplacement, un groupe d’emplacements ou un arrêt GeoJSON.<br><br> **Requis sous condition** :<br> - **Requis** si `s`. location_group_id` ou `s`. location_id` est défini.<br> - **Requis** si `start_pickup_drop_off_window` est défini.<br> - **Interdit** si `arrival_time` ou `departure_time` est défini.<br> - Optionnel sinon. | 
 | `pickup_type` | Énumération | **Interdit sous condition** | Indique la méthode de ramassage. Les options valides sont :<br><br> `0` ou vide – Retrait régulier.<br> `1` - Aucun ramassage disponible.<br> `2` - Doit téléphoner à l’agence pour organiser le ramassage.<br> `3` - Doit se coordonner avec le chauffeur pour organiser le ramassage.<br><br> **Interdit sous condition** :<br> - `pickup_type=0` **interdit** si `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - `pickup_type=3` **interdit** si `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon. | 
 | `drop_off_type` | Énumération | **Interdit sous condition** | Indique la méthode de dépôt. Les options valides sont :<br><br> `0` ou vide – Dépose régulièrement programmée.<br> `1` - Aucun dépôt disponible.<br> `2` - Doit téléphoner à l’agence pour organiser le dépôt.<br> `3` - Doit se coordonner avec le chauffeur pour organiser le dépôt.<br><br> **Interdit sous condition** :<br> - `drop_off_type=0` **interdit** si `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon. | 
 | `continuous_pickup` | Énumération | **Interdit sous condition** | Indique que le passager peut monter à bord du véhicule de transport en commun à tout moment le long du trajet du véhicule, comme décrit par [shapes.txt](#shapestxt), de ce « `stop_time` » au suivant « `stop_time` » dans la « `stop_sequence`» du trajet. Les options valides sont :<br><br> `0` - Arrêt continu du ramassage.<br> `1` ou vide- Pas de collecte d’arrêt continu.<br> `2` - Doit téléphoner à l’agence pour organiser un ramassage avec arrêt continu.<br> `3` - Doit se coordonner avec le conducteur pour organiser le ramassage avec arrêt continu.<br><br> Si ce champ est renseigné, il remplace tout comportement de collecte continue défini dans [routes.txt](#routestxt). Si ce champ est vide, le `stop_time` hérite de tout comportement de ramassage continu défini dans [routes.txt](#routestxt).<br><br> **Interdit sous condition** :<br> - **Interdit** si `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon. | 
 | `continuous_drop_off` | Énumération | **Interdit sous condition** | Indique que le passager peut descendre du véhicule de transport en commun à tout moment le long du trajet du véhicule comme décrit par [shapes.txt](#shapestxt), de cette « `stop_time` » à la suivante « `stop_time` » dans la « `stop_sequence` » du trajet. Les options valides sont :<br><br> `0` - Arrêt continu du dépôt.<br> `1` ou vide- Pas de chute d’arrêt continue.<br> `2` - Doit téléphoner à l’agence pour organiser un dépôt en continu.<br> `3` - Doit se coordonner avec le conducteur pour organiser un arrêt continu du dépôt.<br><br> Si ce champ est renseigné, il remplace tout comportement de dépôt continu défini dans [routes.txt](#routestxt). Si ce champ est vide, le `stop_time` hérite de tout comportement de dépôt continu défini dans [routes.txt](#routestxt).<br><br> **Interdit sous condition** :<br> - **Interdit** si `start_pickup_drop_off_window` ou `end_pickup_drop_off_window` sont définis.<br> - Optionnel sinon. | 
 | `shape_dist_traveled` | float non négatif | Optionnel | Distance réelle parcourue le long de la forme associée, du premier arrêt à l’arrêt spécifié dans cette entrée. Ce champ spécifie la quantité de forme à dessiner entre deux arrêts au cours d’un trajet. Doit être dans les mêmes unités que celles utilisées dans [shapes.txt](#shapestxt). Les valeurs utilisées pour `shape_dist_traveled` doivent augmenter avec `stop_sequence`; ils ne doivent pas être utilisés pour montrer un voyage inverse le long d’un itinéraire.<br><br> Recommandé pour les itinéraires en boucle ou en ligne (le véhicule traverse ou parcourt la même portion d’alignement en un seul trajet). Voir [`shapes.shape_dist_traveled`](#shapestxt).<hr> *Exemple : Si un bus parcourt une distance de 5,25 kilomètres depuis le début du formulaire jusqu’à l’arrêt, `shape_dist_traveled`=`5,25`.*| 
 | `timepoint` | Énumération | Optionnel | Indique si les heures d’arrivée et de départ d’un arrêt sont strictement respectées par le véhicule ou s’il s’agit plutôt d’heures approximatives et/ou interpolées. Ce champ permet à un producteur GTFS de fournir des temps d’arrêt interpolés, tout en indiquant que les temps sont approximatifs. Les options valides sont :<br><br> `0` - Les temps sont considérés comme approximatifs.<br> `1` - Les heures sont considérées comme exactes. <br><br> Tous les enregistrements de [stop_times.txt](#stop_timestxt) avec des heures d'arrivée ou de départ définies doivent avoir des valeurs de timepoint renseignées. Si aucune valeur de timepoint n'est fournie, toutes les heures sont considérées comme exactes. | 
 | `pickup_booking_rule_id` | Clé étrangère faisant référence à `booking_rules.booking_rule_id` | Optionnel | Identifie la règle de réservation d’embarquement à cette heure d’arrêt.<br><br> Recommandé lorsque `pickup_type=2`. | 
 | `drop_off_booking_rule_id` | Clé étrangère faisant référence à `booking_rules.booking_rule_id` | Optionnel | Identifie la règle de réservation de descente à cette heure d’arrêt.<br><br> Recommandé lorsque `drop_off_type=2`. | 
 
#### Comportement d’acheminement du service à la demande
- Lorsqu’ils fournissent un itinéraire ou un temps de trajet entre l’origine et la destination, les consommateurs de données doivent ignorer les entrées intermédiaires stop_times.txt avec le même « `trip_id` » qui ont « `start_pickup_drop_off_window` » et `end_pickup_drop_off_window` défini. Pour des exemples illustrant ce qui doit être ignoré, consultez [la page d’exemples de données](../examples/flex/#ignoring-intermediate-stop-times-records-with-pickupdrop-off-windows). 
 - Le chevauchement simultané de la géométrie `id` de locations.geojson, de l’heure `start/end_pickup_drop_off_window` et du `pickup_type` ou `drop_off_type` entre deux ou plusieurs entrées stop_times.txt avec le même `trip_id` est interdit. Pour des exemples illustrant ce qui est interdit, consultez [la page d’exemple de données](../examples/flex/#zone-overlap-constraint). 
 
### calendar.txt 
 
 Fichier : **Requis sous condition** 
 
 Clé primaire (`service_id`) 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `service_id` | Identifiant unique | **Requis** | Identifie un ensemble de dates auxquelles le service est disponible pour un ou plusieurs itinéraires. | 
 | `monday` | Énumération | **Requis** | Indique si le service fonctionne tous les lundis dans la plage de date spécifiée par les champs `start_date` et `end_date`. Notez que les exceptions pour des dates particulières peuvent être répertoriées dans [calendar_dates.txt](#calendar_datestxt). Les options valides sont :<br><br> `1` - Le service est disponible pour tous les lundis de la plage de date .<br> `0` - Le service n’est pas disponible les lundis dans la plage de date. | 
 | `tuesday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf s’applique aux mardis | 
 | `wednesday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf s’applique au mercredi | 
 | `thursday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf s’applique aux jeudis | 
 | `friday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf s’applique au vendredi | 
 | `saturday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf s’applique aux samedis. | 
 | `sunday` | Énumération | **Requis** | Fonctionne de la même manière que « `monday` », sauf qu’il s’applique au dimanche. | 
 | `start_date` | Dates | **Requis** | Commencez le jour d’entretien pour l’intervalle d’entretien. | 
 | `end_date` | Dates | **Requis** | Fin du jour d’entretien pour l’intervalle d’entretien. Ce jour de service est inclus dans l’intervalle. | 
 
### calendar_dates.txt 
 
 Fichier : **Requis sous condition** 
 
 Clé primaire (`service_id`, `date`) 
 
 Le [calendar_dates.txt](#calendar_datestxt ) active ou désactive explicitement le service par date. Il peut être utilisé de deux manières. 
 
 * Recommandé: utilisez [calendar_dates.txt](#calendar_datestxt) en conjonction avec [calendar.txt](#calendartxt) pour définir des exceptions aux modèles de service par défaut définis dans [calendar.txt](#calendartxt). Si le service est généralement régulier, avec quelques changements à des dates explicites (par exemple, pour accueillir des services d’événements spéciaux ou un horaire scolaire), c’est une bonne approche. Dans ce cas, `calendar_dates.service_id` est un identifiant étranger faisant référence à `calendar.service_id`. 
 * Alternative : Omettez [calendar.txt](#calendartxt) et spécifiez chaque date de service dans [calendar_dates.txt](#calendar_datestxt). Cela permet une variation considérable du service et permet un service sans horaires hebdomadaires normaux. Dans ce cas, « `service_id` » est un identifiant. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `service_id` | Clé étrangère faisant référence à `calendar.service_id` ou ID | **Requis** | Identifie un ensemble de dates auxquelles une exception de service se produit pour un ou plusieurs itinéraires. Chaque paire (`service_id`, `date`) ne peut apparaître qu’une seule fois dans [calendar_dates.txt](#calendar_datestxt) si vous utilisez [calendar.txt](#calendartxt) et [calendar_dates.txt](#calendar_datestxt) conjointement. Si une valeur `service_id` apparaît à la fois dans [calendar.txt](#calendartxt) et [calendar_dates.txt](#calendar_datestxt), les informations dans [calendar_dates.txt](#calendar_datestxt) modifient les informations de service spécifiées dans [calendar.txt](#calendartxt). | 
 | `date` | Date | **Requis** | Date à laquelle l’exception de service se produit. | 
 | `exception_type` | Énumération | **Requis** | Indique si le service est disponible à la date spécifiée dans le champ date. Les options valides sont :<br><br> `1` - Le service a été ajouté pour la date spécifiée.<br> `2` - Le service a été supprimé pour la date spécifiée.<hr>*Exemple : supposons qu’un itinéraire comporte un ensemble de trajets disponibles les jours fériés et un autre ensemble de trajets disponibles tous les autres jours. Un `service_id` pourrait correspondre à l’horaire de service régulier et un autre `service_id` pourrait correspondre à l’horaire des jours fériés. Pour un jour férié particulier, le fichier [calendar_dates.txt](#calendar_datestxt) peut être utilisé pour ajouter le jour férié au jour férié.et `service_id` et pour supprimer les jours fériés du calendrier régulier `service_id` .* | 
 
### fare_attributes.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`fare_id`) 
 
 **Versions**<br> 
 Il existe deux options de modélisation pour décrire les tarifs. GTFS-Fares v1 est l’option héritée pour décrire les informations tarifaires minimales. GTFS-Fares V2 est une méthode mise à jour qui permet un compte rendu plus détaillé de la structure tarifaire d’une agence. Les deux peuvent être présentes dans un jeu de données, mais une seule méthode doit être utilisée par un application réutilisatrice de données pour un jeu de données donné. Il est recommandé que GTFS-Fares V2 soit prioritaire sur GTFS-Fares v1.<br><br> Les fichiers associés à GTFS-Fares v1 sont :<br> - [fare_attributes.txt](#fare_attributestxt)<br> - [fare_rules.txt](#fare_rulestxt)<br><br> Les fichiers associés à GTFS-Fares V2 sont :<br> - [fare_media.txt](#fare_mediatxt)<br> - [fare_products.txt](#fare_productstxt)<br> - [fare_leg_rules.txt](#fare_leg_rulestxt)<br> - [fare_transfer_rules.txt](#fare_transfer_rulestxt) 
 
<br> 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `fare_id` | Identifiant unique | **Requis** | Identifie une classe tarifaire. | 
 | `price` | float non négatif | **Requis** | Prix ​​du tarif, dans l’unité spécifiée par `currency_type`. | 
 | `currency_type` | Code devise | **Requis** | Monnaie utilisée pour payer le voyage. | 
 | `payment_method` | Énumération | **Requis** | Indique quand le tarif doit être payé. Les options valides sont :<br><br> `0` - Le tarif est payé à bord.<br> `1` - Le tarif doit être payé avant l’embarquement. | 
 | `transfers` | Énumération | **Requis** | Indique le nombre de transferts autorisés sur ce tarif. Les options valides sont :<br><br> `0` - Aucun transfert autorisé sur ce tarif.<br> `1` - Les passagers peuvent être transférés une seule fois.<br> `2` - Les passagers peuvent transférer deux fois.<br> vide- Les transferts illimités sont autorisés. | 
 | `agency_id` | Clé étrangère faisant référence à `agency.agency_id` | **Requis sous condition** | Identifie l’agence concernée pour un tarif.<br><br> Requis sous condition:<br> - **Requis** si plusieurs agences sont définies dans [agency.txt](#agencytxt).<br> - Recommandé autrement. | 
 | `transfer_duration` | Entier non négatif | Optionnel | Durée en secondes avant l’expiration d’un transfert. Lorsque `transfers`=`0`, ce champ peut être utilisé pour indiquer la durée de validité d’un billet ou il peut être laissé vide. | 
 
### fare_rules.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`*`) 
 
 Le tableau [fare_rules.txt](#fare_rulestxt) spécifie comment les tarifs dans [fare_attributes.txt](#fare_attributestxt) s’applique à un itinéraire. La plupart des structures tarifaires utilisent une combinaison des règles suivantes : 
 
 * Le tarif dépend des gares d’origine ou de destination. 
 *Le tarif dépend des zones traversées par l’itinéraire. 
 * Le tarif dépend de l’itinéraire emprunté par l’itinéraire. 
 
 Pour des exemples montrant comment spécifier une structure tarifaire avec [fare_rules.txt](#fare_rulestxt) et [fare_attributes.txt](#fare_attributestxt), voir [FareExamples](https://web.archive.org/web/20111207224351/https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) dans le wiki du projet open source GoogleTransitDataFeed. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `fare_id` | Clé étrangère faisant référence à `fare_attributes.fare_id` | **Requis** | Identifie une classe tarifaire. | 
 | `route_id` | Clé étrangère faisant référence à `routes.route_id` | Optionnel | Identifie un itinéraire associé à la classe tarifaire. S’il existe plusieurs itinéraires avec les mêmes attributs tarifaires, créez une entrée dans [fare_rules.txt](#fare_rulestxt) pour chaque itinéraire.<hr> *Exemple : Si la classe tarifaire « b » est valide sur l’itinéraire « TSW » et « TSE », le fichier [fare_rules.txt](#fare_rulestxt) contiendra ces entrées pour la classe tarifaire :*<br> ` fare_id, route_id`<br> `b,TSW`<br> `b,EST`| 
 | `origin_id` | Clé étrangère faisant référence à `stops.zone_id` | Optionnel | Identifie une zone d’origine. Si une classe tarifaire a plusieurs zones d’origine, créez une entrée dans [fare_rules.txt](#fare_rulestxt) pour chaque `origin_id`.<hr> *Exemple : Si la classe tarifaire "b" est valable pour tous les voyages en provenance de la zone "2" ou de la zone "8", le fichier [fare_rules.txt](#fare_rulestxt) contiendra ces entrées pour la classe tarifaire :*<br> `fare_id,...,origin_id`<br> `b,...,2`<br> `b,...,8` | 
 | `destination_id` | Clé étrangère faisant référence à `stops.zone_id` | Optionnel | Identifie une zone de destination. Si une classe tarifaire a plusieurs zones de destination, créez une entrée dans [fare_rules.txt](#fare_rulestxt) pour chaque `destination_id`.<hr> *Exemple : Les champs `origin_id` et `destination_id` peuvent être utilisés ensemble pour spécifier que la classe tarifaire « b » est valable pour les voyages entre les zones 3 et 4, et pour les voyages entre les zones 3 et 5, le [fare_rules.txt](#fare_rulestxt) contiendrait ces entrées pour la classe tarifaire :*<br> `fare_id,...,origin_id,destination_id`<br> `b,...,3,4`<br> `b,...,3,5` | 
 | `contains_id` | Clé étrangère faisant référence à `stops.zone_id` | Optionnel | Identifie les zones dans lesquelles un passager entrera en utilisant une classe tarifaire donnée. Utilisé dans certains systèmes pour calculer la classe tarifaire correcte.<hr> *Exemple : Si la classe tarifaire « c » est associée à tous les déplacements sur l’itinéraire GRT qui traverse les zones 5, 6 et 7, le [fare_rules.txt](#fare_rulestxt) contiendra ces entrées :*<br> `fare_id, route_id,...,contains_id`<br> `c,GRT,...,5`<br> `c,GRT,...,6`<br> `c,GRT,...,7`<br> *Étant donné que toutes les zones `contains_id` doivent correspondre pour que le tarif s’applique, un itinéraire qui traverse les zones 5 et 6 mais pas la zone 7 n’aurait pas la classe tarifaire « c ». Pour plus de détails, consultez [https://code.google.com/p/googletransitdatafeed/wiki/FareExamples](https://code.google.com/p/googletransitdatafeed/wiki/FareExamples) dans le wiki du projet GoogleTransitDataFeed.* | 
 
### timeframes.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`*`) 
 
 Utilisée pour décrire les tarifs qui peuvent varier en fonction de l’heure de la journée, le jour de la semaine ou un jour particulier de l’année. Les périodes horaires peuvent être associées aux produits tarifaires dans [fare_leg_rules.txt](#fare_leg_rulestxt).<br> 
 Il ne doit pas y avoir d’intervalles de temps qui se chevauchent pour les mêmes valeurs `timeframe_group_id` et `service_id`. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `timeframe_group_id` | ID | **Requis** | Identifie une période horaire ou un ensemble de périodes horaires. | 
 | `start_time` | Temps | **Requis sous condition** | Définit le début d’une période. L’intervalle inclut l’heure de début.<br> Les valeurs supérieures à `24:00:00` sont interdites. Une valeur vide dans `start_time` est considérée comme `00:00:00`.<br><br> Requis sous condition:<br> - **Requis** si `timeframes.end_time` est défini.<br> - **Interdit** sinon | 
 | `end_time` | Temps | **Requis sous condition** | Définit la fin d’une période. L’intervalle n’inclut pas l’heure de fin.<br> Les valeurs supérieures à `24:00:00` sont interdites. Une valeur vide dans `end_time` est considérée comme `24:00:00`.<br><br> Requis sous condition:<br> - **Requis** si `timeframes.start_time` est défini.<br> - **Interdit** sinon | 
 | `service_id` | Clé étrangère faisant référence à `calendar.service_id` ou `calendar_dates.service_id` | **Requis** | Identifie un ensemble de dates auxquelles une période est en vigueur. | 
 
#### Sémantique de l’heure locale de la période
- Lors de l’évaluation de l’heure d’un événement tarifaire par rapport à [timeframes.txt](#timeframestxt), l’heure de l’événement est calculée en heure locale en utilisant le fuseau horaire local, tel que déterminé par le `stop_timezone`, si spécifié, de l’arrêt ou de la gare parent pour l’événement tarifaire. S’il n’est pas spécifié, le fuseau horaire de l’agence du flux doit être utilisé à la place. 
 - Le « jour en cours » est la date actuelle de l’événement tarifaire, calculée par rapport au fuseau horaire local. Le « jour en cours » peut être différent du jour de service d’un trajet tarifaire, en particulier pour les trajets qui s’étendent après minuit. 
 - L’« heure de la journée » pour l’événement tarifaire est calculée par rapport au « jour en cours » à l’aide de la sémantique de type champ GTFS Time. 
 
### fare_media.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`fare_media_id`) 
 
 Pour décrire les différents supports tarifaires qui peuvent être utilisés pour utiliser les produits tarifaires. Les supports tarifaires sont des supports physiques ou virtuels utilisés pour la représentation et/ou la validation d’un produit tarifaire. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `fare_media_id` | Identifiant unique | **Requis** | Identifie un média tarifaire. | 
 | `fare_media_name` | Text | Optionnel | Nom du support tarifaire.<br><br> Pour les supports tarifaires qui sont des cartes de transport en commun (`fare_media_type =2`) ou des applications mobiles (`fare_media_type =4`), le `fare_media_name` doit être inclus et doit correspondre au nom du passager utilisé par les organisations qui les livrent. | 
 | `fare_media_type` | Énumération | **Requis** | Le type de support tarifaire. Les options valides sont :<br><br> `0` - Aucun. Utilisé lorsqu’aucun support tarifaire n’est impliqué dans l’achat ou la validation d’un produit tarifaire, comme le paiement en espèces à un chauffeur ou à un conducteur sans billet physique fourni.<br> `1` - Billet physique papier qui permet à un passager d’effectuer soit un certain nombre de voyages pré-achetés, soit un nombre illimité de voyages sur une période de temps déterminée.<br> `2` - Carte de transport physique sur laquelle sont stockés des billets, des laissez-passer ou une valeur monétaire.<br> `3` - cEMV (Europay, Mastercard et Visa sans contact) en tant que conteneur de jetons en boucle ouverte pour la billetterie basée sur un compte.<br> `4` – Application mobile contenant des cartes de transport en commun virtuelles, des billets, des laissez-passer ou une valeur monétaire. | 
 
### fare_products.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`fare_product_id`, `fare_media_id`) 
 
 Utilisée pour décrire la gamme de tarifs disponibles à l’achat par les passagers ou pris en compte dans le calcul du tarif total pour les trajets à plusieurs tronçons, comme les frais de transfert. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `fare_product_id` | ID | **Requis** | Identifie un produit tarifaire ou un ensemble de produits tarifaires.<br><br> Plusieurs entrées dans [fare_products.txt](#fare_productstxt) peuvent partager le même `fare_product_id`, auquel cas toutes les entrées avec cet ID seront récupérées lorsqu’elles seront référencées à partir d’un autre fichier.<br><br> Plusieurs entrées peuvent partager le même `fare_product_id` mais avec des `fare_media_id` différents, indiquant diverses méthodes disponibles pour utiliser le produit tarifaire, potentiellement à des prix différents. | 
 | `fare_product_name` | Text | Optionnel | Le nom du produit tarifaire tel qu’affiché aux passagers. | 
 | `fare_media_id` | Clé étrangère faisant référence à `fare_media.fare_media_id` | Optionnel | Identifie un support tarifaire qui peut être utilisé pour utiliser le produit tarifaire pendant le voyage. Lorsque `fare_media_id` est vide, on considère que le support tarifaire est inconnu.| 
 | `amount` | Montant en devise | **Requis** | Le coût du produit tarifaire. Peut être négatif pour représenter les remises de transfert. Peut être zéro pour représenter un produit tarifaire gratuit. | 
 | `currency` | Code devise | **Requis** | La devise du coût du produit tarifaire. | 
 
 
### fare_leg_rules.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`network_id, from_area_id, to_area_id, from_timeframe_group_id, to_timeframe_group_id, fare_product_id`) 
 
 Règles tarifaires pour les tronçons individuels du voyage. 
 
 Les Tarifs dans [`fare_leg_rules.txt`](#fare_leg_rulestxt) doivent être interrogés en filtrant toutes les entrées du fichier pour trouver les règles qui correspondent au tronçon que doit parcourir le passager. 
 
 Pour traiter le coût d’un trajet : 
 
 1. Le fichier [fare_leg_rules.txt](#fare_leg_rulestxt) doit être filtré par les champs qui définissent les caractéristiques du voyage, ces champs sont : 
    - `fare_leg_rules.network_id` 
    - `fare_leg_rules.from_area_id` 
    - `fare_leg_rules.to_area_id` 
    - `fare_leg_rules.from_timeframe_group_id` 
    - `fare_leg_rules.to_timeframe_group_id` 
<br/> 
 
 2. Si le trajet correspond exactement à une entrée dans [fare_leg_rules.txt](#fare_leg_rulestxt) en fonction des caractéristiques du voyage, cette entrée doit être traitée pour déterminer le coût du trajet. Ce fichier gère les entrées vides de deux manières : sémantique vide OU Rule_priority. 
<br/> 
 
 3. Si aucune correspondance exacte n’est trouvée ET que le champ `rule_priority` n’existe pas, alors les entrées vides dans `fare_leg_rules.network_id`, `fare_leg_rules.from_area_id` et `fare_leg_rules.to_area_id` doivent être vérifiées pour traiter le coût du trajet : 
    - Une entrée vide dans `fare_leg_rules.network_id` correspond à tous les réseaux définis dans [routes.txt](#routestxt) ou [networks.txt](#networkstxt) à l’exclusion de ceux répertoriés sous `fare_leg_rules.network_id` 
 
    - Une entrée vide dans `fare_leg_rules.from_area_id` correspond à toutes les zones définies dans `areas.area_id` à l’exclusion de celles répertoriées sous `fare_leg_rules.from_area_id` 
    - Une entrée vide dans `fare_leg_rules.to_area_id` correspond vers toutes les zones définies dans `areas.area_id`, à l’exclusion de celles répertoriées sous `fare_leg_rules.to_area_id` 
<br/> 
 
 4. Si le champ `rule_priority` existe, alors
    - Une entrée vide dans `fare_leg_rules.network_id` indique que le réseau du tronçon n’affecte pas la correspondance de cette règle. 
    - Une entrée vide dans `fare_leg_rules.from_area_id` indique que la zone de départ du tronçon n’affecte pas la correspondance de cette règle. 
    - Une entrée vide dans `fare_leg_rules.to_area_id` indique que la zone d’arrivée du tronçon n’affecte pas la correspondance de cette règle. 
<br/> 
 
 5. Si le trajet ne correspond à aucune des règles décrites ci-dessus, le tarif est inconnu. 

<br/> 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `leg_group_id` | ID | Optionnel | Identifie un groupe d’entrées dans [fare_leg_rules.txt](#fare_leg_rulestxt).<br><br> Utilisé pour décrire les règles de transfert tarifaire entre `fare_transfer_rules.from_leg_group_id` et `fare_transfer_rules.to_leg_group_id`.<br><br> Plusieurs entrées dans [fare_leg_rules.txt](#fare_leg_rulestxt) peuvent appartenir au même `fare_leg_rules.leg_group_id`.<br><br> La même entrée dans [fare_leg_rules.txt](#fare_leg_rulestxt) (sans compter `fare_leg_rules.leg_group_id`) ne doit pas appartenir à plusieurs `fare_leg_rules.leg_group_id`.| 
 | `network_id` | Clé étrangère faisant référence à `routes.network_id` ou `networks.network_id`| Optionnel | Identifie un réseau d’itinéraires qui s’applique à la règle du segment tarifaire.<br><br> Si le champ `rule_priority` n’existe pas ET qu’il n’y a pas de valeurs `fare_leg_rules.network_id` correspondant au `network_id` filtré, `fare_leg_rules.network_id` vide sera mis en correspondance par défaut.<br><br> Une entrée vide dans `fare_leg_rules.network_id` correspond à tous les réseaux définis dans [routes.txt](#routestxt) ou [networks.txt](#networkstxt) à l’exclusion de ceux répertoriés sous `fare_leg_rules.network_id`<br><br> Si le champ `rule_priority` existe dans le fichier, un `fare_leg_rules.network_id` vide indique que le réseau de routes du tronçon n’affecte pas la correspondance de cette règle. | 
 | `from_area_id` | Clé étrangère faisant référence à `areas.area_id` | Optionnel | Identifie une zone de départ.<br><br> Si le champ `rule_priority` n’existe pas ET qu’il n’y a pas de valeurs `fare_leg_rules.from_area_id` correspondant à la `area_id` filtrée, `fare_leg_rules.from_area_id` vide sera mis en correspondance par défaut.<br><br> Une entrée vide dans `fare_leg_rules.from_area_id` correspond à toutes les zones définies dans `areas.area_id` à l’exclusion de celles répertoriées sous `fare_leg_rules.from_area_id`<br><br> Si le champ `rule_priority` existe dans le fichier, un `fare_leg_rules.from_area_id` vide indique que la zone de départ du tronçon n’affecte pas la correspondance de cette règle. | 
 | `to_area_id` | Clé étrangère faisant référence à `areas.area_id` | Optionnel | Identifie une zone d’arrivée.<br><br> Si le champ `rule_priority` n’existe pas ET qu’il n’y a pas de valeurs `fare_leg_rules.to_area_id` correspondant à la `area_id` filtrée, `fare_leg_rules.to_area_id` vide sera mis en correspondance par défaut.<br><br> Une entrée vide dans `fare_leg_rules.to_area_id` correspond à toutes les zones définies dans `areas.area_id` à l’exclusion de celles répertoriées sous `fare_leg_rules.to_area_id`<br><br> Si le champ `rule_priority` existe dans le fichier, un `fare_leg_rules.to_area_id` vide indique que la zone d’arrivée du tronçon n’affecte pas la correspondance de cette règle. | 
 | `from_timeframe_group_id` | Clé étrangère faisant référence à `timeframes.timeframe_group_id` | Optionnel | Définit la période de l’événement de validation tarifaire au début du segment tarifaire.<br><br> L’« heure de début » du trajet tarifaire est l’heure à laquelle l’événement est prévu pour avoir lieu. Par exemple, l’heure peut être l’heure de départ prévue d’un bus au début d’un trajet tarifaire où le passager embarque et valide son tarif. Pour la sémantique de correspondance de règle ci-dessous, l’heure de début est calculée en heure locale, comme déterminé par la [Sémantique de l’heure locale](#semantique-de-lheure-locale-de-la-periode) de [timeframes.txt](#timeframestxt). L’arrêt ou la gare de l’événement de départ du tronçon tarifaire doit être utilisé pour la résolution du fuseau horaire, le cas échéant.<br><br> Pour une règle de segment tarifaire qui spécifie un `from_timeframe_group_id`, cette règle correspondra à un segment particulier s’il existe au moins une entrée dans [timeframes.txt](#timeframestxt) où toutes les conditions suivantes sont vraies<br> - La valeur de `timeframe_group_id` est égale à la valeur `from_timeframe_group_id` .<br> - L’ensemble de jours identifiés par le `service_id` de l'entrée contient le « jour actuel » de l’heure de début du segment tarifaire.<br> - L’« heure du jour » de l’heure de début du trajet tarifaire est supérieure ou égale à la valeur `timeframes.start_time` de l'entrée et inférieure à la valeur `timeframes.end_time`.<br><br> Un `fare_leg_rules.from_timeframe_group_id` vide indique que l’heure de début du tronçon n’affecte pas la correspondance de cette règle. | 
 | `to_timeframe_group_id` | Clé étrangère faisant référence à `timeframes.timeframe_group_id` | Optionnel | Définit la période de temps pour l’événement de validation tarifaire à la fin du segment tarifaire.<br><br> L’« heure de fin » du trajet tarifaire est l’heure à laquelle l’événement est prévu pour avoir lieu. Par exemple, l’heure peut être l’heure d’arrivée prévue d’un bus à la fin d’un trajet tarifaire où le passager descend et valide son tarif. Pour la sémantique de correspondance de règle ci-dessous, l’heure de fin est calculée en heure locale, comme déterminé par la [Sémantique de l’heure locale](#semantique-de-lheure-locale-de-la-periode) de [timeframes.txt](#timeframestxt). L’arrêt ou la gare de l’événement d’arrivée du tronçon tarifaire doit être utilisé pour la résolution du fuseau horaire, le cas échéant.<br><br> Pour une règle de segment tarifaire qui spécifie un `to_timeframe_group_id`, cette règle correspondra à un segment particulier s’il existe au moins une entrée dans [timeframes.txt](#timeframestxt) où toutes les conditions suivantes sont vraies<br> - La valeur de `timeframe_group_id` est égale à la valeur `to_timeframe_group_id` .<br> - L’ensemble de jours identifiés par le `service_id` de l'entrée contient le « jour en cours » de l’heure de fin du trajet tarifaire.<br> - L’« heure du jour » de l’heure de fin du trajet tarifaire est supérieure ou égale à la valeur `timeframes.start_time` de l'entrée et inférieure à la valeur `timeframes.end_time`.<br><br> Un `fare_leg_rules.to_timeframe_group_id` vide indique que l’heure de fin du tronçon n’affecte pas la correspondance de cette règle. | 
 | `fare_product_id` | Clé étrangère faisant référence à `fare_products.fare_product_id` | **Requis** | Le produit tarifaire requis pour parcourir le tronçon. | 
 | `rule_priority` | Entier non négatif | Optionnel | Définit l’ordre de priorité dans lequel les règles de correspondance sont appliquées aux segments, permettant à certaines règles d’avoir priorité sur d’autres. Lorsque plusieurs entrées dans `fare_leg_rules.txt` correspondent, la règle ou l’ensemble de règles avec la valeur la plus élevée pour `rule_priority` sera sélectionné.<br><br> Une valeur vide pour `rule_priority` est traitée comme zéro. | 
 
### fare_transfer_rules.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`from_leg_group_id, to_leg_group_id, fare_product_id, transfer_count, durée_limit`) 
 
 Règles tarifaires pour les transferts entre les tronçons du voyage défini dans [`fare_leg_rules.txt`](#fare_leg_rulestxt). 
 
 Pour traiter le coût d’un voyage multi-segments : 
 
 1. Les groupes de segments tarifaires applicables définis dans `fare_leg_rules.txt` doivent être déterminés pour tous les segments de voyage individuels en fonction du voyage du passager. 
 2. Le fichier [fare_transfer_rules.txt](#fare_transfer_rulestxt) doit être filtré par les champs qui définissent les caractéristiques du transfert, ces champs sont : 
    - `fare_transfer_rules.from_leg_group_id` 
    - `fare_transfer_rules.to_leg_group_id`<br/> 
<br/> 
 
 3. Si le transfert correspond exactement à une entrée dans [fare_transfer_rules.txt](#fare_transfer_rulestxt) en fonction des caractéristiques du transfert, cette entrée doit être traitée pour déterminer le coût du transfert. 
 4. Si aucune correspondance exacte n’est trouvée, alors les entrées vides dans `from_leg_group_id` ou dans `to_leg_group_id` doivent être vérifiées pour traiter le coût du transfert : 
    - Une entrée vide dans `fare_transfer_rules.from_leg_group_id` correspond à tous les groupes de tronçons définis sous `fare_leg_rules.leg_group_id` à l’exclusion de ceux répertoriés sous `fare_transfer_rules.from_leg_group_id` 
    - Une entrée vide dans `fare_transfer_rules.to_leg_group_id` correspond à tous les groupes de tronçons définis sous `fare_leg_rules.leg_group_id` à l’exclusion de ceux répertoriés sous `fare_transfer_rules.to_leg_group_id`<br/> 
<br/> 
 5. Si le transfert ne correspond à aucune des règles décrites ci-dessus, il n’y a pas d’accord de transfert et les tronçons sont considérés comme séparés. 

<br/> 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `from_leg_group_id` | Clé étrangère faisant référence à `fare_leg_rules.leg_group_id` | Optionnel | Identifie un groupe de règles de tranche tarifaire avant transfert.<br><br> S’il n’y a pas de valeurs `fare_transfer_rules.from_leg_group_id` correspondant au `leg_group_id` filtré, `fare_transfer_rules.from_leg_group_id` vide sera mis en correspondance par défaut.<br><br> Une entrée vide dans `fare_transfer_rules.from_leg_group_id` correspond à tous les groupes de tronçons définis sous `fare_leg_rules.leg_group_id` à l’exclusion de ceux répertoriés sous `fare_transfer_rules.from_leg_group_id`| 
 | `to_leg_group_id` | Clé étrangère faisant référence à `fare_leg_rules.leg_group_id` | Optionnel | Identifie un groupe de règles de tranche tarifaire après le transfert.<br><br> S’il n’y a pas de valeurs `fare_transfer_rules.to_leg_group_id` correspondant au `leg_group_id` filtré, `fare_transfer_rules.to_leg_group_id` vide sera mis en correspondance par défaut.<br><br> Une entrée vide dans `fare_transfer_rules.to_leg_group_id` correspond à tous les groupes de tronçons définis sous `fare_leg_rules.leg_group_id` à l’exclusion de ceux répertoriés sous `fare_transfer_rules.to_leg_group_id` | 
 | `transfer_count` | Entier non nul | **Interdit sous condition** | Définit le nombre de transferts consécutifs auxquels la règle de transfert peut être appliquée.<br><br> Les options valides sont :<br> `-1` - Aucune limite.<br> `1` ou plus : définit le nombre de transferts que la règle de transfert peut couvrir.<br><br> Si un sous-parcours correspond à plusieurs entrées avec des `transfer_count` différents, alors la règle avec le `transfer_count` minimum qui est supérieur ou égal au nombre de transferts actuel du sous-parcours doit être sélectionnée.<br><br> Interdit sous condition:<br> - **Interdit** si `fare_transfer_rules.from_leg_group_id` n’est pas égal à `fare_transfer_rules.to_leg_group_id`.<br> - **Requis** si `fare_transfer_rules.from_leg_group_id` est égal à `fare_transfer_rules.to_leg_group_id`. | 
 | `duration_limit` | Entier positif | Optionnel | Définit la durée limite du transfert.<br><br> Doit être exprimé en incréments entiers de secondes.<br><br> S’il n’y a pas de limite de durée, `fare_transfer_rules.duration_limit` doit être vide. | 
 | `duration_limit_type` | Énumération | **Requis sous condition** | Définit le début et la fin relatifs de `fare_transfer_rules.duration_limit`.<br><br> Les options valides sont :<br> `0` - Entre la validation du tarif de départ du tronçon en cours et la validation du tarif d’arrivée du tronçon suivant.<br> `1` - Entre la validation du tarif de départ du tronçon en cours et la validation du tarif de départ du tronçon suivant.<br> `2` - Entre la validation du tarif d’arrivée du tronçon en cours et la validation du tarif de départ du tronçon suivant.<br> `3` - Entre la validation du tarif d’arrivée du tronçon en cours et la validation du tarif d’arrivée du tronçon suivant.<br><br> Requis sous condition:<br> - **Requis** si `fare_transfer_rules.duration_limit` est défini.<br> - **Interdit** si `fare_transfer_rules.duration_limit` est vide. | 
 | `fare_transfer_type` | Énumération | **Requis** | Indique la méthode de traitement des coûts de transfert entre les tronçons d’un voyage :<br> ![](../../assets/2-leg.svg)<br> Les options valides sont :<br> `0` - De la jambe `fare_leg_rules.fare_product_id` plus `fare_transfer_rules.fare_product_id`; A + AB.<br> `1` - Du tronçon `fare_leg_rules.fare_product_id` plus `fare_transfer_rules.fare_product_id` plus du tronçon vers `fare_leg_rules.fare_product_id`; A + AB + B.<br> `2` - `fare_transfer_rules.fare_product_id`; UN B.<br><br> Interactions de traitement des coûts entre plusieurs transferts au cours d’un voyage :<br> ![](../../assets/3-leg.svg)<br><table><thead><tr><th> `fare_transfer_type`</th><th> Traitement A > B</th><th> Traitement B > C</th></tr></thead><tbody><tr><td> `0`</td><td> A + AB</td><td> S + BC</td></tr><tr><td> `1`</td><td> A + AB + B</td><td> S + BC + C</td></tr><tr><td> `2`</td><td> UN B</td><td> S + BC</td></tr></tbody></table> Où S indique le coût total traité du ou des tronçons et transferts précédents. | 
 | `fare_product_id` | Clé étrangère faisant référence à `fare_products.fare_product_id` | Optionnel | Produit tarifaire requis pour le transfert entre deux segments tarifaires. Si vide, le coût de la règle de transfert est de 0.| 
 
 
### areas.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`area_id`) 
 
 Définit les identifiants de zone. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `area_id` | Identifiant unique | **Requis** | Identifie une zone. Doit être unique dans [areas.txt](#areastxt). | 
 | `area_name` | Text | **Optionnel** | Le nom de la zone tel qu’affiché au passager. | 
 
### stop_areas.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`*`) 
 
 Attribue des arrêts de [stops.txt](#stopstxt) aux zones. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `area_id` | Clé étrangère faisant référence à `areas.area_id` | **Requis** | Identifie une zone à laquelle appartiennent un ou plusieurs `stop_id`. Le même `stop_id` peut être défini dans plusieurs `area_id`. | 
 | `stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis** | Identifie un arrêt. Si une station (c’est-à-dire un arrêt avec `stops.location_type=1`) est définie dans ce champ, on suppose que tous ses quais (c’est-à-dire tous les arrêts avec `stops.location_type=0` pour lesquels cette station est définie comme `stops.parent_station`) font partie de la même zone. Ce comportement peut être remplacé en attribuant des plates-formes à d’autres zones. | 
 
### networks.txt 
 
 Fichier : **Interdit sous condition** 
 
 Clé primaire (`network_id`) 
 
 Définit les identifiants de réseau qui s’appliquent aux règles tarifaires. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `network_id` | Identifiant unique | **Requis** | Identifie un réseau. Doit être unique dans [networks.txt](#networkstxt). | 
 | `network_name` | Text | **Optionnel** | Le nom du réseau qui s’applique aux règles tarifaires, tel qu’utilisé par l’agence locale et ses passagers. 
 
### route_networks.txt 
 
 Fichier : **Interdit sous condition** 
 
 Clé primaire (`route_id`) 
 
 Attribue des routes de [routes.txt](#routestxt) à réseaux. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `network_id` | Clé étrangère faisant référence à `networks.network_id` | **Requis** | Identifie un réseau auquel appartiennent un ou plusieurs `route_id`. Un `route_id` ne peut être défini que dans un seul `network_id`. | 
 | `route_id` | Clé étrangère faisant référence à `routes.route_id` | **Requis** | Identifie un itinéraire. | 
 
### shapes.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`shape_id`, `shape_pt_sequence`) 
 
 Les Tracé des lignes décrivent le chemin qu’un véhicule parcourt le long d’un l’alignement de l’itinéraire, et sont définis dans le fichier shapes.txt. Les Tracé des lignes sont associées aux Trajets et consistent en une séquence de points par lesquels le véhicule passe dans l’ordre. Les Tracé des lignes n’ont pas besoin d’intercepter exactement l’emplacement des Arrêts, mais tous les Arrêts d’un trajet doivent se trouver à une petite distance de la forme pour ce trajet, c’est-à-dire à proximité des segments de ligne droite reliant les points de la forme. Le fichier shapes.txt doit être inclus pour tous les services basés sur l'itinéraire (pas pour les services à la demande basés sur les zones).
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `shape_id` | ID | **Requis** | Identifie une forme. | 
 | `shape_pt_lat` | Latitudes | **Requis** | Latitude d’un point de forme. Chaque entrée dans [shapes.txt](#shapestxt) représente un point de forme utilisé pour définir la forme. | 
 | `shape_pt_lon` | Longitude | **Requis** | Longitude d’un point de forme. | 
 | `shape_pt_sequence` | Entier non négatif | **Requis** | Séquence dans laquelle les points de la forme se connectent pour former la forme. Les valeurs doivent augmenter tout au long du voyage mais ne le font pas Il n’est pas nécessaire que ce soit consécutif.<hr> *Exemple : Si la forme "A_shp" a trois points dans sa définition, le fichier [shapes.txt](#shapestxt) peut contenir ces entrées pour définir la forme :*<br> `shape_id, shape_pt_lat, shape_pt_lon, shape_pt_sequence`<br> `A_shp,37.61956,-122.48161,0`<br> `A_shp,37.64430,-122.41070,6`<br> `A_shp,37.65863,-122.30839,11` | 
 | `shape_dist_traveled` | float non négatif | Optionnel | Distance réelle parcourue le long de la forme depuis le premier point de la forme jusqu’au point spécifié dans cette entrée. Utilisé par les planificateurs de voyage pour afficher la partie correcte de la forme sur une carte. Les valeurs doivent augmenter avec `shape_pt_sequence`; ils ne doivent pas être utilisés pour montrer un voyage inverse le long d’un itinéraire. Les unités de distance doivent être cohérentes avec celles utilisées dans [stop_times.txt](#stop_timestxt).<br><br> Recommandé pour les itinéraires en boucle ou en ligne (le véhicule traverse ou parcourt la même portion d’alignement en un seul trajet). <br><img src="../../../assets/inlining.svg" width=200px style="display: block; margin-left: auto; margin-right: auto;"><br> Si un véhicule retrace ou traverse le tracé de l’itinéraire à des points au cours d’un voyage, `shape_dist_traveled` est important pour clarifier comment les parties des points dans [shapes.txt](#shapestxt) correspondent aux entrées dans [stop_times.txt](#stop_timestxt).<hr> *Exemple : Si un bus circule le long des trois points définis ci-dessus pour A_shp, les valeurs supplémentaires de `shape_dist_traveled` (affichées ici en kilomètres) ressembleraient à ceci :*<br> `shape_id, shape_pt_lat, shape_pt_lon, shape_pt_sequence, shape_dist_traveled`<br> `A_shp,37.61956,-122.48161,0,0`<br> `A_shp,37.64430,-122.41070,6,6.8310`<br> `A_shp,37.65863,-122.30839,11,15.8765` | 
 
### frequencies.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`trip_id`, `start_time`) 
 
 [Frequencies.txt](#frequenciestxt) représente les trajets qui s’effectuent sur des trajets réguliers (temps entre les trajets). Ce fichier peut être utilisé pour représenter deux types de services différents. 
 
 * Service basé sur la fréquence (`exact_times`=`0`) dans lequel le service ne suit pas un horaire fixe tout au long de la journée. Au lieu de cela, les opérateurs tentent de maintenir strictement les intervalles de déplacement prédéterminés. 
 * Une représentation compressée d’un service basé sur un horaire (`exact_times`= `1`) qui a exactement le même avancement pour les trajets sur des périodes de temps spécifiées. Dans les services basés sur des horaires, les opérateurs s’efforcent de respecter strictement un horaire. 
 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `trip_id` | Clé étrangère faisant référence à `trips.trip_id` | **Requis** | Identifie un voyage auquel s’applique l’avance de service spécifiée. | 
 | `start_time` | Temps | **Requis** | Heure à laquelle le premier véhicule part du premier arrêt du voyage avec l’avance spécifiée. | 
 | `end_time` | Temps | **Requis** | Heure à laquelle le service change d’itinéraire (ou cesse) au premier arrêt du voyage. | 
 | `headway_secs` | Entier positif | **Requis** | Temps, en secondes, entre les départs du même arrêt (avancée) pour le trajet, pendant l’intervalle de temps spécifié par `start_time` et `end_time`. Plusieurs trajets peuvent être définis pour un même trajet, mais ne doivent pas se chevaucher. De nouvelles avancées peuvent commencer à l’heure exacte où se termine la progression précédente. | 
 | `exact_times` | Énumération | Optionnel | Indique le type de prestation pour un trajet. Voir la description du fichier pour plus d’informations. Les options valides sont :<br><br> `0` ou vide : déclenchements basés sur la fréquence.<br> `1` : trajets basés sur un horaire avec exactement le même trajet tout au long de la journée. Dans ce cas, la valeur `end_time` doit être supérieure au dernier trajet souhaité `start_time` mais inférieure au dernier trajet souhaité start_time + `headway_secs`. | 
 
### transfers.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`from_stop_id`, `to_stop_id`, `from_trip_id`, `to_trip_id`, `from_route_id`, `to_route_id`) 
 
 Lors du calcul d’un itinéraire, les applications consommatrices de GTFS interpolent les transferts en fonction du temps autorisé et de la proximité des arrêts. [Transfers.txt](#transferstxt) spécifie des règles et des remplacements supplémentaires pour les transferts sélectionnés. 
 
 Les champs `from_trip_id`, `to_trip_id`, `from_route_id` et `to_route_id` permettent des niveaux de spécificité plus élevés pour les règles de transfert. Avec `from_stop_id` et `to_stop_id`, le classement de spécificité est le suivant : 
 
 1. Les deux `trip_id` sont définis : `from_trip_id` et `to_trip_id`. 
 2. Un ensemble `trip_id` et `route_id` défini : (`from_trip_id` et `to_route_id`) ou (`from_route_id` et `to_trip_id`). 
 3. Un `trip_id` défini : `from_trip_id` ou `to_trip_id`. 
 4. Les deux `route_id` sont définis : `from_route_id` et `to_route_id`. 
 5. Un `route_id` défini : `from_route_id` ou `to_route_id`. 
 6. Seuls `from_stop_id` et `to_stop_id` sont définis : aucun champ lié à l’itinéraire ou au voyage n’est défini. 
 
 Pour un couple ordonné d’arrivée et de départ donné, le transfert ayant la plus grande spécificité qui s’applique entre ces deux voyages est choisi. Pour une paire de voyages, il ne devrait pas y avoir deux transferts ayant la même spécificité maximale qui pourraient s’appliquer. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `from_stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis sous condition** | Identifie un arrêt ou une station où commence une connexion entre des itinéraires. Si ce champ fait référence à une gare, la règle de transfert s’applique à tous ses arrêts enfants. Faire référence à une gare est interdit pour les `transfer_types` 4 et 5. | 
 | `to_stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis sous condition** | Identifie un arrêt ou une station où se termine une connexion entre des itinéraires. Si ce champ fait référence à une gare, la règle de transfert s’applique à tous les arrêts enfants. Faire référence à une gare est interdit pour les `transfer_types` 4 et 5. | 
 | `from_route_id` | Clé étrangère faisant référence à `routes.route_id` | Optionnel | Identifie un itinéraire où commence une connexion.<br><br> Si `from_route_id` est défini, le transfert s’appliquera au voyage d’arrivée sur l’itinéraire pour le `from_stop_id` donné.<br><br> Si `from_trip_id` et `from_route_id` sont définis, le `trip_id` doit appartenir au `route_id` et `from_trip_id` aura la priorité. | 
 | `to_route_id` | Clé étrangère faisant référence à `routes.route_id` | Optionnel | Identifie un itinéraire où se termine une connexion.<br><br> Si `to_route_id` est défini, le transfert s’appliquera au trajet de départ sur l’itinéraire pour le `to_stop_id` donné.<br><br> Si `to_trip_id` et `to_route_id` sont définis, le `trip_id` doit appartenir au `route_id` et `to_trip_id` aura la priorité. | 
 | `from_trip_id` | Clé étrangère faisant référence à `trips.trip_id` | **Requis sous condition** | Identifie un voyage où commence une connexion entre les itinéraires.<br><br> Si `from_trip_id` est défini, le transfert s’appliquera au voyage d’arrivée pour le `from_stop_id` donné.<br><br> Si `from_trip_id` et `from_route_id` sont définis, le `trip_id` doit appartenir au `route_id` et `from_trip_id` aura la priorité. OBLIGATOIRE si `transfer_type` est `4` ou `5`. | 
 | `to_trip_id` | Clé étrangère faisant référence à `trips.trip_id` | **Requis sous condition** | Identifie un voyage où se termine une connexion entre des itinéraires.<br><br> Si `to_trip_id` est défini, le transfert s’appliquera au voyage de départ pour le `to_stop_id` donné.<br><br> Si `to_trip_id` et `to_route_id` sont définis, le `trip_id` doit appartenir au `route_id` et `to_trip_id` aura la priorité. OBLIGATOIRE si `transfer_type` est `4` ou `5`. | 
 | `transfer_type` | Énumération | **Requis** | Indique le type de connexion pour la paire spécifiée (`from_stop_id`, `to_stop_id`). Les options valides sont :<br><br> `0` ou vide – Point de transfert Recommandé entre les itinéraires.<br> `1` - Point de transfert chronométré entre deux itinéraires. Le véhicule au départ doit attendre celui qui arrive et laisser suffisamment de temps au passager pour effectuer le transfert entre les itinéraires.<br> `2` - Le transfert nécessite un minimum de temps entre l’arrivée et le départ pour assurer une correspondance. Le temps requis pour le transfert est spécifié par `min_transfer_time`.<br> `3` - Les Transferts ne sont pas possibles entre les itinéraires sur place.<br> `4` - Les passagers peuvent passer d’un voyage à un autre en restant à bord du même véhicule (un « transfert au siège »). Plus de détails sur ce type de transfert [ci-dessous](#voyages-lies).<br> `5` - Les transferts à bord ne sont pas autorisés entre des voyages séquentiels. Le passager doit descendre du véhicule et remonter à bord. Plus de détails sur ce type de transfert [ci-dessous](#linked-trips). | 
 | `min_transfer_time` | Entier non négatif | Optionnel | Temps, en secondes, qui doit être disponible pour permettre un transfert entre les itinéraires aux arrêts spécifiés. Le `min_transfer_time` doit être suffisant pour permettre à un passager typique de se déplacer entre les deux arrêts, y compris le temps tampon pour tenir compte des variations d’horaire sur chaque itinéraire. | 
 
#### Voyages liés 
 
 Ce qui suit s’applique à `transfer_type=4` et `=5`, qui sont utilisés pour relier des voyages entre eux, avec ou sans transferts à bord. 
 
 Les trajets enchaînés DOIT être effectués par le même véhicule. Le véhicule PEUT être attelé ou dételé à d’autres véhicules. 
 
 Si un transfert de voyages liés et un block_id sont fournis et qu’ils produisent des résultats contradictoires, alors le transfert de voyages liés doit être utilisé. 
 
 Le dernier arrêt de `from_trip_id` DEVRAIT être géographiquement proche du premier arrêt de `to_trip_id`, et la dernière heure d’arrivée de `from_trip_id` DEVRAIT être antérieure mais proche de la première heure de départ de `to_trip_id`. La dernière heure d’arrivée de `from_trip_id` PEUT être postérieure à la première heure de départ de `to_trip_id` dans le cas où le voyage `to_trip_id` a lieu le jour de service suivant. 
 
 Les Trajets PEUT être liés 1 à 1 dans le cas normal, mais PEUT également être liés 1 à n, n à 1 ou n à n pour représenter des continuations de voyage plus complexes. Par exemple, deux trajets en train (trajet A et trajet B dans le schéma ci-dessous) peuvent fusionner en un seul trajet en train (trajet C) après une opération d’attelage de véhicules en gare commune : 
 
 - Dans un trajet 1 vers n continuation, le `trips.service_id` pour chaque `to_trip_id` DOIT être identique. 
 - Dans une continuation n vers 1, le `trips.service_id` pour chaque `from_trip_id` DOIT être identique. 
 - Les continuations n vers n doivent respecter les deux contraintes. 
 - Les Trajets peuvent être liés entre eux dans le cadre de plusieurs continuations distinctes, à condition que le `trip.service_id` NE DOIT PAS se chevaucher un jour de service. 

<pre>
Trip A
───────────────────\
                    \    Trip C
                     ─────────────
Trip B              /
───────────────────/
</pre> 
 
### pathways.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`pathway_id`) 
 
 Fichiers [pathways.txt](#pathwaystxt) et [levels.txt](#levelstxt) utilise une représentation graphique pour décrire les stations de métro ou de train, avec des nœuds représentant des emplacements et des bords représentant des chemins. 
 
 Pour naviguer depuis l’entrée/sortie de la station (un nœud représenté comme un emplacement avec `location_type=2`) jusqu’à un quai (un nœud représenté comme un emplacement avec `location_type=0` ou vide), le passager se déplacera à travers les passerelles, les barrières tarifaires, les escaliers et autres bords représentés comme des sentiers. Les nœuds génériques (nœuds représentés par `location_type=3`) peuvent être utilisés pour connecter des chemins dans une station. 
 
 Les Parcours doivent être définis de manière exhaustive dans une gare. Si des parcours sont définis, on suppose que tous les parcours de la station sont représentés. Par conséquent, les directives suivantes s’appliquent : 
 
 - Aucun emplacement suspendu : si un emplacement dans une gare dispose d’un chemin, alors tous les emplacements au sein de cette station doivent avoir des chemins, à l’exception des quais qui ont des zones d’embarquement (`location_type=4`, voir ligne directrice ci-dessous). 
 - Aucun chemin pour une plateforme avec zones d’embarquement : Une plateforme (`location_type=0` ou vide) qui a des zones d’embarquement (`location_type=4`) est traitée comme un objet parent, pas un point. Dans de tels cas, la plateforme ne doit pas avoir de parcours attribués. Tous les chemins doivent être attribués pour chacune des zones d’embarquement de la plate-forme. 
 - Pas de quais verrouillés : chaque quai (`location_type=0` ou vide) ou zone d’embarquement (`location_type=4`) doit être connecté à au moins une entrée/sortie (`location_type=2`) via une chaîne de sentiers. Les gares ne permettant pas un passage vers l’extérieur de la gare depuis un quai donné sont rares. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `pathway_id` | Identifiant unique | **Requis** | Identifie un chemin. Utilisé par les systèmes comme identifiant interne pour l'entrée. Doit être unique dans le jeu de données.<br><br> Différentes voies peuvent avoir les mêmes valeurs pour `from_stop_id` et `to_stop_id`.<hr>_Exemple : lorsque deux escaliers mécaniques sont côte à côte dans des directions opposées, ou lorsqu’un escalier et un ascenseur vont du même endroit au même endroit, différents `pathway_id` peuvent avoir les mêmes valeurs `from_stop_id` et `to_stop_id`_ | 
 | `from_stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis** | Lieu où commence le sentier.<br><br> Doit contenir un `stop_id` qui identifie une plate-forme (`location_type=0` ou vide), une entrée/sortie (`location_type=2`), un nœud générique (`location_type=3`) ou une zone d’embarquement (`location_type=4`) .<br><br> Les valeurs de `stop_id` qui identifient les stations (`location_type=1`) sont interdites.| 
 | `to_stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis** | Lieu où se termine le sentier.<br><br> Doit contenir un `stop_id` qui identifie une plate-forme (`location_type=0` ou vide), une entrée/sortie (`location_type=2`), un nœud générique (`location_type=3`) ou une zone d’embarquement (`location_type=4`) .<br><br> Les valeurs de `stop_id` qui identifient les stations (`location_type=1`) sont interdites.| 
 | `pathway_mode` | Énumération | **Requis** | Type de chemin entre la paire spécifiée (`from_stop_id`, `to_stop_id`). Les options valides sont :<br><br> `1` - Passerelle.<br> `2` - Escaliers.<br> `3` - Trottoir mobile/voyageur.<br> `4` - Escalator.<br> `5` - Ascenseur.<br> `6` - Barrière tarifaire (ou barrière de paiement) : Un chemin qui traverse une zone de la gare où une preuve de paiement est requise pour traverser. Les barrières tarifaires peuvent séparer les zones payantes de la gare de celles non payantes, ou séparer les différentes zones de paiement au sein de la même gare les unes des autres. Ces informations peuvent être utilisées pour éviter d’acheminer les passagers vers les gares en utilisant des raccourcis qui obligeraient les passagers à effectuer des paiements inutiles, comme demander à un passager de traverser un quai de métro pour atteindre une voie de bus.<br> `7` - Porte de sortie : un chemin sortant d’une zone payante vers une zone non payée où une preuve de paiement n’est pas requise pour traverser. | 
 | `is_bidirectional` | Énumération | **Requis** | Indique la direction que le chemin peut être emprunté :<br><br> `0` - Chemin unidirectionnel qui ne peut être utilisé que de `from_stop_id` à `to_stop_id`.<br> `1` - Voie bidirectionnelle pouvant être utilisée dans les deux sens.<br><br> Les portes de sortie (`pathway_mode=7`) ne doivent pas être bidirectionnelles.| 
 | `length` | float non négatif | Optionnel | Longueur horizontale en mètres du chemin depuis l’emplacement d’origine (défini dans `from_stop_id`) jusqu’à l’emplacement de destination (défini dans `to_stop_id`).<br><br> Ce champ est recommandé pour les passerelles (`pathway_mode=1`), les barrières tarifaires (`pathway_mode=6`) et les portes de sortie (`pathway_mode=7`).| 
 | `traversal_time` | Entier positif | Optionnel | Temps moyen en secondes nécessaire pour parcourir le chemin depuis l’emplacement d’origine (défini dans `from_stop_id`) jusqu’à l’emplacement de destination (défini dans `to_stop_id`).<br><br> Ce champ est recommandé pour les trottoirs roulants (`pathway_mode=3`), les escaliers mécaniques (`pathway_mode=4`) et les ascenseurs (`pathway_mode=5`).| 
 | `stair_count` | Entier non nul | Optionnel | Nombre d’escaliers du chemin.<br><br> Un `stair_count` positif implique que le passager monte de `from_stop_id` à `to_stop_id`. Et un `stair_count` négatif implique que le cavalier descend de `from_stop_id` à `to_stop_id`.<br><br> Ce champ est recommandé pour les escaliers (`pathway_mode=2`).<br><br> Si seulement une estimation du nombre d’escaliers peut être fournie, il est recommandé d’estimer environ 15 marches pour 1 étage.| 
 | `max_slope` | Flotteur | Optionnel | Rapport de pente maximum du sentier. Les options valides sont :<br><br> `0` ou vide- Aucune pente.<br> « `Float` » - Rapport de pente du chemin, positif pour le haut, négatif pour le bas.<br><br> Ce champ ne doit être utilisé qu’avec les passerelles (`pathway_mode=1`) et les trottoirs roulants (`pathway_mode=3`).<hr> _Exemple : Aux États-Unis, 0,083 (également écrit 8,3 %) est le rapport de pente maximal pour un fauteuil roulant propulsé à la main, ce qui signifie une augmentation de 0,083 m (donc 8,3 cm) pour chaque 1 m._| 
 | `min_width` | float positif | Optionnel | Largeur minimale du sentier en mètres.<br><br> Ce champ est recommandé si la largeur minimale est inférieure à 1 mètre.| 
 | `signposted_as` | Text | Optionnel | Texte destiné au public provenant de la signalisation physique et visible par les passagers.<br><br> Peut être utilisé pour fournir des instructions textuelles aux passagers, telles que « suivre les panneaux vers ». Le texte dans `singposted_as` doit apparaître exactement tel qu’il est imprimé sur les panneaux.<br><br> Lorsque la signalisation physique est multilingue, ce champ peut être renseigné et traduit à l’instar de `stops.stop_name` dans la définition du champ `feed_info.feed_lang`.| 
 | `reversed_signposted_as` | Text | Optionnel | Identique à `signposted_as`, mais lorsque le chemin est utilisé du `to_stop_id` au `from_stop_id`.| 
 
### levels.txt 
 
 Fichier : **Requis sous condition** 
 
 Clé primaire (`level_id`) 
 
 Décrit les niveaux dans une station. Utile en conjonction avec [pathways.txt](#pathwaystxt). 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `level_id` | Identifiant unique | **Requis** | Identifie un niveau dans une station.| 
 | `level_index` | Flotteur | **Requis** | Index numérique du niveau qui indique sa position relative.<br><br> Le niveau du sol doit avoir l’indice `0`, les niveaux au-dessus du sol étant indiqués par des indices positifs et les niveaux souterrains par des indices négatifs. | 
 | `level_name` | Text | Optionnel | Nom du niveau vu par le passager à l’intérieur du bâtiment ou de la gare.<hr> _Exemple : Prenez l’ascenseur jusqu’à "Mezzanine" ou "Platform" ou "-1"._| 
 
### location_groups.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`location_group_id`) 
 
 Définit les groupes de localisation, qui sont des groupes d’arrêts où un passager peut demander prise en charge ou dépôt. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |----------|----|------------|-----------| 
 | `location_group_id` | Identifiant unique | **Requis** | Identifie un groupe d’emplacements. L’ID doit être unique parmi toutes les valeurs `stops.stop_id`, locations.geojson `id` et `location_groups.location_group_id` .<br><br> Un groupe d’emplacements est un groupe d’arrêts qui, ensemble, indiquent les emplacements où un passager peut demander une prise en charge ou un retour. | 
 | `location_group_name` | Text | Optionnel | Le nom du groupe d’emplacement tel qu’affiché au passager. | 
 
### location_group_stops.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`*`) 
 
 Attribue les arrêts de stops.txt aux groupes de localisation. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |----------|----|------------|-----------| 
 | `location_group_id` | Clé étrangère faisant référence à `location_groups.location_group_id` | **Requis** | Identifie un groupe d’emplacements auquel appartiennent un ou plusieurs `stop_id`. Le même `stop_id` peut être défini dans de nombreux `location_group_id` s. | 
 | `stop_id` | Clé étrangère faisant référence à `stops.stop_id` | **Requis** | Identifie un arrêt appartenant au groupe d’emplacements. | 
 
 
### locations.geojson 
 
 Fichier : **Optionnel** 
 
 Définit les zones où les passagers peuvent demander une prise en charge ou un retour par des services à la demande. Ces zones sont représentées sous forme de polygones GeoJSON. 
 
 - Ce fichier utilise un sous-ensemble du format GeoJSON, décrit dans la [RFC 7946](https://tools.ietf.org/html/rfc7946). 
 - Le fichier `locations.geojson` doit contenir une `FeatureCollection`. 
 - Une `FeatureCollection` définit différents emplacements d’arrêt où les passagers peuvent demander une prise en charge ou un retour. 
 - Chaque `Feature` GeoJSON doit avoir un `id`. L’ `id` doit être unique parmi toutes les valeurs `stops.stop_id`, locations.geojson `id` et `location_group_id`. 
 - Chaque `Feature` GeoJSON doit avoir des objets et des clés associées selon le tableau ci-dessous : 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | -&nbsp; `type` | Chaîne | **Requis** | `"FeatureCollection"` d’emplacements. | 
 | -&nbsp; `features` | Tableau | **Requis** | Collection d’objets `"Feature"` décrivant les emplacements. | 
 | &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `type` | Chaîne | **Requis** | `"Fonctionnalité"` | 
 | &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `id` | Chaîne | **Requis** | Identifie un emplacement. L’ID doit être unique parmi toutes les valeurs `stops.stop_id`, locations.geojson `id` et `location_groups.location_group_id`. | 
 |&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `properties` | Objet | **Requis** | Clés de propriété d’emplacement. | 
 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `stop_name` | Chaîne | Optionnel | Indique le nom de l’emplacement tel qu’affiché aux passagers. | 
 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `stop_desc` | Chaîne | Optionnel | Description significative de l’emplacement pour aider à orienter les passagers. | 
 | &nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `geometry` | Objet | **Requis** | Géométrie du lieu. | 
 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `type` | Chaîne | **Requis** | Doit être du type :<br> - `"Polygone"`<br> - `"MultiPolygone"` | 
 | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\-&nbsp; `coordinates` | Tableau | **Requis** | Coordonnées géographiques (latitude et longitude) définissant la géométrie du lieu. | 
 
### booking_rules.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`booking_rule_id`) 
 
 Définit les règles de réservation pour les services demandés par le passager 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `booking_rule_id` | Identifiant unique | **Requis** | Identifie une règle. | 
 | `booking_type` | Énumération | **Requis** | Indique combien de temps à l’avance la réservation peut être effectuée. Les options valides sont :<br><br> `0` - Réservation en temps réel.<br> `1` - Réservation jusqu’au jour même avec préavis.<br> `2` – Réservation jusqu’au(x) jour(s) précédent(s). | 
 | `prior_notice_duration_min` | Entier | **Requis sous condition** | Nombre minimum de minutes avant le déplacement pour faire la demande.<br><br> **Requis sous condition** :<br> - **Requis** pour `booking_type=1`.<br> - **Interdit** sinon. | 
 | `prior_notice_duration_max` | Entier | **Interdit sous condition** | Nombre maximum de minutes avant le déplacement pour faire la demande de réservation.<br><br> **Interdit sous condition** :<br> - **Interdit** pour `booking_type=0` et `booking_type=2`.<br> - Optionnel pour `booking_type=1`.| 
 | `prior_notice_last_day` | Entier | **Requis sous condition** | Dernier jour avant le voyage pour faire la demande de réservation.<br><br> Exemple : « Le trajet doit être réservé 1 jour à l’avance avant 17h » sera codé comme `prior_notice_last_day=1`.<br><br> **Requis sous condition** :<br> - **Requis** pour `booking_type=2`.<br> - **Interdit** sinon. | 
 | `prior_notice_last_time` | Temps | **Requis sous condition** | Dernière fois le dernier jour avant le voyage pour faire la demande de réservation.<br><br> Exemple : « Le trajet doit être réservé 1 jour à l’avance avant 17h00 » sera codé comme `prior_notice_last_time=17:00:00`.<br><br> **Requis sous condition** :<br> - **Requis** si `prior_notice_last_day` est défini.<br> - **Interdit** sinon. | 
 | `prior_notice_start_day` | Entier | **Interdit sous condition** | Au plus tôt la veille du voyage pour faire la demande de réservation.<br><br> Exemple : « Le trajet peut être réservé au plus tôt une semaine à l’avance à minuit » sera codé comme `prior_notice_start_day=7`.<br><br> **Interdit sous condition** :<br> - **Interdit** pour `booking_type=0`.<br> - **Interdit** pour `booking_type=1` si `prior_notice_duration_max` est défini.<br> - Optionnel sinon. | 
 | `prior_notice_start_time` | Temps | **Requis sous condition** | Le plus tôt possible le jour précédant le voyage pour faire la demande de réservation.<br><br> Exemple : « Le trajet peut être réservé au plus tôt une semaine à l’avance à minuit » sera codé comme `prior_notice_start_time=00:00:00`.<br><br> **Requis sous condition** :<br> - **Requis** si `prior_notice_start_day` est défini.<br> - **Interdit** sinon. | 
 | `prior_notice_service_id` | Clé étrangère faisant référence à `calendar.service_id` | **Interdit sous condition** | Indique les jours de service pendant lesquels `prior_notice_last_day` ou `prior_notice_start_day` sont comptés.<br><br> Exemple : s’il est vide, `prior_notice_start_day=2` sera deux jours calendaires à l’avance. S’il est défini comme un `service_id` contenant uniquement des jours ouvrables (jours de la semaine sans jours fériés), `prior_notice_start_day=2` sera deux jours ouvrables à l’avance.<br><br> **Interdit sous condition** :<br> - Optionnel si `booking_type=2`.<br> - **Interdit** sinon. | 
 | `message` | Text | Optionnel | Message destiné aux passagers utilisant le service à une `stop_time` lors de la réservation d’un ramassage et d’un retour à la demande. Destiné à fournir un minimum d’informations à transmettre dans une interface utilisateur sur l’action qu’un passager doit entreprendre pour utiliser le service. | 
 | `pickup_message` | Text | Optionnel | Fonctionne de la même manière que `message`, mais utilisé lorsque les passagers bénéficient d’un ramassage à la demande uniquement. | 
 | `drop_off_message` | Text | Optionnel | Fonctionne de la même manière que `message`, mais utilisé lorsque les passagers bénéficient d’un dépôt à la demande uniquement. | 
 | `phone_number` | Numéro de téléphone | Optionnel | Numéro de téléphone à appeler pour faire la demande de réservation. | 
 | `info_url` | URL | Optionnel | URL fournissant des informations sur la règle de réservation. | 
 | `booking_url` | URL | Optionnel | URL vers une interface ou une application en ligne où la demande de réservation peut être effectuée. | 
 
### translations.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`table_name`, `field_name`, `language`, `record_id`, `record_sub_id`, `field_value`) 
 
 Dans les régions qui ont plusieurs langues officielles, les agences/opérateurs de transport en commun ont généralement des noms et des pages Web spécifiques à une langue. Afin de mieux servir les usagers de ces régions, il est utile que le jeu de données inclue ces valeurs dépendantes de la langue. 
 
 Si les deux méthodes de référencement (`record_id`, `record_sub_id`) et `field_value` sont utilisées pour traduire la même valeur dans 2 lignes différentes, la traduction fournie avec (`record_id`, `record_sub_id`) est prioritaire. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `table_name` | Énumération | **Requis** | Définit la table qui contient le champ à traduire. Les valeurs autorisées sont :<br><br> - `agency`<br> - `stops`<br> - `routes`<br> - `trips`<br> - `stop_times`<br> - `pathways`<br> - `levels`<br> - `feed_info`<br> - `attributions`<br><br> Tout fichier ajouté à GTFS aura une valeur `table_name` équivalente au nom de fichier, comme indiqué ci-dessus (c’est-à-dire sans compter l’extension de fichier `.txt`). | 
 | `field_name` | Text | **Requis** | Nom du champ à traduire. Les champs de type «Text» peuvent être traduits, les champs de type  `URL` , `Email` et `Phone number` peuvent également être « traduits » pour fournir des ressources dans la langue correcte. Les champs d’autres types ne doivent pas être traduits. | 
 | `language` | Code de langue | **Requis** | Langue de traduction.<br><br> Si la langue est la même que dans `feed_info.feed_lang`, la valeur d’origine du champ sera supposée être la valeur par défaut à utiliser dans les langues sans traduction spécifique (si `default_lang` ne précise pas le contraire).<hr> _Exemple : En Suisse, une ville d’un canton officiellement bilingue s’appelle officiellement « Bienne/Bienne », mais s’appellerait simplement « Bienne » en français et « Bienne » en allemand._ | 
 | `translation` | Text ou URL ou Email ou Numéro de téléphone | **Requis** | Valeur traduite. | 
 | `record_id` | Clé étrangère | **Requis sous condition** | Définit l'entrée qui correspond au champ à traduire. La valeur dans `record_id` doit être le premier ou le seul champ de la clé primaire d’une table, tel que défini dans l’attribut de clé primaire de chaque table et ci-dessous :<br><br> - `agency_id` pour [agency.txt](#agencytxt)<br> - `stop_id` pour [stops.txt](#stopstxt) ;<br> - `route_id` pour [routes.txt](#routestxt) ;<br> - `trip_id` pour [trips.txt](#tripstxt) ;<br> - `trip_id` pour [stop_times.txt](#stop_timestxt) ;<br> - `pathway_id` pour [pathways.txt](#pathwaystxt) ;<br> - `level_id` pour [levels.txt](#levelstxt) ;<br> - `attribution_id` pour [attributions.txt](#attributionstxt).<br><br> Les champs des tableaux non définis ci-dessus ne doivent pas être traduits. Cependant, les producteurs ajoutent parfois des champs supplémentaires qui ne correspondent pas aux spécifications officielles et ces champs non officiels peuvent être traduits. Vous trouverez ci-dessous la manière recommandée d’utiliser `record_id` pour ces tables :<br><br> - `service_id` pour [calendar.txt](#calendartxt) ;<br> - `service_id` pour [calendar_dates.txt](#calendar_datestxt) ;<br> - `fare_id` pour [fare_attributes.txt](#fare_attributestxt) ;<br> - `fare_id` pour [fare_rules.txt](#fare_rulestxt) ;<br> - `shape_id` pour [shapes.txt](#shapestxt) ;<br> - `voyage id` pour [frequencies.txt](#frequenciestxt);<br> - `from_stop_id` pour [transfers.txt](#transferstxt).<br><br> Requis sous condition:<br> - **Interdit** si `table_name` est `feed_info`.<br> - **Interdit** si `field_value` est défini.<br> - **Requis** si `field_value` est vide. | 
 | `record_sub_id` | Clé étrangère | **Requis sous condition** | Aide l'entrée contenant le champ à traduire lorsque la table n’a pas de clé primaire. Par conséquent, la valeur dans `record_sub_id` est l’ID secondaire de la table, tel que défini par le tableau ci-dessous :<br><br> - Aucun pour [agency.txt](#agencytxt);<br> - Aucun pour [stops.txt](#stopstxt);<br> - Aucun pour [routes.txt](#routestxt) ;<br> - Aucun pour [trips.txt](#tripstxt) ;<br> - `stop_sequence` pour [stop_times.txt](#stop_timestxt) ;<br> - Aucun pour [pathways.txt](#pathwaystxt) ;<br> - Aucun pour [levels.txt](#levelstxt) ;<br> - Aucun pour [attributions.txt](#attributionstxt).<br><br> Les champs des tableaux non définis ci-dessus ne doivent pas être traduits. Cependant, les producteurs ajoutent parfois des champs supplémentaires qui ne correspondent pas aux spécifications officielles et ces champs non officiels peuvent être traduits. Vous trouverez ci-dessous la manière recommandée d’utiliser `record_sub_id` pour ces tables :<br><br> - Aucun pour [calendar.txt](#calendartxt) ;<br> - `e` pour [calendar_dates.txt](#calendar_datestxt);<br> - Aucun pour [fare_attributes.txt](#fare_attributestxt) ;<br> - `route_id` pour [fare_rules.txt](#fare_rulestxt) ;<br> - Aucun pour [shapes.txt](#shapestxt) ;<br> - `start_time` pour [frequencies.txt](#frequenciestxt);<br> - `to_stop_id` pour [transfers.txt](#transferstxt).<br><br> Requis sous condition:<br> - **Interdit** si `table_name` est `feed_info`.<br> - **Interdit** si `field_value` est défini.<br> - **Requis** si `table_name=stop_times` et `record_id` sont définis. | 
 | `field_value` | Text ou URL ou Email ou Numéro de téléphone | **Requis sous condition** | Au lieu de définir quelle entrée doit être traduite en utilisant `record_id` et `record_sub_id`, ce champ peut être utilisé pour définir la valeur qui doit être traduite. Lorsqu’elle est utilisée, la traduction sera appliquée lorsque les champs identifiés par `table_name` et `field_name` contiennent exactement la même valeur définie dans field_value.<br><br> Le champ doit avoir **exactement** la valeur définie dans `field_value`. Si seul un sous-ensemble de la valeur correspond à `field_value`, la traduction ne sera pas appliquée.<br><br> Si deux règles de traduction correspondent à la même entrée (une avec `field_value` et l’autre avec `record_id`), la règle avec `record_id` est prioritaire.<br><br> Requis sous condition:<br> - **Interdit** si `table_name` est `feed_info`.<br> - **Interdit** si `record_id` est défini.<br> - **Requis** si `record_id` est vide. | 
 
### feed_info.txt 
 
 Fichier : **Requis sous condition** 
 
 Primary key (none)

 Le fichier contient des informations sur le jeu de données lui-même, plutôt que sur les services décrits par le jeu de données. Dans certains cas, l’éditeur du jeu de données est une entité différente de n’importe laquelle des agences. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `feed_publisher_name` | Text | **Requis** | Nom complet de l’organisation qui publie le jeu de données. Cela peut être identique à l’une des valeurs `agency.agency_name`. | 
 | `feed_publisher_url` | URL | **Requis** | URL du site Web de l’organisation de publication du jeu de données. Cela peut être identique à l’une des valeurs `agency.agency_url`. | 
 | `feed_lang` | Code de langue | **Requis** | Langue par défaut utilisée pour le texte de ce jeu de données. Ce paramètre aide les consommateurs GTFS à choisir les règles de capitalisation et d’autres paramètres spécifiques à la langue pour le jeu de données. Le fichier `translations.txt` peut être utilisé si le texte doit être traduit dans des langues autres que celle par défaut.<br><br> La langue par défaut peut être multilingue pour les jeux de données dont le texte original est en plusieurs langues. Dans de tels cas, le champ `feed_lang` doit contenir le code de langue `mul` défini par la norme ISO 639-2, et une traduction pour chaque langue utilisée dans le jeu de données doit être fournie dans `translations.txt`. Si tout le texte original du jeu de données est dans la même langue, alors `mul` ne doit pas être utilisé.<hr> _Exemple : Considérons un jeu de données provenant d’un pays multilingue comme la Suisse, avec le champ d’origine `stops.stop_name` rempli avec des noms d’arrêts dans différentes langues. Chaque nom d’arrêt est écrit en fonction de la langue dominante dans la situation géographique de cet arrêt, par exemple `Genève` pour la ville francophone de Genève, `Zürich` pour la ville germanophone de Zurich et `Biel/Bienne` pour la ville bilingue.ville de Bienne/Bienne. Le jeu de données `feed_lang` devrait être `mul` et les traductions seraient fournies dans `translations.txt`, en allemand : `Genf`, `Zürich` et `Biel`; en français : `Genève`, `Zurich` et `Bienne` ; en italien :  `Ginevra` , `Zurigo` et `Bienna`; et en anglais : `Geneva`, `Zurich` et `Biel/Bienne`._ | 
 | `default_lang` | Code de langue | Optionnel | Définit la langue à utiliser lorsque le application réutilisatrice de données ne connaît pas la langue du passager. Ce sera souvent `en` (anglais). | 
 | `feed_start_date` | Dates | Recommandé | Le jeu de données fournit des informations complètes et fiables sur les horaires de service pour la période allant du début du jour `feed_start_date` à la fin du jour `feed_end_date`. Les deux jours peuvent être laissés vides en cas d’indisponibilité. La date `feed_end_date` ne doit pas précéder la date `feed_start_date` si les deux sont données. Il est recommandé aux fournisseurs de jeux de données de fournir des données de planification en dehors de cette période pour informer des futurs services probables, mais les consommateurs de jeux de données doivent les traiter en étant conscients de leur statut non faisant autorité. Si `feed_start_date` ou `feed_end_date` s’étendent au-delà des dates du calendrier actif définies dans [calendar.txt](#calendartxt) et [calendar_dates.txt](#calendar_datestxt), le jeu de données affirme explicitement qu’il n’y a pas de service pour les dates dans la plage `feed_start_date` ou `feed_end_date` mais non inclus dans les dates du calendrier actif. | 
 | `feed_end_date` | Dates | Recommandé | (voir ci-dessus) | 
 | `feed_version` | Text | Recommandé | Chaîne qui indique la version actuelle du jeu de données GTFS. Les applications consommant du GTFS peuvent afficher cette valeur pour aider les éditeurs de jeux de données à déterminer si le dernier jeu de données a été incorporé. | 
 | `feed_contact_email` | Courriel | Optionnel | Adresse e-mail pour la communication concernant le jeu de données GTFS et les pratiques de publication de données. `feed_contact_email` est un contact technique pour les applications consommatrices de GTFS. Fournissez les coordonnées du service client via [agency.txt](#agencytxt). Il est recommandé de fournir au moins un des éléments `feed_contact_email` ou `feed_contact_url`. | 
 | `feed_contact_url` | URL | Optionnel | URL pour les informations de contact, un formulaire Web, un service d’assistance ou d’autres outils de communication concernant le jeu de données GTFS et les pratiques de publication de données. `feed_contact_url` est un contact technique pour les applications consommatrices de GTFS. Fournissez les coordonnées du service client via [agency.txt](#agencytxt). Il est recommandé de fournir au moins un des éléments `feed_contact_url` ou `feed_contact_email`. | 
 
### attributions.txt 
 
 Fichier : **Optionnel** 
 
 Clé primaire (`attribution_id`) 
 
 Le fichier définit les attributions appliquées au jeu de données. 
 
 | Nom du champ | Tapez | Présence | Descriptif | 
 |------|------|------|------| 
 | `attribution_id` | Identifiant unique | Optionnel | Identifie une attribution pour le jeu de données ou un sous-ensemble de celui-ci. Ceci est surtout utile pour les traductions. | 
 | `agency_id` | Clé étrangère faisant référence à `agency.agency_id` | Optionnel | Agence à laquelle s’applique l’attribution.<br><br> Si une attribution `agency_id`, `route_id` ou `trip_id` est définie, les autres doivent être vides. Si aucun d’entre eux n’est spécifié, l’attribution s’appliquera à l’ensemble des données. | 
 | `route_id` | Clé étrangère faisant référence à `routes.route_id` | Optionnel | Fonctionne de la même manière que `agency_id` sauf que l’attribution s’applique à un itinéraire. Plusieurs attributions peuvent s’appliquer au même itinéraire. | 
 | `trip_id` | Clé étrangère faisant référence à `trips.trip_id` | Optionnel | Fonctionne de la même manière que `agency_id` sauf que l’attribution s’applique à un voyage. Plusieurs attributions peuvent s’appliquer au même voyage. | 
 | `organization_name` | Text | **Requis** | Nom de l’organisation à laquelle le jeu de données est attribué. | 
 | `is_producer` | Énumération | Optionnel | Le rôle de l’organisation est producteur. Les options valides sont :<br><br> `0` ou vide : l’organisation n’a pas ce rôle.<br> `1` - L’organisation a ce rôle.<br><br> Au moins un des champs `is_producer`, `is_operator` ou `is_authority` doit être défini sur `1`. | 
 | `is_operator` | Énumération | Optionnel | Fonctionne de la même manière que `is_producer`, sauf que le rôle de l’organisation est celui d’opérateur. | 
 | `is_authority` | Énumération | Optionnel | Fonctionne de la même manière que `is_producer`, sauf que le rôle de l’organisation est l’autorité. | 
 | `attribution_url` | URL | Optionnel | URL de l’organisation. | 
 | `attribution_email` | Courriel | Optionnel | Email de l’organisation. | 
 | `attribution_phone` | Numéro de téléphone | Optionnel | Numéro de téléphone de l’organisation. | 
 