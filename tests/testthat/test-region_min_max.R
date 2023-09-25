test_that("data frame outout", {
  df <- region_min_max("USA")

  expect_s3_class(df, "data.frame")
  expect_true("region_name" %in% colnames(df))
  expect_true("dimension" %in% colnames(df))
  expect_true("drainage_area" %in% colnames(df))
  expect_true("value" %in% colnames(df))
})
