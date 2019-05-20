## Load an example data
data("AlphaPart.ped")

## Partition additive genetic values
(res <- AlphaPart(x=AlphaPart.ped, colPath="loc", colAGV=c("agv1", "agv2")))

## Summarize population by generation (=trend)
(ret <- summary(res, by="gen"))

## Plot the partitions
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation")
tmp <- savePlot(x=p, filename="test", type="pdf")

## ... but with some global modifications
ph <- function() ## TODO: how does one use par() with ggplot2?
tmp <- savePlot(x=p, filename="test", type="pdf")

## ... with lattice
p <- plot(ret, ylab=c("AGV for trait 1", "AGV for trait 2"), xlab="Generation", useGgplot2=FALSE)
ph <- function() {
trellis.par.set(list(fontsize       = list(text=24)),
                     layout.widths  = list(right.padding=0),
                     layout.heights = list(top.padding=0))
}
tmp <- savePlot(x=p, filename="test", type="pdf", pre.hook=ph)

## Clean up
unlink(tmp)
