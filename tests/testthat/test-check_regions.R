test_that("check region in package", {
  expect_true(check_regions("USA"))
  expect_true(check_regions("VT"))
  expect_true(check_regions("Mid-Atlantic"))
})

test_that("check errors", {
  expect_error(check_regions("Foo"))
  expect_error(check_regions("Bar"))
  expect_error(check_regions(c("Bar", "Foo")))
  expect_error(check_regions(c("Bar", "Foo", "USA")))
  expect_error(check_regions(7))
})
