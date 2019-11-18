<!-- rmarkdown v1 -->
<!-- README.md is generated from README.Rmd. Please edit that file -->

# RegionalCurve
An R Package of Hydraulic Regional Curve Relationships <img src="man/figures/castle.png" align="right" />

## Package Status

[![Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle)
[![Project Status: Active The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![packageversion](https://img.shields.io/badge/Package%20version-0.1.1-orange.svg?style=flat-square)](commits/master)
[![Last-changedate](https://img.shields.io/badge/last%20change-2019--11--18-yellowgreen.svg)](/commits/master)
[![Licence](https://img.shields.io/badge/licence-CC0-blue.svg)](http://choosealicense.com/licenses/cc0-1.0/)
[![Travis-CI Build Status](https://travis-ci.org/mpdougherty/RegionalCurve.svg?branch=master)](https://travis-ci.org/mpdougherty/RegionalCurve)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mpdougherty/regionalcurve?branch=master&svg=true)](https://ci.appveyor.com/project/mpdougherty/regionalcurve) [![codecov](https://codecov.io/github/mpdougherty/regionalcurve/branch/master/graphs/badge.svg)](https://codecov.io/github/mpdougherty/regionalcurve) 

## Need
Regional hydraulic dimension relationships have been produced in great numbers since the first development of the approach by Dunne and Leopold (1978). Although these regional relationships are in wide use, the authors are not aware of a comprehensive compilation of regional hydraulic dimension relationship studies into a single database that exists as open source. The `RegionalCurve` package seeks to fill that gap by:
* Compiling regional hydraulic relationships into a single database.
* Providing assessor functions to streamline application of these relationships in other studies.

## Funding
Funding for development and maintenance of `RegionalCurve` was provided by the 
US Army Corps of Engineers (USACE) [Ecosystem Management and Restoration 
Research Program (EMRRP)](https://emrrp.el.erdc.dren.mil). <img src="man/figures/EMRRP_logo_300.png" align="right" />

## Authors
* Michael Dougherty, Geographer, U.S. Army Corps of Engineers
* Christopher Haring, Fluvial Geomorphologist/Research Physical Scientist, U.S. Army Corps of Engineers

## Install
To install the `RegionalCurve` package, install from GitHub using the 
`devtools` package:

```r
library(devtools)
install_github(repo = "mpdougherty/RegionalCurve", build_vignettes = TRUE)
```
## Vignettes
View the vignettes to get started using the package.

```r
# View the vignettes in a web browser
browseVignettes("RegionalCurve")

# Open a specific vignette in the RStudio help window
vignette("Get_Regional_Hydraulic_Dimensions")
```

## Calculating Hyrdaulic Dimensions
To easily use the data in this database several assessor functions were created to calculate an estimate of a specified hydraulic dimension for any given drainage area. The `RHG` (Regional Hydraulic Geometry) function computes the hydraulic geometry dimension (cross sectional area, width, depth, discharge) from a built-in data frame of regional hydraulic equation coefficients (`regional_curve`). 


```r
# Calculate the discharge for a 200 sq mi watershed in Massachusetts.
RHG(region = "MA", drainageArea = 200,   dimensionType = "width")
#> [1] 127.7779
```

The units of the value returned from the `RHG` function will depend on the requested dimension (see the `RHG` function help for details). In this case, the requested dimension was `width`, so the units will be in feet. 

To determine which regions are available, the `regional_curve` data frame can be queried. 


```r
# Determine the available regions
levels(regional_curve$region_name)
#>  [1] "Central and Southern AZ"                                                                
#>  [2] "Eastern - Appalachian Plateau, New England, Valley and Ridge"                           
#>  [3] "Eastern - Coastal Plain"                                                                
#>  [4] "Eastern - Piedmont"                                                                     
#>  [5] "Eastern AZ/NM"                                                                          
#>  [6] "Eastern Highlands"                                                                      
#>  [7] "Eastern United States"                                                                  
#>  [8] "IL River LTE 120"                                                                       
#>  [9] "IL River LTE 300"                                                                       
#> [10] "IL River Panther Creek"                                                                 
#> [11] "Illinois River"                                                                         
#> [12] "IN Central Till Plain"                                                                  
#> [13] "IN Northern Moraine and Lake"                                                           
#> [14] "IN Southern Hills and Lowlands"                                                         
#> [15] "Lower Southern Driftless"                                                               
#> [16] "MA"                                                                                     
#> [17] "MD Allegheny Plateau/Valley and Ridge"                                                  
#> [18] "MD Eastern Coastal Plain"                                                               
#> [19] "MD Piedmont"                                                                            
#> [20] "MD Western Coastal Plain"                                                               
#> [21] "ME Coastal and Central"                                                                 
#> [22] "MI Southern Lower Ecoregion"                                                            
#> [23] "Mid-Atlantic"                                                                           
#> [24] "Minnesota Eastern"                                                                      
#> [25] "Minnesota Western"                                                                      
#> [26] "NC Coastal Plain"                                                                       
#> [27] "NC Mountains"                                                                           
#> [28] "NC Piedmont Rural"                                                                      
#> [29] "NC Piedmont Urban"                                                                      
#> [30] "New England"                                                                            
#> [31] "NH"                                                                                     
#> [32] "Northeast - Appalachian Plateau, Coastal Plain, New England, Piedmont, Valley and Ridge"
#> [33] "Northeast - Appalachian Plateau, New England, Piedmont, Valley and Ridge"               
#> [34] "Northern Appalachians"                                                                  
#> [35] "NY Hydrologic Region 1/2"                                                               
#> [36] "NY Hydrologic Region 3"                                                                 
#> [37] "NY Hydrologic Region 4/4a"                                                              
#> [38] "NY Hydrologic Region 5"                                                                 
#> [39] "NY Hydrologic Region 6"                                                                 
#> [40] "NY Hydrologic Region 7"                                                                 
#> [41] "OH Region A"                                                                            
#> [42] "OH Region B"                                                                            
#> [43] "ON Southern"                                                                            
#> [44] "PA Carbonate Areas"                                                                     
#> [45] "PA Non-Carbonate Areas"                                                                 
#> [46] "PA Piedmont 1"                                                                          
#> [47] "PA Piedmont 2"                                                                          
#> [48] "Pacific Maritime Mountain"                                                              
#> [49] "Pacific Northwest"                                                                      
#> [50] "San Francisco Bay"                                                                      
#> [51] "Southern Appalachians"                                                                  
#> [52] "Southern Driftless"                                                                     
#> [53] "Upper Green River"                                                                      
#> [54] "Upper Salmon River"                                                                     
#> [55] "VA Piedmont"                                                                            
#> [56] "VA, MD Coastal Plain"                                                                   
#> [57] "VA, MD, WV Valley and Ridge"                                                            
#> [58] "VT"                                                                                     
#> [59] "West Interior Basin and Range"                                                          
#> [60] "Western Cordillera"                                                                     
#> [61] "WV Appalachian Plateau"                                                                 
#> [62] "WV Eastern Valley and Ridge"                                                            
#> [63] "WV Western Appalachian Plateau"
```

This list of regions can be used to determine which regions are contained in the database and the input `region` string value to use for the `RHG` function. 


Once you have determined which region to use, you will need to determine which dimensions that study derived a relationship for. Not all studies derive relationships for all hydraulic dimensions. 


```r
# Determine which dimensions were calculated for the Eastern United States region
regional_curve[regional_curve$region_name == "Eastern United States", c("dimension")]
#> [1] area  width depth
#> Levels: area depth discharge width
```

As you can see, only area, width, and depth are available. Discharge was not derived by this study. 

## Regional Analyses Contained in this Database
The table below lists the regional hydraulic dimension relationship studies included in this package. It lists the dimensions calculated for each regional analysis. 
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Region </th>
   <th style="text-align:left;"> Reference </th>
   <th style="text-align:left;"> Width </th>
   <th style="text-align:left;"> Depth </th>
   <th style="text-align:left;"> Area </th>
   <th style="text-align:left;"> Discharge </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Central and Southern AZ </td>
   <td style="text-align:left;"> Moody et al (2003) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern - Appalachian Plateau, New England, Valley and Ridge </td>
   <td style="text-align:left;"> Johnson &amp; Fecko (2008) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern - Coastal Plain </td>
   <td style="text-align:left;"> Johnson &amp; Fecko (2008) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern - Piedmont </td>
   <td style="text-align:left;"> Johnson &amp; Fecko (2008) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern AZ/NM </td>
   <td style="text-align:left;"> Moody et al (2003) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern Highlands </td>
   <td style="text-align:left;"> Faustini et al (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Eastern United States </td>
   <td style="text-align:left;"> Dunne &amp; Leopold (1978) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IL River LTE 120 </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IL River LTE 300 </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IL River Panther Creek </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Illinois River </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IN Central Till Plain </td>
   <td style="text-align:left;"> Robinson (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IN Northern Moraine and Lake </td>
   <td style="text-align:left;"> Robinson (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> IN Southern Hills and Lowlands </td>
   <td style="text-align:left;"> Robinson (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lower Southern Driftless </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MA </td>
   <td style="text-align:left;"> Bent &amp; Waite (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MD Allegheny Plateau/Valley and Ridge </td>
   <td style="text-align:left;"> McCandless (2003a) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MD Eastern Coastal Plain </td>
   <td style="text-align:left;"> McCandless (2003b) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MD Piedmont </td>
   <td style="text-align:left;"> McCandless &amp; Everett (2002) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MD Western Coastal Plain </td>
   <td style="text-align:left;"> McCandless (2003b) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ME Coastal and Central </td>
   <td style="text-align:left;"> Dudley (2004) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> MI Southern Lower Ecoregion </td>
   <td style="text-align:left;"> Rachol &amp; Boley-Morse (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Mid-Atlantic </td>
   <td style="text-align:left;"> Faustini et al (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Minnesota Eastern </td>
   <td style="text-align:left;"> MN DNR </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Minnesota Western </td>
   <td style="text-align:left;"> MN DNR </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NC Coastal Plain </td>
   <td style="text-align:left;"> Sweet &amp; Geratz (2003) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NC Mountains </td>
   <td style="text-align:left;"> Harman et al. (1999) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NC Piedmont Rural </td>
   <td style="text-align:left;"> Harman et al. (1999) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NC Piedmont Urban </td>
   <td style="text-align:left;"> Doll et al. (2002) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> New England </td>
   <td style="text-align:left;"> Faustini et al (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NH </td>
   <td style="text-align:left;"> Csiiki (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Northeast - Appalachian Plateau, Coastal Plain, New England, Piedmont, Valley and Ridge </td>
   <td style="text-align:left;"> Bent (2006) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Northeast - Appalachian Plateau, New England, Piedmont, Valley and Ridge </td>
   <td style="text-align:left;"> Bent &amp; Waite (2013) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Northern Appalachians </td>
   <td style="text-align:left;"> Faustini et al (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 1/2 </td>
   <td style="text-align:left;"> Mulvihill et al. (2007) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 3 </td>
   <td style="text-align:left;"> Mulvihill &amp; Baldigo (2007) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 4/4a </td>
   <td style="text-align:left;"> Miller &amp; Davis (2003) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 5 </td>
   <td style="text-align:left;"> Westergard et al. (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 6 </td>
   <td style="text-align:left;"> Mulvihill et al. (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> NY Hydrologic Region 7 </td>
   <td style="text-align:left;"> Mulvihill et al. (2006) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OH Region A </td>
   <td style="text-align:left;"> Sherwood &amp; Huitger (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> OH Region B </td>
   <td style="text-align:left;"> Sherwood &amp; Huitger (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ON Southern </td>
   <td style="text-align:left;"> Annable (1996a, b) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PA Carbonate Areas </td>
   <td style="text-align:left;"> Chaplin (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PA Non-Carbonate Areas </td>
   <td style="text-align:left;"> Chaplin (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PA Piedmont 1 </td>
   <td style="text-align:left;"> White (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PA Piedmont 2 </td>
   <td style="text-align:left;"> Cinotto (2003) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pacific Maritime Mountain </td>
   <td style="text-align:left;"> Castro &amp; Jackson (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pacific Northwest </td>
   <td style="text-align:left;"> Castro &amp; Jackson (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> San Francisco Bay </td>
   <td style="text-align:left;"> Dunne &amp; Leopold (1978) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Southern Appalachians </td>
   <td style="text-align:left;"> Faustini et al (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Southern Driftless </td>
   <td style="text-align:left;"> Haring (2019) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Upper Green River </td>
   <td style="text-align:left;"> Dunne &amp; Leopold (1978) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Upper Salmon River </td>
   <td style="text-align:left;"> Dunne &amp; Leopold (1978) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VA Piedmont </td>
   <td style="text-align:left;"> Lotspeich (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VA, MD Coastal Plain </td>
   <td style="text-align:left;"> Kristolic &amp; Chaplin (2007) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VA, MD, WV Valley and Ridge </td>
   <td style="text-align:left;"> Keaton et al (2005) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> VT </td>
   <td style="text-align:left;"> Jaquith &amp; Kline (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> West Interior Basin and Range </td>
   <td style="text-align:left;"> Castro &amp; Jackson (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Western Cordillera </td>
   <td style="text-align:left;"> Castro &amp; Jackson (2001) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WV Appalachian Plateau </td>
   <td style="text-align:left;"> Messinger (2009) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WV Eastern Valley and Ridge </td>
   <td style="text-align:left;"> Messinger &amp;Wiley (2004) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
  <tr>
   <td style="text-align:left;"> WV Western Appalachian Plateau </td>
   <td style="text-align:left;"> Messinger &amp;Wiley (2004) </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> TRUE </td>
   <td style="text-align:left;"> NA </td>
  </tr>
</tbody>
</table>
