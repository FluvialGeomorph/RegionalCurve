## -----------------------------------------------------------------------------
library(RegionalCurve)
library(patchwork)

## -----------------------------------------------------------------------------
regions = c("Minnesota Eastern", "Minnesota Western")
MN_width <- region_dimension_graph(regions, "width")
MN_depth <- region_dimension_graph(regions, "depth")
MN_area <- region_dimension_graph(regions, "area")

## ----fig.height=6, fig.width=5.5----------------------------------------------
MN_width / MN_depth / MN_area

## ----fig.height=6, fig.width=5.5----------------------------------------------
regions_4 = c("Minnesota Eastern", "Minnesota Western",
              "Southern Driftless", "Lower Southern Driftless")
dimension_types_4 = c("width", "depth", "area")
p <- region_graph(regions_4, dimension_types_4)
p

