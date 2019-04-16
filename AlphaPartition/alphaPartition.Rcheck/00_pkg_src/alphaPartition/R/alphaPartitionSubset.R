#' alphaPartitionSubset.R
#'
#' A function to choose the partition paths to keep.
#'
#' Displaying results of partitions for many paths is often confusing.
#' This function helps in selecting only paths of interest.
#' Unspecified paths are removed from the input object \code{x}.
#' Meta information is modified accordingly. Default setting does nothing.
#' @seealso
#' \code{\link[alphaPartition]{alphaPartition}} for the main method,
#' \code{\link[alphaPartition]{summary.alphaPartition}} for summary method that works on output of \code{alphaPartition},
#' \code{\link[alphaPartition]{alphaPartitionSum}} for sum method.
#'
#' @param x alphaPartition or summaryAlphaPartition, object from the \code{alphaPartition(...)} or \code{summary(alphaPartition(...), ...)} call.
#' @param paths Character, names of paths to be kept.
#'
#' @example inst/examples/examples_alphaPartitionSubset.R
#'
#' @useDynLib alphaPartition, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#'
#' @export

alphaPartitionSubset <-

function
(
  x,
  paths=NULL
) {

  ## --- Setup ---

  test1 <- "alphaPartition"        %in% class(x)
  test2 <- "summaryAlphaPartition" %in% class(x)
  if(!any(c(test1, test2))) stop("object 'x' must be of a 'alphaPartition' or 'summaryAlphaPartition' class")

  ## Do nothing
  if(is.null(paths)) return(x)

  ## Keep only uniquely defined paths
  paths <- unique(paths)

  ## --- Action ---

  ## Create "identity" map for specified paths and call alphaPartitionSum to ease the
  ##   work with a rather complex object structure ;)
  nP <- length(paths)
  map <- vector(mode="list", length=nP)
  for(i in 1:nP) {
    map[[i]] <- c(paths[i], paths[i])
  }
  ## Now add non-specified paths in the last mapping so alphaPartitionSum will remove them
  map[[i]] <- c(map[[i]], x$info$lP[!(x$info$lP %in% paths)])
  ## Call alphaPartitionSum
  alphaPartitionSum(x=x, map=map, remove=TRUE, call="alphaPartitionPathSubset")

  ##value<< An object of class \code{alphaPartition} or \code{summaryalphaPartition} with only some paths.
  ## Meta information in slot "info" is modified as well.

}## --- Functions end ---






