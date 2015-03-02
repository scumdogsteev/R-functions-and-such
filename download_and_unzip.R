## two functions that download and/or unzip a file from the Internet when
## given a local directory (default name is "data"), a url, and an expected
## local file name

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
        ## if the directory exists and/or if the zip file is downloaded/unzipped
        ## or a previously downloaded version of the zip file is unzipped,
        ## proceed with execution of the script
    }
}
