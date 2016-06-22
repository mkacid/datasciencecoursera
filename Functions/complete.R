#For Data_Science__R_Programming__Programming_Project_1

complete <- function(directory, id=1:332){
    # Returns a data frame of the form:
    # id    nobs
    # 1     117
    # 2     1041
    # where 'id' is the monitor ID number and 'nobs' is the number of complete
    # cases
    
    # 'directory' is a character vector of length 1 indicating the location of 
    # the csv files
    
    # 'id' is an integer vector indicating the monitor ID numbers to be used
    
    id_nobs <- data.frame()
    
    for(c_id in id){ #for each id used
        # attaches path and file name with leading zeroes
        file_name <- paste(directory,sprintf("%0.3d.csv", c_id), sep="/")
        
        df <- read.csv(file_name) #read in csv
        c_nobs <- sum(complete.cases(df)) #counts the number of complete cases
        id_nobs <- rbind(id_nobs,c(c_id,c_nobs))
    }
    colnames(id_nobs)<-c("id","nobs")
    return(id_nobs)
}