context("test-alphapartitionsubset")

test_that("Test the input for alphaPartitionSubset", {
  ## Small pedigree with additive genetic (=breeding) values
  ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                      fid=c(  0,   0,   2,   0,   4,   0),
                      mid=c(  0,   0,   1,   0,   3,   3),
                      loc=c("A", "B", "A", "B", "A", "C"),
                      gen=c(  1,   1,   2,   2,   3,   3),
                      trt1=c(100, 120, 115, 130, 125, 125),
                      trt2=c(100, 110, 105,  10,  85, 110))

  ## Test that we only accept objects of class alphaPartition and summaryAlphaPartition
  expect_error(alphaPartitionSubset(x=ped))
})

test_that("Test the output of alphaPartitionSubset", {
  ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                  fid=c(  0,   0,   2,   0,   4,   0),
                  mid=c(  0,   0,   1,   0,   3,   3),
                  loc=c("A", "B", "A", "B", "A", "C"),
                  gen=c(  1,   1,   2,   2,   3,   3),
                  trt1=c(100, 120, 115, 130, 125, 125),
                  trt2=c(100, 110, 105,  10,  85, 110))
  ## Partition additive genetic values
  tmp <- alphaPartition(x=ped, colAGV=c("trt1", "trt2"))

  ## Keep some partitions (working on object of class alphaPartition)
  tmp2 <- alphaPartitionSubset(x=tmp, paths=c("A", "B"))

  ## Test that we kept only specified paths
  expect_equal(tmp2$info$lP, c("A", "B"))
  expect_true(!(c("trt1_C") %in% colnames(tmp2$trt1)))
  expect_true(!(c("trt2_C") %in% colnames(tmp2$trt2)))

  ## Summarize by generation
  tmpS <- summary(tmp, by="gen")

  ## Keep some partitions (working on object of class alphaPartition)
  tmpS2 <- alphaPartitionSubset(x=tmpS, paths=c("A", "C"))
  ## Test that we kept only specified paths
  expect_equal(tmpS2$info$lP, c("A", "C"))
  expect_true(!(c("trt1_B") %in% colnames(tmpS2$trt1)))
  expect_true(!(c("trt2_B") %in% colnames(tmpS2$trt2)))

  ## ... must be equal to
  tmpS3 <- summary(alphaPartitionSubset(x=tmp, paths=c("A", "C")), by="gen")
  expect_equal(tmpS2, tmpS3)

  })