#' Regional hydraulic geometry curve data
#'
#' A dataset containing the regional hydraulic geometry curve data for streams
#' in North America. The variables in this dataset are as follows:
#'
#' @format A data frame with 163 observations and 11 variables:
#' \describe{
#'   \item{region_name}{the name of the region}
#'   \item{state}{the name of the US state or Canadian province}
#'   \item{dimension}{the name of the hydraulic dimension (area, depth, with, discharge)}
#'   \item{intercept}{the y-intercept of the regional equation}
#'   \item{slope}{the slope of the regional equation}
#'   \item{r_squared}{the goodness of fit statistic for the model}
#'   \item{no_sites}{the number of sites used to create the model}
#'   \item{drainage_area_range}{the range of drainage areas considered in the model (square miles)}
#'   \item{recurrence_range}{the flood recurrence interval (years)}
#'   \item{median_recurrence}{the median flood recurrence (years)}
#'   \item{reference}{the citation of the study}
#' }
#'
#' @family {data}
#'
"regional_curve"
