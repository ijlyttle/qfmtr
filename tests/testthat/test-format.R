context("format")

list_char = list(foo = "bar")

test_that("list assertion works", {
  expect_error(qfmt("foo"), "list")
  expect_identical(qfmt(list_char), list_char)
})
