## printMult
## by Steve Myles
## http://steve.mylesandmyles.info/
## 4 June 2015
## documentation:  http://projects.mylesandmyles.info/R-functions-and-such/printMult/printMult.html
##
## The following function, `printCurrency`, properly formats numbers as 
## currency.
##
## The following function, printMult, displays a number with an added 
## multiplier. multiplier is designed to allow for easy formatting of tens, 
## hundreds, thousands, millions, or billions by displaying a 
## multiplier-specific letter after the formatted number. multiplier works for 
## values other than those listed but does not currently display a symbol after 
## the formatted number. The default is 1 (i.e., the number is displayed as 
## entered).

printMult <- function(value, digits = 2, sep = ",", decimal=".", multiplier = 1, 
                      mult.sym = "") {     
    mult.sym <- ifelse(multiplier == 10^1, " tens", 
                       ifelse(multiplier == 10^2, "H",
                              ifelse(multiplier == 10^3, "K",
                                     ifelse(multiplier == 10^6, "M",
                                            ifelse(multiplier == 10^9, "B", 
                                                   "")))))
    paste(formatC(value / multiplier, format = "f", big.mark = sep, digits = digits, 
                  decimal.mark=decimal), mult.sym, sep="")
}
