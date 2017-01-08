context("serialize atomic")

library("lubridate")

char <- c("a", "b")
dbl <- c(1, 2)
int <- c(1L, 2L)
lgl <- c(TRUE, FALSE)
dur <- dseconds(c(1, 2))
per <-seconds(c(1, 2))
dftm <- as.difftime(c(4, 5), units = "secs")

dftm_min <- as.difftime(1, units = "hours")
locale_min <- locale(dtime_format = "min")
ser_dftm_min <- "60"

ser_char <- char
ser_dbl <- as.character(dbl)
ser_int <- format(int)
ser_lgl <- c("true", "false")
ser_dur <- format(c(1000, 2000))
ser_per <- format(c(1000, 2000))
ser_dftm <- format(c(4000, 5000))

test_that("conversion works for atomic vectors", {
  expect_identical(srlz_atomic(char), ser_char)
  expect_identical(srlz_atomic(dbl), ser_dbl)
  expect_identical(srlz_atomic(int), ser_int)
  expect_identical(srlz_atomic(lgl), ser_lgl)
  expect_identical(srlz_atomic(dur), ser_dur)
  expect_identical(srlz_atomic(per), ser_per)
  expect_identical(srlz_atomic(dftm), ser_dftm)
  expect_identical(srlz_atomic(dftm_min, locale = locale_min), ser_dftm_min)
})

test_that("list assertion works", {
  expect_error(srlst("foo"), "list")
  expect_identical(srlst(list("foo")), list("foo"))
})


