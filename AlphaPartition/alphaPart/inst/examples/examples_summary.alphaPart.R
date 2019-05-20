## Load an example data
data("alphaPart.ped")

## --- Partition additive genetic values by loc ---

(res <- alphaPart(x=alphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize whole population
(ret <- summary(res))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))

## --- Partition additive genetic values by loc and sex ---

alphaPart.ped$loc.sex <- with(alphaPart.ped, paste(loc, sex, sep="-"))
(res <- alphaPart(x=alphaPart.ped, colPath="loc.sex", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Summarize population by generation (=trend) and location 1
(ret <- summary(res, by="loc.gen"))

## Summarize population by generation (=trend) but only for location 1
(ret <- summary(res, by="gen", subset=res[[1]]$loc == 1))
