## Load an example data
data("AlphaPart.ped")

## Partition additive genetic values
(res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
print(p[[1]]$abs)
print(p[[1]]$rel)
print(p[[2]]$abs)
print(p[[2]])
print(p)
