#' @title Get Regional Curves
#'
#' @description Returns a data frame of the `regional_curve` package data.
#'
#' @export
#' @return A data frame of the `regional_curve` package data.
#'
#' @examples
#' rc <- regional_curves()
#'
regional_curves <- function() {
  return(RegionalCurve::regional_curve)
}
