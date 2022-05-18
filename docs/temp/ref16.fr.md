#### Exemple : Blocs et jour de service

L'exemple ci-dessous est valable, avec des blocs distincts chaque jour de la semaine.

| route_id | trip_id  | service_id                   | bloc_id      | <span style="font-weight:normal"></span>*(heure du premier arrêt)*</span> | <span style="font-weight:normal"></span>*(heure du dernier arrêt)*</span> |
| -------- | -------- | ---------------------------- | ------------ | ------------------------------------------------------------------------- | ------------------------------------------------------------------------- |
| rouge    | trip_1   | lun-mars-mer-jeu-fri-sam-dim | rouge_boucle | 22:00:00                                                                  | 22:55:00                                                                  |
| rouge    | voyage_2 | ven-sam-dim                  | rouge_boucle | 23:00:00                                                                  | 23:55:00                                                                  |
| rouge    | trip_3   | vendredi-samedi              | rouge_boucle | 24:00:00                                                                  | 24:55:00                                                                  |
| rouge    | voyage_4 | lun-mars-mer-jeu             | rouge_boucle | 20:00:00                                                                  | 20:50:00                                                                  |
| rouge    | trip_5   | lun-mars-mer-jeu             | rouge_boucle | 21:00:00                                                                  | 21:50:00                                                                  |

Notes sur le tableau ci-dessus :

* Du vendredi au samedi matin, par exemple, un seul véhicule effectue les `trajets 1`, `2` et `3` (de 22h00 à 00h55). Notez que le dernier trajet a lieu le samedi, de minuit à minuit cinquante-cinq, mais qu'il fait partie de la " journée de service " du vendredi, car les horaires sont de minuit à minuit cinquante-cinq.
* Le lundi, le mardi, le mercredi et le jeudi, un seul véhicule effectue le `trajet_1`, le `trajet_4` et le `trajet_5` dans un bloc de 20h00 à 22h55.
