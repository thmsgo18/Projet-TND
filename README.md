# Analyse de données de survie - Haberman's Survival Dataset

## Description du projet

Ce projet réalise une analyse statistique approfondie du jeu de données Haberman's Survival, qui contient des informations sur la survie de patients ayant subi une chirurgie pour un cancer du sein entre 1958 et 1970 à l'hôpital Billings de l'Université de Chicago.

## Objectifs

L'objectif principal est d'analyser les facteurs influençant la survie des patients à 5 ans après l'opération, en utilisant des techniques d'analyse de données et de classification.

## Contenu du dataset

Le jeu de données comprend **306 observations** avec les variables suivantes :

- **Age du patient** : Âge au moment de l'opération
- **Année de l'opération** : Année - 1900
- **Nombre de ganglions axillaires positifs détectés** : Indicateur de la propagation du cancer
- **Statut de survie** : 
  - 1 = survie de 5 ans ou plus
  - 2 = décès avant 5 ans

## Analyses réalisées

### 1. Prétraitement des données
- Chargement et structuration du dataset
- Vérification des valeurs manquantes
- Contrôle du typage des variables
- Détection des valeurs aberrantes

### 2. Analyse univariée
- Distribution de l'âge des patients
- Distribution du nombre de ganglions détectés
- Répartition du statut de survie

### 3. Analyse bivariée
- Relation entre l'âge et la survie
- Impact du nombre de ganglions sur le taux de survie
- Visualisations avec ggplot2

### 4. Classification hiérarchique
- Standardisation des variables
- Calcul de la matrice de distances euclidiennes
- Clustering avec la méthode de Ward
- Visualisation sous forme de dendrogramme

## Technologies utilisées

- **Langage** : R
- **Bibliothèques** :
  - `ggplot2` : Visualisations avancées
  - `FactoMineR` : Analyse multivariée
  - `cluster` : Méthodes de clustering
  - `MASS` : Fonctions statistiques

## Structure du projet

```
Projet-TND/
├── Code/
│   └── Code.R           # Script principal d'analyse
├── Data/
│   └── Binome3/
│       ├── haberman.data      # Données brutes
│       └── haberman.names     # Description du dataset
└── README.md
```

## Utilisation

1. S'assurer que R est installé sur votre machine
2. Installer les packages nécessaires :
   ```r
   install.packages(c("ggplot2", "FactoMineR", "cluster", "MASS"))
   ```
3. Exécuter le script principal :
   ```r
   source("Code/Code.R")
   ```

## Résultats attendus

L'analyse permet de :
- Identifier les groupes de patients à risque
- Comprendre l'influence du nombre de ganglions sur la survie
- Visualiser les patterns dans les données
- Proposer une classification des patients

## Auteurs

Binôme 3 - Projet TND (Traitement Numérique des Données)  
Licence 3 - Semestre 2

## Source des données

Haberman, S. J. (1976). Generalized Residuals for Log-Linear Models.  
Dataset disponible via l'UCI Machine Learning Repository.