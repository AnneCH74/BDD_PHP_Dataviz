# Memo BDD_PHP_Dataviz

## Données et visualisation de Données

### Itération 1 : phase de conception
Méthode Merise (MEthode d'étude et de Réalisation Informatique pour les Systèmes d'Entreprises) (MEthodes pour Rassembler les Idées Sans Effort)

**Quelques définitions pour commencer :**

**MCD** : Modèle Conceptuel de Données

**MRLD** : Modèle Relationnel Logique de Données

**MLD** : Modèle Logique de Données. Le MLD est une étape de la méthodologie Merise. C’est une des dernières étapes proposée et elle permet d’implémenter la base de données en transcrivant le MCD/MPD en instructions SQL adaptées au SGBDR prévu. Concrètement, le MLD permet de connaître le nombre de tables ainsi que leurs contraintes (liaisons entre tables) à mettre en œuvre dans une base de données relationnelle.

**Logiciel Système** : ensemble de programmes informatiques et de bibliothèques logicielles qui fournit un environnement permettant de créer et d'exécuter des logiciels applicatifs.

**Logiciel applicatif** : programme (ou un ensemble logiciel) directement utilisé pour réaliser une tâche (ex. : éditeur de texte, navigateur web, lecteur multimédia, etc.).

**Entité** : c'est la représentation d'un élément matériel ou immatériel ayant un rôle dans le système que l'on désire écrire. 

&nbsp;

#### De manière générale :


*- Qu'est-ce-qu'un SGBD ? [DBMS DataBase Management System]*

  Un Système de Gestion de Base de Données est un logiciel système servant à stocker, à manipuler ou gérer, et à partager des données dans une base de données, en garantissant la qualité, la pérennité et la confidentialité des informations, tout en cachant la complexité des opérations.

*- Qu'est-ce-qu'un système d'information (SI) ? [information system]*

  C'est un ensemble de ressources et de dispositifs permettant de collecter, stocker, traiter et diffuser les informations nécessaires au fonctionnement d'une organisation (administration, entreprise, etc.). Il peut s'agir d'informations fiscales, financières, comptables, etc.
  Le SI ne doit pas être confondu avec le système d'informatique. Le système informatique est un sous-ensemble du système d'information (ordinateurs, programmes, etc.).

*- Qu'est-ce-qu'une base de données ? [database]*

  Une BDD est un ensemble d'informations qui est organisé de manière à être facilement accessible, géré et mis à jour. C'est un "conteneur" stockant des données. Elle est utilisée par les organisations comme méthode de stockage, de gestion et de récupération de l'information.
  Les données sont organisées en lignes, colonnes et tableaux et sont indexées pour faciliter la recherche d'informations.

*- Citez les différences entre ces éléments :*

  La BDD contient les informations, le SGBD stocke les informations de la BDD et le SI permet au SGBD de fonctionner et d'être utilisé.
  La BDD correspond aux ingrédients d'une recette de cuisine, le SGBD correspond à la recette


#### Pour un MCD (Modèle Conceptuel de Données):


*- Qu'est-ce-qu'un MCD et pourquoi cela existe ? [CIM Common Information Model]*

Le modèle conceptuel des données (MCD) a pour but d'écrire de façon formelle, sous forme d'un diagramme, les données qui seront utilisées par le système d'information. Il s'agit donc d'une représentation des données, facilement compréhensible, permettant de décrire le système d'information à l'aide d'entités.


*- Comment représenter une entité ? [entity]*

Les classes d'entité (ensemble composé d'entités de même type) sont représentées par un rectangle. Ce rectangle est séparé en deux champs :
    1) Le champ du haut contient le libellé.
    2) Le champ du bas contient la liste des propriétés de la classe d'entité

*- Comment représenter une liaison entre des entités ?*

Une relation (appelée aussi parfois association) représente les liens sémantiques qui peuvent exister entre plusieurs entités.
Les classes de relations sont représentées par des hexagones (parfois des ellipses) dont l'intitulé décrit le type de relation qui relie les classes d'entité (généralement un verbe). On définit pour chaque classe de relation un identificateur de la forme Ri permettant de designer de façon unique la classe de rlation à laquelle il est associé.

*- Où mettre les données qui composent nos entités ?*

Il faut les mettre dans un rectangle.

*- Quels sont les différents types de cardinalité possibles ? Où les placer dans notre schéma ?*

Les cardinalités permettent de caractériser le lien qui existe entre une entité et la relation à laquelle elle est reliée. La cardinalité d'une relation est composée d'un couple comportant une borne maximale et une borne minimale, intervalle dans lequel la cardinalité d'une entité peut prendre sa valeur : 
 * La borne minimale (généralement 0 ou 1) décrit le nombre minimum de fois qu'une entité peut participer à une relation
 * La borne maximale (généralement 1 ou n) décrit le nombre maximum de fois qu'une entité peut participer à une relation
   
Une cardinalité 1.N signifie que chaque entité appartenant à une classe d'entité participe au moins une fois à la relation.
   Une cardinalité 0.N signifie que chaque entité appartenant à une classe d'entité ne participe pas forcément à la relation. 

*-Citer quelques bonnes pratiques de normalisation*

Une modélisation correcte doit avoir éliminé toutes les redondances possibles de données en constituant des nouvelles entités chaque fois que nécessaire, comme nous l'avons fait dès le départ en regroupant les genres musicaux dans une entité séparée.

Une relation est normalisée en première forme normale si :
    * Elle possède une clé identifiant de manière unique et stable chaque ligne
    * Chaque attribut n'a qu'une seule valeur
    * Aucun attribut n'est décomposable en plusieurs attributs significatifs

&nbsp;
#### Pour un MLD (Modèle Logique de Données):


*- Comment passer d'un MCD au MLD ? Que deviennent les associations ?*

La transcription d'un MCD en modèle logique des données ou encore appelé schéma relationnel s'effectue selon quelques règles simples qui consistent d'abord à transformer toute entité en table, avec l'identifiant comme clé primaire, puis à observer les valeurs prises par les cardinalités maximum de chaque association pour représenter celle-ci soit (ex : card. max 1 [1-1 ou 0-1]) par l'ajout d'une clé étrangère dans une table existante, soit (ex : card. max n [0-N ou 1-N]) par la création d'une nouvelle table dont la clé primaire est obtenue par concaténation de clés étrangères correspondant aux entités liées.

La transcription du MCD en MLD doit également être précédée d'une étape de synchronisation et de validation des modèles de données (MCD) et de traitement (MCT et MLT), au moyen de vues. Cela afin d'y introduire les informations d'organisation définies au MLT, d'éliminer les propriétés conceptuelles non utilisées dans les traitements ou redondantes et enfin de vérifier que les données utilisées pour un traitement sont bien atteignables par 'navigation' entre les entités/relations du MCD.

Concernant les associations :
* Une entité du MCD devient une relation, c'est à dire une table
* Son identifiant devient la clé primaire de la relation
* Les autres propriétés deviennent les attributs de la relation


* Une association de type "1:N" se traduit par la création d'une clé étrangère dans la relation correspondante à l'entité côté "1". Cette clé étrangère référence la clé primaire de la relation correspondant à l'autre entité.
* Une association de type N :N (c’est à dire qui a les cardinalités maximales positionnées à « N » des 2 côtés de l’association) se traduit par la
  création d’une table dont la clé primaire est composée des clés étrangères référençant les relations correspondant aux entités liées par
  l’association.
  Les éventuelles propriétés de l’association deviennent des attributs de la relation.



### Itération 2 : phase d'intégration SQL

#### Initiation au SQL

**Quelques définitions pour commencer :**

**SQL** : Structured Query Language. Il permet d'interroger une base de données relationnelle.

**Base de données relationnelles** : information organisée dans des tableaux à deux dimensions appelés des relations ou des tables





- Comment créer une base de données ?
En utilisant la commande CREATE TABLE + nom de la table

- Comment faire un commentaire ?
Deux possibilités :

Soit -- + le commentaire

Soit /* + entrée + le commentaire + entrée + */ + entrée


- Comment créer une table et des colonnes ?

En utilisant CREATE TABLE + nom de la table ( nom et paramètres des colonnes)

Exemple : création d'une table avec 4 colonnes ("title" + "content" + "category" + "createdAt")

CREATE TABLE posts (title VARCHAR(150), content TEXT, category VARCHAR(50), createdAt DATETIME);


- Listez les types de données que vous utiliserez le plus souvent.
VARCHAR, DATATIME, INT , BOOLEAN, FLOAT, TEXT


- Listez des contraintes utiles pour vos colonnes :

Garantir qu'aucune valeur en double ne soit saisi dans des colonnes spécifiques.
Nombre de caractères lorsque c'est possible de les paramétrer (par exemple avec VARCHAR)

- comment préciser qu'une valeur est obligatoire pour une colonne ?

En utilisant NOT NULL

- comment définir l'id d'une table ?
En lui attribuant le paramère PRIMARY KEY. 
Par exemple : 
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
 

- Comment préciser que la valeur d'une colonne doit être unique ?(pour une adresse email par
  exemple)

Avec l'option UNIQUE (ce champ ne peut pas avoir la même valeur en double).

- Comment insérer des données dans une table ?

En insérant un fichier .sql contenant les instructions adéquates

- Comment récupérer les données insérées ?

En les important

- Comment ne sélectionner qu'un certain nombre de résultats ?

Avec la clause LIMIT via une requête SQL.

- Comment trier les résultats ?

Il est possible en SQL d'organiser les résultats grâce à la clause ORDER BY. La clause ORDER BY est suivie des mots clés ASC ou DESC, qui précisent respectivement si le tri se fait de manière croissante (par défaut) ou décroissante


- Comment filtrer les données et chaîner les conditions de filtres ?

Pour filtrer il faut utiliser la fonction FILTER
Pour chaîner les conditions il faut les concaténer grâce à la fonction CONCAT()


- Comment filtrer une colonne avec une valeur commençant par un certain caractère ?

Avec l'opérateur LIKE =>
SELECT *
FROM table
WHERE colonne LIKE modele



- A quoi servent les INDEX ? Comment en créer ?

L'index est utile pour accélérer l'exécution d'une requête SQL qui lit des données et ainsi améliorer les performances d'une application utilisant une base de données

On peut créer un index avec la commande CREATE INDEX =>
CREATE INDEX `index_nom` ON `table`;


- Comment créer une relation entre 2 tables ?

la commande LEFT JOIN , est un type de jointure commune pour lier plusieurs tables entre-elles dans une même requête. Cette commande retourne tous les enregistrements de la table première table, celle de gauche (left), avec la correspondance dans la deuxième table si la condition est respectée


- Comment sélectionner les données de plusieurs tables ?
Au moyen de jointures qui mettent en relation deux (ou plus) tables afin de rechercher la réponse à des interrogations. Une jointure permet donc de combiner les colonnes de plusieurs tables.

Jointure interne =>
SELECT ...
FROM   <table gauche>
[INNER]JOIN <table droite>
ON <condition de jointure>

Jointure externe =>
SELECT ...
FROM   <table gauche>
LEFT | RIGHT | FULL OUTER JOIN <table droite>
ON condition de jointure


- Comment ne sélectionner que certaines colonnes et les renommer dans la liste de résultats ?

Pour ne sélectionner que certaines colonnes et les renommer dans la liste de résultats en SQL, vous pouvez utiliser la clause SELECT. Voici un résumé des étapes pour accomplir cela :
Écrivez votre requête SELECT : Commencez par écrire la requête SELECT pour sélectionner les données souhaitées dans une table.

Liste des colonnes : Spécifiez les colonnes que vous souhaitez sélectionner en les énumérant après le mot-clé SELECT. Vous pouvez utiliser le symbole "*" pour sélectionner toutes les colonnes ou spécifier les noms des colonnes individuellement.
Renommez les colonnes : Pour renommer une colonne dans la liste de résultats, utilisez le mot-clé AS suivi du nouveau nom que vous souhaitez donner à la colonne. Par exemple, SELECT nom AS nom_complet renommera la colonne "nom" en "nom_complet" dans la liste de résultats.

Exécutez la requête : Exécutez la requête SELECT avec les colonnes sélectionnées et renommées pour obtenir les résultats souhaités.
En utilisant la clause SELECT et l'option AS, vous pouvez spécifier les colonnes que vous souhaitez sélectionner et leur attribuer des noms alternatifs dans la liste de résultats. Cela vous permet de personnaliser la présentation des données renvoyées par votre requête.

- Comment supprimer une table et une base de données ?

DROP TABLE nomDeLaTable 