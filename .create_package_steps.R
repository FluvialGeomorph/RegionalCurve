# This script records the steps used to create the package

library(devtools)

# data-raw
# Create the /data-raw folder and add to .Rbuildignore
devtools::use_data_raw()

# Create the Regional_Curve_Database.Rmd file to process the data

# Add the data to the package
devtools::use_data(regional_curve, overwrite = TRUE)

