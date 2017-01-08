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
srlz_atomic <- function(x, locale = default_locale(), ...){
  UseMethod("srlz_atomic")
}

#' @rdname srlz_atomic
#' @keywords internal
#' @export
#'
srlz_atomic.default <- function(x, locale = default_locale(), ...){
  as.character(x)
}

# logical
#
# returns "true"/"false"
#
# TODO: consider using an option fmt = c(true = "true", false = "false")
#

#' @rdname srlz_atomic
#' @keywords internal
#' @export
#'
srlz_atomic.logical <- function(x, locale = default_locale(), ...){
  ifelse(x, "true", "false")
}

#' @rdname srlz_atomic
#' @keywords internal
#' @export
#'
setGeneric("srlz_atomic", function(x, locale = default_locale(), ...) {
  standardGeneric("srlz_atomic")
})

#' @rdname srlz_atomic
#' @keywords internal
#' @importClassesFrom lubridate Duration
#' @export
#'
setMethod("srlz_atomic", list("Duration"), function(x, locale = default_locale(), ...){

  x <- lubridate::as.difftime(x)

  srlz_atomic(x, locale = locale, ...)
})

#' @rdname srlz_atomic
#' @keywords internal
#' @importClassesFrom lubridate Period
#' @export
#'
setMethod("srlz_atomic", list("Period"), function(x, locale = default_locale(), ...){

  x <- lubridate::as.difftime(x)

  srlz_atomic(x, locale = locale, ...)
})

#' @rdname srlz_atomic
#' @keywords internal
#' @export
#'
srlz_atomic.difftime <- function(x, locale = default_locale(), ...){

  list_xref <- list(
    ms = as.difftime(0.001, units = "secs"),
    s = as.difftime(1, units = "secs"),
    minute = as.difftime(1, units = "mins"),
    hour = as.difftime(1, units = "hours"),
    day = as.difftime(1, units = "days"),
    week = as.difftime(1, units = "weeks")
  )

  fmt <- locale[["dtime_format"]]
  x_ref <- list_xref[[fmt]]

  # harmonize the units
  units(x) <- "secs"
  units(x_ref) <- "secs"

  x <- as.numeric(x) / as.numeric(x_ref)

  srlz_atomic.default(x, locale = locale, ...)
}

