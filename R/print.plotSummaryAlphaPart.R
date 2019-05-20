#' print.plotSummaryAlphaPart.R
#'
#' #' Print method for objects of the class \code{plotSummaryAlphaPart} (result of
#' \code{plot(summary(alphaPart(...)))}).
#'
#' TODO: DETAILS
#'
#' @seealso
#' \code{\link[alphaPart]{plot.summaryAlphaPart}}
#'
#' @param x plotSummaryAlphaPart, output object from
#' \code{\link[alphaPart]{plot.summaryAlphaPart}} function
#' @param ask Logical, ask before printing another plot?
#' @param ...  Arguments passed to other functions (not used at the moment).
#'
#' @example inst/examples/examples_print.plotSummaryAlphaPart.R
#'
#' @useDynLib alphaPart, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#'
#' @export


print.plotSummaryAlphaPart <- function (x, ask=interactive(), ...) {

  k <- 1
  nT <- length(x)
  for (i in 1:nT) {
    for (j in 1:2) {
      print(x[[i]][[j]])
      if (ask) {
        if (k < nT*2) {
          msg <- paste("Press any key to print out the next plot (", k, "/", nT*2, ") ...\n", sep="")
          tmp <- readline(prompt=msg)
        }
      }
      k <- k + 1
    }
  }

}

