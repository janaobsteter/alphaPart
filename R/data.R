#' Sample pedigree for partition.
#'
#' A dataset containing pedigree information and additive genetic value
#' for 48 individuals.
#'
#' @format A data frame with 48 rows and 9 variables:
#' \describe{
#'   \item{id}{individual's ID}
#'   \item{fid}{Father's ID}
#'   \item{mid}{Mother's ID}
#'   \item{loc}{Location}
#'   \item{gen}{Generation}
#'   \item{sex}{Individual's sex}
#'   \item{loc.gen}{Interaction of location and generation}
#'   \item{agv1}{First additive genetic value}
#'   \item{agv2}{Second additive genetic value}
#' }
#' @source Stochastic simulation.
"AlphaPart.ped"