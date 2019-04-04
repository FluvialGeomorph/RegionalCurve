if(getRversion() >= "2.15.1")  utils::globalVariables(c("regional_curve"))

#' @title Computes hydraulic geometry dimensions
#'
#' @description Computes hydraulic geometry dimension (cross sectional area,
#'     width, depth, discharge) from a built-in table of regional hydraulic
#'     equation coefficients.
#'
#' @export
#' @param region         character; The region that a dimension will be
#'                       calculated for. For a complete list of regions, see
#'                       levels(regional_curve$region_name)
#' @param drainageArea   numeric; The upstream drainage area of the location of
#'                       the dimension (in square miles).
#' @param dimensionType  character; Dimension type: "area", "depth", "width",
#'                       "discharge"
#'
#' @return The numeric value of the requested hydraulic dimension. The units
#'         of the dimensions are as follows: area: square feet, depth: feet,
#'         width: feet, discharge: cubic feet per second
#'
#' @details This function uses values in the \code{regional_curve} data frame
#'     to calculate hydraulic geometry dimensions. Monomial relationships of
#'     the form \eqn{y=ax^m}, known as power functions, appear as straight
#'     lines in a log–log graph, with the exponent (\code{m}) and constant
#'     (\eqn{a}) term corresponding to slope and intercept of the line
#'     (\eqn{y = mx + b}).
#'
#' @examples
#' # Calculate the discharge for a 200 sq mi watershed in Massachusetts.
#' RHG(region = "MA", drainageArea = 200, dimensionType = "discharge")
#'
RHG <- function(region, drainageArea, dimensionType = c("area", "depth",
                                                        "width", "discharge")) {
  # Subset for the selected region and dimension
  rc <- RegionalCurve::regional_curve[RegionalCurve::regional_curve$region_name
                                      == region &
                  RegionalCurve::regional_curve$dimension == dimensionType,]

  # Check if the dimensionType exists for this region
  if(dimensionType %in% rc$dimension) {
    # Calculate the hydrologic geometry for the selected region and dimension
    dimension <- rc$intercept * drainageArea ^ rc$slope
  } else {
    # Otherwise, create an numeric vector and set to NA
    dimension <- numeric(0)
    dimension <- NA
  }

  return(dimension)
}
