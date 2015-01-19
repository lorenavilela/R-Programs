
pollutantmean <- function (directory, pollutant, id = 1:332){
    ## 'directory' is a character vector of length 1 indicating the location of the CSV files 
    
    ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant for 
    ## which we will calculate the mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
        
    filenames <- list.files(directory)
    data = NA
    
    for(i in id){
        files <- paste(directory,"/",filenames[i],sep="")
        data <- rbind(data, read.csv(files))        
    }
    
    pollutantlist <- data[pollutant]
    bad <- is.na(pollutantlist)
    
    mean(pollutantlist[!bad])
    
}