## Load an example data
data("AlphaPart.ped")

## Partition additive genetic values by location
(res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
print(p[[1]]$abs)
print(p[[1]]$rel)
print(p[[2]])
#print(p)

## Partition additive genetic values by location and sex
AlphaPart.ped$loc.sex <- with(AlphaPart.ped, paste(loc, sex, sep="-"))
(res <- AlphaPart(x=AlphaPart.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

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
        useGgplot2=TRUE, color=c("green", "gray"), lineType=c(2, 3),
        sortValue=FALSE, lineSize=4,
        xlim=c(-1, 7))
print(p)

