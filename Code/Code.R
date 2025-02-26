data <- read.csv("Data/Binome3/haberman.data", header = FALSE, sep = ",")
colnames(data) <- c("Age du patient", "Annee de l'operation -1900",
                    "Nombre de ganglions axillaires positifs detectes",
                    "Statut de survie")

str(data)
summary(data)
head(data)
colSums(is.na(data))
boxplot(data, main = "Détection des valeurs aberrantes")