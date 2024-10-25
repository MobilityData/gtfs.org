# GTFS Schedule 
 
 La spécification GTFS n’est pas gravée dans le marbre. Il s’agit plutôt d’une spécification ouverte développée et maintenue par la communauté des agences de transport en commun, des développeurs et d’autres parties prenantes qui utilisent GTFS. On s’attend à ce que cette communauté de producteurs et de consommateurs de données GTFS ait des propositions pour étendre la spécification afin de permettre de nouvelles capacités. Pour faciliter la gestion de ce processus, les procédures et lignes directrices suivantes ont été établies. 
 
!!! note "" 
 
    La spécification officielle, la référence et la documentation sont rédigées en anglais. Si une traduction dans une autre langue diffère de l’original anglais, ce dernier prévaut. Toutes les communications sont effectuées en anglais. 
 
# Processus de modification des spécifications 
 
1. Créer une branche git avec les changements dans les fichiers de définition de protocole, de spécification et de documentation (sauf pour les traductions). 
1. Créez une pull request sur https://github.com/google/transit. La pull request doit contenir une description détaillée du correctif. Le créateur de la pull request devient l'_advocate_. 
1. Une fois la pull request enregistrée, elle doit être annoncée par son _advocate_ dans la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes), incluant un lien vers la pull request. Une fois annoncée, la pull request est considérée comme une proposition. La pull request doit également être modifiée pour contenir un lien vers l’annonce de Google Groupes afin qu’elle puisse facilement être référencée. 
    - Étant donné que l’_advocate_ est un contributeur, il doit signer le [Contrat de licence de contributeur](https://github.com/google/transit/blob/master/CONTRIBUTING.md) avant que la pull request puisse être acceptée. 
1. Une discussion sur la proposition s'en suit. Les commentaires des pull requests doivent être utilisés comme seul forum de discussion. 
    - La discussion dure aussi longtemps que l’_advocate_ l’estime nécessaire, mais doit durer au moins 7 jours calendaires. 
    - L’_advocate_ est responsable de la mise à jour en temps opportun de la proposition (c’est-à-dire de la pull request) sur la base des commentaires pour lesquels il est d'accord. 
    - A tout moment, l’_advocate_ peut réclamer l’abandon de la proposition. 
1. L’_advocate_ peut demander un vote sur une version de la proposition à tout moment après l’intervalle initial de 7 jours requis pour la discussion. 
    - Avant de demander un vote, au moins un producteur GTFS et une application réutilisatrice GTFS doivent mettre en œuvre le changement proposé. Il est prévu que le ou les producteurs GTFS incluent la modification dans un flux GTFS public et fournissent un lien vers ces données dans les commentaires de la pull request, et que le ou les application réutilisatrice GTFS fournissent un lien dans les commentaires de la pull request vers une application qui utilise le changement d’une manière non triviale (c’est-à-dire qu’elle prend en charge des fonctionnalités nouvelles ou améliorées). 
1. Le vote dure la période minimale suffisante pour couvrir 14 jours calendaires complets. Le vote se termine à 23:59:59 UTC. 
    - L’_advocate_ doit annoncer l’heure précise de fin au début du vote. 
    - Pendant la période de vote, seules les modifications rédactionnelles de la proposition sont autorisées (fautes de frappe, la formulation peut changer tant qu’elle n’en change pas le sens). 
    - Tout le monde est autorisé à voter oui/non sous forme de commentaire sur la pull request, et les votes peuvent être modifiés jusqu’à la fin de la période de vote. 
    Si un électeur modifie son vote, il est recommandé de le faire en mettant à jour le commentaire de vote original en barrant le vote et en écrivant le nouveau vote. 
    - Les votes avant le début de la période de vote ne sont pas pris en compte. 
    - L’ouverture et la clôture des votes doivent être annoncées sur la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes). 
1. La proposition est acceptée s’il y a un consensus unanime oui avec au moins 3 voix. 
    - Le vote de l'_advocate_ ne compte pas dans le total des 3 voix. Par exemple, si l'_advocate_ X crée une pull request et vote oui, et que les utilisateurs Y et Z votent oui, cela compte pour 2 votes oui au total. 
    - Les votes contre doivent être justifiés et, idéalement, fournir des retours constructifs. 
    - Si le vote échoue, l’_advocate_ peut alors choisir de poursuivre les travaux sur la proposition ou d’abandonner la proposition. 
    L’une ou l’autre décision de l’_advocate_ doit être annoncée dans la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes). 
    - Si l’_advocate_ poursuit le travail sur la proposition, un nouveau vote peut être demandé à tout moment. 
1. Toute pull request restant inactive pendant 30 jours calendaires sera clôturée. Lorsqu’une pull request est fermée, la proposition correspondante est considérée comme abandonnée. L’_advocate_ peut rouvrir la pull request à tout moment s’il souhaite poursuivre ou maintenir la conversation. 
1. Si la proposition est acceptée : 
    - Google s’engage à merger la version votée de la pull request (à condition que les contributeurs aient signé la [CLA](https://github.com/google/transit/blob/master/CONTRIBUTING.md)), et en effectuant la pull request dans les 5 jours ouvrables. 
    - Les traductions ne doivent pas être incluses dans la pull request originale. 
    Google est responsable de la mise à jour éventuelle des traductions pertinentes dans les langues prises en charge, mais les demandes de traduction pure de la communauté sont les bienvenues et seront acceptées dès que tous les commentaires éditoriaux auront été pris en compte. 
1. Le résultat final de la pull request (acceptée ou abandonnée) doit être annoncé sur le même fil de discussion Google Groupes où la pull request a été initialement annoncée. 

<hr> 
 
## Principes directeurs 
 Afin de préserver la vision originale de GTFS, un certain nombre de principes directeurs sont à prendre en considération lors de l’extension de la spécification : 
 
**Les flux doivent être faciles à créer et modifier**<br> 
Nous avons choisi CSV comme base de spécification car il est facile à visualiser et à modifier à l’aide de tableurs et d’éditeurs de texte, ce qui est utile pour les petites agences. Il est également simple à générer à partir de la plupart des langages de programmation et des bases de données, ce qui est idéal pour les éditeurs de flux plus volumineux. 
 
**Les flux doivent être faciles à analyser**<br> 
Les lecteurs de flux doivent être capables d’extraire les informations qu’ils recherchent avec le moins de travail possible. Les modifications et ajouts au flux doivent être aussi largement utiles que possible, afin de minimiser le nombre de chemins de code que les lecteurs du flux doivent implémenter. (Cependant, il convient de donner la priorité à la facilité de création, car il y aura finalement plus d’éditeurs de flux que de lecteurs de flux.) 
 
**La spécification concerne les informations sur les passagers**<br> 
GTFS s’occupe principalement de l’information des passagers. Autrement dit, la spécification doit inclure des informations qui peuvent avant tout aider les outils destinés à l'information voyageur. Il existe potentiellement une grande quantité d’informations opérationnelles que les agences de transport en commun pourraient souhaiter transmettre en interne entre les systèmes. GTFS n’est pas destiné à cet objectif et il existe potentiellement d’autres normes de données orientées vers les opérations qui pourraient être plus appropriées. 
 
**Les modifications apportées à la spécification doivent être rétrocompatibles**<br> 
Lors de l’ajout de fonctionnalités à la spécification, nous souhaitons éviter d’apporter des modifications qui rendraient invalides les flux existants. Nous ne voulons pas créer davantage de travail pour les éditeurs de flux existants qui ne souhaiteraient pas ajouter des fonctionnalités à leurs flux. De plus, dans la mesure du possible, nous souhaitons que les lecteurs de flux existants puissent continuer à lire les anciennes parties des flux les plus récents. 
 
**Les fonctionnalités spéculatives sont déconseillées**<br> 
Chaque nouvelle fonctionnalité ajoute de la complexité à la création et à la lecture des flux. Par conséquent, nous voulons veiller à n’ajouter que des fonctionnalités que nous savons utiles. Idéalement, toute proposition aura été testée en générant des données pour un système de transport en commun réel qui utilise la nouvelle fonctionnalité et en implémentant un système pour la lire et l’afficher. Notez que le GTFS permet facilement des extensions du format grâce à l’ajout de colonnes et de fichiers supplémentaires qui sont ignorés par les lecteurs de flux et validateurs officiels, de sorte que les propositions peuvent être facilement prototypées et testées sur les flux existants. 

<hr> 
