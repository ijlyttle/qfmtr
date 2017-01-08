#' Create a locale
#'
#' This locale object acts much like the locale object from the \strong{readr} package.
#' It is used to provide direction to the formatting methods for individual classes.
#'
#' @param logical_format list, with two members: \code{true} and \code{false},
#'   indicating how logicals will be written.
#' @param dtime_format  character, indicates how to express time-differences.
#'
#'
#' @return list
#' @export
#'
locale <- function(logical_format = list(true = "true", false = "false"),
                   dtime_format = c("ms", "s", "minute", "hour", "day", "week")){

  assertthat::assert_that(
    is.list(logical_format),
    assertthat::has_name(logical_format, "true"),
    assertthat::has_name(logical_format, "false"),
    is.character(logical_format[["true"]]),
    is.character(logical_format[["false"]])
  )

  dtime_format <- match.arg(dtime_format)

  list(logical_format = logical_format, dtime_format = dtime_format)
}

default_locale <- function(){
  locale()
}
