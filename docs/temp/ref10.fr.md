## Exigences relatives aux fichiers

Les exigences suivantes s'appliquent au format et au contenu des fichiers de l'ensemble de données :

* Tous les fichiers doivent être enregistrés sous forme de texte délimité par des virgules.
* La première ligne de chaque fichier doit contenir les noms des champs. Chaque sous-section de la section [Field Definitions](#field-definitions) correspond à l'un des fichiers d'un ensemble de données GTFS et énumère les noms de champs qui peuvent être utilisés dans ce fichier.
* Tous les noms de fichiers et de champs sont sensibles à la casse.
* Les valeurs des champs ne doivent pas contenir de tabulation, de retour chariot ou de nouvelle ligne.
* Les valeurs de champ qui contiennent des guillemets ou des virgules doivent être placées entre guillemets. En outre, chaque guillemet dans la valeur du champ doit être précédé d'un guillemet. Cela correspond à la manière dont Microsoft Excel produit des fichiers délimités par des virgules (CSV). Pour plus d'informations sur le format de fichier CSV, voir [https://tools.ietf.org/html/rfc4180.](https://tools.ietf.org/html/rfc4180)

L'exemple suivant montre comment la valeur d'un champ apparaît dans un fichier délimité par des virgules :

* **Valeur originale du champ :** `Contient des "guillemets", des virgules et du texte.`
* **Valeur du champ dans le fichier CSV :** `"Contient des ""guillemets"", des virgules et du texte".`
* Les valeurs des champs ne doivent pas contenir de balises HTML, de commentaires ou de séquences d'échappement.
* Les espaces supplémentaires entre les champs ou les noms de champs doivent être supprimés. De nombreux analyseurs syntaxiques considèrent que les espaces font partie de la valeur, ce qui peut entraîner des erreurs.
* Chaque ligne doit se terminer par un caractère de saut de ligne CRLF ou LF.
* Les fichiers doivent être codés en UTF-8 pour prendre en charge tous les caractères Unicode. Les fichiers qui incluent le caractère Unicode byte-order mark (BOM) sont acceptables. Consultez <https://unicode.org/faq/utf_bom.html#BOM> pour plus d'informations sur le caractère BOM et UTF-8.
* Tous les fichiers de l'ensemble de données doivent être zippés ensemble.
