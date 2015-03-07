************* PROJET GLOBAL ****************

Modélisation de différentes stratégie de stop.

Utiliser http://hitchwiki.org/maps/ qui est une carte creative common où les stopper indiquent la viabilité des emplacement de stop, sur le fond de carte open street map. Les emplacements sont géolocalisés, notés, et parfois une durée d'attente est indiquée. 

Le but des stoppeurs sera de se rendre d'un ensemble de point A à un ensemble de point B en un minimum de temps (globalement d'une ville à une autre).
Des automobilistes s’arrêteront de temps à autre (suivant la viabilité de l'emplacement du stoppeur). Ceux-ci se rendent jusqu'à un point précis C, et peuvent déposer le stoppeur sur un des emplacement de stop en direction de C.

J'ai déjà pensé à différentes stratégies pour les stoppeurs :
- non renseigné : si la direction l’intéresse, il accepte et se rend aussi loin que possible sans réfléchir.
- renseigné prudent : si la direction l'intéresse, que le trajet l'avance beaucoup, et qu'un point de dépose intéressant est disponible, alors il accepte.
- hybride : si la direction l'intéresse, il accepte si le trajet l'avance un minimum et si une dépose pratique semble possible.

Le but est d'estimer quelle stratégie est la plus viable, suivant différents paramètres que j'ai pensé faire varier :
- la distance totale du trajet et sa complexité (Paris => Nice, longue distance, beaucoup d'emplacements, Paris => Clermont, plus courte distance, moins d'emplacements),
- la durée d'attente minimum d'attente (le temps de trouver où l'on est, où se placer, quel panneau de direction utiliser, qui dépend de la stratégie),
- la probabilité que les voitures s'arrêtent suivant la stratégie (sans panneau, plus d’arrêts, mais trajets plus courts, avec panneau de grande distance, moins d'arrêtes mais plus ciblés),
- potentiellement les erreurs de "navigations" liés à la mauvaise connaissance du trajet et des emplacements en fonction du temps que l'on prend à réfléchir à la stratégie.

Obtenir des estimations statistiques grâce au modèle suivant les stratégie pour connaître leur viabilité en terme de sécurité / durée (et suivant les types de trajet?)


************** DIFFICULTE ****************
- une difficulté potentielle est de récupérer le réseau autoroutier Francais au formet OSM ou directement Shapefile 
(utilisable par Gama), la zone étant très étendue (si c'est trop dur a trouver il doit etre possible de restreindre l'étendue).

- En faisant varier la distribution des autostopeurs/destinations, on peut voir des phénomènes interessant émerger du type: "la meilleur stratégie individuelle n'est pas la meilleur pour le reseau" car les auto-stoppeurs peuvent avoir interet a faire des détours si ca permet d'arriver plus vite alors que collectivement cela encombre les voitures inutilement. Il faut donc penser a observer aussi le bien-etre social.

- Commencez par un modèle simple (autostopeur aléatoire, réseau aléatoire, destination aléatoire), 
faites le marcher pour ensuite le complexifier (carte réelle, stratégies, ...). 
Rien qu'avec l'étude de l'impact du type de réseau et des distributions initiales vous pouvez avoir des résultats intéressants.


************* SOLUTION *****************
m'intéresser plus, du coup à l'aspect sociologique / décisionnel / statistique du point de vue du stoppeur.

D'un point de vue pratique, je pensais proposer directement au stoppeur un "déplacement possible" 
(dont je n'ai pas encore défini clairement l'implémentation) et qui permet aux l'agents stoppeurs de se rendre d'un point A à un point B en un certains temps 
(pseudo/aléatoire, non dépendant du réseau routier) : c'est alors à l'agent stoppeur de décider d'utiliser ou non ce moyen de transport, 
et à quel moment il souhaite le quitter ce moyen de transport et s'il souhaite l'emprunter.

 définition de votre " graphe abstrait" de transition entre vos noeux 
(a moins que ce ne soit juste un calcul de distance, qui serait équivalent d'un graphe complet... encore plus simple). 
Ceci dit, il ne sera pas si gros, donc avec quelques hypothèses et/ou un peu de travail manuel, 
c'est tout a fait faisable (et comparable a un graphe aléatoire au passage).
