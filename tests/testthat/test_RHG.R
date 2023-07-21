context("RHG")

test_that("dimensionType = 'width'", {
  expect_equal(RHG(region = "MA", drainageArea = 1,   dimensionType = "width"),
               15.04180, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 10,  dimensionType = "width"),
               38.11534, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 50,  dimensionType = "width"),
               73.00354, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 100, dimensionType = "width"),
               96.58280, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 150, dimensionType = "width"),
               113.7642, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 200, dimensionType = "width"),
               127.7779, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 250, dimensionType = "width"),
               139.8260, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 300, dimensionType = "width"),
               150.5086, tolerance = 1e-4)
})

test_that("dimensionType = 'depth'", {
  expect_equal(RHG(region = "MA", drainageArea = 1,   dimensionType = "depth"),
               0.950200, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 10,  dimensionType = "depth"),
               1.878510, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 50,  dimensionType = "depth"),
               3.024894, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 100, dimensionType = "depth"),
               3.713770, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 150, dimensionType = "depth"),
               4.187338, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 200, dimensionType = "depth"),
               4.559528, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 250, dimensionType = "depth"),
               4.870856, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 300, dimensionType = "depth"),
               5.140945, tolerance = 1e-4)
})

test_that("dimensionType = 'area'", {
  expect_equal(RHG(region = "MA", drainageArea = 1,   dimensionType = "area"),
               14.1156, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 10,  dimensionType = "area"),
               71.17039, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 50,  dimensionType = "area"),
               220.4934, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 100, dimensionType = "area"),
               358.8388, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 150, dimensionType = "area"),
               477.1128, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 200, dimensionType = "area"),
               583.9868, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 250, dimensionType = "area"),
               683.1121, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 300, dimensionType = "area"),
               776.4701, tolerance = 1e-4)
})

test_that("dimensionType = 'discharge'", {
  expect_equal(RHG(region = "MA", drainageArea = 1,   dimensionType = "discharge"),
               37.13640, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 10,  dimensionType = "discharge"),
               234.0991, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 50,  dimensionType = "discharge"),
               847.8055, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 100, dimensionType = "discharge"),
               1475.706, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 150, dimensionType = "discharge"),
               2040.809, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 200, dimensionType = "discharge"),
               2568.641, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 250, dimensionType = "discharge"),
               3070.384, tolerance = 1e-4)
  expect_equal(RHG(region = "MA", drainageArea = 300, dimensionType = "discharge"),
               3552.27, tolerance = 1e-4)
})

test_that("missing dimensionType returns NA", {
  expect_equal(is.na(RHG(region = "Eastern Highlands", 300, "depth")),
               TRUE)
  expect_equal(is.na(RHG(region = "Eastern Highlands", 300, "area")),
               TRUE)
  expect_equal(is.na(RHG(region = "Eastern Highlands", 300, "discharge")),
               TRUE)
  expect_equal(is.na(RHG(region = "Eastern Highlands", 300, "width")),
               FALSE)
})


test_that("vector input", {
  expect_contains(RHG(region = c("MA", "MA"),
                      drainageArea = c(1, 1),
                      dimensionType = c("width", "depth")),
                  c(15.04180, 0.950200))
})
