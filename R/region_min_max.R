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
#' @examples
#' regions = c("Minnesota Eastern", "Minnesota Western")
#' df <- region_min_max(regions)
#'
#' @importFrom dplyr mutate filter select
#' @importFrom stringr str_extract
#' @importFrom tidyr pivot_longer
#'
region_min_max <- function(regions) {
  # Get regional_curve package data
  rc <- RegionalCurve::regional_curve %>%
    # Remove factors
    mutate(region_name = as.character(region_name)) %>%
    mutate(dimension = as.character(dimension))

  # Check parameters
  assert_that(is.character(regions),
              msg = "regions must be a character")
  assert_that(all(regions %in% rc$region_name),
              msg = "regions must be in: RegionalCurve::regional_curve$region_name")

  # Calculate min-max dimension for regions
  min_max_df <- rc %>%
    # Create new variables
    mutate(drainage_min = str_extract(drainage_area_range, "[^-]+")) %>%
    mutate(drainage_max = str_extract(drainage_area_range, "\\b\\w+$")) %>%
    # Filter for regions
    filter(region_name %in% regions) %>%
    # Create a record for each min and max drainage area
    select(c(region_name, dimension, drainage_min, drainage_max)) %>%
    pivot_longer(c(drainage_min, drainage_max),
                 names_to = NULL,
                 values_to = "drainage_area") %>%
    mutate(drainage_area = as.numeric(drainage_area)) %>%
    # Calculate dimensions
    mutate(value = RHG(region_name, drainage_area, dimension))

  return(min_max_df)
}
