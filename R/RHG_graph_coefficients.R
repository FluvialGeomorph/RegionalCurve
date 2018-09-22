if(getRversion() >= "2.15.1")  utils::globalVariables(c("regional_curve_graphs"))

#' @title Compute power function coefficients
#'
#' @description  Computes the regional curve power function coefficients from
#'     a table of regional hydraulic curve coordinates contained in a built-in
#'     table.
#'
#' @export
#' @param region        character; The region that a dimension will be
#'                      calculated for. See the regional_curves$region field
#'                      for a complete list.
#' @param drainageArea  numeric; The upstream drainage area of the location of
#'                      the dimension (in square miles).
#' @param dimensionType character; The dimension type: "area", "depth", "width"
#'
#' @return The value of the requested hydraulic dimension
#'
RHG_graph_coefficients <- function(region, drainageArea, dimensionType) {
  # Subset the RHG curve for the selected region and dimension
  rc <- regional_curve_graphs[regional_curve_graphs$region_name == region &
                              regional_curve_graphs$dimension == dimensionType,]
  # Calculate the slope
  m <- log(rc$y_2 / rc$y_1 ) / (log(rc$x_2 / rc$x_1))
  # Calculate the hydrologic geometry for the selected region and dimension
  k <- rc$y_1
  # Create a data frame to hold the coefficients
  coefficients <- data.frame(region, drainageArea, dimensionType, m, k,
                             rc$source)
  return(coefficients)
}
