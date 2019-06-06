context("test-write-csv")

test_that("Check writing input for write.csv.AlphaPart", {

  ## Making sure we accept only the right class and one file name!
  expect_error(write.csv.AlphaPart(data.frame(x=1:10)))
  expect_error(write.csv.AlphaPart(data.frame(x=1:10), file=c("a", "b")))
})

test_that("Check writing process for write.csv.AlphaPart", {
  ## Load an example data
  data("AlphaPart.ped")

  ## Partition additive genetic values
  res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2"))

  ## Write summary on the disk and collect saved file names
  dirT <- tempdir()
  fileName <- file.path(dirT, "AlphaPart")
  retF <- write.csv(x=res, file=fileName)


  ## Check content of files
  tmp <- read.csv2(file=retF[1])
  expect_equal(tmp$agv1,   res$agv1$agv1)
  expect_equal(tmp$agv1_1, res$agv1$agv1_1)

  tmp <- read.csv2(file=retF[2])
  expect_equal(tmp$agv1,   res$agv2$agv1)
  expect_equal(tmp$agv1_1, res$agv2$agv1_1)

  ## Clean up
  files <- dir(path=dirT, pattern="AlphaPart*")
  unlink(x=files)
})

###############################################################
###############################################################
###############################################################
###############################################################
#write.csv.summaryAlphaPart

test_that("Check writing input for write.csv.summaryAlphaPart", {

  ## Making sure we accept only the right class and one file name!
  expect_error(write.csv.summaryAlphaPart(data.frame(x=1:10)))
  expect_error(write.csv.summaryAlphaPart(data.frame(x=1:10), file=c("a", "b")))
})

test_that("Check writing process for write.csv.summaryAlphaPart", {
  ## Load an example data
  data("AlphaPart.ped")

  ## Partition additive genetic values
  res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2"))

  ## Summarize population by generation (=trend)
  ret <- summary(res, by="gen")

  ## Write summary on the disk and collect saved file names
  dirT <- tempdir()
  fileName <- file.path(dirT, "AlphaPart")
  retF <- write.csv(x=ret, file=fileName)


  ## Check content of files
  col <- c("gen", "N", "Sum", "1", "2")
  tmp <- read.csv2(file=retF[1]); colnames(tmp) <- col ## need colnames as 1 gets X1
  expect_equal(tmp, ret$agv1$abs)
  tmp <- read.csv2(file=retF[2]); colnames(tmp) <- col ## ...
  expect_equal(tmp, ret$agv1$rel)
  tmp <- read.csv2(file=retF[3]); colnames(tmp) <- col ## ...
  expect_equal(tmp, ret$agv2$abs)
  tmp <- read.csv2(file=retF[4]); colnames(tmp) <- col ## ...
  expect_equal(tmp, ret$agv2$rel)

  ## Clean up
  files <- dir(path=dirT, pattern="AlphaPart*")
  unlink(x=files)
})

