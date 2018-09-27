context("regional_curve")

test_that("Check that key fields exist by name", {
  expect_true("region_name" %in% colnames(regional_curve))
  expect_true("dimension" %in% colnames(regional_curve))
  expect_true("intercept" %in% colnames(regional_curve))
  expect_true("slope" %in% colnames(regional_curve))
})

test_that("Check that key fields are of the correct data type", {
  expect_true(is.factor(regional_curve$region_name))
  expect_true(is.factor(regional_curve$dimension))
  expect_true(is.numeric(regional_curve$intercept))
  expect_true(is.numeric(regional_curve$slope))
})
