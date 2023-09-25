test_that("check outputs", {
  df <- RHG_graph_coefficients(region = "Eastern United States",
                               drainageArea = 1,
                               dimensionType = "area")

  expect_s3_class(df, "data.frame")
  expect_true("region" %in% colnames(df))
  expect_true("drainageArea" %in% colnames(df))
  expect_true("dimensionType" %in% colnames(df))
  expect_true("m" %in% colnames(df))
  expect_true("a" %in% colnames(df))
  expect_true("rc.source" %in% colnames(df))
})

test_that("check values", {
  df <- RHG_graph_coefficients(region = "Eastern United States",
                               drainageArea = 1,
                               dimensionType = "area")

  expect_equal(df$m, 0.6602316, tolerance = 1e-4)
  expect_equal(df$a, 23, tolerance = 1e-4)
})
