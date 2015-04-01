************* PROJET GLOBAL ****************

Modélisation de différentes stratégie de stop.

L'objectif était d'utiliser http://hitchwiki.org/maps/ qui est une carte creative common où les autostoppeur indiquent la viabilité des emplacement de stop, sur le fond de carte de open street map. Les emplacements sont géolocalisés, notés, et parfois une durée d'attente est indiquée. 

Le but des stoppeurs sera de se rendre d'un ensemble de point A à un ensemble de point B en un minimum de temps (globalement d'une ville à une autre).
Des automobilistes s'arrêteront de temps à autre (suivant la viabilité de l'emplacement du stoppeur). Ceux-ci se rendent jusqu'à un point précis C, et peuvent déposer le stoppeur sur un des emplacement de stop en direction de C.

Différentes stratégies pour les stoppeurs ont été imaginées :
- non renseigné : si la direction intéresse le stoppeur, il accepte et se rend aussi loin que possible sans réfléchir.
- renseigné mais prudent : si la direction l'intéresse, que le trajet l'avance beaucoup, et qu'un point de dépose intéressant est disponible, alors il accepte.
- hybride : si la direction l'intéresse, il accepte si le trajet l'avance un minimum et si une dépose pratique semble possible.

Le but est d'estimer quelle stratégie est la plus viable, suivant différents paramètres variables :
- la distance totale du trajet et sa complexité (Paris => Nice, longue distance, beaucoup d'emplacements, Paris => Clermont, plus courte distance, moins d'emplacements),
- la durée d'attente minimum (le temps de trouver où l'on est, où se placer, quel panneau de direction utiliser, qui dépend de la stratégie),
- la probabilité que les voitures s'arrêtent suivant la stratégie (sans panneau, plus d'arrêts, mais trajets plus courts, avec panneau de grande distance, moins d'arrêtes mais plus ciblés),
- potentiellement les erreurs de "navigations" liés à la mauvaise connaissance du trajet et des emplacements en fonction du temps que l'on prend à réfléchir à la stratégie.

Obtenir des estimations statistiques grâce au modèle suivant les stratégie pour connaître leur viabilité en terme de sécurité / durée (et suivant les types de trajet).

************* REALISATION *****************
Toutes les fonctionnalités qui devaient être implémentées ne l'ont pas été malheureusement. Il y a 4 espèces dont une générique et une grille.
Des autostoppeurs, symbolisés en bleu, attendent le passage d'un automobiliste à un point fixé au départ.
Les automobilistes sont en rouge et se déplacent aléatoirement grâce à un réflexe jusqu'à avoir trouvé une ville.
Les villes sont en noires.
Si un automobiliste rencontre un stoppeur celui le suivra jusqu'à l'arrivée dans une ville.
Les paramètres initiaux sont réglables dans la simulation ainsi que la taille de la grille.
