#' @title Computes regional hydraulic geometry dimensions
#'
#' @description Computes regional hydraulic geometry (RHG) dimension (cross
#'   sectional area, width, depth, discharge) from a built-in table of regional
#'   hydraulic geometry equation coefficients.
#'
#' `r lifecycle::badge("stable")`
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
#' @details This function uses values in the `regional_curve` data frame
#'     to calculate hydraulic geometry dimensions. Monomial relationships of
#'     the form \eqn{y=ax^m}, known as power functions, appear as straight
#'     lines in a log–log graph, with the exponent (`m`) and constant
#'     (\eqn{a}) term corresponding to slope and intercept of the line
#'     (\eqn{y = mx + b}).
#'
#' @family {calculations}
#'
#' @examples
#' # Calculate the discharge for a 200 sq mi watershed in Massachusetts.
#' RHG(region = "MA", drainageArea = 200, dimensionType = "discharge")
#'
#' # Calculate the discharge for a 200 sq mi watershed in Massachusetts.
#' RHG(region        = c("MA","MA","MA", "MA"),
#'     drainageArea  = c(200, 200, 200, 200),
#'     dimensionType = c("width", "depth", "area", "discharge"))
#'
#' @importFrom cli cli_abort
#' @importFrom dplyr %>% mutate filter bind_rows
#' @importFrom rlang .data
#'
RHG <- function(region, drainageArea, dimensionType = c("area", "depth",
                                                        "width", "discharge")) {
  # Get regional_curve package data
  rc <- RegionalCurve::regional_curve %>%
    # Remove factors
    dplyr::mutate(region_name = as.character(.data$region_name)) %>%
    dplyr::mutate(dimension = as.character(.data$dimension))

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

  # Assemble inputs into data frame
  inputs <- data.frame(region, drainageArea, dimensionType,
                       dimension = NA)

  # Create empty list to hold the calculated rhg dimension data frames
  rhg_dims <- list()

  # Iterate through inputs
  for (i in 1:length(inputs$region)) {
    # Filter inputs for current row and get variables
    inputs_i <- inputs[i,]

    # Filter rc for current region and dimension
    rc_i <- rc %>%
      dplyr::filter(.data$region_name == inputs_i$region,
                    .data$dimension == inputs_i$dimensionType)

    # Check if region has this dimension
    if(length(rc_i$dimension) == 0) {
      inputs_i$dimension <- NA
    } else {
      # Calculate hydraulic geometry for current item
      inputs_i$dimension <- rc_i$intercept * inputs_i$drainageArea ^ rc_i$slope
    }
    # Append the data frame of calculated dimensions to the list
    rhg_dims[[i]] <- inputs_i
  }

  # Append the list of data frames in rhg_dims into a single data frame
  outputs <- dplyr::bind_rows(rhg_dims)

  return(outputs$dimension)
}
