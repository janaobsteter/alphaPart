pkgname <- "alphaPartition"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "alphaPartition-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('alphaPartition')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
cleanEx()
nameEx("alphaPartition")
### * alphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: alphaPartition
### Title: alphaPartition.R
### Aliases: alphaPartition

### ** Examples

## Small pedigree with additive genetic (=breeding) values
ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                   fid=c(  0,   0,   2,   0,   4,   0),
                   mid=c(  0,   0,   1,   0,   3,   3),
                   loc=c("A", "B", "A", "B", "A", "A"),
                   gen=c(  1,   1,   2,   2,   3,   3),
                  trt1=c(100, 120, 115, 130, 125, 125),
                  trt2=c(100, 110, 105, 100,  85, 110))

## Partition additive genetic values
tmp <- alphaPartition(x=ped, colAGV=c("trt1", "trt2"))
print(tmp)

## Summarize by generation
summary(tmp, by="gen")

## There are also two demos
#demo(topic="alphaPartition_deterministic", package="alphaPartition", ask=interactive())
#demo(topic="alphaPartition_stochastic",     package="alphaPartition", ask=interactive())




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("alphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("alphaPartitionSubset")
### * alphaPartitionSubset

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: alphaPartitionSubset
### Title: alphaPartitionSubset.R
### Aliases: alphaPartitionSubset

### ** Examples

## Small pedigree with additive genetic (=breeding) values
ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                  fid=c(  0,   0,   2,   0,   4,   0),
                  mid=c(  0,   0,   1,   0,   3,   3),
                  loc=c("A", "B", "A", "B", "A", "A"),
                  gen=c(  1,   1,   2,   2,   3,   3),
                 trt1=c(100, 120, 115, 130, 125, 125),
                 trt2=c(100, 110, 105, 100,  85, 110))

## Partition additive genetic values
(tmp <- alphaPartition(x=ped, colAGV=c("trt1", "trt2")))

## Keep some partitions (working on object of class alphaPartition)
(tmp2 <- alphaPartitionSubset(x=tmp, paths="A"))

## Summarize by generation
(tmpS <- summary(tmp, by="gen"))

## Keep some partitions (working on object of class summaryAlphaPartition)
(tmpS2 <- alphaPartitionSubset(x=tmpS, paths="A"))

## ... must be equal to
(tmpS3 <- summary(tmp2, by="gen"))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("alphaPartitionSubset", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("alphaPartitionSum")
### * alphaPartitionSum

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: alphaPartitionSum
### Title: alphaPartitionSum.R
### Aliases: alphaPartitionSum

### ** Examples

## Small pedigree with additive genetic (=breeding) values
ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                  fid=c(  0,   0,   2,   0,   4,   0),
                  mid=c(  0,   0,   1,   0,   3,   3),
                  loc=c("A", "B", "A", "B", "A", "A"),
                  gen=c(  1,   1,   2,   2,   3,   3),
                 trt1=c(100, 120, 115, 130, 125, 125),
                 trt2=c(100, 110, 105,  140,  85, 110))

## Partition additive genetic values
(tmp <- alphaPartition(x=ped, colAGV=c("trt1", "trt2")))

## Sum some partitions (working on object of class alphaPartition)
(tmp2 <- alphaPartitionSum(x=tmp, map=list(c("X", "A", "B"), c("A", "B"))))

## Summarize by generation
(tmpS <- summary(tmp, by="gen"))

## Sum some partitions (working on object of class summaryAlphaPartition)
(tmpS2 <- alphaPartitionSum(x=tmpS, map=list(c("X", "A", "B"), c("A", "B"))))

## ... must be equal to
(tmpS3 <- summary(tmp2, by="gen"))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("alphaPartitionSum", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pedFixBirthYear")
### * pedFixBirthYear

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pedFixBirthYear
### Title: pedFixBirthYear.R
### Aliases: pedFixBirthYear

### ** Examples

## Example pedigree with missing (unknown) birth year for some individuals
ped0 <- data.frame(     id=c( 1, 2, 3,  4, 5, 6, 7,  8, 9, 10, 11, 12, 13, 14),
                        fid=c( 0, 0, 0,  1, 1, 1, 3,  3, 3,  5,  4,  0,  0, 12),
                        mid=c( 0, 0, 0,  2, 0, 2, 2,  2, 5,  0,  0,  0,  0, 13),
                        birth_dt=c(NA, 0, 1, NA, 3, 3, 3, 3, 4, 4, 5, NA, 6, 6) + 2000)

## First run - using information from children
ped1 <- pedFixBirthYear(x=ped0, interval=1)

## Second run - using information from parents
ped2 <- pedFixBirthYear(x=ped1, interval=1, down=TRUE)

## Third run - using information from children, but with no success
ped3 <- pedFixBirthYear(x=ped2, interval=1)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pedFixBirthYear", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("pedSetBase")
### * pedSetBase

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: pedSetBase
### Title: pedSetBase.R
### Aliases: pedSetBase

### ** Examples

## Example pedigree
ped <- data.frame(      id=1:10,
                       fid=c(0, 0, 0, 1, 1, 1, 3, 3, 3, 5),
                       mid=c(0, 0, 0, 2, 0, 2, 2, 2, 5, 0),
                  birth_dt=c(0, 0, 1, 2, 3, 3, 3, 4, 4, 5) + 2000)

## Set base population as those individuals that were born after year 2002
pedSetBase(x=ped, keep=ped$birth_dt > 2002, unknown=0)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("pedSetBase", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("plot.summaryAlphaPartition")
### * plot.summaryAlphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: plot.summaryAlphaPartition
### Title: plot.summaryAlphaPartition.R
### Aliases: plot.summaryAlphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## Partition additive genetic values by location
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
print(p[[1]]$abs)
print(p[[1]]$rel)
print(p[[2]])
#print(p)

## Partition additive genetic values by location and sex
alphaPartition.ped$loc.sex <- with(alphaPartition.ped, paste(loc, sex, sep="-"))
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
print(p)
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation",
        lineTypeList=list("-1"=1, "-2"=2, def=3))
print(p)
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation",
        lineTypeList=list("-1"=1, "-2"=2, def=3), useGgplot2=FALSE, useDirectLabels = FALSE)
print(p)

## Plot control (color and type of lines + limits)
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation",
        useGgplot2=FALSE, color=c("green", "gray"), lineType=c(2, 3),
        sortValue=FALSE, lineSize=4,
        xlim=c(-1, 7), ylim=list(c(0, 5), c(-5, 5)), ylimRel=list(c(0, 100), c(0, 50)))
print(p)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("plot.summaryAlphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("print.alphaPartition")
### * print.alphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: print.alphaPartition
### Title: print.alphaPartition.R
### Aliases: print.alphaPartition

### ** Examples

## Small pedigree with additive genetic (=breeding) values
ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                   fid=c(  0,   0,   2,   0,   4,   0),
                   mid=c(  0,   0,   1,   0,   3,   3),
                   loc=c("A", "B", "A", "B", "A", "A"),
                   gen=c(  1,   1,   2,   2,   3,   3),
                  trt1=c(100, 120, 115, 130, 125, 125),
                  trt2=c(100, 110, 105, 100,  85, 110))

## Partition additive genetic values
tmp <- alphaPartition(x=ped, colAGV=c("trt1", "trt2"))
print(tmp)

## Summarize by generation
summary(tmp, by="gen")

## There are also two demos
#demo(topic="alphaPartition_deterministic", package="alphaPartition", ask=interactive())
#demo(topic="alphaPartition_stochastic",     package="alphaPartition", ask=interactive())




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("print.alphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("print.plotSummaryAlphaPartition")
### * print.plotSummaryAlphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: print.plotSummaryAlphaPartition
### Title: print.plotSummaryAlphaPartition.R
### Aliases: print.plotSummaryAlphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## Partition additive genetic values
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
print(p[[1]]$abs)
print(p[[1]]$rel)
print(p[[2]]$abs)
print(p[[2]])
print(p)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("print.plotSummaryAlphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("print.summaryAlphaPartition")
### * print.summaryAlphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: print.summaryAlphaPartition
### Title: print.summaryAlphaPartition.R
### Aliases: print.summaryAlphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## --- Partition additive genetic values by loc ---

(res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize whole population
(ret <- summary(res))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))

## --- Partition additive genetic values by loc and sex ---

alphaPartition.ped$loc.sex <- with(alphaPartition.ped, paste(loc, sex, sep="-"))
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("print.summaryAlphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("savePlot")
### * savePlot

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: savePlot
### Title: savePlot.plotSummaryAlphaPartition.R
### Aliases: savePlot savePlot.default savePlot.plotSummaryAlphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## --- Partition additive genetic values by loc ---

(res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize whole population
(ret <- summary(res))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))

## --- Partition additive genetic values by loc and sex ---

alphaPartition.ped$loc.sex <- with(alphaPartition.ped, paste(loc, sex, sep="-"))
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("savePlot", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("summary.alphaPartition")
### * summary.alphaPartition

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: summary.alphaPartition
### Title: summary.alphaPartition.R
### Aliases: summary.alphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## --- Partition additive genetic values by loc ---

(res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize whole population
(ret <- summary(res))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))

## --- Partition additive genetic values by loc and sex ---

alphaPartition.ped$loc.sex <- with(alphaPartition.ped, paste(loc, sex, sep="-"))
(res <- alphaPartition(x=alphaPartition.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("summary.alphaPartition", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("write.csv")
### * write.csv

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: write.csv
### Title: write.csv.R
### Aliases: write.csv write.csv.default write.csv.alphaPartition
###   write.csv.summaryAlphaPartition

### ** Examples

## Load an example data
data("alphaPartition.ped")

## Partition additive genetic values
res <- alphaPartition(x=alphaPartition.ped, colPath="loc", colAGV=c("agv1", "agv2"))

## Write summary on the disk and collect saved file names
fileName <- file.path(tempdir(), "alphaPartition")
ret <- write.csv(x=res, file=fileName)
print(ret)
file.show(ret[1])

## Clean up
files <- dir(path=tempdir(), pattern="alphaPartition*")
unlink(x=files)




base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("write.csv", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
