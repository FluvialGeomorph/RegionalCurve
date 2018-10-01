if(getRversion() >= "2.15.1")  utils::globalVariables(c("regional_curve_graphs"))

#' @title Compute hydraulic geometry from graph
#'
#' @export
#' @description  Computes hydraulic dimension (cross sectional area, width,
#'     or depth) from a built-in table of regional hydraulic curve graph
#'     coordinates.
#'
#' @param region        character; The region that a dimension will be
#'                      calculated for. See the regional_curves$region field
#'                      for a complete list.
#' @param drainageArea  numeric; The upstream drainage area of the location of
#'                      the dimension (in square miles).
#' @param dimensionType character; The dimension type: "area", "depth", "width"
#'
#' @return The value of the requested hydraulic dimension
#'
#' @examples
#' # Calculate the cross sectional area for a watershed with drainage area = 1
#' # square mile in the Eastern United States region.
#' RHG_graph(region = "Eastern United States",
#'           drainageArea = 1,
#'           dimensionType = "area")
#'
RHG_graph <- function(region, drainageArea, dimensionType) {
  # Subset the regional_curve_graphs for the selected region and dimension
  rc <- regional_curve_graphs[regional_curve_graphs$region == region &
                              regional_curve_graphs$dimension == dimensionType,]
  # Calculate the hydrologic geometry for the selected region and dimension
  dimension <- rc$y_1 * drainageArea^(log(rc$y_2 / rc$y_1 ) / (log(rc$x_2 /
                                                                     rc$x_1)))
  # Return the calculated dimensions in a data frame
  return(dimension)
}
