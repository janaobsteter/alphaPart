## Load an example data
data("AlphaPart.ped")

## --- Partition additive genetic values by loc ---

(res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize whole population
(ret <- summary(res))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))

## --- Partition additive genetic values by loc and sex ---

AlphaPart.ped$loc.sex <- with(AlphaPart.ped, paste(loc, sex, sep="-"))
(res <- AlphaPart(x=AlphaPart.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))
