## Part 2
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
        
        all_files <- as.character(list.files(directory))
        datapath <- paste(directory, all_files, sep="/")
        
        id_length <- length(id)
        complete_cases <- rep(0, id_length)
        j <- 1
        
        for (i in id) {
                
                #check if data variable mondata exists or if this is the first time using it
                
                mondata <- read.table(datapath[i], header=TRUE, sep=",")
                complete_cases[j] <- sum(complete.cases(mondata))
                j <- j + 1
        }
        
        result <- data.frame(id = id, nobs = complete_cases)
        return(result) 
}