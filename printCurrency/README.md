### printCurrency
##### by [Steve Myles](http://steve.mylesandmyles.info/) | 24 May 2015 (updated 4 June 2015)
##### License:  [MIT License](https://github.com/scumdogsteev/R-functions-and-such/blob/master/LICENSE)
##### based almost entirely on [this Stack Overflow response](http://stackoverflow.com/a/23833928)

The following function, `printCurrency`, properly formats numbers as currency.

`multiplier` is designed to allow for easy formatting of tens, hundreds, 
thousands, millions, or billions by displaying a multiplier-specific letter 
after the formatted number.  `multiplier` works for values other than those 
listed but does not currently display a symbol after the formatted number.  The 
default is 1 (i.e., the number is displayed as entered with currency 
formatting).


```r
printCurrency <- function(value, currency.sym = "$", digits = 2, sep = ",",
                          decimal=".", multiplier = 1, mult.sym = "") {     
     mult.sym <- ifelse(multiplier == 10^1, " tens",
                        ifelse(multiplier == 10^2, "H",
                               ifelse(multiplier == 10^3, "K",
                                      ifelse(multiplier == 10^6, "M",
                                             ifelse(multiplier == 10^9, "B", 
                                                    "")))))
     paste(currency.sym, formatC(value / multiplier, format = "f", 
                                 big.mark = sep, digits = digits, 
                                 decimal.mark=decimal), mult.sym, sep="")
}
```

Examples:

```r
## simple 1000s multiplier
printCurrency(10000, multiplier = 1000)
```

```
## [1] "$10.00K"
```

```r
## create a variable to pass to printCurrency
x <- 123456789

## multiplier can be numeric or in scientific notation
printCurrency(x, multiplier = 10^6, digits = 0)
```

```
## [1] "$123M"
```

```r
## passing a non-standard multiplier - note that the result is displayed without
## a multiplier symbol
printCurrency(1000, multiplier = 123)
```

```
## [1] "$8.13"
```

```r
## passing an alternate currency symbol
printCurrency(10121333, digits = 1, multiplier = 1000000, currency.sym = "€")
```

```
## [1] "€10.1M"
```
