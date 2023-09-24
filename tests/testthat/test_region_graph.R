# Regions contains all 4 dimensions
regions_4 = c("MA", "VA Piedmont")
dimension_types_4 = c("width", "depth", "area", "discharge")
p4 <- region_graph(regions_4, dimension_types_4)
#p4

# Regions only contain 3 dimensions
regions_3 = c("Minnesota Eastern", "Minnesota Western")
dimension_types_3 = c("width", "depth", "area", "discharge")
p3 <- region_graph(regions_3, dimension_types_3)
#p3

test_that("created plot exists", {
  expect_s3_class(p4, "ggplot")
  expect_s3_class(p4$scales, "ggproto")
  expect_s3_class(p3, "ggplot")
  expect_s3_class(p3$scales, "ggproto")
})

test_that("check data", {
  expect_identical(colnames(p4$data),
                   c("region_name", "dimension", "drainage_area",
                     "value", "label"))
  expect_identical(colnames(p3$data),
                   c("region_name", "dimension", "drainage_area",
                     "value", "label"))
})
