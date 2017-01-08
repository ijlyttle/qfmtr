
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/srlst)](https://cran.r-project.org/package=srlst) [![Travis-CI Build Status](https://travis-ci.org/ijlyttle/srlst.svg?branch=master)](https://travis-ci.org/ijlyttle/srlst) [![Coverage Status](https://img.shields.io/codecov/c/github/ijlyttle/srlst/master.svg)](https://codecov.io/github/ijlyttle/srlst?branch=master)

srlst
=====

One purpose of an API client in R is to let you work in the R world and for the client translate to the remote world. In many cases, parameters for http queries are formatted differently from R:

-   logicals are expressed: `"true"`/`"false"`
-   time durations are specified in ms (R uses difftime, or **lubridate** durations or periods)
-   vectors are expressed using delimited strings (usually delimited by commas).

The goal of this package is to make that translation process easier.

Installation
------------

You can install srlst from github with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/srlst")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library("lubridate")
library("srlst")

query_params <- list(
  delay = dseconds(3),
  print = TRUE,
  next_steps = c("collate", "send"),
  number = 20
)

srlst(query_params)
#> $delay
#> [1] "3000"
#> 
#> $print
#> [1] "true"
#> 
#> $next_steps
#> [1] "collate,send"
#> 
#> $number
#> [1] "20"
```

Here's where it can be handy:

``` r
library("httr")

url <- parse_url("https://useful.site.com/service")

url$query <- srlst(query_params)

build_url(url)
#> [1] "https://useful.site.com/service?delay=3000&print=true&next_steps=collate%2Csend&number=20"
```

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
