# :material-wheelchair: Accessibilité 

 Les fonctionnalités Accessibilité sont destinées à fournir aux personnes handicapées les informations dont elles ont besoin pour accéder au service. 
 
## Accessibilité aux Personnes en Fauteuil Roulant aux Arrêts 
 
 Arrêts Accessibilité en fauteuil roulant permet d’indiquer si l’embarquement en fauteuil roulant est possible à partir de l’emplacement spécifié. Afin de servir les passagers en fauteuil roulant, il est tout aussi important de préciser que l’embarquement en fauteuil roulant est possible que de préciser qu’il ne l’est pas. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `wheelchair_boarding` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 - [Types d’emplacement](../base_add-ons/#types-demplacement) lors de la définition des informations d’accessibilité pour les emplacements des gares tels que les entrées/sorties ou les zones d’embarquement. 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre que l’embarquement en fauteuil roulant est disponible à l’arrêt `TAS001` en utilisant `wheelchair_boarding=1`.
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat  | stop_lon   | location_type | wheelchair_boarding |
        |---------|------------|-----------|------------|---------------|---------------------|
        | TAS001  | 5 Av/53 St | 40.760167 | -73.975224 |               |                   1 |
 
 
## Accessibilité aux Personnes en Fauteuil Roulant lors des Trajets
 
 Trajets Accessibilité en fauteuil roulant permettent d’indiquer si un véhicule peut accueillir des passagers en fauteuil roulant. Afin de servir les usagers en fauteuil roulant, il est tout aussi important de préciser qu’un véhicule peut accueillir des usagers en fauteuil roulant que de préciser qu’un véhicule ne le peut pas. L’arrêt et le trajet doivent être accessibles aux fauteuils roulants pour qu’un passager puisse accéder à un trajet à l’arrêt donné. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[trips.txt](../../../documentation/schedule/reference/#tripstxt)| `wheelchair_accessible` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 
 
??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant montre que le véhicule utilisé lors du voyage « AWE1» est équipé pour accueillir au moins un fauteuil roulant, et que le véhicule utilisé lors du voyage «AWE2» ne l’est pas. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#tripstxt"><b>trips.txt</b></a> <br>
        </p>

        | route_id | service_id | trip_id | wheelchair_accessible |
        |----------|------------|---------|-----------------------|
        | RA       | WE         | AWE1    |                     1 |
        | RA       | WE         | AWE2    |                     2 |
 
 
## Synthèse Vocale 
 
 Synthèse Vocale permet de fournir les entrées nécessaires pour convertir le texte en audio, garantit que les passagers utilisant la technologie d’assistance pour lire le texte à haute voix obtiennent les bons noms d’arrêt lorsque vous utilisez le service de transport en commun. 
 
 | Fichiers inclus | Champs inclus | 
 |------------------------|-------------------| 
 |[stops.txt](../../../documentation/schedule/reference/#stopstxt)| `tts_stop_name` | 
 
 **Prérequis** : 
 
 - [fonctionnalités de Base](../base) 

??? note "Exemples de données"

    <p style="font-size:16px">
    L’exemple suivant fournit une version lisible du nom de l’arrêt, permettant aux outils de synthèse vocale de lire le nom à haute voix. 
    </p>
    !!! note ""
        <p style="font-size:16px">
        <a href="../../../documentation/schedule/reference/#stopstxt"><b>stops.txt</b></a> <br>
        </p>

        | stop_id | stop_name  | stop_lat    | stop_lon   | tts_stop_name            |
        |---------|------------|-------------|------------|--------------------------|
        | TAS001  | 5 Av/53 St | 45.5035680  | -73.587079 | 5th avenue and 53 street |

