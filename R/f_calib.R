#' The function calib
#'
#' It calculates a new cocnentration based on a cailbration curve,
#'
#' here you can give more details
#'
#' Those detail can be multiple paragraphs
#'
#' @param conc description of parameter
#' @param OD takes the optical densities
#' @param ... currently disregarded
#'
#' @return the lm information
#'
#' @examples
#' conc <- seq(1:10)
#' OD <- seq(1:10) + rnorm (10)
#' calib(conc, OD)
#'
#' @importFrom stats lm
#' @export

calib <- function (conc, OD, ...){
  tmp <- data.frame(conc,OD)
  lm(conc ~ OD, data = tmp)
}
