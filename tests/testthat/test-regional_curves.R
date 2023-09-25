test_that("returns a data frame", {
  expect_s3_class(regional_curves(), "data.frame")
})

test_that("same as package data", {
  expect_identical(regional_curves(),
                   RegionalCurve::regional_curve)
})
