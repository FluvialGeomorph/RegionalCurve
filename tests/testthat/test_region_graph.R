test_that("check plot 1", {
  # Regions contains all 4 dimensions
  regions = c("MA", "VA Piedmont")
  dimension_types = c("width", "depth", "area", "discharge")
  p4 <- region_graph(regions, dimension_types)
  #p4

  expect_identical(colnames(p4$data),
                   c("region_name", "dimension", "drainage_area",
                     "value", "label"))
  expect_s3_class(p4, "ggplot")
  expect_s3_class(p4$scales, "ggproto")
})

test_that("check plot 2", {
  # Regions only contain 3 dimensions
  regions = c("Minnesota Eastern", "Minnesota Western")
  dimension_types = c("width", "depth", "area", "discharge")
  p3 <- region_graph(regions, dimension_types)
  #p3

  expect_identical(colnames(p3$data),
                   c("region_name", "dimension", "drainage_area",
                     "value", "label"))
  expect_s3_class(p3, "ggplot")
  expect_s3_class(p3$scales, "ggproto")
})
