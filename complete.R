complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
    
    nobslist <- c()
    listid <- c()
    
    filenames <- list.files(directory)
    i <- 1
    
    
    for(i in id){
        namefile <- sprintf("%03.0f",i)
        files <- paste(directory,"/",namefile,".csv",sep="")
        data <- read.csv(files)
        
        if(sum(complete.cases(data))>0){
            nobslist <- append(nobslist, nrow(na.omit(data)))
            listid <- append(listid, i)
        }
    }
    ##print(id)
    return(data.frame(id = listid, nods = nobslist))
    
}