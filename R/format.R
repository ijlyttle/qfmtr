#' Format a list to use as http query
#'
#' @param x list, where values are to be formatted
#'
#' @return list
#' @export
#'
qfmt <- function(x){

  # x has to be a list
  assertthat::assert_that(is.list(x))

  x <- x %>%
    purrr::map(.fmt_lgl) # format logicals

  # format durations

  # format difftimes

  # format vectors

  x
}

# takes a scalar, formats if it is logical
.fmt_lgl <- function(x){

  x_new <- x

  if (is.logical(x)){
    x_new <- ifelse(x, "true", "false")
  }

  x_new
}


