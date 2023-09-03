#' @title Region Dimension Graph
#'
#' @description Creates a Regional Hydraulic Dimension graph for the regions
#' provided for the specified dimension.
#'
#' @export
#' @param regions         character; A vector of region names that will be
#'                        displayed on the graph. For a complete list of
#'                        regions, see levels(regional_curve$region_name)
#'                        RegionalCurve::regional_curve$region_name.
#' @param dimension_types character; Dimension type: "area", "depth", "width",
#'                       "discharge"
#'
#' @return A ggplot object.
#'
#' @examples
#' regions = c("Minnesota Eastern", "Minnesota Western")
#' dimension_types = c("width", "depth", "area")
#' region_graph(regions, dimension_types)
#'
#' @importFrom dplyr filter left_join
#' @importFrom ggplot2 ggplot aes geom_line scale_x_log10 scale_y_log10
#'             annotation_logticks labs theme_bw theme element_blank
#'             facet_wrap vars labeller label_wrap_gen
#'
region_graph <- function(regions, dimension_types) {

  # Create graph axes ticks and labels
  breaks <- 10^(-10:10)
  minor_breaks <- rep(1:9, 21)*(10^rep(-10:10, each=9))
  dim_labels_df <- data.frame(
                     dimension = c("width", "depth",
                                   "area", "discharge"),
                     label = c("Width (feet)", "Depth (feet)",
                               "Cross Section Area (sq ft)",
                               "Discharge (cu ft/sec)"))

  # Calculate region dimensions and label
  df_dim <- region_min_max(regions) %>%
    filter(dimension %in% dimension_types) %>%
    left_join(dim_labels_df, by = "dimension")

  n_dims <- length(unique(df_dim$dimension))

  p <- ggplot(df_dim,
              aes(x = drainage_area, y = value, color = region_name)) +
    geom_line() +
    scale_x_log10(breaks = breaks, minor_breaks = minor_breaks) +
    scale_y_log10(breaks = breaks, minor_breaks = minor_breaks) +
    annotation_logticks() +
    labs(x = "Drainage Area (sq miles)",
         y = NULL) +
    theme_bw() +
    theme(legend.title = element_blank(),
          legend.position = c(.15,.93),
          strip.background = element_blank(),
          strip.placement = "outside") +
    facet_wrap(vars(label),
               nrow = n_dims,
               scales = "free_y",
               labeller = labeller(label = label_wrap_gen(20)),
               strip.position = "left")
  p
}
