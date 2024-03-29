% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/region_min_max.R
\name{region_min_max}
\alias{region_min_max}
\title{Calculate Region Minimum and Maximum Dimensions}
\usage{
region_min_max(regions)
}
\arguments{
\item{regions}{character; A vector of region names that will be
displayed on the graph. For a complete list of
regions, see levels(regional_curve$region_name)
RegionalCurve::regional_curve$region_name.}
}
\value{
A data frame.
}
\description{
Calculates regional hydraulic dimensions for the minimum and
maximum drainage area values provided for a region.
}
\examples{
regions = c("Minnesota Eastern", "Minnesota Western")
df <- region_min_max(regions)

}
\seealso{
Other {data}: 
\code{\link{RHG_graph_coefficients}()},
\code{\link{RHG_graph}()},
\code{\link{regional_curves}()},
\code{\link{regional_curve}}
}
\concept{{data}}
