#' print.plotSummaryAlphaPartition.R
#'
#' #' Print method for objects of the class \code{plotSummaryAlphaPartition} (result of
#' \code{plot(summary(alphaPartition(...)))}).
#'
#' TODO: DETAILS
#'
#' @seealso
#' \code{\link[alphaPartition]{plot.summaryAlphaPartition}}
#'
#' @param x plotSummaryAlphaPartition, output object from
#' \code{\link[alphaPartition]{plot.summaryAlphaPartition}} function
#' @param ask Logical, ask before printing another plot?
#' @param ...  Arguments passed to other functions (not used at the moment).
#'
#' @example inst/examples/examples_print.plotSummaryAlphaPartition.R
#'
#' @useDynLib alphaPartition, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#'
#' @export


print.plotSummaryAlphaPartition <-

function #

(
  x,
  ask=interactive(),
  ...
) {



  k <- 1
  nT <- length(x)
  for(i in 1:nT) {
    for(j in 1:2) {
      print(x[[i]][[j]])
      if(ask) {
        if(k < nT*2) {
          msg <- paste("Press any key to print out the next plot (", k, "/", nT*2, ") ...\n", sep="")
          tmp <- readline(prompt=msg)
        }
      }
      k <- k + 1
    }
  }
  ## value<< Nothing except the printout of graphics.

}


