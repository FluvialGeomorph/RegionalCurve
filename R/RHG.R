if(getRversion() >= "2.15.1")  utils::globalVariables(c("regional_curve"))

#' @title Computes regional hydraulic geometry dimensions
#'
#' @description Computes regional hydraulic geometry (RHG) dimension (cross
#'   sectional area, width, depth, discharge) from a built-in table of regional
#'   hydraulic geometry equation coefficients.
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
  # Check inputs

  # Assemble inputs into data frame
  inputs <- data.frame(region, drainageArea, dimensionType,
                       dimension = NA)

  # Subset regional_curve for the selected region and dimension
  rc <- RegionalCurve::regional_curve %>%
    dplyr::mutate(region_name = as.character(region_name)) %>%
    dplyr::mutate(dimension = as.character(dimension))

  # Create list to hold all of the rhg dimensions
  rhg_dims <- list()

  # Iterate through inputs
  for (i in 1:length(inputs$region)) {
    # Filter inputs for current row and get variables
    inputs_i <- inputs[i,]
    region         <- inputs_i$region
    dimension_type <- inputs_i$dimensionType
    drainage_area  <- inputs_i$drainageArea

    # Filter rc for current row and get variables
    rc_i <- rc %>%
      dplyr::filter(region_name == region,
                    dimension == dimension_type)
    intercept <- rc_i$intercept
    slope     <- rc_i$slope

    # Calculate hydraulic geometry for current row
    inputs_i$dimension <- intercept * drainage_area ^ slope
    rhg_dims[[i]] <- inputs_i
  }

  # Append all of the rhg_dims
  dims <- dplyr::bind_rows(rhg_dims)

  return(dims$dimension)
}
