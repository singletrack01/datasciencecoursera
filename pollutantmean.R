## Part 1

pollutantmean <- function (directory, pollutant, id=1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        
        ## Get all the files in the variable "directory" and assign to a vector.  Create the path to each file
        all_files <- as.character(list.files(directory))
        datapath <- paste(directory, all_files, sep="/")
        
        for (i in id) {
                
                #check if data variable mondata exists or if this is the first time using it
                
                if (!exists("mondata")){
                        mondata <- read.table(datapath[i], header=TRUE, sep=",")
                }
                if (exists("mondata")) {
                        temp_data <- read.table(datapath[i], header=TRUE, sep=",")
                        mondata <- rbind(mondata, temp_data)
                        rm(temp_data)
                }
        }
        
        # get the mean for the pollutant within the dataframe, exclude NA's
        poll_mean <- mean(mondata[[pollutant]], na.rm=TRUE)
        return(round(poll_mean, 3)) 
}