#' Serialize a list into text
#'
#' This function acts as a text-serializer for lists. One use case is
#'
#' @param x           list, where values are to be formatted (serialized)
#' @param delim       character, delimiter to collapse mutiple-value members
#' @param locale      list, directs the formatting functions for each class
#'
#' @return list with same names as \code{x}, values are all \code{\link{character}}
#' @export
#'
srlst <- function(x, delim = ",", locale = default_locale()){

  # x has to be a list
  assertthat::assert_that(is.list(x))

  x <- lapply(x, serialize_atomic)
  x <- lapply(x, paste, sep = "", collapse = delim)

  x
}




