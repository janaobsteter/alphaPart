## Load an example data
data("alphaPart.ped")

## Partition additive genetic values
res <- alphaPart(x=alphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2"))

## Write summary on the disk and collect saved file names
fileName <- file.path(tempdir(), "alphaPart")
ret <- write.csv(x=res, file=fileName)
print(ret)
file.show(ret[1])

## Clean up
files <- dir(path=tempdir(), pattern="alphaPart*")
unlink(x=files)

