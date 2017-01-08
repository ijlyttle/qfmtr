#' Serialize a list into text
#'
#' This function acts as a text-serializer for lists. One use case is
#'
#' @param x           list, values to be serialized
#' @param delim       character, delimiter to collapse mutiple-value members
#' @param locale      list, directs the formatting functions for each class
#'
#' @return list with same names as \code{x}, all values are \code{\link{character}}
#' @seealso \code{\link{locale}}
#' @examples
#' library("lubridate")
#'
#' query_param <- list(
#'   delay = dseconds(4),
#'   next_steps = c("collate", "send"),
#'   verbose = TRUE
#' )
#'
#' srlst(query_param)
#'
#' srlst(query_param, delim = " ")
#' @export
#'
srlst <- function(x, delim = ",", locale = default_locale()){

  # x has to be a list
  assertthat::assert_that(is.list(x))

  x <- lapply(x, serialize_atomic, locale)
  x <- lapply(x, paste, sep = "", collapse = delim)

  x
}




