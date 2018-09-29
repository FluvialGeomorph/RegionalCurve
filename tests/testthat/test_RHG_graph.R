context("RHG_graph")
# Compare to values in the regional_curve_graphs data frame

test_that("dimensionType = 'area'", {
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1,
                         dimensionType = "area"),
               23.0,   tolerance = 1e-4)
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1000,
                         dimensionType = "area"),
               2200.0, tolerance = 1e-4)
})

test_that("dimensionType = 'width'", {
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1,
                         dimensionType = "width"),
               15.0,   tolerance = 1e-4)
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1000,
                         dimensionType = "width"),
               205.0,  tolerance = 1e-4)
})
test_that("dimensionType = 'depth'", {
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1,
                         dimensionType = "depth"),
               1.6,    tolerance = 1e-4)
  expect_equal(RHG_graph(region = "Eastern United States", drainageArea = 1000,
                         dimensionType = "depth"),
               11.0,   tolerance = 1e-4)
})
