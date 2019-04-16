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
print(p)

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
        lineTypeList=list("-1"=1, "-2"=2, def=3), useGgplot2=FALSE)
print(p)

## Plot control (color and type of lines + limits)
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation",
        useGgplot2=FALSE, color=c("green", "gray"), lineType=c(2, 3),
        sortValue=FALSE, lineSize=4,
        xlim=c(-1, 7), ylim=list(c(0, 5), c(-5, 5)), ylimRel=list(c(0, 100), c(0, 50)))
print(p)

