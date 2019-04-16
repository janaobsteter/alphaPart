#' print.summaryAlphaPartition.R
#'
#' Print method for objects of the class summaryAlphaPartition.
#'
#' Print method for objects of the class \code{summaryAlphaPartition} (result of
#' \code{summary(alphaPartition(...))}).
#'
#' @seealso
#' \code{\link[alphaPartition]{summary.alphaPartition}}
#'
#' @param x summaryAlphaPartition, output object from \code{\link[alphaPartition]{summary.alphaPartition}} function.
#' @param ...  Arguments passed to other functions (not used at the moment).
#'
#' @example inst/examples/examples_summary.alphaPartition.R
#'
#' @useDynLib alphaPartition, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#'
#' @export


print.summaryAlphaPartition <-

function

(
  x,
  ...
) {
  

  nI <- nrow(x[[1]])
  cat("\n\n Summary of partitions of additive genetic values \n")
  cat("   - paths: ",  x$info$nP, " (", paste(x$info$lP, collapse=", "), ")\n", sep="")
  cat("   - traits: ", x$info$nT, " (", paste(x$info$lT, collapse=", "), ")\n", sep="")
  if(length(x$info$warn) > 0) cat("   - warning: ", paste(x$info$warn, collapse="\n"), "\n", sep="")

  for(trt in x$info$lT) {
    cat("\n Trait:", trt, "(absolute) \n\n")
    print(x[[trt]]$abs)
    cat("\n Trait:", trt, "(relative) \n\n")
    print(x[[trt]]$rel)
  }
  cat("\n")

  ## value<< Nothing except printout on the screen.

}
  

