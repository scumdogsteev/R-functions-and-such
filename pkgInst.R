## "pkgInst" is a function that checks whether a set of packages are 
## installed and, if not, it installs them
## based on this response from Stack Overflow:
## http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them/19870272#19870272
pkgInst <- function(x) {
for(i in x) {
    ## "require" returns TRUE invisibly if it was able to load package
    if(!require(i, character.only = TRUE) ){
         ##  If package was not able to be loaded then install it
         install.packages(i, dependencies = TRUE)
         ##  Load package after installing
         require(i, character.only = TRUE)
         }
    }
}
