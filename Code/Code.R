# Charger les bibliothèques nécessaires
library(ggplot2)
library(FactoMineR)
library(cluster)
library(MASS)


# Extarction des datas
data <- read.csv("Data/Binome3/haberman.data", header = FALSE, sep = ",")
# Nommage des différentes colonnes
colnames(data) <- c("Age du patient", "Annee de l'operation -1900",
                    "Nombre de ganglions axillaires positifs detectes",
                    "Statut de survie")

head(data)
# Vérification du manque de donnée

colSums(is.na(data))
# Vérification du typage des variables
str(data)
# Vérification des valeurs abérrantes
summary(data)

# Analyse univariée
summary(data)
#   Histogramme :
hist(data$Age, main = "Distribution de l'age", xlab = "Age", col = "blue")
hist(data$`Nombre de ganglions axillaires positifs`,
     main = "Distribution des ganglions",
     xlab = "Nombre de ganglions", col = "red")

#   Analyse variable cible :
table(data$`Statut de survie`)
barplot(table(data$`Statut de survie`),
        main = "Repartition du statut de survie", col = c("green", "red"))


# Analyse bivariée
#install.packages("ggplot2", repos = "https://cloud.r-project.org/")


ggplot(data, aes(x = `Age du patient`, fill = as.factor(`Statut de survie`))) +
  geom_histogram(binwidth = 5, position = "stack", alpha = 0.7) +
  labs(title = "Distribution de l'age des patients selon la survie",
       x = "Age du patient", y = "Nombre de patients",
       fill = "Statut de survie") +
  scale_fill_manual(values = c("green", "red"),
                    labels = c("Survie >= 5 ans", "Deces < 5 ans")) +
  theme_minimal()


data$Ganglions_group <- cut(data$`Nombre de ganglions axillaires positifs`,
                            breaks = c(-1, 0, 1, 5, 10, 20, 50, Inf),
                            labels = c("0", "1", "2-5", "6-10", "11-20",
                                       "21-50", ">50"))
ggplot(data, aes(x = Ganglions_group, fill = as.factor(`Statut de survie`))) +
  geom_bar(position = "fill") +
  labs(title = "Proportion de survie selon le nombre de ganglions",
       x = "Nombre de ganglions", y = "Proportion",
       fill = "Statut de survie") +
  scale_fill_manual(values = c("green", "red"),
                    labels = c("Survie > 5 ans", "Deces < 5 ans")) +
  theme_minimal()


data$Survival <- as.factor(data$`Statut de survie`)
# Transformer la variable en facteur


# Classification hiérarchique

# Préparation des données (exclure la variable de survie)
data_clustering <- data[, c("Age du patient", "Annee de l'operation -1900",
                            "Nombre de ganglions axillaires positifs detectes")]

# Standardisation des données
data_clustering_scaled <- scale(data_clustering)

# Calcul de la matrice de distances
distance <- dist(data_clustering_scaled, method = "euclidean")

# Clustering hiérarchique avec la méthode de Ward
hc <- hclust(distance, method = "ward.D2")

# Affichage du dendrogramme
plot(hc, labels = FALSE, hang = -1, main = "Dendrogramme - Classification hierarchique")
rect.hclust(hc, k = 3, border = "red")  # Découper en 3 groupes, ajustable