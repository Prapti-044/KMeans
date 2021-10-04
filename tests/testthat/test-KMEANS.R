test_that("Output shapes are correct", {
  K.list <- 3:5
  for(K in K.list) {
    result <- apply.kmeans(iris[,-5], K, 300)

    expect_type(result[["tot.withinss"]], "double")
    expect_equal(nrow(result[["cluster"]]),K)
    expect_equal(ncol(result[["cluster"]]),ncol(iris[,-5]))
  }
})

test_that("The clustering algorithm is working", {
  set.seed(1)
  result <- apply.kmeans(iris[,-5], 3, 300)

  expect_lte(result[["tot.withinss"]],100)
})
