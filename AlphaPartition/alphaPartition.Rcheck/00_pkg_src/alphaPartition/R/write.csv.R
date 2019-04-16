#' write.csv.R
#'
#' TODO: Generic write.csv
#'
#' Function \code{\link[utils]{write.csv}} from the \pkg{utils} package works
#' when exported object is a \code{\link[base]{data.frame}} or a
#' \code{\link[base]{matrix}}. This is an attempt to make this function generic
#' so that one can define \code{write.csv} methods for other objects.
#'
#' @seealso \code{\link[utils]{write.csv}} help page on the default \code{write.csv} and \code{write.csv2}
#' methods in the \pkg{utils} package; TODO: tega ni! \code{\link[alphaPartition]{write.csv.summaryAlphaPartition}}
#' \code{\link[alphaPartition]{summary.alphaPartition}} and \code{\link[alphaPartition]{alphaPartition}}
#' help pages on the objects of \code{summaryAlphaPartition} and \code{alphaPartition} classes.
#'
#' @param x alphaPartition, object returned from \code{\link[alphaPartition]{alphaPartition}} function or
#' summaryAlphaPartition, object returned from \code{\link[alphaPartition]{summary.alphaPartition}} function.
#' @param file Character, file name with or without .csv extension, e.g., both "file" and "file.csv" are valid.
#' @param traitsAsDir Logical, should results be saved within trait folders;
#' the construction is \code{file.path(dirname(file), trait, basename(file))};
#' folders are created if they do not exist.
#' @param csv2 Logical, export using \code{\link[utils]{write.csv2}} or \code{\link[utils]{write.csv}}.
#' @param row.names Logical, export row names as well?
#' @param ... Other options passed to \code{\link[utils]{write.csv2}} or \code{\link[utils]{write.csv}}.
#'
#' @example inst/examples/examples_write.csv.R
#'
#' @useDynLib alphaPartition, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @importFrom utils write.csv2


write.csv  <- function

(
  ...
) {
  

  UseMethod("write.csv")
  
  ##value<< See \code{\link[utils]{write.csv}} for details.

}

#' @describeIn write.csv Default \code{write.csv} method.
write.csv.default <- function
(
  ... ##<< see \code{\link[utils]{write.csv}}
) {


  utils::write.csv(...)

  ##value<< See \code{\link[utils]{write.csv}} for details.

}

#' @describeIn write.csv  Save partitioned additive genetic values to CSV files on disk on disk for further
#' analyses or processing with other software or just for saving (backing up)
#' results.
#'
#' @export


write.csv.alphaPartition <-

function

(
  x,
  file,
  traitsAsDir=FALSE,
  csv2=TRUE,
  row.names=FALSE,
  ...
) {


 
  ## --- Setup ---

  if(length(file) > 1) stop("'file' argument must be of length one")
  if(!("alphaPartition" %in% class(x))) stop("'x' must be of a 'alphaPartition' class")
  fileOrig <- sub(pattern=".csv$", replacement="", x=file)
  ret <- c()

  ## --- Code ---

  for(i in 1:(length(x)-1)) { ## loop over traits
    if(traitsAsDir) {
      dir.create(path=file.path(dirname(fileOrig), x$info$lT[i]), recursive=TRUE, showWarnings=FALSE)
      file <- file.path(dirname(fileOrig), x$info$lT[i], basename(fileOrig))
    }
    fileA <- paste(file, "_", x$info$lT[i], ".csv", sep="")
    ret   <- c(ret, fileA)
    cat(fileA, "\n")
    
    if(csv2) {
      write.csv2(x=x[[i]], file=fileA, row.names=row.names, ...)
    } else {
      write.csv(x=x[[i]], file=fileA, row.names=row.names, ...)
    }
  }
  
  ## --- Return ---
  
  invisible(ret)

  ##value<< For each trait (list component in \code{x}) a file is saved on disk with name
  ## "file_trait.csv", where the file will hold original data and additive genetic value partitions.
  ## With \code{traitsAsDir=TRUE} files are saved as "trait/file_trait.csv".
  ## File names are printed on screen during the process of export and at the end invisibly returned.

}

#' @describeIn write.csv Save summaries of partitioned additive genetic values to CSV files on disk for further
#' analyses of processing with other software or just for saving (backing up)
#' results.
#'
#' @export



write.csv.summaryAlphaPartition <-

function

(
  x,
  file,
  traitsAsDir=FALSE,
  csv2=TRUE,
  row.names=FALSE,
  ...
) {



  ## --- Setup ---

  if(length(file) > 1) stop("'file' argument must be of length one")
  if(!("summaryAlphaPartition" %in% class(x))) stop("'x' must be of a 'summaryAlphaPartition' class")
  fileOrig <- sub(pattern=".csv$", replacement="", x=file)
  ret <- c()

  ## --- Code ---

  for(i in 1:(length(x)-1)) { ## loop over traits
    if(traitsAsDir) {
      dir.create(path=file.path(dirname(fileOrig), x$info$lT[i]), recursive=TRUE, showWarnings=FALSE)
      file <- file.path(dirname(fileOrig), x$info$lT[i], basename(fileOrig))
    }
    fileA <- paste(file, x$info$lT[i], "abs.csv", sep="_")
    fileR <- paste(file, x$info$lT[i], "rel.csv", sep="_")
    ret  <- c(ret, fileA, fileR)
    cat(fileA, "\n")
    cat(fileR, "\n")
    
    if(csv2) {
      write.csv2(x=x[[i]]$abs, file=fileA, row.names=row.names, ...)
      write.csv2(x=x[[i]]$rel, file=fileR, row.names=row.names, ...)
    } else {
      write.csv(x=x[[i]]$abs, file=fileA, row.names=row.names, ...)
      write.csv(x=x[[i]]$rel, file=fileR, row.names=row.names, ...)
    }
  }
  
  ## --- Return ---
  
  invisible(ret)

  ##value<< For each trait (list component in \code{x}) two files are saved on disk with names
  ## "file_trait_abs.csv" and "file_trait_rel.csv", where the first file will hold absolute values
  ## and the second file will hold relative values of additive genetic value partitions. 
  ## With \code{traitsAsDir=TRUE} files are saved as "trait/file_trait_*.csv". File names
  ## are printed on screen during the process of export and at the end invisibly returned.

}

