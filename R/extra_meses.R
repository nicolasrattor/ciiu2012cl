
#' Funciones para lidiar con meses
#'
#' En desarrollo
#'
#'
#'
#'
#' @param
#' @return
#' @export
#'
#' @examples
#' ene3_to_n_meses(data,data$mes)

ene3_to_n_meses <- function(x,y){
  ene <- dplyr::mutate(x,y=tolower(substr(y,1,3)))
  x <- dplyr::mutate(x,mes=dplyr::case_when(y == "ene" ~ 2,
                                  y == "feb" ~ 3,
                                  y == "mar" ~ 4,
                                  y == "abr" ~ 5,
                                  y == "may" ~ 6,
                                  y == "jun" ~ 7,
                                  y == "jul" ~ 8,
                                  y == "ago" ~ 9,
                                  y == "sep" ~ 10,
                                  y == "oct" ~ 11,
                                  y == "nov" ~ 12,
                                  y == "dic" ~ 1))
  x
}

espanol_to_n_meses <- function(x,y){
  x <- dplyr::mutate(x,mes=dplyr::case_when(y == "ene" ~ 1,
                                  y == "feb" ~ 2,
                                  y == "mar" ~ 3,
                                  y == "abr" ~ 4,
                                  y == "may" ~ 5,
                                  y == "jun" ~ 6,
                                  y == "jul" ~ 7,
                                  y == "ago" ~ 8,
                                  y == "sep" ~ 9,
                                  y == "oct" ~ 10,
                                  y == "nov" ~ 11,
                                  y == "dic" ~ 12))
  x
}
