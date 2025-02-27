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

