context("locale")

logical_format_test <- list(true = "true", false = "false")
dtime_format_test <- "ms"

default_locale_test <- list(
  logical_format = logical_format_test,
  dtime_format = dtime_format_test
)

test_that("logical_format works", {
  expect_error(locale(logical_format = "foo"), "list")
  expect_error(locale(logical_format = list("foo")), "true")
  expect_error(locale(logical_format = list(true = "foo")), "false")
  expect_error(locale(logical_format = list(true = "foo", false = 1)), "character")
  expect_identical(
    locale(logical_format = logical_format_test)[["logical_format"]],
    logical_format_test
  )
})

test_that("dtime_format works", {
  expect_error(locale(dtime_format = "foo"), "arg")
  expect_identical(
    locale(dtime_format = dtime_format_test)[["dtime_format"]],
    dtime_format_test
  )
})

test_that("default_locale works", {
  expect_identical(default_locale(), default_locale_test)
})
