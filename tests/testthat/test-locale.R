context("locale")

logical_format_test <- list(true = "true", false = "false")
duration_unit_test <- "ms"

default_locale_test <- list(
  logical_format = logical_format_test,
  duration_unit = duration_unit_test
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

test_that("duration_unit works", {
  expect_error(locale(duration_unit = "foo"), "arg")
  expect_identical(
    locale(duration_unit = duration_unit_test)[["duration_unit"]],
    duration_unit_test
  )
})

test_that("default_locale works", {
  expect_identical(default_locale(), default_locale_test)
})
