#' @title Check Regions
#'
#' @description Checks if the parameter is listed in the package data frame
#' regional_curve$region_name.
#'
#' @export
#' @param regions        character vector; A vector of regions listed in the
#'                       package data frame regional_curve$region_name.
#'
#' @return Returns TRUE if the `regions` parameter listed in the package data
#' frame regional_curve$region_name.
#'
#' @importFrom cli cli_abort
#'
check_regions <- function(regions) {
  region_names <- levels(regional_curves()$region_name)
  regions_missing <- regions[!(regions %in% region_names)]

  if(!is.character(regions)) {
    cli_abort(c(
      "x" = "{.arg regions} must be a character vector."))
  }
  if(length(regions_missing) > 0) {
    cli_abort(c(
      "x" = "Region{?s} '{regions_missing}' {?is/are} not in `regional_curve$region_name`.",
      "i" = "Run {.run levels(RegionalCurves::regional_curves()$region_name)} for a list of valid regions."))
  }

  TRUE
}
