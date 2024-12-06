# Tracé des lignes (Shapes)

## Guide des données de tracé des lignes

Les données contenues dans le fichier shapes.txt jouent un rôle essentiel dans la représentation des services de transport en commun. Des lignes correctement construites améliorent la précision des visualisations de trajet dans les applications de planification d'itinéraire, garantissant une expérience fluide pour les usagers. Les pratiques recommandées suivantes fournissent des conseils sur la création de données de haute qualité qui représentent avec précision les mouvements des véhicules et s'alignent sur les trajectoires de déplacement physique.

  1. Lorsque la trajectoire de déplacement entre les arrêts n’est pas une ligne droite, évitez de définir la ligne avec seulement deux points. Assurez-vous que la linge reflète avec précision la trajectoire de déplacement du véhicule.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-1.png"> 

  2. Veiller à ce que les lignes partent de la station d'origine et se terminent à la station de destination. Évitez les lignes trop courtes ou trop longues.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2a.png"> 

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-2b.png"> 

  3. Dans une ligne définie par un seul shape_id, évitez les retours en arrière illogiques ou les inversions de points inutiles.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-3.png"> 

  4. Assurez-vous que les lignes s'alignent sur le chemin emprunté par les véhicules dans le système de coordonnées WGS84, évitez les décalages causés par des systèmes de coordonnées différentes.

      - Pour les services routiers (par exemple, les bus), les alignements doivent suivre l'axe médian de la chaussée sur laquelle le véhicule circule. Il peut s'agir soit de l'axe médian de la rue s'il n'y a pas des voies désignées, soit de l'axe médian du côté de la direction de déplacement si des voies sont spécifiées.

        <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4a.png"> 

      - Pour les services ferroviaires (par exemple, métro, train, métro léger), les lignes doivent suivre les voies sur lesquelles le train circule. Si un trajet ne se déroule pas toujours sur une voie spécifique dans certaines zones et qu’il existe plusieurs voies, assurez-vous que la ligne reste dans les limites des voies sur lesquelles le train peut circuler.

        <img class="center" width="1500" height="100%" src="../../../../assets/shapes-4b.png"> 

  5. Lorsque le véhicule se déplace dans des courbes, les points de ligne doivent être suffisamment denses pour permettre une présentation visuellement fluide pour les conducteurs.

    <img class="center" width="1500" height="100%" src="../../../../assets/shapes-5.png"> 

  6. Les alignements ne doivent pas « dévier » vers un arrêt sur le trottoir, un quai ou un lieu d’embarquement.

   <img class="center" width="1500" height="100%" src="../../../../assets/shapes-6.png">