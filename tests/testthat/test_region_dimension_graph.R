regions = c("Minnesota Eastern", "Minnesota Western")
dimension_type = "width"
p <- region_dimension_graph(c("Minnesota Eastern", "Minnesota Western"),
                            dimension_type = "width")

test_that("created plot exists", {
  expect_s3_class(p, "ggplot")
})

test_that("check labels", {
  expect_identical(p$labels$x, "Drainage Area (sq miles)")
  expect_identical(p$labels$y, "Width (feet)")
})

test_that("check data", {
  expect_identical(unique(p$data$region_name),
                   c("Minnesota Eastern", "Minnesota Western"))
  expect_identical(unique(p$data$dimension), "width")
  expect_equal(p$data$drainage_area, c(0.6, 1100.0, 7.5, 13500))
  expect_equal(p$data$value, c(5.260561, 158.703230, 12.625824, 229.125596))
})
