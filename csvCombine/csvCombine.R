## csvCombine.R
## by Steve Myles
## http://steve.mylesandmyles.info/
## 2 March 2015 (updated 4 June 2015)
##
## "csvCombine" creates a data frame from a user-specified directory's (csv) 
## files. the user can specify how many files to combine (default is all in 
## "directory").
##
## to do:  1) extend to other file types
##         2) error-checking to exclude files of the wrong type
##
## documentation:  https://github.com/scumdogsteev/R-functions-and-such/blob/master/csvCombine/README.md

csvCombine <- function(directory, id = NULL) {
    ## create a list of files in "directory"
    files_list <- list.files(directory, full.names=TRUE)
    ## create an empty data frame
    data <- data.frame()                             
    ## if "id" is null (default behavior), reset id to the length of the
    ## "files_list" vector (i.e., the number of files in "directory")
    if (is.null(id)) { id <- length(files_list) } 
    ## loop through the files, rbinding them together 
    for (i in id) {
        data <- rbind(data, read.csv(files_list[i]))
    }
}
