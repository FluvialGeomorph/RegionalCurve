#' @title Region Dimension Graph
#'
#' @description Creates a Regional Hydraulic Dimension graph for the regions
#' provided for the specified dimension.
#'
#' @export
#'
#' @param regions         character; A vector of region names that will be
#'                        displayed on the graph. For a complete list of
#'                        regions, see levels(regional_curve$region_name)
#'                        RegionalCurve::regional_curve$region_name.
#' @param dimension_type  character; Dimension type: "area", "depth", "width",
#'                       "discharge"
#'
#' @return A ggplot object
#'
#' @examples
#' regions = c("Minnesota Eastern", "Minnesota Western")
#' dimension_type = "width"
#' region_dimension_graph(regions, dimension_type)
#'
#' @importFrom dplyr mutate filter select
#' @importFrom tidyr pivot_longer
#' @importFrom ggplot2 ggplot aes geom_line scale_x_log10 scale_y_log10
#'             annotation_logticks labs theme_bw theme
#'
region_dimension_graph <- function(regions, dimension_type) {
  # Calculate min-max dimension for each region
  regions_min_max <- RegionalCurve::regional_curve %>%
    # Create new variables
    mutate(drainage_min = str_extract(drainage_area_range, "[^-]+")) %>%
    mutate(drainage_max = str_extract(drainage_area_range, "\\b\\w+$")) %>%
    # Filter for regions
    filter(region_name %in% regions) %>%
    mutate(region_name = as.character(region_name)) %>%
    mutate(dimension = as.character(dimension)) %>%
    # Create a record for each min and max drainage area
    select(c(region_name, dimension, drainage_min, drainage_max)) %>%
    pivot_longer(c(drainage_min, drainage_max),
                 names_to = NULL,
                 values_to = "drainage_area") %>%
    mutate(drainage_area = as.numeric(drainage_area)) %>%
    # Calculate dimensions
    mutate(value = RHG(region_name, drainage_area, dimension))

  breaks <- 10^(-10:10)
  minor_breaks <- rep(1:9, 21)*(10^rep(-10:10, each=9))
  dimension_label <- switch(dimension_type,
                            "width" = "Width (feet)",
                            "depth" = "Depth (feet)",
                            "area" = "Cross Section Area (sq ft)",
                            "discharge" = "Discharge (cu ft/sec)")

  df_dim <- filter(regions_min_max, dimension == dimension_type)

  ggplot(df_dim, aes(x = drainage_area, y = value, color = region_name)) +
    geom_line() +
    scale_x_log10(breaks = breaks, minor_breaks = minor_breaks) +
    scale_y_log10(breaks = breaks, minor_breaks = minor_breaks) +
    annotation_logticks() +
    labs(x = "Drainage Area (sq miles)",
         y = dimension_label) +
    theme_bw() +
    theme(legend.position = c(.15,.90),
          legend.title = element_blank())
}
