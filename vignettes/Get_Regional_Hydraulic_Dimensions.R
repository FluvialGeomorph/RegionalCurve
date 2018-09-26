## ----setup, include = FALSE----------------------------------------------
library(dplyr)
library(tidyr)
library(knitr)
library(kableExtra)
library(RegionalCurve)

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=FALSE, fig.cap="Regional Hydraulic Dimension by Drainage Area Studies Included in this Package."----
# Create a summary table describing dimensions available for each region
regional_curve %>%
spread(key = dimension, value = slope) %>%
group_by(region_name, reference) %>%
summarise(width     = any(width > 0), 
          depth     = any(depth > 0), 
          area      = any(area  > 0),
          discharge = any(discharge > 0)) %>%
kable(format = "html", 
      col.names = c("Region","Reference","Width","Depth","Area","Discharge")) %>%
kable_styling()

## ------------------------------------------------------------------------
# Calculate the discharge for a 200 sq mi watershed in Massachusetts.
RHG(region = "MA", drainageArea = 200,   dimensionType = "width")

## ------------------------------------------------------------------------
# Determine the available regions
levels(regional_curve$region_name)

## ------------------------------------------------------------------------
# Determine which dimensions were calculated for the Eastern United States region
regional_curve[regional_curve$region_name == "Eastern United States", c("dimension")]

