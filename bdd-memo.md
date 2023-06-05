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