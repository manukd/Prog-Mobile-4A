#  Présentation globale de l'application
Cette application a pour objectif de proposer à l'utilisateur les scores des différents matchs de football en ligue 1. En effet l'application va chercher les données nécessaires grâce à l'API [football data](https://www.football-data.org/), cette dernière me permet de récupérer les noms et donner de chaque équipe présente dans le championnat français.

## Vue Accueil
Sur notre première vue, nous aurons la liste des matchs de la journée considérée comme "actuelle", un icône de couleur présente sur la partie supérieure de chaque case précise si le match est prévu, en cours, terminé, annulé, etc... On aura donc bien entendu accès aux deux équipes qui joueront ce match ainsi que le score en temps réel. On a aussi accès à la date du match en question. Il est possible de cliquer sur chacun des matchs afin d'accéder à la vue détails des matchs.

En cliquant sur le bouton "classement" en haut à gauche de notre application, on accède à la vue classement.

Enfin on pourra utiliser le textfield qui n'est pas éditable, présent sur la partie supérieure de la liste view principale. En cliquant sur ce dernier, un menu picker se déroule afin de donner à l'utilisateur la possibilité de choisir la journée qu'il souhaite observer, il pourra alors faire le choix d'une des 38 journées que propose le championnat français.

## Vue Détails des matchs
Dans la vue détails de match, on peut observer les noms des deux équipes, le score du match en temps réel et lister les joueurs de chacune des deux équipes dans une liste view.

## Vue Classement
Dans la vue Classement, il est possible d'observer le classement actuel de la ligue 1, cette vue va requetter sur l'API [football data standing](www.football-data.org/documentation/api#league-table) qui nous permet de récupérer chaque équipe et statistiques clés pour chaque équipe qui sont décrites à l'aide des colonnes ci-dessous.

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
De nombreuses pistes d'améliorations sont à évoquer, comme par exemple afficher les joueurs qui ont marqué pendant le match ou pouvoir modifier le championnat dans lequel nous souhaitons avoir les résultats, toutefois, ce type d'API est généralement gratuit qu'en partie et ne permet pas de manipuler autant de donnée que nous le souhaitons, en plus de cela j'ai découvert au cours du développement de l'application l'accessibilité à une autre API qui aurait pu me permettre de grandement améliorer mon application, en effet mon souhait de départ était de faire un ratio entre le pourcentage de chance qu'une équipe gagne et la côte du pari sportif, cela aurait permis de mettre en avant les côtes les plus intéressantes en matière de rapport chance/gain. Cependant je n'ai trouvé que trop tard cette API et en plus de cela, elle est extrêmement restrictive.
