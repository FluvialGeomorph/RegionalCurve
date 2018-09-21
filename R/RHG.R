#' Computes hydraulic dimension (cross sectional area, width, depth,
#' discharge) from a built-in table of regional hydraulic equation
#' coefficients.
#'
#' @param region         character; The region that a dimension will be
#'                       calculated for. For a complete list of names, see the
#'                       regional_curve_equation$region_name field
#' @param drainageArea   numeric; The upstream drainage area of the location of
#'                       the dimension (in square miles).
#' @param dimensionType  character; Dimension type: "area", "depth", "width",
#'                       "discharge"
#'
#' @return The value of the requested hydraulic dimension.
#' @export
#'
#' @examples
RHG <- function(region, drainageArea, dimensionType) {
  # Subset for the selected region and dimension
  rc <- regional_curve[regional_curve$region_name == region &
                       regional_curve$dimension == dimensionType,]
  # Calculate the hydrologic geometry for the selected region and dimension
  dimension <- rc$intercept * drainageArea ^ rc$slope
  # Return the calculated dimensions in a data frame
  return(dimension)
}
