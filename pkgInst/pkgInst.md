### pkgInst
##### by [Steve Myles](http://steve.mylesandmyles.info/) | 2 March 2015 (updated 4 June 2015)
##### License:  [MIT License](https://github.com/scumdogsteev/R-functions-and-such/blob/master/LICENSE)
##### based almost entirely on [this Stack Overflow response](http://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them/19870272#19870272)

`pkgInst` is a function that checks whether a set of packages are installed and,
if not, it installs them and loads them into memory.  x is a vector of package
names.
 
This function is called as follows:
`pkgInst(c("pkg1", "pkg2", "pkg3", ..., "pkgN"))`
where pkg1 through pkgN are the names of the required packages.


```r
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
```

Example:

```r
## start with a vector of package names, some of which have previously been
## installed and some of which (qcc in this case) have not
pkgs <- c("dplyr", "qcc", "reshape2")

## run pkgInst for this vector of packages to load them into memory and to 
## install any previously uninstalled packages
pkgInst(pkgs)
```

```
## Loading required package: qcc
```

```
## Warning in library(package, lib.loc = lib.loc, character.only = TRUE,
## logical.return = TRUE, : there is no package called 'qcc'
```

```
## 
## The downloaded binary packages are in
## 	/var/folders/b6/r3ss83k50r52yc4db9b95y2m0000gp/T//RtmpbvXB7a/downloaded_packages
```

```
## Loading required package: qcc
## Package 'qcc', version 2.6
## Type 'citation("qcc")' for citing this R package in publications.
```
