#' Create a locale
#'
#' This locale object acts much like the locale object from the
#' \strong{readr} package. It is used to provide direction to the
#' formatting methods for classes of each individual memeber of the
#' query-parameter list sent to \code{\link{serialize_list}}.
#'
#' @param logical_format list, with two members: \code{true} and \code{false},
#'   character strings indicating how logicals are written.
#' @param dtime_format  character, indicating how to express time-differences.
#'   Using \code{\link{serialize_list}}, time-differences are indicated by using
#'   \code{\link{difftime}}, \code{lubridate::\link[lubridate]{duration}}, or
#'   \code{lubridate::\link[lubridate]{period}}.
#'   The options indicate which time unit to use, \code{"ms"} being the default.
#'   The output for time-differences is a character representation of the numeric
#'   value of the time-differences expressed using that unit.
#'
#' @seealso \code{\link{serialize_list}}
#' @examples
#' library("lubridate")
#'
#' query_params <- list(
#'   keep = TRUE,
#'   delay = dseconds(5)
#' )
#'
#' serialize_list(query_params)
#'
#' locale_new <- locale(
#'   logical_format = list(true = "True", false = "False"),
#'   dtime_format = "s"
#' )
#'
#' serialize_list(query_params, locale = locale_new)
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

#' @rdname locale
#' @export
default_locale <- function(){
  locale()
}
