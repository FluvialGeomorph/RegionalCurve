test_that("drainageArea = 1, Area m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "area")$m,
               0.6602316, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "area")$a,
               23.0,      tolerance = 1e-4)
})

test_that("drainageArea = 1, Depth m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "depth")$m,
               0.2790909, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "depth")$a,
               1.6,       tolerance = 1e-4)
})

test_that("drainageArea = 1, Width m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "width")$m,
               0.3785542, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1, dimensionType = "width")$a,
               15.0,      tolerance = 1e-4)
})

test_that("drainageArea = 1000, Area m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "area")$m,
               0.6602316, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "area")$a,
               23.0,    tolerance = 1e-4)
})

test_that("drainageArea = 1000, Depth m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "depth")$m,
               0.2790909, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "depth")$a,
               1.6,      tolerance = 1e-4)
})

test_that("drainageArea = 1000, Width m and k", {
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "width")$m,
               0.3785542, tolerance = 1e-4)
  expect_equal(RHG_graph_coefficients(region = "Eastern United States",
                          drainageArea = 1000, dimensionType = "width")$a,
               15.0,     tolerance = 1e-4)
})
