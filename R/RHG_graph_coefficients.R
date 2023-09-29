if(getRversion() >= "2.15.1")  utils::globalVariables(c("regional_curve_graphs"))

#' @title Compute power function coefficients
#'
#' @description  Computes the regional curve power function coefficients from
#'     a table of regional hydraulic curve coordinates contained in a built-in
#'     table.
#'
#' `r lifecycle::badge("stable")`
#'
#' @export
#' @param region        character; The region that a dimension will be
#'                      calculated for. See the regional_curves$region field
#'                      for a complete list.
#' @param drainageArea  numeric; The upstream drainage area of the location of
#'                      the dimension (in square miles).
#' @param dimensionType character; The dimension type: "area", "depth", "width"
#'
#' @return A data frame containing the value of slope (\eqn{m}) and intercept
#'     (\eqn{a}) for the requested region and hydraulic dimension.
#'
#' @details Regional curves are typically displayed on log-log plots. This
#'     method is required to extract the formula for calculating the y-axis
#'     value on these graphs (i.e., cross-sectional area, width, mean depth)
#'     from the x-axis value (i.e., drainage area). Monomial relationships of
#'     the form \eqn{y=ax^m}, known as power functions, appear as straight
#'     lines in a log–log graph, with the exponent (`m`) and constant
#'     (\eqn{a}) term corresponding to slope and intercept of the line
#'     (\eqn{y = mx + b}).
#'
#'     Used internally to convert historic studies that do not report regional
#'     relationships using the "power function" convention.
#'
#' @family {data}
#'
#' @examples
#' # Calculate the slope and intercept for a watershed with drainage area = 1
#' # square mile in the Eastern United States region.
#' RHG_graph_coefficients(region = "Eastern United States",
#'                        drainageArea = 1,
#'                        dimensionType = "area")
#'
RHG_graph_coefficients <- function(region, drainageArea, dimensionType) {
  # Check parameters
  check_regions(region)
  check_dimensionType(dimensionType)
  if(!is.numeric(drainageArea)) {
    cli_abort(c(
      "x" = "{.arg drainageArea} must be a numeric vector."))
  }
  # check parameters equal length
  if(!(length(region) == length(drainageArea) &
       length(drainageArea) == length(dimensionType))) {
    cli_abort(c(
      "x" = "Arguments are not of matching length.",
      "i" = "`region`: {length(region)}",
      "i" = "`drainageArea`: {length(drainageArea)}",
      "i" = "`dimensionType`: {length(dimensionType)}"))
  }

  # Subset the RHG curve for the selected region and dimension
  rc <- regional_curve_graphs[regional_curve_graphs$region_name == region &
                              regional_curve_graphs$dimension == dimensionType,]
  # Calculate the slope
  m <- log(rc$y_2 / rc$y_1 ) / (log(rc$x_2 / rc$x_1))
  # Calculate the hydrologic geometry for the selected region and dimension
  a <- rc$y_1
  # Create a data frame to hold the coefficients
  coefficients <- data.frame(region, drainageArea, dimensionType, m, a,
                             rc$source)
  return(coefficients)
}
