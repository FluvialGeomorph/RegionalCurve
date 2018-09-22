#' @title Computes hydraulic geometry dimensions
#'
#' @Description Computes hydraulic geometry dimension (cross sectional area,
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
#' @return The numeric value of the requested hydraulic dimension.
#'
#' @examples
#' # Calculate the discharge for a 200 sq mi watershed in Massachusetts.
#' RHG(region = "MA", drainageArea = 200, dimensionType = "discharge")
#'
RHG <- function(region, drainageArea, dimensionType) {
  # Subset for the selected region and dimension
  rc <- regional_curve[regional_curve$region_name == region &
                       regional_curve$dimension == dimensionType,]
  # Calculate the hydrologic geometry for the selected region and dimension
  dimension <- rc$intercept * drainageArea ^ rc$slope
  # Return the calculated dimension
  return(dimension)
}
