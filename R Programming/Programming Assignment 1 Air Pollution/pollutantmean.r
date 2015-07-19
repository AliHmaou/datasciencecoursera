### Programming Assignment 1 Air Pollution


## PART 1

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  
  ## Utilisation de la library stringr pour retrouver un lpad correct
  library(stringr)
  
  ## Pour chaque fichier csv, on charge dans une data.frame temporaire puis on rbind avec la dataframe finale.
  
  finaldf<-data.frame()
  
  
  for(current_id in id){
    filename <- paste(str_pad(current_id, width=3, side="left", pad="0"), ".csv", sep="")
    tempdf<-read.csv(file = paste(directory,"/", filename, sep=""))
    finaldf<-rbind(finaldf, tempdf)
  }
  
  pollutantVector <- finaldf[c(pollutant)][,1]
  
  mean(pollutantVector, na.rm = "TRUE")
  
}

## directory = "D:/DataScience/Project/datasciencecoursera/R Programming/Programming Assignment 1 Air Pollution/specdata/"
## pollutant = "nitrate"

## result<-pollutantmean(directory, pollutant, id = 1:10)

## result