% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/savePlot.plotSummaryAlphaPart.R
\name{savePlot}
\alias{savePlot}
\alias{savePlot.default}
\alias{savePlot.plotSummaryAlphaPart}
\title{savePlot.plotSummaryAlphaPart.R}
\usage{
savePlot(...)

\method{savePlot}{default}(...)

\method{savePlot}{plotSummaryAlphaPart}(
  x,
  filename = paste("Rplot", type, sep = "."),
  type = c("pdf", "png", "jpeg", "tiff", "bmp"),
  device = dev.cur(),
  pre.hook = NULL,
  traitsAsDir = FALSE,
  ...
)
}
\arguments{
\item{...}{Arguments passed to \code{type} specific methods, say
\code{width} and \code{height} for \code{type="pdf"} etc.}

\item{x}{Object on which to chose savePLot method.}

\item{filename}{Character, filename to save to.}

\item{type}{Character, file/device type.}

\item{device}{Device, the device to save from.}

\item{pre.hook}{Function, call some code before calling print method for plots (see examples).}

\item{traitsAsDir}{Logical, should plots be saved within trait folders; the construction is
\code{file.path(dirname(file), trait, basename(file))}.
folders are created if they do not exist.}
}
\value{
Beside the side effect of saving plots to disk, filenames are printed on
screen during the process and at the end invisibly returned.
}
\description{
Save plot objects on the disk for permanent storage. Function \code{\link[grDevices]{savePlot}} from the \pkg{grDevices} package
works for current page on graphical device. This is an attempt to make this
function generic so that one can define \code{savePlot} methods for particular
needs.
}
\section{Methods (by class)}{
\itemize{
\item \code{default}: Default \code{savePlot} method.

\item \code{plotSummaryAlphaPart}: Save plot objects of class \code{plotSummaryAlphaPart} on the disk for
permanent storage.
}}

\examples{
## Partition additive genetic values
res <- AlphaPart(x=AlphaPart.ped, colPath="country", colBV=c("bv1", "bv2"))

## Summarize population by generation (=trend)
ret <- summary(res, by="gen")

## Plot the partitions
p <- plot(ret, ylab=c("BV for trait 1", "BV for trait 2"), xlab="Generation")

## Save the plots
tmp <- savePlot(x = p, filename="test", type="png")

## Remove the files
unlink(tmp)

}
\seealso{
\code{\link[grDevices]{savePlot}} help page on the default \code{savePlot}
method in the \pkg{grDevices} package; \code{\link[AlphaPart]{savePlot.plotSummaryAlphaPart}}
help page on the method for the objects of \code{plotSummaryAlphaPart} class; and
\code{\link[AlphaPart]{plot.summaryAlphaPart}} for ploting results of summaryAlphaPart object.
}
