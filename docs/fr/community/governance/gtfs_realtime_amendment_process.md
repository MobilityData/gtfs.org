# GTFS Realtime 
 
La spécification GTFS Realtime n’est pas gravée dans le marbre. Il s’agit plutôt d’une spécification ouverte développée et maintenue par la communauté des agences de transport en commun, des développeurs et d’autres parties prenantes qui utilisent GTFS Realtime. On s’attend à ce que cette communauté de producteurs et de consommateurs de données GTFS Realtime ait des propositions pour étendre la spécification afin de permettre de nouvelles fonctionnalités. Pour faciliter la gestion de ce processus, les procédures et lignes directrices suivantes ont été établies. 

!!! note ""

	La spécification officielle, la référence et la documentation sont rédigées en anglais. Si une traduction dans une autre langue diffère de l’original anglais, ce dernier prévaut. Toutes les communications sont effectuées en anglais. 
 
# Ajout de nouveaux champs à GTFS Realtime 
 
Lorsqu’un producteur ou une application réutilisatrice souhaite ajouter un nouveau champ à la spécification GTFS Realtime, il doit ouvrir une nouvelle issue sur le [répertoire GTFS Realtime GitHub](https://github.com/google/transit) décrivant le champ proposé et annoncer ce nouveau champ (y compris un lien vers l'issue) sur la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#! forum/gtfs-realtime). 

## Champs *expérimentaux* 
1. Si la communauté parvient à un consensus (a) sur le fait que le champ proposé semble utile et (b) sur le type de champ (`optional` vs `repeated`, `string` vs `int` vs `bool` ), alors un numéro de champ sera alloué dans le message GTFS Realtime et une note sera faite dans le [fichier .proto](../../../documentation/realtime/proto/) et une documentation indiquant qu’il s’agit d’un champ *expérimental* qui pourrait changer à l’avenir. 

    - Le consensus est atteint via un processus de discussion et de vote qui est le même que celui ci-dessous [Processus de modification des spécifications](#processus-de-modification-des-specifications), mais au lieu du consentement unanime, seuls 80 % de votes oui sont requis pour l’approbation. 
    - Les producteurs et consommateurs GTFS Realtime qui souhaitent utiliser le nouveau champ *expérimental* régénéreront leur bibliothèque en utilisant le fichier .proto avec le nouveau champ (par exemple, Google mettra à jour la bibliothèque [gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings)), et commenceront à remplir et à consommer le champ avec des données réelles. 
    - Une fois que nous sommes convaincus que le champ *expérimental* en vaut la peine et que les producteurs et les consommateurs utilisent le champ, nous suivrons le [processus de modification des spécifications](#processus-de-modification-des-specifications) ci-dessous pour ajouter officiellement le champ à la spécification. 
    - Si le champ *expérimental* n’est pas adopté via le [processus de modification des spécifications](#processus-de-modification-des-specifications) dans les 2 ans suivant son approbation en tant que champ *expérimental*, il sera obsolète en ajoutant `[deprecated=true]` à côté de la valeur du champ dans le [fichier .proto](../../../documentation/realtime/proto/). En utilisant `[deprecated=true]` (au lieu de `RESERVED`), les producteurs et les consommateurs qui ont déjà adopté le champ n’ont pas à le retirer de son utilisation. De plus, le champ peut être « non obsolète » à l’avenir s’il est approuvé lors d’un vote ultérieur après le [processus de modification des spécifications](#processus-de-modification-des-specifications) (par exemple, lorsque des producteurs et/ou des consommateurs supplémentaires commencent à utiliser le champ). 
 
1. Si le nouveau champ est considéré comme spécifique à un seul producteur ou s’il y a un litige sur le type de données, nous attribuerons une [extension personnalisée](#extensions) au producteur afin qu’il puisse utiliser le champ dans son propre flux. Lorsque cela est possible, nous devrions éviter les extensions et plutôt ajouter des champs utiles à de nombreuses agences à la spécification principale afin d’éviter la fragmentation et le travail supplémentaire pour les consommateurs pour prendre en charge diverses extensions de la spécification. 
 
## Processus de modification des spécifications 
 1. Créer une branche git avec les changements dans les fichiers de définition de protocole, de spécification et de documentation (sauf pour les traductions). 
 1. Créez une pull request sur https://github.com/google/transit. La pull request doit contenir une description détaillée du correctif. Le créateur de la pull request devient l'_advocate_. 
 1. Une fois la pull request enregistrée, elle doit être annoncée par son _advocate_ dans la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). Une fois annoncée, la pull request est considérée comme une proposition. 
    - Étant donné que l’_advocate_ est un contributeur, il doit signer le [Contrat de licence de contributeur](https://github.com/google/transit/blob/master/CONTRIBUTING.md) avant que la pull request puisse être acceptée. 
 1. Une discussion sur la proposition s'en suit. Les commentaires des pull requests doivent être utilisés comme seul forum de discussion. 
    - La discussion dure aussi longtemps que l’_advocate_ l’estime nécessaire, mais doit durer au moins 7 jours calendaires. 
    - L’_advocate_ est responsable de la mise à jour en temps opportun de la proposition (c’est-à-dire de la pull request) sur la base des commentaires pour lesquels il est d'accord. 
    - A tout moment, l’_advocate_ peut réclamer l’abandon de la proposition. 
 1. L’_advocate_ peut demander un vote sur une version de la proposition à tout moment après l’intervalle initial de 7 jours requis pour la discussion. 
    - Avant de demander un vote, au moins un producteur GTFS Realtime et une application réutilisatrice GTFS Realtime doivent mettre en œuvre le changement proposé. Il est prévu que le ou les producteurs GTFS Realtime incluent la modification dans un flux public en GTFS Realtime et fournissent un lien vers ces données dans les commentaires de la pull request, et que le ou les application réutilisatrice GTFS Realtime fournissent un lien dans les commentaires de la pull request vers une application qui utilise le changement d’une manière non triviale (c’est-à-dire qu’elle prend en charge des fonctionnalités nouvelles ou améliorées). 
    - Lorsqu’il appelle à un vote, l’_advocate_ doit clairement indiquer si le vote porte sur l’adoption officielle du champ dans la spécification ou sur un champ expérimental. 
 1. Le vote dure la période minimale suffisante pour couvrir 7 jours calendaires complets et 5 jours ouvrables suisses complets. Le vote se termine à 23:59:59 UTC. 
    - L’_advocate_ doit annoncer l’heure précise de fin au début du vote. 
    - Pendant la période de vote, seules les modifications rédactionnelles de la proposition sont autorisées (fautes de frappe, la formulation peut changer tant qu’elle n’en change pas le sens). 
    - Tout le monde est autorisé à voter oui/non sous forme de commentaire sur la pull request, et les votes peuvent être modifiés jusqu’à la fin de la période de vote. 
    Si un électeur modifie son vote, il est recommandé de le faire en mettant à jour le commentaire de vote original en barrant le vote et en écrivant le nouveau vote. 
    - Les votes avant le début de la période de vote ne sont pas pris en compte. 
    - L’ouverture et la clôture des votes doivent être annoncées sur la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). 
 1. La proposition est acceptée s’il y a un consensus unanime oui avec au moins 3 voix. 
    - Le vote de l'_advocate_ ne compte pas dans le total des 3 voix. Par exemple, si l'_advocate_ X crée une pull request et vote oui, et que les utilisateurs Y et Z votent oui, cela compte pour 2 votes oui au total. 
    - Les votes contre doivent être justifiés et, idéalement, fournir des retours constructifs. 
    - Si le vote échoue, l’_advocate_ peut alors choisir de poursuivre les travaux sur la proposition ou d’abandonner la proposition. 
    L’une ou l’autre décision de l’_advocate_ doit être annoncée dans la [liste de diffusion GTFS Realtime](https://groups.google.com/forum/#!forum/gtfs-realtime). 
    - Si l’_advocate_ poursuit le travail sur la proposition, un nouveau vote peut être demandé à tout moment. 
 1. Toute pull request restant inactive pendant 30 jours calendaires sera clôturée. Lorsqu’une pull request est fermée, la proposition correspondante est considérée comme abandonnée. L’_advocate_ peut rouvrir la pull request à tout moment s’il souhaite poursuivre ou maintenir la conversation. 
    - Notez que l’_advocate_ peut choisir d’implémenter la fonctionnalité en tant qu’[extension personnalisée](#extensions) au lieu de faire partie de la spécification officielle. 
 1. Si la proposition est acceptée : 
    - Google s’engage à merger la version votée de la pull request (à condition que les contributeurs aient signé la [CLA](https: blob/master/CONTRIBUTING.md)), et en effectuant la pull request dans les 5 jours ouvrables. 
    - Google s’engage à mettre à jour en temps opportun le répertoire [https://github.com/google/gtfs-realtime-bindings](https://github.com/google/gtfs-realtime-bindings). Les commits dans gtfs-realtime-bindings qui sont le résultat d’une proposition doivent faire référence à la pull request de la proposition. 
    - Les traductions ne doivent pas être incluses dans la pull request originale. 
     Google est responsable de la mise à jour éventuelle des traductions pertinentes dans les langues prises en charge, mais les demandes de traduction pure de la communauté sont les bienvenues et seront acceptées dès que tous les commentaires éditoriaux auront été pris en compte. 
 
## Principes directeurs 
 Afin de préserver la vision originale de GTFS Realtime, un certain nombre de principes directeurs sont à prendre en considération lors de l’extension de la spécification : 
 
 **Les flux doivent être efficaces pour produire et consommer en temps réel.** 
 
 L’information en temps réel est un flux continu et dynamique de données qui nécessite nécessairement un traitement efficace. Nous avons choisi les Protocol Buffers comme base de la spécification car ils offrent un bon compromis en termes de facilité d’utilisation pour les développeurs et en termes d’efficacité de transmission des données. Contrairement à GTFS, nous n’imaginons pas que de nombreuses agences éditeront manuellement les flux GTFS Realtime. Le choix des tampons de protocole reflète la conclusion selon laquelle la plupart des flux GTFS Realtime seront produits et consommés automatiquement. 
 
 **La spécification concerne les informations sur les passagers.** 
 
 Comme GTFS avant lui, GTFS Realtime s’intéresse principalement aux informations sur les passagers. Autrement dit, la spécification doit inclure des informations qui peuvent avant tout aider les outils destinés à l'information voyageur. Il existe potentiellement une grande quantité d’informations opérationnelles que les agences de transport en commun pourraient souhaiter transmettre en interne entre les systèmes. GTFS Realtime n’est pas destiné à cet objectif et il existe potentiellement d’autres normes de données orientées opérations qui pourraient être plus appropriées. 
 
 **Les modifications apportées à la spécification doivent être rétrocompatibles.** 
 
 Lors de l’ajout de fonctionnalités à la spécification, nous souhaitons éviter d’apporter des modifications qui rendraient les flux existants invalides. Nous ne voulons pas créer davantage de travail pour les éditeurs de flux existants qui ne souhaiteraient pas ajouter des fonctionnalités à leurs flux. De plus, dans la mesure du possible, nous souhaitons que les lecteurs de flux existants puissent continuer à lire les anciennes parties des flux les plus récents. Les conventions d’extension des tampons de protocole imposeront la rétrocompatibilité dans une certaine mesure. Cependant, nous souhaitons éviter les modifications sémantiques des champs existants qui pourraient également rompre la rétrocompatibilité. 
 
 **Les fonctionnalités spéculatives sont déconseillées.** 
 
 Chaque nouvelle fonctionnalité ajoute de la complexité à la création et à la lecture des flux. Par conséquent, nous voulons veiller à n’ajouter que des fonctionnalités que nous savons utiles. Idéalement, toute proposition aura été testée en générant des données pour un système de transport en commun réel qui utilise la nouvelle fonctionnalité et en implémentant un système pour la lire et l’afficher. 
 
## Extensions 
 Pour permettre aux producteurs d’ajouter des informations personnalisées à un flux GTFS Realtime, nous profiterons de la [fonctionnalité d’extensions des tampons de protocole](https://developers.google.com/protocol-buffers/docs/proto#extensions). Les extensions nous permettent de définir un espace de noms dans un message Protocol Buffer où les développeurs tiers peuvent définir des champs supplémentaires sans avoir besoin de modifier la définition du proto d’origine. 
 
 Lorsque cela est possible, nous devrions éviter les extensions et plutôt ajouter des champs utiles à de nombreuses agences à la spécification principale afin d’éviter la fragmentation et le travail supplémentaire pour les consommateurs pour prendre en charge diverses extensions de la spécification. Avant de demander un identifiant d’extension, les producteurs doivent proposer d’ajouter le champ à la spécification (voir [Ajout de nouveaux champs à GTFS Realtime](#ajout-de-nouveaux-champs-a-gtfs-realtime)) 
 
 Les identifiants d’extension dans la plage 9000-9999 sont réservés à un usage privé par les producteurs GTFS Realtime. Ces identifiants ne doivent être utilisés que pour transmettre des informations en interne à votre organisation. Les extensions de cette plage **ne doivent pas** être utilisées dans les flux publics. 
 
 Pour créer une nouvelle extension, nous attribuerons à un producteur le prochain identifiant d’extension disponible, choisi progressivement dans une liste de numéros commençant à 1000 et remontant et documentée dans la section Registre d’extension ci-dessous. 
 
 Ces identifiants d’extension attribués correspondent aux identifiants de balise disponibles dans l’espace de noms "extension" pour chaque définition de message GTFS Realtime. Maintenant que le développeur dispose d’un identifiant d’extension attribué, il utilisera cet identifiant lors de l’extension de tous les messages GTFS Realtime. Même si le développeur ne prévoit d’étendre qu’un seul message, l’identifiant d’extension attribué sera réservé à TOUS les messages. 
 
 Pour un développeur étendant la spécification, au lieu d’ajouter un seul champ comme une "string" ou "int32" avec son identifiant d’extension, le modèle préféré est de définir un nouveau message comme " MyTripDescriptorExtension ", d’étendre le message GTFS Realtime sous-jacent avec votre nouveau message, puis d'y placer tous vos nouveaux champs. Cela a l’avantage de vous permettre de gérer les champs de votre message d’extension comme vous le souhaitez, sans avoir besoin de réserver un nouvel identifiant d’extension dans la liste principale. 
 
```
message MyTripDescriptorExtension {
  optional string some_string = 1;
  optional bool some_bool = 2;
  ...
}
extend transit_realtime.TripDescriptor {
  optional MyTripDescriptorExtension my_trip_descriptor = YOUR_EXTENSION_ID;
}
```
 
 Lors de la création d’extensions, les développeurs doivent suivre le [Protocol Buffers Language Guide](https://developers.google.com/protocol-buffers/docs/proto). Une erreur courante consiste à réutiliser un numéro de champ d’extension. Dans la section [Assigning Field Numbers](https://developers.google.com/protocol-buffers/docs/proto#assigning-field-numbers), le guide linguistique indique : 
 
 > Chaque champ de la définition du message possède un numéro unique. Ces numéros sont utilisés pour identifier vos champs au format binaire du message et ne doivent pas être modifiés une fois que votre type de message est utilisé. 
 
 Par exemple, dans le premier exemple, `some_string` s’est vu attribuer le numéro de champ `1`. Lorsque le développeur ne souhaite plus utiliser `some_string`, ou lorsque `some_string` a été adopté dans la spécification officielle GTFS Realtime et que l’extension n’est pas nécessaire, le développeur ne peut pas réutiliser le champ numéro `1` pour un nouveau champ. Au lieu de cela, le développeur doit rendre le champ obsolète et utiliser un nouveau numéro pour le nouveau champ : 
```
message MyTripDescriptorExtension {
  optional string some_string = 1 [deprecated=true];
  optional bool some_bool = 2;
  optional string some_new_string = 3;
  ...
}
```
 
## Registre d’extension 
 
|ID d’extension|Développeur|Contact|Détails| 
|------------|---------|-------|-------|
|1000|OneBusAway|[onebusaway-developers](http://groups.google.com/group/onebusaway-developers)|https://github.com/OneBusAway/onebusaway/wiki/GTFS-Realtime-Resources|
|1001|New York City MTA|[mtadeveloperresources](http://groups.google.com/group/mtadeveloperresources)|http://mta.info/developers/|
|1002|Google|[transit-realtime-partner-support@google.com](mailto:transit-realtime-partner-support@google.com)|Google Maps Live Transit Updates|
|1003|OVapi|gtfs-rt sur ovapi.nl|http://gtfs.ovapi.nl|
|1004|Metra|[William Ashbaugh <w.l.ashbaugh@gmail.com>](mailto:w.l.ashbaugh@gmail.com)|
|1005|Metro-North Railroad|[John Larsen](mailto:mnrappdev@mnr.org)|
|1006|realCity|[David Varga](mailto:transit@realcity.io)|http://realcity.io|
|1007|Transport for NSW|[timetable@transport.nsw.gov.au](mailto:timetable@transport.nsw.gov.au)|[Group discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/WYwIs4Hd_E0/PbkMnELUAwAJ)|
|1008|SEPTA - Southeastern Pennsylvania Transportation Authority|[Gregory Apessos](mailto:GApessos@septa.org)|https://github.com/septadev|
|1009|Swiftly|[mike@goswift.ly](mailto:mike@goswift.ly)|[Group Discussion](https://groups.google.com/forum/#!msg/gtfs-realtime/mmnZV6L-2ls/wVWdknhLBwAJ)|
|1010|IBI Group|[Ritesh Warade](mailto:transitrealtime@ibigroup.com)|[GitHub proposal for new timestamps in Service Alerts](https://github.com/google/transit/pull/134)|
|1013|MITFAHR\|DE\|ZENTRALE (MFDZ)|[Holger Bruch](mailto:holger.bruch@mfdz.de)|[Group discussion](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
|9000-9999|RESERVED - INTERNAL USE ONLY|[GTFS Community](https://groups.google.com/forum/#!forum/gtfs-realtime)|[Group discussion](https://groups.google.com/g/gtfs-realtime/c/IxYh-beoNoo)|
