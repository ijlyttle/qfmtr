#' Format an atomic vector
#'
#' @param x    atomic vector
#' @param ...  additional arguments
#'
#' @return character
#'
#' @keywords internal
#' @export
#'
qfmtr_fmt <- function(x, ...){
  UseMethod("qfmtr_fmt")
}

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
qfmtr_fmt.default <- function(x, ...){
  format(x)
}

# logical
#
# returns "true"/"false"
#
# TODO: consider using an option fmt = c(true = "true", false = "false")
#

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
qfmtr_fmt.logical <- function(x, ...){
  ifelse(x, "true", "false")
}

# duration
#
# returns milliseconds
#
# TODO: consider using option
#   fmt = c("ms", "s", "minute", "hour", "day", "week", "year")
#
# S4 generic for converting to a bootstrap option

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
setGeneric("qfmtr_fmt", function(x, ...) {
  standardGeneric("qfmtr_fmt")
})

#' @rdname qfmtr_fmt
#' @keywords internal
#' @importClassesFrom lubridate Duration
#' @export
#'
setMethod("qfmtr_fmt", list("Duration"), function(x, ...){
  x_new <- x@.Data * 1000 # get ms

  x_new <- x / lubridate::dmilliseconds(1)

  x_new
})
