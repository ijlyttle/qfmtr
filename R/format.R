#' Format a list to use as http query
#'
#' @param x           list, where values are to be formatted
#' @param delim       character, delimiter for mutiple-value members
#' @param locale      list, directs the formatting functions for each class
#'
#' @return list
#' @export
#'
qfmt <- function(x, delim = ",", locale = default_locale()){

  # x has to be a list
  assertthat::assert_that(is.list(x))

  x <- x %>%
    purrr::map(qfmtr_fmt)

  x
}




