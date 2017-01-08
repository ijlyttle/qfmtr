#' Format an atomic vector
#'
#' @param x      atomic vector
#' @param locale list, generated using \code{\link{locale}}
#' @param ...    additional arguments
#'
#' @return character
#'
#' @keywords internal
#' @export
#'
qfmtr_fmt <- function(x, locale = default_locale(), ...){
  UseMethod("qfmtr_fmt")
}

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
qfmtr_fmt.default <- function(x, locale = default_locale(), ...){
  as.character(x)
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
qfmtr_fmt.logical <- function(x, locale = default_locale(), ...){
  ifelse(x, "true", "false")
}

# duration
#
# returns milliseconds
#
# TODO: consider using option
#   fmt = c("ms", "s", "minute", "hour", "day", "week", "year")

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
setGeneric("qfmtr_fmt", function(x, locale = default_locale(), ...) {
  standardGeneric("qfmtr_fmt")
})

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
setMethod("qfmtr_fmt", list("Duration"), function(x, locale = default_locale(), ...){

  x <- lubridate::as.difftime(x)

  qfmtr_fmt(x, locale = locale, ...)
})

# period
#
# returns milliseconds
#
# TODO: consider using option
#   fmt = c("ms", "s", "minute", "hour", "day", "week", "year")

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
setMethod("qfmtr_fmt", list("Period"), function(x, locale = default_locale(), ...){

  x <- lubridate::as.difftime(x)

  qfmtr_fmt(x, locale = locale, ...)
})

#' @rdname qfmtr_fmt
#' @keywords internal
#' @export
#'
qfmtr_fmt.difftime <- function(x, locale = default_locale(), ...){

  x_ref <- as.difftime(0.001, units = "secs")

  # harmonize the units
  units(x_ref) <- "secs"
  units(x) <- "secs"

  x <- as.numeric(x) / as.numeric(x_ref)

  qfmtr_fmt.default(x, locale = locale, ...)
}

