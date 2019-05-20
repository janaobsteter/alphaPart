#' alphaPartSubset.R
#'
#' A function to choose the partition paths to keep.
#'
#' Displaying results of partitions for many paths is often confusing.
#' This function helps in selecting only paths of interest.
#' Unspecified paths are removed from the input object \code{x}.
#' Meta information is modified accordingly. Default setting does nothing.
#' @seealso
#' \code{\link[alphaPart]{alphaPart}} for the main method,
#' \code{\link[alphaPart]{summary.alphaPart}} for summary method that works on output of \code{alphaPart},
#' \code{\link[alphaPart]{alphaPartSum}} for sum method.
#'
#' @param x alphaPart or summaryAlphaPart, object from the \code{alphaPart(...)} or \code{summary(alphaPart(...), ...)} call.
#' @param paths Character, names of paths to be kept.
#'
#' @return An object of class \code{alphaPart} or \code{summaryAlphaPart} with only some paths.
#' Meta information in slot "info" is modified as well.
#'
#' @example inst/examples/examples_alphaPartSubset.R
#'


#' @useDynLib alphaPart, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#'
#' @export

alphaPartSubset <- function(x, paths=NULL) {

  ## --- Setup ---

  test1 <- "alphaPart"        %in% class(x)
  test2 <- "summaryAlphaPart" %in% class(x)
  if (!any(c(test1, test2))) stop("object 'x' must be of a 'alphaPart' or 'summaryalphaPart' class")

  ## Do nothing
  if (is.null(paths)) return(x)

  ## Keep only uniquely defined paths
  paths <- unique(paths)

  ## --- Action ---

  ## Create "identity" map for specified paths and call alphaPartSum to ease the
  ##   work with a rather complex object structure ;)
  nP <- length(paths)
  map <- vector(mode="list", length=nP)
  for (i in 1:nP) {
    map[[i]] <- c(paths[i], paths[i])
  }
  ## Now add non-specified paths in the last mapping so alphaPartSum will remove them
  map[[i]] <- c(map[[i]], x$info$lP[!(x$info$lP %in% paths)])
  ## Call alphaPartSum
  alphaPartSum(x=x, map=map, remove=TRUE, call="alphaPartPathSubset")


}






