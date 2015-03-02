## download_and_unzip.R
## by Steve Myles
## 2 March 2015
##
## two related functions that download and/or unzip a file from the Internet 
## when given a local directory (default name is "data"), a url, and an 
## expected local file name.
##
## "downLoad" checks whether the file exists locally and downloads it if not.
## "downloadUnzip" checks whether the zip file exists locally.  if so, it
## unzips it.  if not, it downloads it and unzips.
##
## to do:  1) add error checking including what to do if the user is offline
##         2) add option of changing url from "https" to "http"

downLoad <- function(dir = "data", url, file) {
    ## check if the expected directory exists in the working directory.
    dir <- paste("./", dir, sep = "")
    if (!file.exists(dir)) {
        ## if not, check whether the expected file exists in the working 
        ## directory
        if (!file.exists(file)) {
            ## if not, try to download it -- need to remove 'method = "curl"'
            ## if using in Windows
            download.file(url, file, method = "curl", mode="wb")
        }
    }
    ## if the directory exists and/or if the file is downloaded,
}

downloadUnzip <- function(dir = "data", url, file) {
    ## check if the expected directory exists in the working directory.
    dir <- paste("./", dir, sep = "")
    if (!file.exists(dir)) {
        ## if not, check whether the expected zip file ("file") exists 
        ## in the working directory
        if (!file.exists(file)) {
            ## if not, try to download it -- need to remove 'method = "curl"'
            ## if using in Windows
            download.file(url = url, destfile = file, method = "curl", 
                          mode="wb")
        }
        ## unzip the file if the directory doesn't already exist
        unzip(file)     
    }
    ## if the directory exists and/or if the zip file is downloaded/unzipped
    ## or a previously downloaded version of the zip file is unzipped,
    ## proceed with execution of the script
}
