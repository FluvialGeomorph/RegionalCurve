<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- rmarkdown::render(input="README.Rmd", output_file = "README.md", output_format = "md_document") -->

<img src="man/figures/rc-3-logo.png" width="250" align="right"/>

# RegionalCurve

An R Package of Hydraulic Regional Curve Relationships

## Package Status

[![Maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle)
[![Project Status: Active The project has reached a stable, usable state
and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![packageversion](https://img.shields.io/badge/Package%20version-0.1.6-orange.svg?style=flat-square)](commits/master)
[![Last-changedate](https://img.shields.io/badge/last%20change-%60r%20gsub('-',%20'--',%20Sys.Date())%60-yellowgreen.svg)](/commits/master)
[![Licence](https://img.shields.io/badge/licence-CC0-blue.svg)](http://choosealicense.com/licenses/cc0-1.0/)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mpdougherty/regionalcurve?branch=master&svg=true)](https://ci.appveyor.com/project/mpdougherty/regionalcurve)
[![codecov](https://codecov.io/github/mpdougherty/regionalcurve/branch/master/graphs/badge.svg)](https://codecov.io/github/mpdougherty/regionalcurve)

## Need

Regional hydraulic dimension relationships have been produced in great
numbers since the first development of the approach by Dunne and Leopold
(1978). Although these regional relationships are in wide use, the
authors are not aware of a comprehensive compilation of regional
hydraulic dimension relationship studies into a single database that
exists as open source. The `RegionalCurve` package seeks to fill that
gap by:

-   Compiling regional hydraulic relationships into a single database.
-   Providing assessor functions to streamline application of these
    relationships in other studies.

<img src="man/figures/HDQLO-03_h120.jpg" width="125" align="right"/>

## Funding

Funding for development and maintenance of FluvialGeomorph has been
provided by the following US Army Corps of Engineers (USACE) programs:

-   [Ecosystem Management and Restoration Research Program
    (EMRRP)](https://emrrp.el.erdc.dren.mil).
-   [Regional Sediment Management Program
    (RSM)](https://rsm.usace.army.mil/)
-   [Mississippi River Geomorphology and Potamology Program
    (MRG&P)](https://www.mvd.usace.army.mil/Missions/Mississippi-River-Science-Technology/MS-River-Geomorphology-Potamology/)
-   [Flood Risk Management Program
    (FRM)](https://www.iwr.usace.army.mil/Missions/Flood-Risk-Management/Flood-Risk-Management-Program/)

<img src="man/figures/FRMP_300.png" height="75" align="right"/><img src="man/figures/MRG&amp;P_300.png" height="75" align="right"/><img src="man/figures/RSMlogo.png" height="75" align="right"/><img src="man/figures/EMRRP_logo_300.png" height="75" align="right"/>

## Authors

-   Michael Dougherty, Geographer, U.S. Army Corps of Engineers
    <a itemprop="sameAs" content="https://orcid.org/0000-0002-1465-5927" href="https://orcid.org/0000-0002-1465-5927" target="orcid.widget" rel="me noopener noreferrer" style="vertical-align:top;"><img src="https://orcid.org/sites/default/files/images/orcid_16x16.png" alt="ORCID iD icon" style="width:1em;margin-right:.5em;"/>https://orcid.org/0000-0002-1465-5927</a>
-   Christopher Haring, Fluvial Geomorphologist/Research Physical
    Scientist, U.S. Army Corps of Engineers

## Install

To install the `RegionalCurve` package, install from GitHub using the
`devtools` package:

    library(devtools)
    install_github(repo = "FluvialGeomorph/RegionalCurve", build_vignettes = TRUE)

## Vignettes

View the vignettes to get started using the package.

    # View the vignettes in a web browser
    browseVignettes("RegionalCurve")

    # Open a specific vignette in the RStudio help window
    vignette("Get_Regional_Hydraulic_Dimensions")

## Calculating Hyrdaulic Dimensions

To easily use the data in this database several assessor functions were
created to calculate an estimate of a specified hydraulic dimension for
any given drainage area. The `RHG` (Regional Hydraulic Geometry)
function computes the hydraulic geometry dimension (cross sectional
area, width, depth, discharge) from a built-in data frame of regional
hydraulic equation coefficients (`regional_curve`).

    # Calculate the discharge for a 200 sq mi watershed in Massachusetts.
    RHG(region = "MA", drainageArea = 200,   dimensionType = "width")

The units of the value returned from the `RHG` function will depend on
the requested dimension (see the `RHG` function help for details). In
this case, the requested dimension was `width`, so the units will be in
feet.

To determine which regions are available, the `regional_curve` data
frame can be queried.

    # Determine the available regions
    levels(regional_curve$region_name)

This list of regions can be used to determine which regions are
contained in the database and the input `region` string value to use for
the `RHG` function.

Once you have determined which region to use, you will need to determine
which dimensions that study derived a relationship for. Not all studies
derive relationships for all hydraulic dimensions.

    # Determine which dimensions were calculated for the Eastern United States region
    regional_curve[regional_curve$region_name == "Eastern United States", c("dimension")]

As you can see, only area, width, and depth are available. Discharge was
not derived by this study.

## Regional Analyses Contained in this Database

The table below lists the regional hydraulic dimension relationship
studies included in this package. It lists the dimensions calculated for
each regional analysis.

<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Region
</th>
<th style="text-align:left;">
Reference
</th>
<th style="text-align:left;">
Width
</th>
<th style="text-align:left;">
Depth
</th>
<th style="text-align:left;">
Area
</th>
<th style="text-align:left;">
Discharge
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Altlantic Plain
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Appalachain Highlands
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Central and Southern AZ
</td>
<td style="text-align:left;">
Moody et al (2003)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern - Appalachian Plateau, New England, Valley and Ridge
</td>
<td style="text-align:left;">
Johnson & Fecko (2008)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern - Coastal Plain
</td>
<td style="text-align:left;">
Johnson & Fecko (2008)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern - Piedmont
</td>
<td style="text-align:left;">
Johnson & Fecko (2008)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern AZ/NM
</td>
<td style="text-align:left;">
Moody et al (2003)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern Highlands
</td>
<td style="text-align:left;">
Faustini et al (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Eastern United States
</td>
<td style="text-align:left;">
Dunne & Leopold (1978)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
IL River LTE 120
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
IL River LTE 300
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
IL River Panther Creek
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Illinois River
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
IN Central Till Plain
</td>
<td style="text-align:left;">
Robinson (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
IN Northern Moraine and Lake
</td>
<td style="text-align:left;">
Robinson (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
IN Southern Hills and Lowlands
</td>
<td style="text-align:left;">
Robinson (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Interior Highlands
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Interior Plains
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Intermontane Plateau
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
KY Bluegrass
</td>
<td style="text-align:left;">
Parola et al (2007)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Laurentian Upland
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Lower Southern Driftless
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MA
</td>
<td style="text-align:left;">
Bent & Waite (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MD Allegheny Plateau/Valley and Ridge
</td>
<td style="text-align:left;">
McCandless (2003a)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MD Eastern Coastal Plain
</td>
<td style="text-align:left;">
McCandless (2003b)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MD Piedmont
</td>
<td style="text-align:left;">
McCandless & Everett (2002)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MD Western Coastal Plain
</td>
<td style="text-align:left;">
McCandless (2003b)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
ME Coastal and Central
</td>
<td style="text-align:left;">
Dudley (2004)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
MI Southern Lower Ecoregion
</td>
<td style="text-align:left;">
Rachol & Boley-Morse (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Mid-Atlantic
</td>
<td style="text-align:left;">
Faustini et al (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Minnesota Eastern
</td>
<td style="text-align:left;">
MN DNR
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Minnesota Western
</td>
<td style="text-align:left;">
MN DNR
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
NC Coastal Plain
</td>
<td style="text-align:left;">
Sweet & Geratz (2003)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NC Mountains
</td>
<td style="text-align:left;">
Harman et al. (1999)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NC Piedmont Rural
</td>
<td style="text-align:left;">
Harman et al. (1999)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NC Piedmont Urban
</td>
<td style="text-align:left;">
Doll et al. (2002)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
New England
</td>
<td style="text-align:left;">
Faustini et al (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
NH
</td>
<td style="text-align:left;">
Csiiki (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Northeast - Appalachian Plateau, Coastal Plain, New England, Piedmont,
Valley and Ridge
</td>
<td style="text-align:left;">
Bent (2006)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Northeast - Appalachian Plateau, New England, Piedmont, Valley and Ridge
</td>
<td style="text-align:left;">
Bent & Waite (2013)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Northern Appalachians
</td>
<td style="text-align:left;">
Faustini et al (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 1/2
</td>
<td style="text-align:left;">
Mulvihill et al. (2007)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 3
</td>
<td style="text-align:left;">
Mulvihill & Baldigo (2007)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 4/4a
</td>
<td style="text-align:left;">
Miller & Davis (2003)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 5
</td>
<td style="text-align:left;">
Westergard et al. (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 6
</td>
<td style="text-align:left;">
Mulvihill et al. (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
NY Hydrologic Region 7
</td>
<td style="text-align:left;">
Mulvihill et al. (2006)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
OH Region A
</td>
<td style="text-align:left;">
Sherwood & Huitger (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
OH Region B
</td>
<td style="text-align:left;">
Sherwood & Huitger (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
ON Southern
</td>
<td style="text-align:left;">
Annable (1996a, b)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
PA Carbonate Areas
</td>
<td style="text-align:left;">
Chaplin (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
PA Non-Carbonate Areas
</td>
<td style="text-align:left;">
Chaplin (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
PA Piedmont 1
</td>
<td style="text-align:left;">
White (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
PA Piedmont 2
</td>
<td style="text-align:left;">
Cinotto (2003)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Pacific Maritime Mountain
</td>
<td style="text-align:left;">
Castro & Jackson (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Pacific Mountain System
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Pacific Northwest
</td>
<td style="text-align:left;">
Castro & Jackson (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Rocky Mountain System
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
San Francisco Bay
</td>
<td style="text-align:left;">
Dunne & Leopold (1978)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Southern Appalachians
</td>
<td style="text-align:left;">
Faustini et al (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Southern Driftless
</td>
<td style="text-align:left;">
Haring (2019)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Upper Green River
</td>
<td style="text-align:left;">
Dunne & Leopold (1978)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
Upper Salmon River
</td>
<td style="text-align:left;">
Dunne & Leopold (1978)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
USA
</td>
<td style="text-align:left;">
Bieger et al (2015)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
VA Piedmont
</td>
<td style="text-align:left;">
Lotspeich (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
VA, MD Coastal Plain
</td>
<td style="text-align:left;">
Kristolic & Chaplin (2007)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
VA, MD, WV Valley and Ridge
</td>
<td style="text-align:left;">
Keaton et al (2005)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
VT
</td>
<td style="text-align:left;">
Jaquith & Kline (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
West Interior Basin and Range
</td>
<td style="text-align:left;">
Castro & Jackson (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
Western Cordillera
</td>
<td style="text-align:left;">
Castro & Jackson (2001)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
WV Appalachian Plateau
</td>
<td style="text-align:left;">
Messinger (2009)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
</tr>
<tr>
<td style="text-align:left;">
WV Eastern Valley and Ridge
</td>
<td style="text-align:left;">
Messinger &Wiley (2004)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
WV Western Appalachian Plateau
</td>
<td style="text-align:left;">
Messinger &Wiley (2004)
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
TRUE
</td>
<td style="text-align:left;">
NA
</td>
</tr>
</tbody>
</table>
