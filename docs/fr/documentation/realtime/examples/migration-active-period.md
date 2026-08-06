## Guide de migration- Transition de active_period à communication_period et impact_period 

 
La propriété GTFS-realtime `alert.active_period` a été définie comme suit : *« Période pendant laquelle l’alerte doit être affichée à l’ utilisateur·rice. Si cette valeur est manquante, l’alerte sera affichée tant qu’elle apparaît dans le flux. Si plusieurs plages sont spécifiées, l’alerte sera affichée pendant chacune d’elles. »* 

 
Cette définition comportait une ambiguïté : la « période pendant laquelle l’alerte doit être affichée à l’ utilisateur·rice» pouvait être interprétée de deux manières : 
* Moment où l’ utilisateur·rice est informé de l’alerte. 
* Moment où l’interruption de service résultant de l’alerte est effective. 

Pour lever cette ambiguïté, les champs `communication_period` et `impact_period` sont introduits. 
* `communication_period` : durée pendant laquelle l’alerte doit être affichée à l’ utilisateur·rice à titre purement informatif. 
* `impact_period` : durée pendant laquelle les services sont affectés par l’alerte. 

Afin de garantir la mise en œuvre de ces nouveaux champs tout en préservant la rétrocompatibilité et en tenant compte des coûts d’infrastructure, la communauté a décidé de rendre le champ `active_period` obsolète, tout en autorisant sa coexistence avec `communication_period` et `impact_period`. Ce guide de migration explique comment interpréter la coexistence de ces trois champs et décrit les étapes d’une migration progressive vers les nouveaux champs `communication_period` et `impact_period`. L’objectif est d’inciter les producteurs et les consommateurs à utiliser progressivement `communication_period` et `impact_period` à la place de `active_period`. 

## Producteurs 
Pour les producteurs, vous pouvez continuer à inclure les 3 champs dans la même alerte. Essayez de spécifier `communication_period` et `impact_period` dans autant d’alertes que possible, en particulier celles avec NO_SERVICE.

**Ne dupliquez pas les alertes pour séparer active_period des nouveaux champs!** Créez une alerte par incident de service réel; vous pouvez y spécifier `communication_period`, `impact_period` et `active_period`. 

Lorsqu’une alerte contient `communication_period` et `impact_period`, il est recommandé de ne pas inclure `active_period` (ce champ est déjà facultatif). 

Pour promouvoir les bonnes pratiques, il est recommandé de spécifier `communication_period` et `impact_period` ensemble autant que possible. 

Tous les exemples suivants sont valides. 

### Option recommandée 

```` 
alert { 
“communication_period”: [{ "start": …, "end": … }], ← Durée pendant laquelle l’ utilisateur·rice est informé de l’alerte. 
“impact_period": [{ "start": …, "end": … }], ← Durée pendant laquelle l’interruption de service résultant de l’alerte est effective. Peut correspondre à plusieurs périodes si l’interruption de service est récurrente. 
...
} 
```` 
 
### Autres options valides non recommandées 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
“communication_period”: [{ "start": …, "end": … }], 
"impact_period": [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alert { 
“active_period”: [{ "start": …, "end": … }], 
"impact_period": [{ "start": …, "end": … }], 
...
} 
```` 

```` 
alerte { 
« période_active » : [{ « début » : …, « fin » : … }], 
« période_communication » : [{ « début » : …, « fin » : … }], 
...
} 
```` 

```` 
alerte { 
« période_active » : [{ « début » : …, « fin » : … }], 
...
} 
```` 

```` 
alerte { 
« période_communication » : [{ « début » : …, « fin » : … }], 
...
} 
````

Il est conseillé d’informer les utilisateurs actuels (par exemple, via une liste de diffusion développeur·euse) que l’utilisation de `active_period` est progressivement abandonnée et qu’ils doivent désormais utiliser `communication_period` et `impact_period` à la place. Ce guide de migration doit être inclus, en insistant sur la section « Utilisateur ». Après la date limite, vous pouvez supprimer les entités `active_period` de votre flux et ne publier que `communication_period` et `impact_period`. 
 
## Consommateurs 
 
Pour les consommateurs, vous pouvez interpréter les champs en fonction de leur définition de spécification. 
- Si `active_period` existe avec `communication_period` et `impact_period`, **ignorez `active_period** et utilisez les deux autres champs. 
 
- Si `active_period` existe avec `impact_period`, **ignorez `active_period`** et ne l’interprétez pas comme `communication_period`. 
 
- Si `active_period` existe avec `communication_period`, **ignorez `active_period` **et ne l’interprétez pas comme `impact_period`. 
 
- Si `active_period` existe seul, utilisez-le.