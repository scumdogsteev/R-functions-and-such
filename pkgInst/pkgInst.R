## pkgInst.R
## by Steve Myles
## http://steve.mylesandmyles.info/
## 2 March 2015 (updated 4 June 2015)
## documentation:  https://github.com/scumdogsteev/R-functions-and-such/tree/master/pkgInst/
##
## "pkgInst" is a function that checks whether a set of packages are 
## installed and, if not, it installs them and loads them into 
## memory.  x is a set of packages.
## 
## this function is called as follows:
## pkgInst(c("pkg1", "pkg2", "pkg3", ..., "pkgN"))
## where pkg1 through pkgN are the names of the required packages.
##
## almost completely based on this response from Stack Overflow:
## http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them/19870272#19870272

pkgInst <- function(x) {
    for (i in x) {
        ## "require" returns TRUE invisibly if it was able to load package
        if (!require(i, character.only = TRUE)) {
            ## if package was not able to be loaded, install it
            install.packages(i, dependencies = TRUE)
            ## load package after installing
            require (i, character.only = TRUE)
        }
    }
}
