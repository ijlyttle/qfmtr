context("serialize")

library("lubridate")

query_params <- list(
  number = 20,
  keep = c(TRUE, TRUE, FALSE),
  delay = dseconds(5)
)

locale_new <- locale(
  logical_format = list(true = "True", false = "False"),
  dtime_format = "s"
)

query_params_ser <- list(
  number = "20",
  keep = "true,true,false",
  delay = "5000"
)

query_params_ser_new <- list(
  number = "20",
  keep = "True,True,False",
  delay = "5"
)

test_that("list assertion works", {
  expect_error(serialize_list("foo"), "list")
  expect_identical(serialize_list(list("foo")), list("foo"))
})

test_that("list serialization works", {
  expect_identical(serialize_list(query_params), query_params_ser)
  expect_identical(
    serialize_list(query_params, locale = locale_new),
    query_params_ser_new
  )
})
