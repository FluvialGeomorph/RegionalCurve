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
#' @return A ggplot object.
#'
#' @examples
#' regions = c("Minnesota Eastern", "Minnesota Western")
#' dimension_type = "width"
#' region_dimension_graph(regions, dimension_type)
#'
#' @importFrom dplyr filter
#' @importFrom ggplot2 ggplot aes geom_line scale_x_log10 scale_y_log10
#'             annotation_logticks labs theme_bw theme element_blank
#'
region_dimension_graph <- function(regions, dimension_type) {

  df_dim <- region_min_max(regions) %>%
    filter(dimension == dimension_type)

  breaks <- 10^(-10:10)
  minor_breaks <- rep(1:9, 21)*(10^rep(-10:10, each=9))
  dimension_label <- switch(dimension_type,
                            "width" = "Width (feet)",
                            "depth" = "Depth (feet)",
                            "area" = "Cross Section Area (sq ft)",
                            "discharge" = "Discharge (cu ft/sec)")

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
