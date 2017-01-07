context("format")

list_char <- list(a = "a", b = "b")
list_num <- list(one = 1, two = 2L)
list_lgl <- list(true = TRUE, false = FALSE)

q_char <- list_char
q_num <- list_num
q_lgl <- list(true = "true", false = "false")

test_that("list assertion works", {
  expect_error(qfmt("foo"), "list")
})

test_that("pass-through works", {
  expect_identical(qfmt(list_char), q_char)
  expect_identical(qfmt(list_num), q_num)
})

test_that("logical conversion works", {
  expect_identical(.fmt_lgl("a"), "a")
  expect_identical(.fmt_lgl(TRUE), "true")
  expect_identical(.fmt_lgl(FALSE), "false")
})

test_that("combinations work", {
  expect_identical(
    qfmt(c(list_char, list_lgl)),
    c(q_char, q_lgl)
  )
})
