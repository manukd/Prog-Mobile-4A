#  Présentation globale de l'application
Cette application à pour objectif de proposer à l'utilisateur les scores des différentes matchs de football en ligue 1. En effet l'application va chercher les données nécessaires grâce à l'API [football data](https://www.football-data.org/), cette dernière me permet de récupérer les noms et donnés de chaque équipe présente dans le championnat français.

## Vue Accueil
Sur notre première vue, nous aurrons la liste des matchs de la journée considérée comme "actuelle", un iconne de couleur présent sur la partie supérieur de chaque case précise si je match est prévu, en cours, terminé, annulé, etc... On aura donc bien entendu accès au deux équipes qui joueront ce match ainsi que le score en temps réel. On a aussi accès à la date du match en question. Il est possible de cliquer sur chacun des matchs afin d'accèder à la vue détails des matchs.
En cliquant sur le boutton "classement" en haut à gauche de notre application, on accède à la vue classement.
Enfin on pourra utiliser le textfield qui n'est pas éditable, présent sur la partie suppérieure de la liste view princiaple. En cliquant sur ce dernier, un menu picker se déroule afin de donner à l'utilisateur la possibilité de choisir la journée qu'il souhaite obserser, il pourra alors faire le choix d'une des 38 journées que propose la championnat Français.

## Vue Détails des matchs
Dans la vue détails de match, on peut observer le nom des deux équipes, le score du match en temsp réel et lister les joueurs de chacune des deux équipes dans une liste view.

## Vue Classement
Dans la vue Classement, il est possible d'observer le classement actuel de la ligue 1, chaque colonne à son rôle comme décrit ci-dessous.

- Place au classement
- Nom de l'équipe
- Point de l'équipe
- Match joué
- Match gagné
- Match nul
- Match perdu
- But marqué
- But encaissé
- Différence de but

## Pistes d'améliorations
De nombreuses pistes d'améliorations sont a évoquer, comme par exemple afficher les joueurs qui ont marqué pendant le match ou pouvoir modifier le championnat dans lequel nous souhaitons avoir les résultats, toutefois, ce type d'API est généralement gratuit qu'en partie et ne permet pas de manipuler autant de donnée que nous le souhatons, en plus de cela j'ai découvert au cours du developpement de l'application l'accèssibilité à une autre API qui aurait pu me permettre de grandement améliorer mon application, en effet mon souhait de départ était de faire un ratio entre le pourcentage de chance qu'une équipe gagne et la côte du paris sportif, cela aurait permis de mettre en avant les côtes les plus interessante en terme de rapport chance/gain. Cependant je n'ai trouvé que trop tard cette API et en plus de cela, elle est extremement restrictive.
