************* PROJET GLOBAL ****************

Mod�lisation de diff�rentes strat�gie de stop.

Utiliser http://hitchwiki.org/maps/ qui est une carte creative common o� les stopper indiquent la viabilit� des emplacement de stop, sur le fond de carte open street map. Les emplacements sont g�olocalis�s, not�s, et parfois une dur�e d'attente est indiqu�e. 

Le but des stoppeurs sera de se rendre d'un ensemble de point A � un ensemble de point B en un minimum de temps (globalement d'une ville � une autre).
Des automobilistes s�arr�teront de temps � autre (suivant la viabilit� de l'emplacement du stoppeur). Ceux-ci se rendent jusqu'� un point pr�cis C, et peuvent d�poser le stoppeur sur un des emplacement de stop en direction de C.

J'ai d�j� pens� � diff�rentes strat�gies pour les stoppeurs :
- non renseign� : si la direction l�int�resse, il accepte et se rend aussi loin que possible sans r�fl�chir.
- renseign� prudent : si la direction l'int�resse, que le trajet l'avance beaucoup, et qu'un point de d�pose int�ressant est disponible, alors il accepte.
- hybride : si la direction l'int�resse, il accepte si le trajet l'avance un minimum et si une d�pose pratique semble possible.

Le but est d'estimer quelle strat�gie est la plus viable, suivant diff�rents param�tres que j'ai pens� faire varier :
- la distance totale du trajet et sa complexit� (Paris => Nice, longue distance, beaucoup d'emplacements, Paris => Clermont, plus courte distance, moins d'emplacements),
- la dur�e d'attente minimum d'attente (le temps de trouver o� l'on est, o� se placer, quel panneau de direction utiliser, qui d�pend de la strat�gie),
- la probabilit� que les voitures s'arr�tent suivant la strat�gie (sans panneau, plus d�arr�ts, mais trajets plus courts, avec panneau de grande distance, moins d'arr�tes mais plus cibl�s),
- potentiellement les erreurs de "navigations" li�s � la mauvaise connaissance du trajet et des emplacements en fonction du temps que l'on prend � r�fl�chir � la strat�gie.

Obtenir des estimations statistiques gr�ce au mod�le suivant les strat�gie pour conna�tre leur viabilit� en terme de s�curit� / dur�e (et suivant les types de trajet?)


************** DIFFICULTE ****************
- une difficult� potentielle est de r�cup�rer le r�seau autoroutier Francais au formet OSM ou directement Shapefile 
(utilisable par Gama), la zone �tant tr�s �tendue (si c'est trop dur a trouver il doit etre possible de restreindre l'�tendue).

- En faisant varier la distribution des autostopeurs/destinations, on peut voir des ph�nom�nes interessant �merger du type: "la meilleur strat�gie individuelle n'est pas la meilleur pour le reseau" car les auto-stoppeurs peuvent avoir interet a faire des d�tours si ca permet d'arriver plus vite alors que collectivement cela encombre les voitures inutilement. Il faut donc penser a observer aussi le bien-etre social.

- Commencez par un mod�le simple (autostopeur al�atoire, r�seau al�atoire, destination al�atoire), 
faites le marcher pour ensuite le complexifier (carte r�elle, strat�gies, ...). 
Rien qu'avec l'�tude de l'impact du type de r�seau et des distributions initiales vous pouvez avoir des r�sultats int�ressants.


************* SOLUTION *****************
m'int�resser plus, du coup � l'aspect sociologique / d�cisionnel / statistique du point de vue du stoppeur.

D'un point de vue pratique, je pensais proposer directement au stoppeur un "d�placement possible" 
(dont je n'ai pas encore d�fini clairement l'impl�mentation) et qui permet aux l'agents stoppeurs de se rendre d'un point A � un point B en un certains temps 
(pseudo/al�atoire, non d�pendant du r�seau routier) : c'est alors � l'agent stoppeur de d�cider d'utiliser ou non ce moyen de transport, 
et � quel moment il souhaite le quitter ce moyen de transport et s'il souhaite l'emprunter.

 d�finition de votre " graphe abstrait" de transition entre vos noeux 
(a moins que ce ne soit juste un calcul de distance, qui serait �quivalent d'un graphe complet... encore plus simple). 
Ceci dit, il ne sera pas si gros, donc avec quelques hypoth�ses et/ou un peu de travail manuel, 
c'est tout a fait faisable (et comparable a un graphe al�atoire au passage).
