regions = c("Minnesota Eastern", "Minnesota Western")
df <- region_min_max(regions)

test_that("check fields", {
  expect_true(is.data.frame(df))
  expect_true("region_name" %in% colnames(df))
  expect_true("dimension" %in% colnames(df))
  expect_true("drainage_area" %in% colnames(df))
  expect_true("value" %in% colnames(df))
})

test_that("check data", {
  expect_identical(unique(df$region_name),
                   c("Minnesota Eastern", "Minnesota Western"))
  expect_identical(unique(df$dimension),
                   c("width", "depth", "area"))
  expect_equal(unique(df$drainage_area), c(0.6, 1100.0, 7.5, 13500))
  expect_equal(df$value,
               c(5.2605615, 158.7032302, 0.7064004, 4.6712146, 3.7031363,
                 742.0961949, 12.6258240, 229.1255963, 1.2848727, 6.8614120,
                 16.2275708, 1572.6091379))
})
