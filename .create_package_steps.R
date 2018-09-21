# This script records the steps used to create the package
# This script follows the steps in the cheatsheet below
# https://www.rstudio.com/wp-content/uploads/2015/06/devtools-cheatsheet.pdf

library(devtools)

## Package Structure
# Ignore this file
devtools::add_build_ignore(".create_package_steps.R")

## Setup


## Write Code


## Test
# Create the testing infrastructure
devtools::use_testthat()


## Document
# Add roxygen2 comments to .R files
# Delete the original NAMESPACE file (document() will recreate)
devtools::document()


## Add Data
# Create the /data-raw folder and add to .Rbuildignore
devtools::use_data_raw()

# Use the `Regional_Curve_Database.Rmd` file to process the data

# Add regional_curve to data
devtools::use_data(regional_curve, overwrite = TRUE)

# Add regional_curve_graphs to R/sysdata.rda
devtools::use_data(regional_curve_graphs, internal = TRUE, overwrite = TRUE)


## Organize


## Teach


