#For Data_Science__R_Programming__Programming_Project_1

corr <- function(directory, threshold=0){
    # Returns a numeric vector of correlations
    
    # 'directory' is a character vector of length 1 indicating the location of 
    # the csv files
    
    # 'threshold' is a numeric vector of length 1 indicatind the number of
    # completely observed observations (on all variables) required to compute 
    # the correlation between nitrate and sulfate. (Default is 0)
    
    complete_cases <- complete(directory) #gets number of complete cases
    # makes list of cases that are above the threshold
    threshold_cases <- complete_cases[complete_cases$nobs > threshold,]
    correlation <- numeric()
    
    for(c_id in threshold_cases$id){ #for each id above threshold
        # attaches path and file name with leading zeroes
        file_name <- paste(directory,sprintf("%0.3d.csv", c_id), sep="/")
        df <- read.csv(file_name) #read in csv
        
        # calculates the correlation between sufate and nitrate for c_id
        c_correlation <- cor(df$sulfate, df$nitrate, use="complete.obs")
        # adds the current correlation data to the data frame of correlations
        correlation <- c(correlation,c_correlation)
    }
    return(correlation) #returns the correlation values
}