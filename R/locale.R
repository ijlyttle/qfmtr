#' Create a locale
#'
#' This locale object acts much like the locale object from the \strong{readr} package.
#' It is used to provide direction to the formatting methods for individual classes.
#'
#' @param logical_format list, with two members: \code{true} and \code{false},
#'   indicating how logicals will be written.
#' @param duration_unit  character, indicates how to express time-durations
#'
#' @return list
#' @export
#'
locale <- function(logical_format = list(true = "true", false = "false"),
                   duration_unit = c("ms", "s", "min", "hr", "day", "week")){

  duration_unit <- match.arg(duration_unit)

  list(logical_format = logical_format, duration_unit = duration_unit)
}

default_locale <- function(){
  locale()
}
