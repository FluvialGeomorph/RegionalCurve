#' @title Region Dimension Graph
#'
#' @description Creates a Regional Hydraulic Dimension graph for the regions
#' provided for the specified dimension.
#'
#' `r lifecycle::badge("stable")`
#'
#' @export
#' @param regions         character; A vector of region names that will be
#'                        displayed on the graph. For a complete list of
#'                        regions, see levels(regional_curve$region_name)
#'                        RegionalCurve::regional_curve$region_name.
#' @param dimension_types character; A vector of dimension types: "area",
#'                        "depth", "width", "discharge"
#'
#' @return A ggplot object.
#'
#' @details Creates a regional hydraulic dimension graph styled using
#' conventions that have emerged in the fluvial geomorphic literature:
#'
#' * Drainage Area as the independent variable on the x-axis. Units are
#'   expressed in imperial units (square miles).
#' * Hydraulic dimensions (i.e., width, depth, cross sectional area, discharge)
#'   as the dependent variables on the y-axis. Units are expressed in imperial
#'   units(i.e, width: feet, depth: feet, cross sectional area: square feet,
#'   discharge: cubic feet per second).
#' * Dependent variables (y-axes) are stacked over the dependent variable
#'   (x-axis).
#' * Both axes on log scale (aka "log-log graph").

#'
#' @family {visualizations}
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
#' @importFrom rlang .data
#'
region_graph <- function(regions, dimension_types) {
  # Check parameters
  check_regions(regions)
  check_dimensionType(dimension_types)

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
    filter(.data$dimension %in% dimension_types) %>%
    left_join(dim_labels_df, by = "dimension")

  n_dims <- length(unique(df_dim$dimension))

  p <- ggplot(df_dim,
              aes(x = .data$drainage_area,
                  y = .data$value,
                  color = .data$region_name)) +
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
    facet_wrap(vars(.data$label),
               nrow = n_dims,
               scales = "free_y",
               labeller = labeller(label = label_wrap_gen(20)),
               strip.position = "left")
  return(p)
}
