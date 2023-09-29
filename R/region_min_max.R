#' @title Calculate Region Minimum and Maximum Dimensions
#'
#' @description Calculates regional hydraulic dimensions for the minimum and
#' maximum drainage area values provided for a region.
#'
#' @export
#' @param regions         character; A vector of region names that will be
#'                        displayed on the graph. For a complete list of
#'                        regions, see levels(regional_curve$region_name)
#'                        RegionalCurve::regional_curve$region_name.
#'
#' @return A data frame.
#'
#' @family {data}
#'
#' @examples
#' regions = c("Minnesota Eastern", "Minnesota Western")
#' df <- region_min_max(regions)
#'
#' @importFrom dplyr mutate filter select
#' @importFrom rlang .data
#' @importFrom stringr str_extract
#' @importFrom tidyr pivot_longer
#'
region_min_max <- function(regions) {
  # Check parameters
  check_regions(regions)

  # Get regional_curve package data
  rc <- RegionalCurve::regional_curve %>%
    # Remove factors
    mutate(region_name = as.character(.data$region_name)) %>%
    mutate(dimension = as.character(.data$dimension))

  # Calculate min-max dimension for regions
  min_max_df <- rc %>%
    # Create new variables
    mutate(drainage_min = str_extract(.data$drainage_area_range,
                                            "[^-]+")) %>%
    mutate(drainage_max = str_extract(.data$drainage_area_range,
                                            "\\b\\w+$")) %>%
    # Filter for regions
    filter(.data$region_name %in% regions) %>%
    # Create a record for each min and max drainage area
    select(c("region_name", "dimension", "drainage_min", "drainage_max")) %>%
    pivot_longer(c("drainage_min", "drainage_max"),
                 names_to = NULL,
                 values_to = "drainage_area") %>%
    mutate(drainage_area = as.numeric(.data$drainage_area)) %>%
    # Calculate dimensions
    mutate(value = RHG(.data$region_name,
                       .data$drainage_area,
                       .data$dimension))

  return(min_max_df)
}
