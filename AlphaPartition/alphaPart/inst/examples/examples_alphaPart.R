## Small pedigree with additive genetic (=breeding) values
ped <- data.frame(  id=c(  1,   2,   3,   4,   5,   6),
                   fid=c(  0,   0,   2,   0,   4,   0),
                   mid=c(  0,   0,   1,   0,   3,   3),
                   loc=c("A", "B", "A", "B", "A", "A"),
                   gen=c(  1,   1,   2,   2,   3,   3),
                  trt1=c(100, 120, 115, 130, 125, 125),
                  trt2=c(100, 110, 105, 100,  85, 110))

## Partition additive genetic values
tmp <- alphaPart(x=ped, colAGV=c("trt1", "trt2"))
print(tmp)

## Summarize by generation
summary(tmp, by="gen")

## There are also two demos
#demo(topic="alphaPart_deterministic", package="alphaPart", ask=interactive())
#demo(topic="alphaPart_stochastic",     package="alphaPart", ask=interactive())

