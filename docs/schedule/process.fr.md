---
search:
  exclude: true
---

# Processus de modification de la spécification

La spécification GTFS n'est pas gravée dans le marbre. Il s'agit plutôt d'une spécification ouverte développée et maintenue par la communauté des agences de transport, des développeurs et des autres parties prenantes qui utilisent GTFS. On s'attend à ce que cette communauté de producteurs et de consommateurs de données GTFS ait des propositions pour étendre la spécification afin de permettre de nouvelles capacités. Pour aider à gérer ce processus, les procédures et directives suivantes ont été établies.

!!! note ""

    La spécification, la référence et la documentation officielles sont rédigées en anglais. Si une Translation dans une autre langue diffère de l'original anglais, c'est ce dernier qui prévaut. Toute communication est effectuée en anglais.

1. Créer une branche git avec la mise à jour de toutes les parties pertinentes des fichiers de définition, de spécification et de documentation du protocole (à l'exception des traductions).
1. Créer une demande de retrait sur [https://github.com/google/transit.](https://github.com/google/transit) La demande de retrait ne doit pas contenir une description détaillée du correctif. Le créateur de la demande de retrait devient l'_avocat_.
1. Une fois que la demande de retrait est enregistrée, elle doit être annoncée par son défenseur dans la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes), avec un lien vers la demande de retrait. Une fois annoncée, la pull request est considérée comme une proposition. La demande de retrait devrait également être modifiée pour contenir un lien vers l'annonce dans Google Groups afin de pouvoir facilement les recouper.
   * Étant donné que le défenseur est un contributeur, il doit signer l'[accord de licence du contributeur](../CONTRIBUTING.md) avant que la demande de retrait puisse être acceptée.
1. La discussion de la proposition suit. Les commentaires de la demande de tirage devraient être utilisés comme seul forum de discussion.
   * La discussion dure aussi longtemps que le défenseur le juge nécessaire, mais doit être au moins de 7 jours civils.
   * L'avocat est responsable de la mise à jour en temps voulu de la proposition (c'est-à-dire de la pull request) sur la base des commentaires qu'il accepte.
   * À tout moment time le défenseur peut déclarer la proposition abandonnée.
1. L'avocat peut demander un vote sur une version de la proposition à tout time après l'intervalle initial de 7 jours obligatoire pour la discussion.
   * Avant d'appeler au vote, au moins un producteur GTFS et un consommateur GTFS devraient mettre en œuvre le changement proposé. Il est prévu que le(s) producteur(s) GTFS inclue(nt) le changement dans un flux GTFS public et fournisse(nt) un lien vers ces données dans les commentaires de la demande pull, et que le(s) consommateur(s) GTFS fournisse(nt) un lien dans les commentaires de la demande pull vers une application qui utilise le changement d'une manière non triviale (c'est-à-dire qu'elle supporte une fonctionnalité nouvelle ou améliorée).
1. Le vote dure la période minimale suffisante pour couvrir 7 jours civils FULL et 5 jours ouvrables suisses FULL. Le vote se termine à 23:59:59 UTC.
   * Le défenseur devrait annoncer l'time end spécifique au start du vote.
   * Pendant la période de vote, seules les modifications rédactionnelles de la proposition sont autorisées (fautes de frappe, changement de formulation possible tant que cela ne change pas le sens).
   * Tout le monde est autorisé à voter oui/non sous forme de commentaire à la pull request, et les votes peuvent être modifiés jusqu'à la end de la période de vote.
   Si un votant change son vote, il est recommandé de le faire en mettant à jour le commentaire du vote original en rayant le vote et en écrivant le nouveau vote.
   * Les votes effectués avant le start de la période de vote ne sont pas pris en compte.
   * L'ouverture et la clôture des votes doivent être annoncées sur la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes).
1. La proposition est acceptée s'il y a un consensus unanime de oui avec au moins 3 votes.
   * Le vote du proposant ne compte pas dans le total des 3 votes. Par exemple, si le proposant X crée une demande de retrait et vote oui, et que les utilisateurs Y et Z votent oui, cela compte pour un total de 2 votes oui.
   * Les votes contre doivent être motivés et, dans l'idéal, fournir des informations exploitables.
   * Si le vote a échoué, l'avocat peut choisir de continuer à travailler sur la proposition ou de l'abandonner.
   L'une ou l'autre décision de l'avocat doit être annoncée dans la [liste de diffusion GTFS Changes](https://groups.google.com/forum/#!forum/gtfs-changes).
   * Si l'avocat continue à travailler sur la proposition, un nouveau vote peut être demandé à tout time.
1. Toute demande tirée qui reste inactive pendant 30 jours civils sera fermée. Lorsqu'une demande de retrait est fermée, la proposition correspondante est considérée comme abandonnée. Le défenseur peut rouvrir la demande à tout time s'il souhaite poursuivre ou maintenir la conversation.
1. Si la proposition est acceptée :
   * Google s'engage à fusionner la version votée de la demande de modification (à condition que les contributeurs aient signé la [ALC](../CONTRIBUTING.md)), et à exécuter la demande de modification dans les 5 jours ouvrables.
   * Les traductions ne doivent pas être incluses dans la demande originale.
   Google est responsable de la mise à jour éventuelle des traductions pertinentes dans les langues prises en charge, mais les demandes de Translation pure émanant de la communauté sont les bienvenues et seront acceptées dès que tous les commentaires éditoriaux auront été traités.
1. Le résultat final de la demande de retrait (acceptée ou abandonnée) devrait être annoncé sur le même fil de discussion Google Groups que celui où la demande de retrait a été initialement annoncée.

<hr/>

## Principes directeurs

Afin de préserver la vision originale de GTFS, un certain nombre de principes directeurs ont été établis pour être pris en considération lors de l'extension de la spécification :

**Les flux devraient être faciles à créer et à modifier**<br/> Nous avons choisi le format CSV comme base de la spécification parce qu'il est facile à visualiser et à modifier à l'aide de tableurs et d'éditeurs de text, ce qui est utile pour les petites agences. Il est également facile à générer à partir de la plupart des langages de programmation et des bases de données, ce qui est une bonne chose pour les éditeurs de flux plus importants.<br/>

**Les flux devraient être faciles à analyser**<br/>Les lecteurs de flux devraient être en mesure d'extraire les informations qu'ils recherchent avec le moins de travail possible. Les modifications et les ajouts au flux devraient être aussi largement utiles que possible, afin de minimiser le nombre de chemins de code que les lecteurs du flux doivent mettre en œuvre. (Toutefois, la facilité de création devrait être privilégiée, car il y aura finalement plus d'éditeurs de flux que de lecteurs de flux).<br/>

**La spécification concerne l'information des passagers**<br/> GTFS est principalement concerné par l'information des passagers. C'est-à-dire que la spécification devrait inclure des informations qui peuvent aider les outils électriques pour les coureurs, d'abord et avant tout. Il y a potentiellement une grande quantité d'informations orientées vers les opérations que les agences de transport peuvent vouloir transmettre en interne entre les systèmes. GTFS n'est pas destiné à cette fin et il existe potentiellement d'autres normes de données orientées opérations qui pourraient être plus appropriées.<br/>

**Les changements apportés à la spécification doivent être compatibles avec le passé.**<br/> Lorsque nous ajoutons des fonctionnalités à la spécification, nous voulons éviter d'apporter des changements qui rendraient les flux existants invalides. Nous ne voulons pas créer plus de travail pour les éditeurs de flux existants jusqu'à ce qu'ils souhaitent ajouter des fonctionnalités à leurs flux. De plus, dans la mesure du possible, nous voulons que les analyseurs existants puissent continuer à lire les anciennes parties des nouveaux flux.<br/>

**Les fonctionnalités spéculatives sont découragées**<br/>Chaque nouvelle fonctionnalité ajoute de la complexité à la création et à la lecture des flux. Par conséquent, nous voulons prendre soin de n'ajouter que des fonctionnalités que nous savons être utiles. Idéalement, toute proposition aura été testée en générant des données pour un système de transport réel qui utilise la nouvelle fonctionnalité et en écrivant un logiciel pour les lire et les afficher. Notez que le GTFS permet facilement des extensions du format par l'ajout de colonnes et de fichiers supplémentaires qui sont ignorés par les analyseurs et validateurs officiels, de sorte que les propositions peuvent être facilement prototypées et testées sur des flux existants.<br/>

<hr/>

## Historique des révisions

**26 juillet 2022**<br/>

* Ajout de transferts d'un voyage à l'autre avec l'option "siège". Voir la [discussion](https://github.com/google/transit/pull/303)

**17 mai 2022**<br/>

* Mise en œuvre de la base GTFS-Fares V2. Voir la [discussion](https://github.com/google/transit/pull/286)

**22 octobre 2021**<br/>

* Ajout de champs d'id primaires et étrangers. Voir la [discussion](https://github.com/google/transit/pull/278)

**05 octobre 2021**<br/>

* Ajout des transferts de voyage à voyage et d'itinéraire à itinéraire. Voir la [discussion](https://github.com/google/transit/pull/284)

**15 septembre 2021**<br/>

* Permet aux portes de tarifs (pathway_mode=6) d'être bidirectionnelles. Voir la [discussion](https://github.com/google/transit/pull/276).

**13 septembre 2021**<br/>

* Mise à jour des meilleures pratiques concernant `stop_name`. Voir la [discussion](https://github.com/google/transit/pull/282).

**27 août 2021**<br/>

* Mise à jour du GTFS Schedule selon la [RFC 2119](https://datatracker.ietf.org/doc/html/rfc2119). Voir la [discussion](https://github.com/google/transit/pull/277).

**4 janvier 2021**<br/>

* Clarification de la description de `stop_times.stop_id`. Voir la [discussion](https://github.com/google/transit/pull/258).
* Définition des signes positifs et non nuls des champs. Voir la [discussion](https://github.com/google/transit/pull/251).

**2 octobre 2020**<br/>

* Changement du type de champ de `frequencies.headway_secs` de non-négatif à positif. Voir la [discussion](https://github.com/google/transit/pull/249).

**Peut 25, 2020**<br/>

* Définition de `pathways.txt`, `levels.txt` et `attributions.txt` comme tableaux traduisibles. Ajout de recommandations pour la traduction des valeurs `signposted_as` multilingues. Voir la [discussion](https://github.com/google/transit/pull/220).

**Peut 13, 2020**<br/>

* Ajout de `continuous_pickup` et `continuous_drop_off` aux `routes.txt` et `stop_times.txt`. Changement de `shape_id` de "Optional" à "Conditionally required". Voir la [discussion](https://github.com/google/transit/pull/208).

**24 mars 2020**<br/>

* Définition du champ de text et ajout de `tts_stop_name` dans `stops.txt`. Voir la [discussion](https://github.com/google/transit/pull/49).

**5 février 2020**<br/>

* Ajout de trolleybus et monorail `route_types`. Voir la [discussion](https://github.com/google/transit/pull/174).

**9 janvier 2020**<br/>

* Ajout des `translations.txt`. Voir la [discussion](https://github.com/google/transit/pull/180).

**26 décembre 2019**<br/>

* Mise à jour des définitions pour le téléphérique et l'ascenseur aérien dans `route_type`. Voir la [discussion](https://github.com/google/transit/pull/186).

**20 décembre 2019**<br/>

* Ajouté `attributions.txt`. Voir la [discussion](https://github.com/google/transit/pull/192).

**26 août 2019**<br/>

* Spécification que `stop_lat` et `stop_lon` doivent être positionnés là où les passagers attendent pour monter dans le vehicle. Voir la [discussion](https://github.com/google/transit/pull/179).

**9 juillet 2019**<br/>

* Ajout des meilleures pratiques concernant time arrival et de departure. Voir la [discussion](https://github.com/google/transit/pull/165).
* Ajout des meilleures pratiques en matière de panneaux de signalisation. Voir la [discussion](https://github.com/google/transit/pull/167).
* Ajout des meilleures pratiques concernant le `stop_id`. Voir la [discussion](https://github.com/google/transit/pull/169).

**25 juin 2019**<br/>

* Clarification de la relation entre les points de Shape et les arrêts. Voir la [discussion](https://github.com/google/transit/pull/39).

**4 avril 2019**<br/>

* Ajout du champ `platform_code` dans `stops.txt`. Voir la [discussion](https://github.com/google/transit/pull/146).

**27 mars 2019**<br/>

* Ajout de `pathways.txt` et `levels.txt`. Voir la [discussion](https://github.com/google/transit/pull/143).

**6 février 2019**<br/>

* Changements éditoriaux et de formatage pour plus de clarté. Voir la [discussion](https://github.com/google/transit/pull/120).

**2 octobre 2018**<br/>

* Types de champs factorisés. Voir la [discussion](https://github.com/google/transit/pull/104).

**14 septembre 2018**<br/>

* Ajout du concept de "Conditionally required". Voir la [discussion](https://github.com/google/transit/pull/100).

**4 septembre 2018**<br/>

* Unification des définitions de `agency_lang` et `feed_lang`. Voir la [discussion](https://github.com/google/transit/pull/98).

**27 août 2018**<br/>

* Mise à jour de `CHANGES.md` et de la date de dernière révision. Voir la [discussion](https://github.com/google/transit/pull/99).

**22 août 2018**<br/>

* Ajout des champs `feed_contact_email` et `feed_contact_url` dans le fichier `feed_info.txt`. Voir la [discussion](https://github.com/google/transit/pull/31).

**11 décembre 2017**<br/>

* Ajouté `route_sort_order` dans `routes.txt`. Voir la [discussion](https://github.com/google/transit/pull/83).

**15 mars 2017**<br/>

* Clarification du fait que le vote d'un proposant ne compte pas dans le total. Voir la [discussion](https://github.com/google/transit/pull/50).
* Spécifié qu'avant d'appeler un vote, au moins un producteur GTFS et un consommateur GTFS devraient implémenter le changement proposé. Voir la [discussion](https://github.com/google/transit/pull/46).

**7 février 2017**<br/>

* Clarification de la relation entre `block_id` et `service_id`. Voir la [discussion](https://github.com/google/transit/pull/44).
* Clarification du fait que le service basé sur la fréquence commence au departure vehicle. Voir la [discussion](https://github.com/google/transit/pull/42).
* Clarification des descriptions de `stop_id` et `stop_code`. Voir la [discussion](https://github.com/google/transit/pull/40).

**11 décembre 2017**<br/>

* Ajout du champ `route_sort_order` dans le fichier `routes.txt`. Voir la [discussion](https://github.com/google/transit/pull/83).

**27 novembre 2016**<br/>

* Ajout de l'entrée de la station en tant que `stops.location_type`. Voir la [discussion](https://github.com/google/transit/pull/30).

**2 septembre 2016**<br/>

* Mise à jour de la documentation pour ajouter le champ `agency_id` dans le fichier `fare_attributes.txt`. Voir la [discussion](https://github.com/google/transit/pull/27).

**16 mars 2016**<br/>

* Transition de la documentation GTFS vers Github à l'adresse <https://github.com/google/transit>.

**3 février 2016**<br/>

* Ajout de `agency_email` à `agency.txt` proposition de spec : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/aezjQsriLYA)

**2 février 2015**<br/>

* Ajouté stop_times.txt 'timepoint' proposition à spec : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/Ah-J9JP2rJY)

**17 février 2014**<br/>

* Ajouté trips.txt 'bikes_allowed' proposition vers spec : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/rEiSeKNc4cs)

**15 octobre 2012**<br/>

* Ajouté trips.txt wheelchair_accessible' proposition vers spec : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**20 juin 2012**<br/>

* Ajouté la proposition 'wheelchair_boarding' aux spécifications : [discussion](https://groups.google.com/forum/?fromgroups#!topic/gtfs-changes/ASxItgsQlh4)

**2 février 2012**<br/>

* Ajouté la proposition 'stop_timezone' à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/2Il0Q9OXqu4)

**18 janvier 2012**<br/>

* Migration de la documentation de l'ancien code.google.com vers son nouvel emplacement à developers.google.com.

**26 septembre 2011**<br/>

* Ajouté la proposition 'feed_info' aux spécifications : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/Sh0e4o9o2Gw)

**6 septembre 2011**<br/>

* Ajouté la proposition 'agency_fare_url' aux spécifications : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/Zp9rPG07CgE)
* Ajouté la proposition 'exact_times' à la spécification : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/nZF9lbQ7TQs)

**30 mars 2009**<br/>

* Une nouvelle section sur la mise à disposition publique d'un flux de transit. Ce point n'a pas été discuté précédemment dans le groupe, car il ne s'agit pas strictement d'un changement dans la façon dont les données sont interprétées ou écrites. Cependant, certains membres de Google ont pensé qu'il serait utile d'inclure une discussion sur les utilisations non Google de GTFS, étant donné qu'un nombre croissant d'applications peuvent utiliser des données GTFS.
* Clarifications sur le format CSV : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/03qz5aTA2mk)
* Des indications supplémentaires sur la manière de choisir des couleurs contrastées dans les descriptions des champs route_color et route_text_color.
* trip_short_name, comme proposé et testé dans ces fils de discussion : a et b.
* Une correction d'une erreur mineure dans l'exemple de données inclus à la end du document (donnant à l'arrêt S7 la station_parent S8).
* Ajout de l'information "agency_lang" aux exemples de données à la end du document, comme suggéré par Marcy pendant la période de commentaires : [discussion](https://groups.google.com/forum/#!topic/gtfs-changes/5qP1kDUFqx0).
* Mise à jour du lien vers le flux GTFS de l'OCTA dans la barre latérale.
* Voir le [résumé original](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw).

**26 février 2009**<br/>

* Suppression de la plupart des instructions de soumission de flux spécifiques à Google, étant donné qu'il existe actuellement de nombreuses autres applications qui consomment des données GTFS.
* Nous avons corrigé un lien cassé dans la barre latérale vers le flux public de l'OCTA du comté d'Orange.

**Le 7 août 2008**<br/>

* Restauration du champ stop_url, qui avait été accidentellement omis dans la version du 6 août.
* Ajout du champ agency_phone à l'échantillon de données
* Ajout d'une mention de l'accord d'utilisation des données lors de la soumission d'un flux à Google.

**6 août 2008**<br/>

* Ajout du fichier transfers.txt, permettant aux éditeurs de flux de fournir des indications sur le comportement de transfert préféré ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/cL1E4oKKpKw)).
* Ajout des champs location_type et parent_station dans le stops.txt, permettant de regrouper les points d'arrêt en stations ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/ScGAyZ9a_yw)).
* Ajout du champ agency_phone pour fournir le numéro de téléphone vocal d'une agence ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/8Itt58ueyqA))
* Ajout d'une section "Testing Your Feeds" mentionnant les outils de test open-source
* Ajout de précisions sur le format CSV, le fuseau horaire de l'agence, la langue de l'agence, la couleur de l'itinéraire, la couleur du texte de l'itinéraire, l'heure d'arrivée, l'heure de départ, le calendar.txt et le calendar_dates.txt, les tableaux de tarifs et le frequencies.txt.
* Ajout d'un lien vers le document sur l'historique des flux et correction de certains liens vers des flux publics.
* Mise à jour des images d'exemple pour représenter l'interface utilisateur actuelle de Google Maps
* Mise à jour/correction des exemples de données dans le document

**29 février 2008**<br/>

* Ajout du champ stop_code dans stops.txt pour permettre la spécification des codes d'arrêt faisant face aux usagers ([proposition originale](https://groups.google.com/forum/#!topic/gtfs-changes/k9A95fYZexc))
* Clarification des descriptions de route_short_name et route_long_name dans routes.txt
* Clarification des descriptions de arrival_time et departure_time dans stop_times.txt
* Correction de fautes de frappe dans la section "Sample Data

**20 novembre 2007**<br/>

* Clarification de la description de block_id
* Modification du langage afin de ne pas mettre l'accent sur Google Transit (étant donné que des applications autres que Google utilisent GTFS et que l'acheminement des transports en commun est désormais une fonctionnalité intégrée de Google Maps) et correction de diverses coquilles.
* Mise à jour des captures d'écran d'exemple afin de refléter la présentation des champs GTFS dans l'interface utilisateur actuelle de Google Maps.
* Mise à jour de l'adresse électronique de contact de Google pour les fournisseurs de données sur les transports en commun.
* Mise à jour du formatage

**5 octobre 2007**<br/>

* Modification de stop_sequence et shape_pt_sequence pour permettre l'utilisation de tout nombre entier croissant non négatif.
* Clarification des descriptions et correction des fautes de frappe

**Peut 31, 2007**<br/>

* Mise à jour du style de la page, rendant le HTML plus propre et plus accessible
* Ajout de liens vers des exemples de flux publics et d'autres sites utiles
* Suppression des exemples dans les descriptions des champs individuels

**9 avril 2007**<br/>

* Ajout d'une section sur la [soumission d'un flux](https://developers.google.com/transit/google-transit#SubmitFeedToGoogle).
* Ajout de l'[exemple de flux de l'agence de transport de démonstration](https://developers.google.com/transit/gtfs/examples/gtfs-feed).
* Ajout d'une note indiquant que calendar.txt peut être omis si toutes les dates de service sont définies dans calendar_dates.txt.
* Le champ agency_id est devenu optionnel dans les flux ne contenant qu'une seule agence. Cela permet aux flux existants sans agency_id de rester valides.
* Ajout d'une spécification plus complète des champs agency_url, stop_url et route_url, et d'exemples de valeurs supplémentaires pour ces champs.
* Ajout de 6 (Gondole) et 7 (Funiculaire) comme valeurs valides de route_type.

**8 mars 2007**<br/>

* Modification mineure pour déplacer le champ stop_url de stop_times.txt, où il était incorrectement spécifié dans la mise à jour du 28 février, vers stops.txt, où il appartient.

**5 mars 2007**<br/>

* Modification mineure pour clarifier la description du champ route_long_name.

**28 février 2007**<br/>

* Ajout de frequencies.txt pour la prise en charge des Schedule en fonction de la distance parcourue.
* Plusieurs agences sont maintenant autorisées dans le même flux. Ajout également d'un nouveau champ agency_id dans agencies.txt et routes.txt qui permet de spécifier quelle route est exploitée par quelle agence.
* Ajout d'URLs par itinéraire et par arrêt.
* Ajout d'un champ direction_id dans trips.txt.
* Prise en charge des changements de panneaux d'indication à mi-parcours avec l'ajout du champ stop_headsign dans stop_times.txt.
* Prise en charge des couleurs d'itinéraire avec l'ajout de l'option route_color et route_text_color dans routes.txt.
* Suppression de la possibilité de spécifier des arrêts en utilisant des adresses de rue. La version précédente des spécifications vous permettait de donner l'emplacement d'un arrêt de transport en commun en utilisant une adresse de rue dans les champs stop_street, stop_city, stop_region, stop_postcode, et stop_country. Maintenant, les emplacements des arrêts peuvent être donnés en utilisant stop_lat pour latitude et stop_lon pour la longitude, ce qui est plus utile pour la plupart des applications.
* Ajout du type de vehicle téléphérique pour le champ route_type dans routes.txt.
* Voir le résumé des modifications [dans l'article de blog Headway](https://headwayblog.com/2007/03/02/google-feed-spec-update-2007-02/) original.

**29 novembre 2006**<br/>

* Ajout de la prise en charge des informations sur Shape trip via shapes.txt
* Clarification de la définition de stop_sequence
* Marqué pickup_type et drop_off_type optionnelle

**31 Octobre 2006**<br/>

* Ajout du support pour les informations sur les tarifs
* Suppression des dates des noms de fichiers individuels
* Modification des définitions de la valeur route_type
* Possibilité d'afficher plusieurs fichiers d'alimentation en même time, tant que leurs périodes de service ne se chevauchent pas.
* Correction du block_id dans trips.txt pour qu'il soit correctement marqué Optionnelle
* Notez que les en-têtes de colonnes ne doivent pas être inclus

**29 septembre 2006**<br/>

* Modification mineure pour corriger quelques erreurs dans les exemples.

**25 septembre 2006**<br/>

* Version initiale.
