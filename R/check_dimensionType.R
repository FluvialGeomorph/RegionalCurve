#' @title Check Dimension Type
#'
#' @description Check to determine the if a valid dimension type has been
#' supplied.
#'
#' @export
#' @param dimensionType  character; A vector of dimension type. Must only
#'                       contain the following values: "area", "depth", "width",
#'                       "discharge"
#'
#' @return Returns TRUE if the vector of dimension types only contain valid
#' values.
#'
#' @importFrom cli cli_abort
#'
check_dimensionType <- function(dimensionType) {
  valid_types <- c('area', 'depth', 'width', 'discharge')
  type_missing <- dimensionType[!(dimensionType %in% valid_types)]

  if(!is.character(dimensionType)) {
    cli_abort(c(
      "x" = "{.arg dimensionType} must be a character vector.",
      "i" = "You supplied: {class(dimensionType)}"))
  }
  if(!all((dimensionType %in% valid_types))) {
    cli_abort(c(
      "x" = "{.arg dimensionType} must be one of 'area', 'depth', 'width',
             or 'discharge'.",
      "i" = "You supplied: {type_missing}"))
  }

  return(TRUE)
}
