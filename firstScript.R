library(readxl) # Import des fichiers Excel
install.packages("tidyverse")
install.packages("tidyr")
library(tidyr)

#imports des données
file.exists('~/R/projects/BigDataProject/data/excel/csv-neurotrans-set.csv')
pubmed <- read.csv(file = '~/R/projects/BigDataProject/data/excel/csv-neurotrans-set.csv')


i <- 3
row <- pubmed[i, ]
authors<- row["Authors"]
authors
#res<-unlist(strsplit(toString(authors$Authors), split=","))
#length(res)



#create a data frame for output
output <- data.frame("hi","bye")
names(output)<-c("Source","Target")
output

i <- 1
while (i<nrow(pubmed) && nrow(output) < 10000) {
  #get Authors splited 
  row <- pubmed[i, ]
  authors<- row["Authors"]
  res<-unlist(strsplit(toString(authors$Authors), split=","))
  
  #adding relations 
  j <- 1
  if(length(res) == 2){
    #rbind(output, list(res[j][1], res[j+1][1]))
    #create a dataFrame
    relationAuthor<-data.frame(res[j][1],res[j+1][1])
    names(relationAuthor)<-c("Source","Target")
    output <- rbind(output, relationAuthor)
  }
  if(length(res) > 2){
    while ((j+1)<length(res)){
      k<-j+1
      while(k<=length(res)){
        relationAuthor<-data.frame(res[j][1],res[k][1])
        names(relationAuthor)<-c("Source","Target")
        output <- rbind(output, relationAuthor)
        k<-k+1
      }
      j<- j + 1
    }
  }
  
 
  
  i <- i + 1
  #output
} 



#colnames(authorsNames)[1] <- "Source"
#colnames(authorsNames)[2] <- "Target"

#export
write.csv (output, file = "export/my_data.csv", row.names=FALSE)
