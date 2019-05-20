#' print.alphaPart.R
#'
#' Print method for the output of alphaPart function.
#'
#' Partitioning of additive genetic values if often performed on quite
#' large datasets, which quickly fills in the whole screen. Print method
#' therefore prints out paths, number of individuals and the first and
#' the last few lines for each trait to quickly see what kind of data is
#' in \code{x}.
#' @seealso
#' \code{\link[alphaPart]{alphaPart}}, \code{\link{head}}, \code{\link{tail}}.
#'
#' @param x alphaPart, output object from \code{\link[alphaPart]{alphaPart}} function.
#' @param n Integer, number of the first and last rows in \code{x} to print out
#' using \code{\link{head}} and \code{\link{tail}}.
#' @param ...  Arguments passed to other functions (not used at the moment).
#'
#' @example inst/examples/examples_alphaPart.R
#'
#' @useDynLib alphaPart, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @importFrom utils head
#' @importFrom utils tail
#'
#' @export


print.alphaPart <- function (x, n=6, ...) {
  
  nI <- nrow(x[[1]])
  cat("\n\n Partitions of additive genetic values \n")
  cat("   - individuals:", nI, "\n")
  cat("   - paths: ",  x$info$nP, " (", paste(x$info$lP, collapse=", "), ")\n", sep="")
  cat("   - traits: ", x$info$nT, " (", paste(x$info$lT, collapse=", "), ")\n", sep="")
  if (length(x$info$warn) > 0) cat("   - warning: ", paste(x$info$warn, collapse="\n"), "\n", sep="")

  for (trt in x$info$lT) {
    cat("\n Trait:", trt, "\n\n")
    if (nI > n*2) {
      print(head(x[[trt]]))
      cat("...\n")
      print(tail(x[[trt]]))
    } else {
      print(x[[trt]])
    }
  }
  cat("\n")


}


