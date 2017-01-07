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

  # format logicals

  # format durations

  # format difftimes

  # format vectors

  x
}

.fmt_lgl <- function(x){
  x
}


