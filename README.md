
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/qfmtr)](https://cran.r-project.org/package=qfmtr) [![Travis-CI Build Status](https://travis-ci.org/ijlyttle/qfmtr.svg?branch=master)](https://travis-ci.org/ijlyttle/qfmtr) [![Coverage Status](https://img.shields.io/codecov/c/github/ijlyttle/qfmtr/master.svg)](https://codecov.io/github/ijlyttle/qfmtr?branch=master)

qfmtr
=====

One purpose of an API client in R is to let you work in the R world and for the client translate to the remote world. In many cases, parameters for http queries are formatted differently from R:

-   logicals are expressed: `"true"`/`"false"`
-   time durations are specified in ms (R uses difftime, or lubridate durations)
-   vectors are expressed using comma-delimited strings.

The goal of this package is to make that translation process easier.

Installation
------------

You can install qfmtr from github with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/qfmtr")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library("lubridate")
library("qfmtr")

query_params <- list(
  delay = dseconds(3),
  print = TRUE,
  next_steps = c("collate", "send"),
  number = 20
)

qfmt(query_params)
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

url$query <- qfmt(query_params)

build_url(url)
#> [1] "https://useful.site.com/service?delay=3000&print=true&next_steps=collate%2Csend&number=20"
```

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
