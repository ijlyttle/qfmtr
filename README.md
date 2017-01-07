
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/qhelpr)](https://cran.r-project.org/package=qhelpr) [![Travis-CI Build Status](https://travis-ci.org/ijlyttle/qhelpr.svg?branch=master)](https://travis-ci.org/ijlyttle/qhelpr)

qhelpr
======

One purpose of an API client in R is to let you work in the R world and for the client translate to the remote world. In many cases, parameters for http queries are formatted differently from R:

-   logicals are expressed as `"true"`/`"false"`,
-   time durations are specified in ms (R uses difftime, or lubridate durations),
-   vectors are expressed using comma-delimited strings.

The goal of this package is to make that translation process easier.

Installation
------------

You can install qhelpr from github with:

``` r
# install.packages("devtools")
devtools::install_github("ijlyttle/qhelpr")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code
```

Code of Conduct
---------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
