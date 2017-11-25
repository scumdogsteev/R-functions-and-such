## prettyTable
## by Steve Myles
## http://s.mylesandmyles.info/
## 25 November 2017
##
## The following function, `prettyTable`, creates a formatted html table
## using the kableExtra package.

require(kableExtra)
pretty_table <- function(x, format = "html", bootstrap_options = c("striped", "hover", "condensed", "responsive"),
                         full_width = F, ...) { kable(x, format = format) %>%
    kable_styling(bootstrap_options = bootstrap_options, full_width = full_width)}