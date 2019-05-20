context("test-summary-alphapart")

test_that("Test summary.AlphaPart", {

  ## Small pedigree with additive genetic (=breeding) values
  ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                     fid=c(  0,   0,   2,   0,   4,   0),
                     mid=c(  0,   0,   1,   0,   3,   0),
                     loc=c("A", "A", "C", "B", "C", "C"),
                    trt1=c(100, 120, 115, 130, 125, 125),
                    trt2=c(100, 110, 105, 100,  85, 110),
                     gen=c(  1,   1,   2,   2,   3,   3))

  ## Partition additive genetic values
  tmp <- AlphaPart(x=ped, colAGV=c("trt1", "trt2"))
  ##
  ##  Trait: trt1
  ##
  ##   id fid mid loc gen trt1 trt1_pa trt1_w trt1_A trt1_B trt1_C
  ## 1  1   0   0   A   1  100     0.0  100.0    100      0      0
  ## 2  2   0   0   A   1  120     0.0  120.0    120      0      0
  ## 3  3   2   1   C   2  115   110.0    5.0    110      0      5
  ## 4  4   0   0   B   2  130     0.0  130.0      0    130      0
  ## 5  5   4   3   C   3  125   122.5    2.5     55     65      5
  ## 6  6   0   0   C   3  125     0.0  125.0      0      0    125
  ##
  ## Trait: trt2
  ##
  ##   id fid mid loc gen trt2 trt2_pa trt2_w trt2_A trt2_B trt2_C
  ## 1  1   0   0   A   1  100     0.0  100.0  100.0      0    0.0
  ## 2  2   0   0   A   1  110     0.0  110.0  110.0      0    0.0
  ## 3  3   2   1   C   2  105   105.0    0.0  105.0      0    0.0
  ## 4  4   0   0   B   2  100     0.0  100.0    0.0    100    0.0
  ## 5  5   4   3   C   3   85   102.5  -17.5   52.5     50  -17.5
  ## 6  6   0   0   C   3  110     0.0  110.0    0.0      0  110.0

  ## Create summary
  expect_error(summary(tmp, by="gen", FUN=range))
  x <- summary(tmp, by="gen")
  ##
  ## Trait: trt1 (absolute)
  ##
  ##   gen N   Sum     A    B    C
  ## 1   1 2 110.0 110.0  0.0  0.0
  ## 2   2 2 122.5  55.0 65.0  2.5
  ## 3   3 2 125.0  27.5 32.5 65.0
  ##
  ##  Trait: trt1 (relative)
  ##
  ##   gen N Sum         A         B          C
  ## 1   1 2   1 1.0000000 0.0000000 0.00000000
  ## 2   2 2   1 0.4489796 0.5306122 0.02040816
  ## 3   3 2   1 0.2200000 0.2600000 0.52000000
  ##
  ##  Trait: trt2 (absolute)
  ##
  ##   gen N   Sum      A  B     C
  ## 1   1 2 105.0 105.00  0  0.00
  ## 2   2 2 102.5  52.50 50  0.00
  ## 3   3 2  97.5  26.25 25 46.25
  ##
  ##  Trait: trt2 (relative)
  ##
  ##   gen N Sum         A         B        C
  ## 1   1 2   1 1.0000000 0.0000000 0.000000
  ## 2   2 2   1 0.5121951 0.4878049 0.000000
  ## 3   3 2   1 0.2692308 0.2564103 0.474359

  ## Test summary for trt1
  expect_equal(x$trt1$abs$N,   c(2, 2, 2))
  expect_equal(x$trt1$abs$Sum, c(110, 122.5, 125.0))
  expect_equal(x$trt1$abs$A,   c(110,  55,    27.5))
  expect_equal(x$trt1$abs$B,   c(  0,  65,    32.5))
  expect_equal(x$trt1$abs$C,   c(  0,   2.5,  65.0))

  expect_equal(round(x$trt1$rel$Sum),  c(1, 1,    1))
  expect_equal(round(x$trt1$rel$A, 2), c(1, 0.45, 0.22))
  expect_equal(round(x$trt1$rel$B, 2), c(0, 0.53, 0.26))
  expect_equal(round(x$trt1$rel$C, 2), c(0, 0.02, 0.52))

  ## Test summary for trt2
  expect_equal(x$trt2$abs$N,   c(2, 2, 2))
  expect_equal(x$trt2$abs$Sum, c(105, 102.50, 97.50))
  expect_equal(x$trt2$abs$A,   c(105,  52.50, 26.25))
  expect_equal(x$trt2$abs$B,   c(  0,  50.00, 25.00))
  expect_equal(x$trt2$abs$C,   c(  0,   0.00, 46.25))

  expect_equal(round(x$trt2$rel$Sum),  c(1, 1, 1))
  expect_equal(round(x$trt2$rel$A, 2), c(1.00, 0.51, 0.27))
  expect_equal(round(x$trt2$rel$B, 2), c(0.00, 0.49, 0.26))
  expect_equal(round(x$trt2$rel$C, 2), c(0.00, 0.00, 0.47))

  ## Test FUN argument
  x <- summary(tmp, by="gen", FUN=max)
  expect_equal(x$trt1$abs$N,   c(2, 2, 2))
  expect_equal(x$trt1$abs$Sum, c(120, 130, 125))
  expect_equal(x$trt1$abs$A,   c(120, 110,  55))
  expect_equal(x$trt1$abs$B,   c(  0, 130,  65))
  expect_equal(x$trt1$abs$C,   c(  0,   5, 125))

  ## Test labelSum argument
  x <- summary(tmp, by="gen", labelSum="bla")
  expect_true("bla" %in% colnames(x$trt1$abs))

  ## Test subset argument
  x <- summary(tmp, by="gen", subset=tmp[[1]]$gen != 3)
  expect_equal(x$trt1$abs$N,   c(2, 2))
  expect_equal(x$trt1$abs$Sum, c(110, 122.5))
  expect_equal(x$trt1$abs$A,   c(110,  55))
  expect_equal(x$trt1$abs$B,   c(  0,  65))
  expect_equal(x$trt1$abs$C,   c(  0,   2.5))

  expect_equal(round(x$trt1$rel$Sum),  c(1, 1))
  expect_equal(round(x$trt1$rel$A, 2), c(1, 0.45))
  expect_equal(round(x$trt1$rel$B, 2), c(0, 0.53))
  expect_equal(round(x$trt1$rel$C, 2), c(0, 0.02))

  ## Test the direct use of by group analysis in the AlphaPart function
  ped$gen <- factor(ped$gen)
  tmp1 <- summary(AlphaPart(x=ped, colAGV=c("trt1", "trt2")), by="gen")
  tmp2 <- AlphaPart(x=ped, colAGV=c("trt1", "trt2"), colBy="gen")
  expect_equal(tmp1, tmp2)

})