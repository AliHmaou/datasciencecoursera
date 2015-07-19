# Write a function that takes a directory of data files and a threshold 
# for complete cases and calculates the correlation between sulfate and nitrate 
# for monitor locations where the number of completely observed cases (on all variables) 
# is greater than the threshold. 
# The function should return a vector of correlations for the monitors that meet the threshold requirement. 
# If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 
# A prototype of this function follows
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  
  ## Utilisation de la library stringr pour retrouver un lpad correct
  library(stringr)
  
  ## Vector final où seront stockés les résultats de la fonction corr appliqué à chaque jeu de données correct
  finalvector<-vector()

  ## Pour chaque capteur
  for(current_id in 1:332){
    
    ## On crée le nom de fichier en s'appuyant sur str_pad (1->001.csv)
    filename <- paste(str_pad(current_id, width=3, side="left", pad="0"), ".csv", sep="")
    
    ## DEBUG
    #print(filename)
    
    ## On charge le fichier en cours dans une dataframe temporaire
    tempdf<-read.csv(file = paste(directory,"/", filename, sep=""))
    
    ## DEBUG
    #print(str(tempdf))
    
    ## On calcule le nommbre de cas complets via complete.cases
    ## Le fichier 275 n'a aucun cas complet dans ce cas on affecte 0
    ## Ici il faut optimiser car pour chaque fichier on recalcule 2 fois
    if(is.na(table(complete.cases(tempdf))["TRUE"])){
      nbComplete<-0
    }else {
      nbComplete<-table(complete.cases(tempdf))["TRUE"]
    }
    
    ##DEBUG
    #print(nbComplete)
    
    ## Si le dataset est correct le nombre de complete.Cases est supérieur au seuil 
    if(nbComplete>threshold){
      
      ## On sélectionne les lignes complète du fichier en cours
      completeTempDf <- tempdf[complete.cases(tempdf),]
      
      ##DEBUG
      #print(str(completeTempDf))
      
      ## On utilise la fonction corr sur les colonnes sulfate et nitrate et on ajoute le résultat au vecteur final
      finalvector<-c(finalvector, cor(completeTempDf$sulfate, completeTempDf$nitrate))
    }
    
    ## On passe au fichier suivant
    
  }
  
  ## On output le vecteur final
  finalvector

}
# For this function you will need to use the 'cor' function in R which calculates the correlation between two vectors.
# Please read the help page for this function via '?cor' and make sure that you know how to use it.
# You can see some example output from this function. 
# The function that you write should be able to match this output. 
# Please save your code to a file named corr.R. To run the submit script for this part, 
# make sure your working directory has the file corr.R in it.


directory = "D:/DataScience/Project/datasciencecoursera/R Programming/Programming Assignment 1 Air Pollution/specdata/"

result<- corr(directory,400)

head(result)

str(result)