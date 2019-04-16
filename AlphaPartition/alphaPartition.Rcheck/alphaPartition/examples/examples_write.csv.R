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

