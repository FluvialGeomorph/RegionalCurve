test_that("check region in package", {
  expect_true(check_regions("USA"))
  expect_true(check_regions("VT"))
  expect_true(check_regions("Mid-Atlantic"))
})

test_that("check errors", {
  expect_snapshot(check_regions("Foo"), error = TRUE)
  expect_snapshot(check_regions("Bar"), error = TRUE)
  expect_snapshot(check_regions(c("Bar", "Foo")), error = TRUE)
  expect_snapshot(check_regions(c("Bar", "Foo", "USA")), error = TRUE)
  expect_snapshot(check_regions(7), error = TRUE)
})
