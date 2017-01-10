
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/srlst)](https://cran.r-project.org/package=srlst) [![Travis-CI Build Status](https://travis-ci.org/ijlyttle/srlst.svg?branch=master)](https://travis-ci.org/ijlyttle/srlst) [![Coverage Status](https://img.shields.io/codecov/c/github/ijlyttle/srlst/master.svg)](https://codecov.io/github/ijlyttle/srlst?branch=master)

srlst
=====

Serialzing lists into text-lists can make it easier to work with web-service APIs. This package can help you work with http-query lists in the "R world", helping you serialize it for use in the "remote world". In many cases, parameters for http queries are formatted differently from R:

-   logicals are expressed as `"true"` or `"false"`
-   time durations are specified in ms (R uses difftime, or **lubridate** durations or periods)
-   vectors are expressed using delimited strings (often delimited by commas)

The goal of this package is to make that translation process easier.

Installation
------------

You can install **srlst** from github with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/srlst")
```

Example
-------

``` r
library("httr")
library("lubridate")
library("srlst")
```

Let's consider a web-serice endpoint that accepts query-parameters in the format described above. You wish to work with the query-parameters in an R-sensible way. The function `serialize_list()` is used to serialize the elements of your list into the format expected by the web-service.

``` r
query_params <- list(
  delay = dseconds(3),
  print = TRUE,
  next_steps = c("collate", "send"),
  number = 20
)

serialize_list(query_params)
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

Thus, you can use the **httr** package to build your URL, attaching the query.

``` r
url <- parse_url("https://useful.site.com/service")
url$query <- serialize_list(query_params)

build_url(url)
#> [1] "https://useful.site.com/service?delay=3000&print=true&next_steps=collate%2Csend&number=20"
```

If you need to change the default behavior of the serializer, the `serialize_list()` function lets you set the delimiter. It also lets you set the `locale()`, which is used to specify the format for individual types (like logical and time-difference).

There are other situations where list-serialization may be useful. For example if you are writing HTML elements for use with JavaScript, you will often have to set parameters like `data-foo = "true"`. You can use `serialize_list()` to help you think in the R world, then write to the HTML/JavaScript world.

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
