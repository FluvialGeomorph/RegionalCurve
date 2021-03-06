# This script records the steps used to create the package
# This script follows the steps in the cheatsheet below
# https://www.rstudio.com/wp-content/uploads/2015/06/devtools-cheatsheet.pdf

library(devtools)
library(usethis)

## Package Structure
# Ignore this file
devtools::use_build_ignore("create_package_steps.R")


## Setup
# Add the following line to DESCRIPTION to support .rda file compression
# Depends: R (>= 2.10)

# Use packages needed by functions, vignettes, etc.
devtools::use_package("dplyr", "Suggests")
devtools::use_package("kableExtra", "Suggests")
devtools::use_package("tidyr", "Suggests")


## Write Code
# Added RHG.R and RHG_graph_coefficients.R functions


## Test
# Create the testing infrastructure
devtools::use_testthat()


# Run the tests
devtools::test()


## Document
# Add roxygen2 comments to .R files
# Delete the original NAMESPACE file (document() will recreate)
devtools::document()

# Add qpdf.exe to the path to compress pdf's to resolve R CMD CHECK warnings

# Use .Rmd file to build Readme
devtools::use_readme_rmd()

# Add badges to Readme
badgecreatr::badgeplacer(status = "active")


## Add Data
# Create the /data-raw folder and add to .Rbuildignore
usethis::use_data_raw()

# Use the `Regional_Curve_Database.Rmd` file to process the data

# Add regional_curve to data
usethis::use_data(regional_curve, overwrite = TRUE)

# Add regional_curve_graphs to R/sysdata.rda
usethis::use_data(regional_curve_graphs, internal = TRUE, overwrite = TRUE)


## Organize
# Update the package documentation
devtools::document()

# Update README.Rmd
# after making changes to README.RMD
#   * knit the README.Rmd to produce the .md file
#   * delete the YAML header from the README.md file
#   * delete the README.html file

## Teach
# Create the vignette infrastructure
devtools::use_vignette()

# Build the vignette (re-run after each set of edits)
devtools::build_vignettes()


## Check
# Use devtools::check() as RStudio check fails when repository is stored on a
# network drive
devtools::check()


## Continuous Integration
# https://bookdown.org/rdpeng/RProgDA/continuous-integration.html
# Use travis to test on Linux
devtools::use_travis()
# Use AppVeyor to test on Windows
devtools::use_appveyor()

# Check status of Travis CI builds
# https://travis-ci.org/mpdougherty/RegionalCurve

# Check status of AppVeyor builds
# https://ci.appveyor.com/project/mpdougherty/regionalcurve

# Check status of test code coverage
# https://codecov.io/gh/mpdougherty/RegionalCurve

