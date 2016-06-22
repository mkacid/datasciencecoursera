#For Data_Science__R_Programming__Programming_Project_1

pollutantmean <- function(directory, pollutant, id=1:332){
    # Returns the mean of the pollutant across all monitors listed in the 'id'
    # vector (ignoring NA values). Does not round.
    
    # 'directory' is a character vector of length 1 indicating the location of 
    # the csv files
    
    # 'pollutant' is a character vector of length 1 indicating the name of the 
    # pollutant for which the mean is calculated. ("sulfate" or "nitrate")

    # 'id' is an integer vector indicating the monitor ID numbers to be used
    
    pollutant_val <- NULL #creates variable to hold pollutant values
    
    for(c_id in id){ #for each id used
        # attaches path and file name with leading zeroes
        file_name <- paste(directory,sprintf("%0.3d.csv", c_id), sep="/")
        
        df <- read.csv(file_name) #read in csv
        c_pollutant <- df[pollutant] #gets only relevant data
        c_nas <- is.na(c_pollutant) #makes a list of NA data
        
        # adds the non-NA data to the data to be analyzed
        pollutant_val <- c(pollutant_val, c_pollutant[!c_nas])
    }
    
    return(mean(pollutant_val)) #returns the mean value
}