library(readxl) # Import des fichiers Excel
install.packages("tidyverse")
library(tidyverse)

#imports des données
file.exists('~/R/projects/BigDataProject/data/excel/savedrecs.xlsx')
wofs <- read_xlsx("~/R/projects/BigDataProject/data/excel/savedrecs.xlsx",sheet = "Feuil1")
authorsNames <- wofs["Author Full Names"]
#head(wofs)
colnames(authorsNames)[1] <- "Authors"
#supress comas
#authorsNames <- authorsNames %>%   separate (Authors, c("Source", "Target"))

i <- 0

while (i<nrow(authorsNames)) {
 print(authorsNames[i, ])
  row <- authorsNames[i, ]
  #split ';' create a table and multiple row by authors
  i <- i + 1
} # fin tant que



colnames(authorsNames)[1] <- "Source"
colnames(authorsNames)[2] <- "Target"

#export
write.csv (authorsNames, file = "export/my_data.csv", row.names=FALSE)
