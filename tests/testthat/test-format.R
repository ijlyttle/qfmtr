context("format")

library("lubridate")

char <- c("a", "b")
dbl <- c(1, 2)
int <- c(1L, 2L)
lgl <- c(TRUE, FALSE)
dur <- dseconds(c(1, 2))
per <-seconds(c(1, 2))
dftm <- as.difftime(c(4, 5), units = "secs")

f_char <- char
f_dbl <- format(dbl)
f_int <- format(int)
f_lgl <- c("true", "false")
f_dur <- format(c(1000, 2000))
f_per <- format(c(1000, 2000))
f_dftm <- format(c(4000, 5000))

test_that("conversion works for atomic vectors", {
  expect_identical(qfmtr_fmt(char), f_char)
  expect_identical(qfmtr_fmt(dbl), f_dbl)
  expect_identical(qfmtr_fmt(int), f_int)
  expect_identical(qfmtr_fmt(lgl), f_lgl)
  expect_identical(qfmtr_fmt(dur), f_dur)
  expect_identical(qfmtr_fmt(per), f_per)
  expect_identical(qfmtr_fmt(dftm), f_dftm)
})

test_that("list assertion works", {
  expect_error(qfmt("foo"), "list")
  expect_identical(qfmt(list("foo")), list("foo"))
})


