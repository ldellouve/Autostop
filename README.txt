************* PROJET GLOBAL ****************

Mod�lisation de diff�rentes strat�gie de stop.

L'objectif �tait d'utiliser http://hitchwiki.org/maps/ qui est une carte creative common o� les autostoppeur indiquent la viabilit� des emplacement de stop, sur le fond de carte de open street map. Les emplacements sont g�olocalis�s, not�s, et parfois une dur�e d'attente est indiqu�e. 

Le but des stoppeurs sera de se rendre d'un ensemble de point A � un ensemble de point B en un minimum de temps (globalement d'une ville � une autre).
Des automobilistes s'arr�teront de temps � autre (suivant la viabilit� de l'emplacement du stoppeur). Ceux-ci se rendent jusqu'� un point pr�cis C, et peuvent d�poser le stoppeur sur un des emplacement de stop en direction de C.

Diff�rentes strat�gies pour les stoppeurs ont �t� imagin�es :
- non renseign� : si la direction int�resse le stoppeur, il accepte et se rend aussi loin que possible sans r�fl�chir.
- renseign� mais prudent : si la direction l'int�resse, que le trajet l'avance beaucoup, et qu'un point de d�pose int�ressant est disponible, alors il accepte.
- hybride : si la direction l'int�resse, il accepte si le trajet l'avance un minimum et si une d�pose pratique semble possible.

Le but est d'estimer quelle strat�gie est la plus viable, suivant diff�rents param�tres variables :
- la distance totale du trajet et sa complexit� (Paris => Nice, longue distance, beaucoup d'emplacements, Paris => Clermont, plus courte distance, moins d'emplacements),
- la dur�e d'attente minimum (le temps de trouver o� l'on est, o� se placer, quel panneau de direction utiliser, qui d�pend de la strat�gie),
- la probabilit� que les voitures s'arr�tent suivant la strat�gie (sans panneau, plus d'arr�ts, mais trajets plus courts, avec panneau de grande distance, moins d'arr�tes mais plus cibl�s),
- potentiellement les erreurs de "navigations" li�s � la mauvaise connaissance du trajet et des emplacements en fonction du temps que l'on prend � r�fl�chir � la strat�gie.

Obtenir des estimations statistiques gr�ce au mod�le suivant les strat�gie pour conna�tre leur viabilit� en terme de s�curit� / dur�e (et suivant les types de trajet).

************* REALISATION *****************
Toutes les fonctionnalit�s qui devaient �tre impl�ment�es ne l'ont pas �t� malheureusement. Il y a 4 esp�ces dont une g�n�rique et une grille.
Des autostoppeurs, symbolis�s en bleu, attendent le passage d'un automobiliste � un point fix� au d�part.
Les automobilistes sont en rouge et se d�placent al�atoirement gr�ce � un r�flexe jusqu'� avoir trouv� une ville.
Les villes sont en noires.
Si un automobiliste rencontre un stoppeur celui le suivra jusqu'� l'arriv�e dans une ville.
Les param�tres initiaux sont r�glables dans la simulation ainsi que la taille de la grille.
